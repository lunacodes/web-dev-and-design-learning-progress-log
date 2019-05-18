# WordPress - Optimization Snippets

<!-- MarkdownTOC -->

* [Remove Plugin Stylesheets and Scripts](#remove-plugin-stylesheets-and-scripts)
* [Hosting Scripts Locally With Cron Updates](#hosting-scripts-locally-with-cron-updates)
* [Trackbacks & Pingbacks](#trackbacks--pingbacks)
* [Embeds](#embeds)
  * [Disable Embeds](#disable-embeds)
  * [Deregister Embed Scripts](#deregister-embed-scripts)
* [Google Fonts](#google-fonts)
* [Debugging](#debugging)
* [Find Out All Plugin \(Script?\) Handles](#find-out-all-plugin-script-handles)

<!-- /MarkdownTOC -->

<a id="remove-plugin-stylesheets-and-scripts"></a>
## Remove Plugin Stylesheets and Scripts

1. Deregister Stylesheet Handle:

```php
// For a script w/ id="gdwpm_styles-css":
add_action( 'wp_print_styles', 'my_deregister_styles', 100 );
function my_deregister_styles() {
wp_deregister_style( 'gdwpm_styles-css' );
}

// For multiple files:
add_action( 'wp_print_styles', 'my_deregister_styles', 100 );
function my_deregister_styles() {
wp_deregister_style( 'gdwpm_styles-css' );
wp_deregister_style( 'bfa-font-awesome-css' );
wp_deregister_style( 'some-other-stylesheet-handle' );
}
```

2. Find plugin handles and then deregister

```php
function wpb_display_pluginhandles() {
  $wp_scripts = wp_scripts();
  $handlename .= '<ul>';
  foreach ( $wp_scripts->queue as $handle ) :
    $handlename .= '<li>' . $handle . '</li>';
  endforeach;
  $handlename .= '</ul>';
  echo( $handlename );
  return $handlename;
}
add_shortcode( 'pluginhandles', 'wpb_display_pluginhandles');
```

```php
add_action( 'wp_print_scripts', 'my_deregister_javascript', 100 );
function my_deregister_javascript() {
  wp_deregister_script( 'contact-form-7' );
}

// Multiple Scripts
add_action( 'wp_print_scripts', 'my_deregister_javascript', 100 );
function my_deregister_javascript() {
  wp_deregister_script( 'contact-form-7' );
  wp_deregister_script( 'gdwpm_lightbox-script' );
  wp_deregister_script( 'another-plugin-script' );
}
```

3. Load Scripts on specific pages:

```php
// Load Scripts only on Specific Pages

add_action( 'wp_print_scripts', 'my_deregister_javascript', 100 );
function my_deregister_javascript() {
  if ( !is_page('Contact') ) {
  wp_deregister_script( 'contact-form-7' );
  }
}
```

4. Deregister in specific location

```php
add_action('wp_footer', 'remove_scripts_styles_footer');
function remove_scripts_styles_footer() {
  //----- CSS
  wp_deregister_style('jetpack_css'); // Jetpack

  //----- JS
  wp_deregister_script('devicepx'); // Jetpack
}
```

5. Remove the Action

```php
remove_action('wp_head', 'devicepx');
```

6. Remove From Header and Add to Footer

From: [Stack Exchange - WordPress Development - Move scripts to footer, but exclude one script?](https://wordpress.stackexchange.com/questions/205938/move-scripts-to-footer-but-exclude-one-script)

```php
function dequeue_my_scripts() {
   wp_dequeue_script('script-handle-here');
}
add_action( 'wp_print_scripts', 'dequeue_my_scripts', 11 );
```

```php
function enqueue_scripts_to_footer() {
   wp_enqueue_script('script-handle-here');
}
add_action( 'wp_footer', 'enqueue_scripts_to_footer' );
```

<a id="hosting-scripts-locally-with-cron-updates"></a>
## Hosting Scripts Locally With Cron Updates

How to Host any (.js)-File Locally (and keep it updated using Crontab)

From: https://daan.dev/how-to/host-js-locally-crontab/

**Creating the PHP-script**

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

**Scheduling a Cronjob**

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

<a id="trackbacks--pingbacks"></a>
## Trackbacks & Pingbacks
```php

function remove_trackback_metabox() {
  remove_meta_box( 'trackbacksdiv','post','normal' );
}
add_action('admin_menu','remove_trackback_metabox');

/**
 * Disable Pingbacks
 */

// This still seems to show the link rel="pingback" in the site headers tho - idk if this is a Genesis thing or something else??

add_filter( ‘wp_headers’, function( $headers ) {
  unset( $headers[‘X-Pingback’] );
  return $headers;
}, 20);

add_filter( ‘xmlrpc_methods’, function( $methods ) {
  unset( $methods[‘pingback.ping’] );
  unset( $methods[‘pingback.extensions.getPingbacks’] );
  return $methods;
}, 20);
```

<a id="embeds"></a>
## Embeds

<a id="disable-embeds"></a>
### Disable Embeds
```php
function disable_embeds_code_init() {

 // Remove the REST API endpoint.
 remove_action( 'rest_api_init', 'wp_oembed_register_route' );

 // Turn off oEmbed auto discovery.
 add_filter( 'embed_oembed_discover', '__return_false' );

 // Don't filter oEmbed results.
 remove_filter( 'oembed_dataparse', 'wp_filter_oembed_result', 10 );

 // Remove oEmbed discovery links.
 remove_action( 'wp_head', 'wp_oembed_add_discovery_links' );

 // Remove oEmbed-specific JavaScript from the front-end and back-end.
 remove_action( 'wp_head', 'wp_oembed_add_host_js' );
 add_filter( 'tiny_mce_plugins', 'disable_embeds_tiny_mce_plugin' );

 // Remove all embeds rewrite rules.
 add_filter( 'rewrite_rules_array', 'disable_embeds_rewrites' );

 // Remove filter of the oEmbed result before any HTTP requests are made.
 remove_filter( 'pre_oembed_result', 'wp_filter_pre_oembed_result', 10 );
}

add_action( 'init', 'disable_embeds_code_init', 9999 );

function disable_embeds_tiny_mce_plugin($plugins) {
    return array_diff($plugins, array('wpembed'));
}

function disable_embeds_rewrites($rules) {
    foreach($rules as $rule => $rewrite) {
        if(false !== strpos($rewrite, 'embed=true')) {
            unset($rules[$rule]);
        }
    }
    return $rules;
}
```

<a id="deregister-embed-scripts"></a>
### Deregister Embed Scripts

```php
function my_deregister_scripts(){
 wp_dequeue_script( 'wp-embed' );
}
add_action( 'wp_footer', 'my_deregister_scripts' );
```


<a id="google-fonts"></a>
## Google Fonts

* https://speckyboy.com/speed-google-fonts-wordpress/
* https://google-webfonts-helper.herokuapp.com/fonts/source-sans-pro?subsets=latin,vietnamese,cyrillic-ext,greek,latin-ext,greek-ext,cyrillic

<a id="debugging"></a>
## Debugging

<a id="find-out-all-plugin-script-handles"></a>
## Find Out All Plugin (Script?) Handles

```php
function wpb_display_pluginhandles() {
$wp_scripts = wp_scripts();
$handlename .= "<ul>";
    foreach( $wp_scripts->queue as $handle ) :
      $handlename .=  '<li>' . $handle .'</li>';
    endforeach;
$handlename .= "</ul>";
return $handlename;
}
add_shortcode( 'pluginhandles', 'wpb_display_pluginhandles');
```
