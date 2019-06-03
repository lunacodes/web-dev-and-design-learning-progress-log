# WP Troubleshooting Snippets

<!-- MarkdownTOC -->

* [WP-Config](#wp-config)
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

<a id="display-a-list-of-plugin-handles"></a>
## Display a List of Plugin Handles

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
