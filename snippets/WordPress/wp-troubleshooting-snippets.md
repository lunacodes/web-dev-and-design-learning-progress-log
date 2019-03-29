# WP Troubleshooting Snippets

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
