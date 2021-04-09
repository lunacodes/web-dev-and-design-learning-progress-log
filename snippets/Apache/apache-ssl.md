# Enabling SSL On Apache

<!-- MarkdownTOC -->

* [1. Create the Certificate](#1-create-the-certificate)
* [2. Configure Apache to Use SSL](#2-configure-apache-to-use-ssl)
	* [Creating an Apache Configuration Snippet with Strong Encryption Settings](#creating-an-apache-configuration-snippet-with-strong-encryption-settings)
	* [Modifying the Default Apache SSL Virtual Host File](#modifying-the-default-apache-ssl-virtual-host-file)
	* [Modify the Hosts File to Redirect to HTTPS](#modify-the-hosts-file-to-redirect-to-https)
* [3. Adjust the Firewall](#3-adjust-the-firewall)
* [4. Enable the Changes in Apache](#4-enable-the-changes-in-apache)
* [5. Test Encryption](#5-test-encryption)
* [6. Change to a Permanent Redirect](#6-change-to-a-permanent-redirect)

<!-- /MarkdownTOC -->

From: https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-18-04

<a id="1-create-the-certificate"></a>
## 1. Create the Certificate

We can create a self-signed key and certificate pair with OpenSSL in a single command:

```sh
# See source page for explanation of params
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
```


<a id="2-configure-apache-to-use-ssl"></a>
## 2. Configure Apache to Use SSL

<a id="creating-an-apache-configuration-snippet-with-strong-encryption-settings"></a>
### Creating an Apache Configuration Snippet with Strong Encryption Settings

Create a new snippet in the /etc/apache2/conf-available directory. We will name the file ssl-params.conf to make its purpose clear:

```sh
sudo vi /etc/apache2/conf-available/ssl-params.conf
```

Optional: Disable HSTS. May be helpful for compatibility issues. See [Wikipedia - HTTP Strict Transport Security](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security) and [HSTS Preload List Submission](https://hstspreload.appspot.com/) for more

Paste the configuration into the ssl-params.conf file we opened:

```sh
# file: /etc/apache2/conf-available/ssl-params.conf
SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH
SSLProtocol All -SSLv2 -SSLv3 -TLSv1 -TLSv1.1
SSLHonorCipherOrder On
# Disable preloading HSTS for now.  You can use the commented out header line that includes
# the "preload" directive if you understand the implications.
# Header always set Strict-Transport-Security "max-age=63072000; includeSubDomains; preload"
Header always set X-Frame-Options DENY
Header always set X-Content-Type-Options nosniff
# Requires Apache >= 2.4
SSLCompression off
SSLUseStapling on
SSLStaplingCache "shmcb:logs/stapling-cache(150000)"
# Requires Apache >= 2.4.11
SSLSessionTickets Off
```

<a id="modifying-the-default-apache-ssl-virtual-host-file"></a>
### Modifying the Default Apache SSL Virtual Host File

Backup the original SSL Virtual Host File

```sh
sudo cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bak
```

Modify settings to match the following:

```sh
sudo vi /etc/apache2/sites-available/default-ssl.conf

# file: /etc/apache2/sites-available/default-ssl.conf
<IfModule mod_ssl.c>
        <VirtualHost _default_:443>
                ServerAdmin your_email@example.com
                # Add server name
                ServerName server_domain_or_IP

                DocumentRoot /var/www/html

                ErrorLog ${APACHE_LOG_DIR}/error.log
                CustomLog ${APACHE_LOG_DIR}/access.log combined

                SSLEngine on

                SSLCertificateFile      /etc/ssl/certs/apache-selfsigned.crt
                SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key

                <FilesMatch "\.(cgi|shtml|phtml|php)$">
                                SSLOptions +StdEnvVars
                </FilesMatch>
                <Directory /usr/lib/cgi-bin>
                                SSLOptions +StdEnvVars
                </Directory>

        </VirtualHost>
</IfModule>
```

<a id="modify-the-hosts-file-to-redirect-to-https"></a>
### Modify the Hosts File to Redirect to HTTPS

```sh
sudo vi /etc/apache2/sites-available/000-default.conf

<a id="file-etcapache2sites-available000-defaultconf"></a>
# file: /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
        . . .

        Redirect "/" "https://your_domain_or_IP/"

        . . .
</VirtualHost>
```

<a id="3-adjust-the-firewall"></a>
## 3. Adjust the Firewall

```sh
# Check available profiles and status
sudo ufw app list
sudo ufw status

# Allow the 'Apache Full' profile, and then delete the redundant 'Apache' profile
sudo ufw allow 'Apache Full'
sudo ufw delete allow 'Apache'

sudo ufw status
```

<a id="4-enable-the-changes-in-apache"></a>
## 4. Enable the Changes in Apache

We can enable `mod_ssl`, the Apache SSL module, and `mod_headers`, needed by some of the settings in our SSL snippet, with the `a2enmod` command:

```sh
sudo a2enmod ssl
sudo a2enmod headers

# Enable SSL Virtual Host
sudo a2ensite default-ssl

# Enable ssl-params.conf to read in the values we set
sudo a2enconf ssl-params

# Test config
sudo apache2ctl configtest

# Restart Apache
sudo systemctl restart apache2
```

<a id="5-test-encryption"></a>
## 5. Test Encryption

Check that `https://yoursite.url` works and that `yoursite.url` redirects to `https://yoursite.url`

<a id="6-change-to-a-permanent-redirect"></a>
## 6. Change to a Permanent Redirect

```sh
sudo vi /etc/apache2/sites-available/000-default.conf

# file: /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
        . . .

        Redirect permanent "/" "https://your_domain_or_IP/"

        . . .
</VirtualHost>

# Test config
sudo apache2ctl configtest

# Restart Apache
sudo systemctl restart apache2
```
