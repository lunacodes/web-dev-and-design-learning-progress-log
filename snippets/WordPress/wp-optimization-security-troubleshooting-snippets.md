# WordPress - Optimization & Security Snippets

<!-- MarkdownTOC -->

* [Site Optimization](#site-optimization)
  * [Remove Plugin Stylesheets and Scripts](#remove-plugin-stylesheets-and-scripts)
  * [Trackbacks & Pingbacks](#trackbacks--pingbacks)
  * [Embeds](#embeds)
    * [Disable Embeds](#disable-embeds)
    * [Deregister Embed Scripts](#deregister-embed-scripts)
* [Security](#security)
  * [Scripts & Actions to Remove](#scripts--actions-to-remove)
  * [Google Fonts](#google-fonts)
* [Debugging](#debugging)
  * [Find Out All Plugin \(Script?\) Handles](#find-out-all-plugin-script-handles)

<!-- /MarkdownTOC -->

<a id="site-optimization"></a>
## Site Optimization

<a id="remove-plugin-stylesheets-and-scripts"></a>
### Remove Plugin Stylesheets and Scripts

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
function remove_scripts_styles_footer() {
    //----- CSS
    wp_deregister_style('jetpack_css'); // Jetpack

    //----- JS
    wp_deregister_script('devicepx'); // Jetpack
}

add_action('wp_footer', 'remove_scripts_styles_footer');
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

<a id="trackbacks--pingbacks"></a>
### Trackbacks & Pingbacks
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
### Embeds

<a id="disable-embeds"></a>
#### Disable Embeds
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
#### Deregister Embed Scripts

```php
function my_deregister_scripts(){
 wp_dequeue_script( 'wp-embed' );
}
add_action( 'wp_footer', 'my_deregister_scripts' );
```

<a id="security"></a>
## Security

<a id="scripts--actions-to-remove"></a>
### Scripts & Actions to Remove

1. Windows Live Write
```php
remove_action('wp_head', 'wlwmanifest_link');
```

<a id="google-fonts"></a>
### Google Fonts

* https://speckyboy.com/speed-google-fonts-wordpress/
* https://google-webfonts-helper.herokuapp.com/fonts/source-sans-pro?subsets=latin,vietnamese,cyrillic-ext,greek,latin-ext,greek-ext,cyrillic

<a id="debugging"></a>
## Debugging

<a id="find-out-all-plugin-script-handles"></a>
### Find Out All Plugin (Script?) Handles

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
