# WP Troubleshooting Snippets

<!-- MarkdownTOC -->

* [WP-Config](#wp-config)
* [Plugins](#plugins)
	* [List of High-CPU Plugins](#list-of-high-cpu-plugins)
	* [Display a List of Plugin Handles](#display-a-list-of-plugin-handles)

<!-- /MarkdownTOC -->

<a id="wp-config"></a>
## WP-Config

```php
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_LOG', '/tmp/wp-errors.log' );
define( 'WP_DEBUG_DISPLAY', false );

// SCRIPT_DEBUG is a related constant that will force WordPress to use the “dev” versions of core CSS and JavaScript files rather than the minified versions that are normally loaded.
define( 'SCRIPT_DEBUG', true );
define( 'SAVEQUERIES', true );
```

<a id="plugins"></a>
## Plugins

<a id="list-of-high-cpu-plugins"></a>
### List of High-CPU Plugins

from: https://onlinemediamasters.com/slow-wordpress-admin-panel/

* AdSense Click Fraud Monitoring
* Backup Buddy (use UpdraftPlus)
* Better WordPress Google XML Sitemaps (use Yoast)
* Broken link checker (use Dr. Link Check)
* Constant Contact for WordPress
* Contact Form 7 (load JS + stylesheet only when necessary)
* Contextual Related Posts
* Digi Auto Links
* Disqus Comment System (use Disqus Conditional Load)
* Divi Builder
* Essential Grid
* Fuzzy SEO Booster
* Google XML Sitemaps (use Yoast)
* Jetpack
* NextGEN Gallery
* NewStatPress
* Pods
* Reveal IDs
* Revolution Slider
* S2 member
* SEO Auto Links & Related Posts
* Similar Posts
* Slimstat Analytics
* SumoMe
* Talk.To
* VaultPress
* WooCommerce
* WordPress Facebook
* WordPress Related Posts
* WordPress Popular Posts
* WP Bakey (formerly Visual Composer)
* WP Statistics
* WP-PostViews
* WP Power Stats
* wpCloaker
* WPML
* Yet Another Related Post Plugin
* Yuzo Related Posts

<a id="display-a-list-of-plugin-handles"></a>
### Display a List of Plugin Handles

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
