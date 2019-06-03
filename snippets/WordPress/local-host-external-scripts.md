# How to Host any (.js)-File Locally (and keep it updated using Crontab)

From: https://daan.dev/how-to/host-js-locally-crontab/

## Creating the PHP-script
The following script is basically ready to go, the only values for you to adjust are:

`$remoteFile`: the source of the scriptfile you want to download,
`$localFile`: the path to where you want to save the file — including filename,
`$uploadDir`: the path to where you want to save the file, without the filename.
Edit and upload the script to your server in a convenient location, to keep your crontab readable later on.

```php
// Script to update any js-file
// Credits go to: Matthew Horne
// Remote file to download
$remoteFile = 'https://www.google-analytics.com/analytics.js';
$localFile  = /path/to/your/webroot/analytics.js;
// Check if directory exists, otherwise create it.
$uploadDir = /path/to/your/webroot/;
if (!file_exists($uploadDir)) {
	wp_mkdir_p($uploadDir);
}
// Connection time out
$connTimeout = 10;
$url = parse_url($remoteFile);
$host = $url['host'];
$path = isset($url['path']) ? $url['path'] : '/';
if (isset($url['query'])) {
	$path .= '?' . $url['query'];
}
$port = isset($url['port']) ? $url['port'] : '80';
$fp = @fsockopen($host, '80', $errno, $errstr, $connTimeout );
if(!$fp){
	// On connection failure return the cached file (if it exist)
	if(file_exists($localFile)){
			readfile($localFile);
	}
} else {
	// Send the header information
	$header = "GET $path HTTP/1.0\r\n";
	$header .= "Host: $host\r\n";
	$header .= "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6\r\n";
	$header .= "Accept: */*\r\n";
	$header .= "Accept-Language: en-us,en;q=0.5\r\n";
	$header .= "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\r\n";
	$header .= "Keep-Alive: 300\r\n";
	$header .= "Connection: keep-alive\r\n";
	$header .= "Referer: http://$host\r\n\r\n";
	fputs($fp, $header);
	$response = '';
	// Get the response from the remote server
	while($line = fread($fp, 4096)){
		$response .= $line;
	}
// Close the connection
fclose( $fp );
// Remove the headers
$pos = strpos($response, "\r\n\r\n");
$response = substr($response, $pos + 4);
// Return the processed response
echo $response;
// Save the response to the local file
if(!file_exists($localFile)){
	// Try to create the file, if doesn't exist
	fopen($localFile, 'w');
}
	if(is_writable($localFile)) {
		if($fp = fopen($localFile, 'w')){
			fwrite($fp, $response);
			fclose($fp);
		}
	}
}
```

After running the script, the javascript file should appear within the directory you specified within the $uploadDir variable. If that’s not the case, make sure PHP has the right permissions and can write files to the directory you specified.

## Scheduling a Cronjob
Businesses advise you to load their javascript from their own resources for a very important reason. They want to control its contents:

As a security measure,
It allows them to roll out updates at once, whenever this is required.
The downside to this is that it will lower your score on Google Pagespeed, Pingdom, etc., because making external DNS requests is bad for your site’s performance and raises your loading time.

To achieve the best of both worlds, we combine the script you created earlier with a Cronjob, so it is triggered regularly and kept up-to-date.

The command you used earlier to test your script, will be extended into a syntax that Crontab understands. For this we need the following prerequisites:

An interval for the script to be triggered (e.g. daily),
The full path to the PHP executable, which can be found by entering `which php` into a terminal.
This would result in a command looking like this:

`10 0 * * * /usr/bin/php -f /path/to/your/script.php >/dev/null 2>&1`

This command triggers the script on a daily basis at 10 minutes past Midnight. You can use a [crontab generator](https://crontab-generator.org/) to generate your own cronjob.

After generating your cronjob, copy it and enter `crontab -e` into a terminal. Crontab will open in editor mode (sometimes you first need to choose your favourite text editor. I suggest `nano`) and all you have to do is paste the command on a new line. Save it, and you’re done!

All you need to do now is change the URLs within the provided javascript snippets. E.g. for Google Analytics, this would mean I’d change this:

```js
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','__gaTracker');

		__gaTracker('create', 'UA-XXXXXXXX-X', 'auto');
		__gaTracker('set', 'forceSSL', true);
		__gaTracker('send','pageview');
view rawgoogle-analytics.com-analytics.js hosted with ❤ by GitHub
To this:

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.yoursite.com/analytics.js','__gaTracker');

		__gaTracker('create', 'UA-XXXXXXXX-X', 'auto');
		__gaTracker('set', 'forceSSL', true);
		__gaTracker('send','pageview');
```

After this, make sure your changes are not influencing the results the script should generate. This differs per script, but e.g. for Google Analytics you could open up a private browser window, and visit your site, while you’re monitoring the Real Time traffic within your Analytics Dashboard.

If all is well, tap yourself on the shoulder! Perhaps you could even demand a standing ovation from your pets! After that, run your site through Pingdom and Pagespeed Insights and you’ll see your score is higher than before!
