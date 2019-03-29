# WordPress Snippets

<!-- MarkdownTOC -->

* [Action Hooks](#action-hooks)
    * [do_action](#do_action)
    * [Parameters](#parameters)
* [Tags](#tags)
    * [Template Tags](#template-tags)
    * [Include Tags](#include-tags)
* [The Loop](#the-loop)
    * [Customizing Excerpts](#customizing-excerpts)
* [Theme Development](#theme-development)
    * [Change Name & Path of Theme](#change-name--path-of-theme)
* [WP Admin](#wp-admin)
    * [General](#general)
    * [Color Schemes](#color-schemes)
    * [Menu Positioning](#menu-positioning)
        * [Adding New Menu Items](#adding-new-menu-items)
        * [Repositioning Menu Items](#repositioning-menu-items)
            * [buddyPress](#buddypress)
* [WP Editor Snippets](#wp-editor-snippets)
    * [Add Buttons to TinyMCE](#add-buttons-to-tinymce)
    * [Site Settings](#site-settings)
* [Navigation](#navigation)
    * [Default Navigation Menu](#default-navigation-menu)
    * [Specific Navigation Menu](#specific-navigation-menu)
    * [Page Based Navigation](#page-based-navigation)
* [Optimization and Security](#optimization-and-security)
    * [Trackbacks & Pingbacks](#trackbacks--pingbacks)
* [Cron Jobs](#cron-jobs)
    * [See Also:](#see-also)
* [Other](#other)
    * [Use $ in jQuery Code](#use-%24-in-jquery-code)
    * [Replace Uploaded Images](#replace-uploaded-images)
    * [Useful Header Functions](#useful-header-functions)
    * [WP_User_Query](#wp_user_query)
    * [Passing parameters through add_action](#passing-parameters-through-add_action)
    * [Social Media Sharing Icons](#social-media-sharing-icons)
* [Needs Sorting](#needs-sorting)

<!-- /MarkdownTOC -->

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

<a id="tags"></a>
## Tags

<a id="template-tags"></a>
### Template Tags

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
### Include Tags

Use these tags to include templates to your theme.

* <?php get_header(); ?> – Includes header.php and display its content.
* <?php get_sidebar(); ?> – Includes sidebar.php.
* <?php get_footer(); ?> – Includes the footer.php.
* <?php comments_template(); ?> – Load specific template for comments.

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

<a id="theme-development"></a>
## Theme Development

<a id="change-name--path-of-theme"></a>
### Change Name & Path of Theme

```php
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

<a id="wp-admin"></a>
##WP Admin

<a id="general"></a>
### General

```php
function remove_trackback_metabox() {
        remove_meta_box( 'trackbacksdiv','post','normal' );
}
   add_action('admin_menu','remove_trackback_metabox');
```

<a id="color-schemes"></a>
### Color Schemes

**Add Color Scheme:**

```php
add_action('admin_init', 'additional_admin_color_schemes');
function additional_admin_color_schemes() {
    //Get the theme directory
    $theme_dir = get_template_directory_uri();

    //Ocean
    wp_admin_css_color( 'isitwpcolor', __( 'Is It WP' ),
        $theme_dir . '/admin-colors/isitwp/colors.min.css',
        array( ' #ed2a0c', '#000000', '#738e96', '#f2fcff' )
    );
}

// With the next piece of code, make your new color scheme active:

add_action('user_register', 'set_default_admin_color');
function set_default_admin_color($user_id) {
    $args = array(
        'ID' => $user_id,
        'admin_color' => 'isitwpcolor'
    );
    wp_update_user( $args );
}
```

**Rename Color Scheme:**

```php
add_filter('admin_init', 'rename_fresh_color_scheme');
function rename_fresh_color_scheme() {
    global $_wp_admin_css_colors;
    $color_name = $_wp_admin_css_colors['fresh']->name;

    if( $color_name == 'Default' ) {
        $_wp_admin_css_colors['fresh']->name = 'Fresh';
    }
    return $_wp_admin_css_colors;
}
```

<a id="menu-positioning"></a>
### Menu Positioning

<a id="adding-new-menu-items"></a>
#### Adding New Menu Items

1. Basic Functions

```php
// See https://developer.wordpress.org/reference/functions/add_submenu_page/
add_menu_page( $page_title, $menu_title, $capability, $menu_slug, $function, $icon_url, $position );
add_submenu_page( $parent_slug, $page_title, $menu_title, $capability, $menu_slug, $function);

// Example:
add_submenu_page('edit.php?post_type=wiki', 'Options', 'Options', 'manage_options', 'wiki-options', array(&$this, 'options_page') );


/**
 * Note:
 * The function that displays the page content for the menu page.
 * Technically, as in the add_menu_page function, the function parameter is optional, but if it is not supplied, then WordPress will basically assume that including the PHP file will generate the administration screen, without calling a function. Most plugin authors choose to put the page-generating code in a function within their main plugin file.
 * In the event that the function parameter is specified, It's possible to use any string for the menu_slug parameter. This allows usage of pages such as ?page=my_super_plugin_page instead of ?page=my-super-plugin/admin-options.php.
 * See the Top-Level Menus for notes about how to reference class members as function parameters.
 *
 */
```

2. Adding Custom Post Types

From: https://wordpress.stackexchange.com/questions/276230/how-can-i-control-the-position-in-the-admin-menu-of-items-added-by-plugins?rq=1

when you're creating a post type with `register_post_type()` you can set the menu position via the `menu_position` param

`menu_position (integer) (optional)` The position in the menu order the post type should appear. show_in_menu must be true.

```
Default: null - defaults to below Comments

5 - below Posts
10 - below Media
15 - below Links
20 - below Pages
25 - below comments
60 - below first separator
65 - below Plugins
70 - below Users
75 - below Tools
80 - below Settings
100 - below second separator
```

If items have the same menu position they are sorted alphabetically.


<a id="repositioning-menu-items"></a>
#### Repositioning Menu Items

1. Static

```php
// Reposition the Core Menu Items
function wpse_custom_menu_order( $menu_ord ) {
    if ( !$menu_ord ) return true;

    return array(
        'index.php', // Dashboard
        'separator1', // First separator
        'edit.php', // Posts
        'upload.php', // Media
        'link-manager.php', // Links
        'edit-comments.php', // Comments
        'edit.php?post_type=page', // Pages
        'separator2', // Second separator
        'themes.php', // Appearance
        'plugins.php', // Plugins
        'users.php', // Users
        'tools.php', // Tools
        'options-general.php', // Settings
        'separator-last', // Last separator
    );
}
add_filter( 'custom_menu_order', 'wpse_custom_menu_order', 10, 1 );
add_filter( 'menu_order', 'wpse_custom_menu_order', 10, 1 );

// Add in custom menu items as well
return array(
    'index.php', // Dashboard
    'separator1', // First separator
    'edit.php', // Posts
    'upload.php', // Media
    'link-manager.php', // Links
    'edit-comments.php', // Comments
    'edit.php?post_type=page', // Pages
    'separator2', // Second separator
    'themes.php', // Appearance
    'plugins.php', // Plugins
    'users.php', // Users
    'tools.php', // Tools
    'separator3', // Third separator
    'options-general.php', // Settings
    'separator-last', // Last separator
    'Wordfence', // Wordfence
    'nextcellent-gallery-nextgen-legacy', // NextCellent Gallery
);

```

2. Loop Based

```php
// From: https://wordpress.stackexchange.com/questions/276230/how-can-i-control-the-position-in-the-admin-menu-of-items-added-by-plugins

/**
 * Activates the 'menu_order' filter and then hooks into 'menu_order'
 * See https://developer.wordpress.org/reference/hooks/custom_menu_order/
 */
add_filter('custom_menu_order', function() { return true; });
add_filter('menu_order', 'my_new_admin_menu_order');
/**
 * Filters WordPress' default menu order
 */
function my_new_admin_menu_order( $menu_order ) {
  // define your new desired menu positions here
  // for example, move 'upload.php' to position #9 and built-in pages to position #1
  $new_positions = array(
    'upload.php' => 9,
    'edit.php?post_type=page' => 1
  );
  // helper function to move an element inside an array
  function move_element(&$array, $a, $b) {
    $out = array_splice($array, $a, 1);
    array_splice($array, $b, 0, $out);
  }
  // traverse through the new positions and move
  // the items if found in the original menu_positions
  foreach( $new_positions as $value => $new_index ) {
    if( $current_index = array_search( $value, $menu_order ) ) {
      move_element($menu_order, $current_index, $new_index);
    }
  }
  return $menu_order;
};
```

<a id="buddypress"></a>
##### buddyPress

From: https://rtmedia.io/docs/developers/add-remove-buddypress-tabs/

To change the profile menu (on the top right of the ToolBar):

```php
function my_change_profile_tab_order() {
global $bp;

$bp->bp_nav[‘settings’][‘position’] = 10;
$bp->bp_nav[‘activity’][‘position’] = 20;
$bp->bp_nav[‘friends’][‘position’] = 30;
$bp->bp_nav[‘groups’][‘position’] = 40;
$bp->bp_nav[‘blogs’][‘position’] = 50;
$bp->bp_nav[‘messages’][‘position’] = 60;
$bp->bp_nav[‘profile’][‘position’] = 70;
}
add_action( ‘bp_setup_nav’, ‘my_change_profile_tab_order’, 999 );
```


<a id="wp-editor-snippets"></a>
## WP Editor Snippets

I don't know how useful these will actually be at this point, given the advent of Gutenberg.

```php


/**
 * Remove TinyMCE
 */

add_filter('user_can_richedit' , create_function('' , 'return false;') , 50);

```

<a id="add-buttons-to-tinymce"></a>
### Add Buttons to TinyMCE

```php
function add_more_buttons($buttons) {
 $buttons&#91;&#93; = 'hr';
 $buttons&#91;&#93; = 'del';
 $buttons&#91;&#93; = 'sub';
 $buttons&#91;&#93; = 'sup';
 $buttons&#91;&#93; = 'fontselect';
 $buttons&#91;&#93; = 'fontsizeselect';
 $buttons&#91;&#93; = 'cleanup';
 $buttons&#91;&#93; = 'styleselect';
 return $buttons;
}
add_filter("mce_buttons_3", "add_more_buttons");
```

```php
/**
 * Reuse your Theme's Stylesheet
 * You can reuse the styles from your theme stylesheet file in your custom editor stylesheet file using the @import CSS rule. Working on the previous example, put the following instead into the custom-editor-style.css file.
 *
 */

@import url( 'style.css' );

/* Add overwrites as needed so that the content of the editor field is attractive and not broken */
body { padding: 0; background: #fff; }

```

```php
/**
 * Add Editor Style
 * From: https://developer.wordpress.org/reference/functions/add_editor_style/
 */

add_editor_style( array|string $stylesheet = 'editor-style.css' )
```

```php
/**
 * Registers an editor stylesheet for the theme.
 */
function wpdocs_theme_add_editor_styles() {
    add_editor_style( 'custom-editor-style.css' );
}
add_action( 'admin_init', 'wpdocs_theme_add_editor_styles' );

// Next, add to stylesheet:
body#tinymce.wp-editor {
    font-family: Arial, Helvetica, sans-serif;
    margin: 10px;
}

body#tinymce.wp-editor a {
    color: #4CA6CF;
}

// To style dynamically:
// Note that any new lines or double quotes should be removed or double escaped in your CSS.
add_filter('tiny_mce_before_init','wpdocs_theme_editor_dynamic_styles');
function wpdocs_theme_editor_dynamic_styles( $mceInit ) {
    $styles = 'body.mce-content-body { background-color: #' . get_theme_mod( 'background-color', '#FFF' ) . '}';
    if ( isset( $mceInit['content_style'] ) ) {
        $mceInit['content_style'] .= ' ' . $styles . ' ';
    } else {
        $mceInit['content_style'] = $styles . ' ';
    }
    return $mceInit;
}

```

```php
/**
 * Registers an editor stylesheet for the current theme.
 */
function wpdocs_theme_add_editor_styles() {
    $font_url = str_replace( ',', '%2C', '//fonts.googleapis.com/css?family=Lato:300,400,700' );
    add_editor_style( $font_url );
}
add_action( 'after_setup_theme', 'wpdocs_theme_add_editor_styles' );

```

```php
/**
 * Choosing Styles based on Post-Type
 * Note: There was a more elaborate version of this above this example
 * Is there a way to combine this with the dynamic version??
 */

function value( $ar, $key, $default = '' ) {
    if ( is_array( $ar ) && isset( $ar[ $key ] ) ) { return $ar[ $key ]; }
    //else

    return $default;
}
```

```php
/**
 * Registers an editor stylesheet for the current theme.
 *
 * @global WP_Post $post Global post object.
 */
function wpdocs_theme_add_editor_styles() {
    global $pagenow;
    global $post;
    $my_post_type = 'posttype';

    if ( ( ( 'post-new.php' === $pagenow ) && ( value( $_GET, 'post_type' ) == $my_post_type ) ) ||   // New post (init hook)
         ( ( 'post.php' === $pagenow ) && is_object( $post ) && ( get_post_type( $post->ID ) == $my_post_type ) ) ) {  // Edit post (pre_get_posts hook).
        add_editor_style( get_stylesheet_directory_uri() . '/css/editor-style-' . $my_post_type . '.css' );
    }
}

add_action( 'admin_init',    'wpdocs_theme_add_editor_styles' );
add_action( 'pre_get_posts', 'wpdocs_theme_add_editor_styles' );
```

```php
/**
 * Limit Post Revisions
 *
 * Limits the revisions stored in the Database as well
 * Does not delete old revisions from the database
 */
add_filter( 'wp_revisions_to_keep', 'filter_function_name', 10, 2 );

function filter_function_name( $num, $post ) {
    return $num;
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


<a id="navigation"></a>
## Navigation

<a id="default-navigation-menu"></a>
### Default Navigation Menu
* <?php wp_nav_menu(); ?>

<a id="specific-navigation-menu"></a>
### Specific Navigation Menu

```php
wp_nav_menu( array('menu' => 'My Navigation' )); ?>
// Category Based Navigation

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

/**
 * Registering New Sidebar
 * Add the following code to your functions.php file to register new side bar.
 */

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

<a id="optimization-and-security"></a>
## Optimization and Security

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

<a id="cron-jobs"></a>
## Cron Jobs

From: [https://developer.wordpress.org/plugins/cron/hooking-into-the-system-task-scheduler/](https://developer.wordpress.org/plugins/cron/hooking-into-the-system-task-scheduler/) - didn't finish copying. Resume here!!

1. Create custom interval for Cron Job

```php
add_filter( 'cron_schedules', 'example_add_cron_interval' );

function example_add_cron_interval( $schedules ) {
    $schedules['five_seconds'] = array(
        'interval' => 5,
        'display'  => esc_html__( 'Every Five Seconds' ),
    );

    return $schedules;
}
```

2. Task Scheduling

```php
// Create a custom hook:
add_action( 'bl_cron_hook', 'bl_cron_exec' );

// Check is cron job is already scheduled:
// Returns: Timestring of next time | False (if not scheduled)
wp_next_scheduled( 'bl_cron_hook' );

// Schedule an event:
// $timestamp – The UNIX timestamp of the first time this task should execute
// $recurrence – The name of the interval in which the task will recur in seconds
// $hook – The name of our custom hook to call
if ( ! wp_next_scheduled( 'bl_cron_hook' ) ) {
    wp_schedule_event( time(), 'five_seconds', 'bl_cron_hook' );

}
```

3. Unschedule Task

```php
$timestamp = wp_next_scheduled( 'bl_cron_hook' );
wp_unschedule_event( $timestamp, 'bl_cron_hook' );
```

4. Deactivate Tasks

This is *extremely important* because WordPress will continue to run Cron tasks, even if your plugin no longer exists :o

```php
register_deactivation_hook( __FILE__, 'bl_deactivate' );
function bl_deactivate() {
    $timestamp = wp_next_scheduled( 'bl_cron_hook' );
    wp_unschedule_event( $timestamp, 'bl_cron_hook' );
}
```

<a id="see-also"></a>
### See Also:

* https://kinsta.com/knowledgebase/wordpress-cron-job/#settings_saved
* https://code.tutsplus.com/tutorials/do-it-yourself-wordpress-scheduling-mastering-wp-cron--wp-188
* https://www.siteground.com/tutorials/wordpress/real-cron-job/
* https://www.jnorton.co.uk/wordpress-tutorial-cron-jobs-scheduled-tasks


<a id="other"></a>
## Other

<a id="use-%24-in-jquery-code"></a>
### Use $ in jQuery Code
```js
jQuery( document ).ready( function( $ ) {
    // $() will work as an alias for jQuery() inside of this function
    [ your code goes here ]
} );
```

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

<a id="useful-header-functions"></a>
### Useful Header Functions
* site_url();
* wp_title();
* bloginfo('name');
* bloginfo('description');
* get_stylesheet_directory_uri();
* bloginfo('template_url');
* bloginfo('atom_url');
* bloginfo('rss2_url');

<a id="wp_user_query"></a>
### WP_User_Query

```php
//new query with default args
$author_query = new WP_User_Query();

// Get the results
$authors = $author_query->get_results();

if( $authors ) {

    foreach( $authors as $author ) {

     if ( count_user_posts( $author->id ) >= 1 ) {

        echo $author->display_name . '</br>';
    }
}
} else {
    echo "no users found";
}
```

<a id="passing-parameters-through-add_action"></a>
### Passing parameters through add_action

```php
//define post type name
$pt_name = 'post';

//remove default wysiwyg editor
add_action('init', function($pt_name) {
    $post_type = $pt_name;
    remove_post_type_support( $post_type, 'editor');
}, 100);
```

<a id="social-media-sharing-icons"></a>
### Social Media Sharing Icons

```php
$fb_url = 'https://www.facebook.com/sharer/sharer.php?u=' . $post_url;
// echo( $fb_url);
$twitter_url = 'https://twitter.com/share?text=' . $post_title . '&url=' . $post_url . '&via=haSepharadi';
// $google_plus_url = 'https://plus.google.com/share?url='.$post_url;
// $linked_in_url = 'https://www.linkedin.com/shareArticle?mini=true&title='.$post_title.'&source-'.$post_url.'&url='.$post_url;
// $pinterest_url = 'https://pinterest.com/pin/create/button/?media='.$post_url.'&media='.$post_thumbnail[0].'&description='.$post_title;
// var_dump($post_thumbnail);
$whats_app_url = 'whatsapp://send?text=' . $post_title . ' ' . $post_url;

?>

<!-- Remove extraneous classes here?? -->
<div class="social-buttons share">
    <a href="<?php echo( $fb_url ); ?>" target="_blank" title="Facebook" class="social-btn facebook-circle"><i class="fab fa-fw fa-facebook-f"></i></a>
    <a href="<?php echo( $twitter_url ); ?>" target="_blank" title="Twitter" class="social-btn twitter-circle"><i class="fab fa-fw fa-twitter"></i></a>
    <!-- <a href="<?php // echo($google_plus_url) ?>" target="_blank" title="Google Plus" class="social-btn google-plus-circle"><i class="fab fa-fw fa-google-plus"></i></a> -->
    <!-- <a href="<?php // echo($pinterest_url) ?>" target="_blank" title="Pinterest" class="social-btn pinterest-circle"><i class="fab fa-fw fa-pinterest"></i></a> -->
    <!-- <a href="<?php // echo($linked_in_url) ?>" target="_blank" title="LinkedIn" class="social-btn linkedin-circle"><i class="fab fa-fw fa-linkedin"></i></a> -->
    <a href="<?php echo( $whats_app_url ); ?>" target="_blank" title="WhatsApp" class="social-btn whatsapp-circle"><i class="fab fa-fw fa-whatsapp"></i></a>

</div>

<?php
} else {
    return;
}
```


<a id="needs-sorting"></a>
## Needs Sorting


```
/**
 *  https://www.smashingmagazine.com/2015/12/responsive-images-in-wordpress-core/
 * https://css-tricks.com/responsive-images-css/
 * https://gtmetrix.com/blog/how-to-optimize-images-a-practical-guide/
 * https://www.sitepoint.com/javascript-media-queries/
 ```
