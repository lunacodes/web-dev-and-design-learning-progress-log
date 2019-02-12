# WordPress Snippets

<!-- MarkdownTOC -->

* [General](#general)
    * [Use $ in jQuery Code](#use-%24-in-jquery-code)
* [Site Optimization](#site-optimization)
    * [Remove Plugin Stylesheets and Scripts](#remove-plugin-stylesheets-and-scripts)
* [General](#general-1)
    * [Remove From Header and Add to Footer](#remove-from-header-and-add-to-footer)
* [Debugging](#debugging)
    * [Find Out All Plugin \(Script?\) Handles](#find-out-all-plugin-script-handles)
* [Theme Development](#theme-development)
    * [Change Name & Path of Theme](#change-name--path-of-theme)
    * [Site Settings](#site-settings)
* [Plugin Development](#plugin-development)
    * [Conditional Display of Widgets](#conditional-display-of-widgets)
    * [Custom Dashboard Widgets](#custom-dashboard-widgets)
* [WordPress Coding Standards - Linting](#wordpress-coding-standards---linting)
* [Images](#images)
    * [Replace Uploaded Images](#replace-uploaded-images)
* [Action Hooks](#action-hooks)
    * [do_action](#do_action)
    * [Parameters](#parameters)
* [Template Tags](#template-tags)
* [Include Tags](#include-tags)
    * [Useful Header Functions](#useful-header-functions)
* [The Loop](#the-loop)
    * [Customizing Excerpts](#customizing-excerpts)
* [Navigation](#navigation)
    * [Default Navigation Menu](#default-navigation-menu)
        * [Specific Navigation Menu](#specific-navigation-menu)
    * [Page Based Navigation](#page-based-navigation)

<!-- /MarkdownTOC -->

<a id="general"></a>
## General

<a id="use-%24-in-jquery-code"></a>
### Use $ in jQuery Code
```js
jQuery( document ).ready( function( $ ) {
    // $() will work as an alias for jQuery() inside of this function
    [ your code goes here ]
} );
```

<a id="site-optimization"></a>
## Site Optimization

<a id="remove-plugin-stylesheets-and-scripts"></a>
### Remove Plugin Stylesheets and Scripts

<a id="general-1"></a>
## General

1. Deregister Stylesheet Handle:

```php
// For a script w/ id="gdwpm_styles-css":
add_action( 'wp_print_styles', 'my_deregister_styles', 100 );
function my_deregister_styles() {
wp_deregister_style( 'gdwpm_styles-css' );
}

// FOr multiple files:
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
$handlename .= "<ul>";
    foreach( $wp_scripts->queue as $handle ) :
      $handlename .=  '<li>' . $handle .'</li>';
    endforeach;
$handlename .= "</ul>";
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

<a id="remove-from-header-and-add-to-footer"></a>
### Remove From Header and Add to Footer

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

<a id="theme-development"></a>
## Theme Development

<a id="change-name--path-of-theme"></a>
### Change Name & Path of Theme

```php
<?php
require_once 'wp-config.php';
$current_theme = wp_get_theme();

$name = $current_theme->get_stylesheet();
$path = $current_theme->get_stylesheet_directory();

$new_stylesheet_name = 'haSepharadi'; // The new folder name. Just the name e.g. 'mynewtheme'

if( $new_stylesheet_name ) {
    rename( $path, get_theme_root() . '/' . $new_stylesheet_name );
    switch_theme( $new_stylesheet_name );
}
```

<a id="site-settings"></a>
### Site Settings

Static vs Blog homepage, via PHP

```php
// Use a static front page
$about = get_page_by_title( 'About' );
update_option( 'page_on_front', $about->ID );
update_option( 'show_on_front', 'page' );

// Set the blog page
$blog   = get_page_by_title( 'Blog' );
update_option( 'page_for_posts', $blog->ID );

// Switch to our theme
switch_theme( 'Template', 'stylesheet' );
```

<a id="plugin-development"></a>
## Plugin Development

<a id="conditional-display-of-widgets"></a>
### Conditional Display of Widgets

```php
/* Note: these require some sorting and evaluation */

// not quite working: https://www.isitwp.com/show-hide-widgets-specific-pages/
add_filter( 'widget_display_callback', 'hide_widget_pages', 10, 3 );
function hide_widget_pages( $instance, $widget, $args ) {
  if ( $widget->id_base == 'pages' ) { // change 'pages' to widget name
     if ( !is_page( 'contact' ) ) {    // change page name
         return false;
     }
  }
}


https://inthedigital.co.uk/simple-filter-to-hide-specific-widgets-on-specific-pages/
/**
 * Hide portfolio teaser widget on any portfolio page
 */
add_filter( 'widget_display_callback', function ( $instance, $widget, $args ) {
    return ( 'portfolio' === get_post_type() and 'portfolio_recent_installs' === $widget->id_base) ? false : $instance;
}, 10, 3 );


/**
 * Hide portfolio teaser widget on any portfolio page
 */
add_filter( 'widget_display_callback', function ( $instance, $widget, $args ) {
    // the post type and widget ID to compare
    $post_type_to_compare = 'portfolio';
    $widget_id_to_compare = 'portfolio_recent_installs';

    // the current page's post type and current widget's base ID
    $post_type = get_post_type();
    $widget_id = $widget->id_base;

    // the Boolean results from each comparison
    $is_widget_match = $widget_id_to_compare === $widget_id;
    $is_post_type_match = $post_type_to_compare === $post_type;

    // the expression to determine which value will be returned
    if ( $is_post_type_match &amp;&amp; $is_widget_match ) {
        return false;
    } else {
        return $instance;
    }
}, 10, 3 );

// Jetpack's implementation
// http://hookr.io/filters/widget_display_callback/


```

<a id="custom-dashboard-widgets"></a>
### Custom Dashboard Widgets

```php
// From: https://www.wpbeginner.com/wp-themes/how-to-add-custom-dashboard-widgets-in-wordpress/
add_action('wp_dashboard_setup', 'my_custom_dashboard_widgets');

function my_custom_dashboard_widgets() {
global $wp_meta_boxes;

wp_add_dashboard_widget('custom_help_widget', 'Theme Support', 'custom_dashboard_help');
}

function custom_dashboard_help() {
echo '<p>Welcome to Custom Blog Theme! Need help? Contact the developer <a href="mailto:yourusername@gmail.com">here</a>. For WordPress Tutorials visit: <a href="https://www.wpbeginner.com" target="_blank">WPBeginner</a></p>';
}
```

<a id="wordpress-coding-standards---linting"></a>
## WordPress Coding Standards - Linting

1. [Create & Code - How to setup linting and coding standards compliance for WordPress](https://createandcode.com/linting-wordpress-coding-standards/)

2. [webdev studios - Lint Code Like a Boss](https://webdevstudios.com/2017/04/06/lint-code-like-boss/)

<a id="images"></a>
## Images

<a id="replace-uploaded-images"></a>
### Replace Uploaded Images

```php
/* Note: have not tested */

function replace_uploaded_image($image_data) {
// if there is no large image : return
if (!isset($image_data['sizes']['large'])) return $image_data;

// paths to the uploaded image and the large image
$upload_dir = wp_upload_dir();
$uploaded_image_location = $upload_dir['basedir'] . '/' .$image_data['file'];
$large_image_location = $upload_dir['path'] . '/'.$image_data['sizes']['large']['file'];

// delete the uploaded image
unlink($uploaded_image_location);

// rename the large image
rename($large_image_location,$uploaded_image_location);

// update image metadata and return them
$image_data['width'] = $image_data['sizes']['large']['width'];
$image_data['height'] = $image_data['sizes']['large']['height'];
unset($image_data['sizes']['large']);

return $image_data;
}

add_filter('wp_generate_attachment_metadata','replace_uploaded_image');
```


<a id="action-hooks"></a>
## Action Hooks

<a id="do_action"></a>
### do_action

Execute functions hooked on a specific action hook:
`do_action( string $tag,  $arg = '' )`

This function invokes all functions attached to action hook $tag. It is possible to create new action hooks by simply calling this function, specifying the name of the new hook using the $tag parameter.

You can pass extra arguments to the hooks, much like you can with apply_filters().

<a id="parameters"></a>
### Parameters
$tag
(string) (Required) The name of the action to be executed.

$arg,...
(mixed) (Optional) Additional arguments which are passed on to the functions hooked to the action. Default empty.



<a id="template-tags"></a>
## Template Tags

WordPress template tags are used to return information dynamically.
In other words they you can use them to customize your WordPress site.

For example, the_title() tag would display title of the specific post.

* the_content(); – Get post content.
* the_excerpt(); – Get the post excerpt.
* the_title(); – Get the title of the post
* the_permalink() – Display post link
* the_category(', ') – Display category of a post
* the_author(); – Show post author
* the_ID(); – Display post ID
* edit_post_link(); – Show Edit link for a post
* next_post_link(' %link ') – Display next page URL
* previous_post_link('%link') – Display previous page URL
* get_links_list(); – Retrieve blogroll links
* wp_list_pages(); – Retrieve all pages
* wp_get_archives() – Retrieve archive for the site
* wp_list_cats(); – Retrieve all categories
* get_calendar(); – Show the built-in WordPress calendar
* wp_register(); – Show register link
* wp_loginout(); – Displays login or logout links (for registered users)

<a id="include-tags"></a>
## Include Tags

Use these tags to include templates to your theme.

* <?php get_header(); ?> – Includes header.php and display its content.
* <?php get_sidebar(); ?> – Includes sidebar.php.
* <?php get_footer(); ?> – Includes the footer.php.
* <?php comments_template(); ?> – Load specific template for comments.

<a id="useful-header-functions"></a>
### Useful Header Functions
site_url();
wp_title();
bloginfo('name');
bloginfo('description');
get_stylesheet_directory_uri();
bloginfo('template_url');
bloginfo('atom_url');
bloginfo('rss2_url');

<a id="the-loop"></a>
## The Loop

The Loop is PHP code used by WordPress to return posts. It processes individual posts and displays them on the current page. It also formats the post according to how it matches specified parameters.

```php
<?php if ( have_posts() ) : ?>
 <?php while ( have_posts() ) : the_post(); ?>
 // Display post content
 <?php endwhile; ?>
<?php endif; ?>
```

<a id="customizing-excerpts"></a>
### Customizing Excerpts

```php
/**
 * Append ellipses to excerpts and then show "Read More"  button for manual & automatic excerpts.
 *
 * @param type $text
 * @return string
 */
 function custom_excerpt($text) {
//    $text= substr_replace($text,"...",strpos($text, "</p>"),0);
$excerpt = $text . '<a href="' . get_permalink() . '"><button class="read-more-btn" type="button" value="read_more">Read More</button></a>';
return $excerpt;
}

add_filter('the_excerpt', 'custom_excerpt');


function new_excerpt_more($more) {
    return '...';
}
add_filter('excerpt_more', 'new_excerpt_more');
```

<a id="navigation"></a>
## Navigation

<a id="default-navigation-menu"></a>
### Default Navigation Menu
* <?php wp_nav_menu(); ?>

<a id="specific-navigation-menu"></a>
#### Specific Navigation Menu

```php
wp_nav_menu( array('menu' => 'My Navigation' )); ?>
Category Based Navigation

<ul id="menu">
    <li <?php if(is_home()) { ?> class="current-cat" <?php } ?>>
    <a href="<?php bloginfo('home'); ?>">Home</a></li>

    <?php wp_list_categories('title_li=&orderby=id');?>
</ul>
```

<a id="page-based-navigation"></a>
### Page Based Navigation

```php
<ul id="menu">
<li <?php if(is_home()) { ?> class="current-page-item" <?php } ?>>
<a href="<?php bloginfo('home'); ?>">Home</a></li>
<?php wp_list_pages('sort_column=menu_order&depth=1&title_li=');?>
</ul>
Registering New Sidebar
Add the following code to your functions.php file to register new side bar.
add_action( 'widgets_init', 'theme_slug_widgets_init' );
function theme_slug_widgets_init() {
 register_sidebar( array(
 'name' => __( 'My Sidebar', 'theme-slug' ),
 'id' => 'sidebar-1',
 'description' => __( 'Description', 'theme-slug' ),
 'before_widget' => '<li id="%1$s" class="widget %2$s">',
 'after_widget' => '</li>',
 'before_title' => '<h2 class="widgettitle">',
 'after_title' => '</h2>',
 ) );
}
```
