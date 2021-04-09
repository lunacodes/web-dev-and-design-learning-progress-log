# NGINX Installation and Setup Guide

<!-- MarkdownTOC -->

* [NGINX LEMP Stack](#nginx-lemp-stack)
* [Create a Self-Signed SSL Certificate](#create-a-self-signed-ssl-certificate)
    * [Configure NGINX to Use SSL](#configure-nginx-to-use-ssl)
        * [Create a Configuration Snippet Pointing to the SSL Key and Certificate](#create-a-configuration-snippet-pointing-to-the-ssl-key-and-certificate)
        * [Adjusting the Nginx Configuration to Use SSL](#adjusting-the-nginx-configuration-to-use-ssl)
        * [Adjust the Firewall](#adjust-the-firewall)
    * [Make the Redirect Permanents](#make-the-redirect-permanents)
* [Installing WordPress](#installing-wordpress)

<!-- /MarkdownTOC -->


<a id="nginx-lemp-stack"></a>
## NGINX LEMP Stack

```bash
sudo apt update
sudo apt install nginx

sudo ufw allow 'Nginx HTTP'
sudo ufw status
# Get IP Address if necessary (though you can just do this w/ ifconfig)
# Or alternately curl -4 icanhazip.com
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

sudo apt install mysql-server
sudo mysql_secure_installation
# It should ask if you want to configure the VALIDATE PASSWORD PLUGIN.
# Mine didn't

sudo mysql
SELECT user,authentication_string,plugin,host FROM mysql.user;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;
SELECT user,authentication_string,plugin,host FROM mysql.user;
exit
# After this you'll have to use mysql -u root -p

# NGINX doesn't contain native PHP propcesses - so we need to make that happen
# via php-gm 'fastCGI process manager'
sudo add-apt-repository universe
sudo apt install php-fpm php-mysql

sudo nano /etc/nginx/sites-available/example.com

# Add the following :
server {
    listen 80;
    root /var/www/html/river;
    index index.php index.html index.htm index.nginx-debian.html;
    server_name river.dev.cc www.river.dev.cc;

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
    }

    location = /favicon.ico { log_not_found off; access_log off; }
    location = /robots.txt { log_not_found off; access_log off; allow all; }
    location ~* \.(css|gif|ico|jpeg|jpg|js|png)$ {
        expires max;
        log_not_found off;
    }

    location ~ /\.ht {
        deny all;
    }
}

sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
# Unlink the default configuration
# To restore it, just type: sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
sudo unlink /etc/nginx/sites-enabled/default

# Test the config file
sudo nginx -t
sudo systemctl reload nginx
# Create a phpinfo file, then visit
# http://your_server_domain_or_IP/info.php
sudo nano /var/www/html/info.php
# <?php
# phpinfo();
# ?>

# Remove the phpinfo file
sudo rm /var/www/html/info.php
```


<a id="create-a-self-signed-ssl-certificate"></a>
## Create a Self-Signed SSL Certificate

```bash
# Create a self-signed key and cert pair
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

# Create a strong Diffie-Hellman group, which is used in negotiating [Perfect Forwarrd Secrecy](https://en.wikipedia.org/wiki/Forward_secrecy) with clients
#   NOTE: This takes forever, and you can do it later on in the process if necessary
#   Alternately, this and *Excellent* time to take your lunch break!!
# When it's done you will have a strong DH group at /etc/nginx/dhparam.pem that we can use in our configuration.
sudo openssl dhparam -out /etc/nginx/dhparam.pem 4096


```

<a id="configure-nginx-to-use-ssl"></a>
### Configure NGINX to Use SSL

```bash
sudo nano /etc/nginx/snippets/self-signed.conf
# Add the following:
ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
```

<a id="create-a-configuration-snippet-pointing-to-the-ssl-key-and-certificate"></a>
#### Create a Configuration Snippet Pointing to the SSL Key and Certificate

```bash
# We'll be slightly modifying the template on https://cipherli.st
sudo nano /etc/nginx/snippets/ssl-params.conf
# Add this:
ssl_protocols TLSv1.2;
ssl_prefer_server_ciphers on;
ssl_dhparam /etc/nginx/dhparam.pem;
ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384;
ssl_ecdh_curve secp384r1; # Requires nginx >= 1.1.0
ssl_session_timeout  10m;
ssl_session_cache shared:SSL:10m;
ssl_session_tickets off; # Requires nginx >= 1.5.9
ssl_stapling on; # Requires nginx >= 1.3.7
ssl_stapling_verify on; # Requires nginx => 1.3.7
resolver 8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout 5s;
# Disable strict transport security for now. You can uncomment the following
# line if you understand the implications.
# add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
add_header X-Frame-Options DENY;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";
```

<a id="adjusting-the-nginx-configuration-to-use-ssl"></a>
#### Adjusting the Nginx Configuration to Use SSL

```bash
# Backup the config file first
sudo cp /etc/nginx/sites-available/example.com /etc/nginx/sites-available/example.com.bak

server {
    listen 443 ssl;
    listen [::]:443 ssl;
    include snippets/self-signed.conf;
    include snippets/ssl-params.conf;

    server_name example.com www.example.com;

    root /var/www/example.com/html;
    index index.html index.htm index.nginx-debian.html;

    . . .
}

. . .
server {
    listen 80;
    listen [::]:80;

    server_name example.com www.example.com;

    return 302 https://$server_name$request_uri;
}

```

<a id="adjust-the-firewall"></a>
#### Adjust the Firewall

```bash
sudo ufw app list
sudo ufw app status
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'

# Test the config file
# sudo nginx -t

# Visit your site to double check that it works
```

<a id="make-the-redirect-permanents"></a>
### Make the Redirect Permanents

```bash
sudo nano /etc/nginx/sites-available/example.com
# Change return 302 to 301
return 301 https://$server_name$request_uri;

sudo nginx -t
sudo systemctl reload nginx
```

<a id="installing-wordpress"></a>
## Installing WordPress

```bash
sudo sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.2/fpm/php.ini
```


As globpath() takes a comma-separated list of directories, you can build the locations like this (I'm doing this in a primitive way with duplication, as you seem to be not very well versed in Vimscript):

function! sourceConfig()
  let path = $HOME  . '/dotfiles/vim/config/global'
  let path .= ',' . $HOME  . '/dotfiles/vim/config/plugins'
  let path .= ',' . $HOME  . '/dotfiles/vim/config/functions'
Then, this list can be passed to generate the list of script files, which can then be sourced (note that your syntax was wrong, and it's recommended to do proper escaping):

  let file_list = split(globpath(path, '*.vim'), '\n')

  for file in file_list
    execute 'source' fnameescape(file)
  endfor
endfunction
Critique of approach
You didn't mention the motivation for that reorganization, but I would recommend to stick to default configuration layouts, either the "all under .vim" or the "separate bundle directories per plugin".

For example, your listed approach doesn't handle ftplugins or autoload, which I'm sure some of your plugins has / will have.
