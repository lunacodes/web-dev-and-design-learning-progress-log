# WordPress Admin & Webmaster Snippets

<!-- MarkdownTOC -->

* [WP Admin](#wp-admin)
    * [General](#general)
    * [Custom Login Links and Logo](#custom-login-links-and-logo)
    * [Color Schemes](#color-schemes)
    * [Menu Positioning](#menu-positioning)
        * [Adding New Menu Items](#adding-new-menu-items)
        * [Repositioning Menu Items](#repositioning-menu-items)
    * [Getting IDs](#getting-ids)
    * [buddyPress](#buddypress)
* [WP Editor Snippets](#wp-editor-snippets)
    * [Add Buttons and Files to TinyMCE](#add-buttons-and-files-to-tinymce)
    * [Editor Stylesheets](#editor-stylesheets)
    * [Google Fonts](#google-fonts)
* [Site Settings](#site-settings)
* [Cron Jobs](#cron-jobs)
    * [See Also:](#see-also)

<!-- /MarkdownTOC -->

<a id="wp-admin"></a>
## WP Admin

<a id="general"></a>
### General

```php
function remove_trackback_metabox() {
        remove_meta_box( 'trackbacksdiv','post','normal' );
}
   add_action('admin_menu','remove_trackback_metabox');
```

<a id="custom-login-links-and-logo"></a>
### Custom Login Links and Logo
```php
add_action( 'login_enqueue_scripts', 'haSeph_custom_login_logo' );
function haSeph_custom_login_logo() { ?>
    <style type="text/css">
        #login h1 a, .login h1 a {
            background-image: url(https://hasepharadi.com/wp-content/themes/haSepharadi/images/logo.png);
            background-image: none, url(https://hasepharadi.com/wp-content/themes/haSepharadi/images/logo.png);
            background-position: left top;
            background-repeat: no-repeat;
            background-size: 320px;
            color: #444;
            display: block;
            font-size: 20px;
            font-weight: 400;
            height: 120px;
            line-height: 1.3em;
            margin: 0 auto 25px;
            outline: 0;
            overflow: hidden;
            padding: 0;
            text-decoration: none;
            text-indent: -9999px;
            width: 320px;
        }
    </style>

    <?php
}
```

To change the link values so the logo links to your WordPress site, use the following WordPress hooks example; edit it and paste it below the previous in the functions.php:

```php
function my_login_logo_url() {
    return home_url();
}
add_filter( 'login_headerurl', 'my_login_logo_url' );

function my_login_logo_url_title() {
    return 'Your Site Name and Info';
}
add_filter( 'login_headertitle', 'my_login_logo_url_title' );
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

<a id="getting-ids"></a>
### Getting IDs

```php
/* 1.4 - WP Admin - Get Widget ID
============================*/

add_action( 'in_widget_form', 'luna_get_widget_id' );
function luna_get_widget_id( $widget_instance ) {
    if ( $widget_instance->number=="__i__" ) {
        echo( "<p><strong>Widget ID:</strong> Please save the widget first!</p>");
    } else {
        echo( "<p><strong>Widget ID: </strong>" . $widget_instance->id . "</p>");
    }
}
```

<a id="buddypress"></a>
### buddyPress

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

```php
/**
 * Remove TinyMCE
 */

add_filter('user_can_richedit' , create_function('' , 'return false;') , 50);

```

<a id="add-buttons-and-files-to-tinymce"></a>
### Add Buttons and Files to TinyMCE

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

Add files dynamically:

```php
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

<a id="editor-stylesheets"></a>
### Editor Stylesheets

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

<a id="google-fonts"></a>
### Google Fonts

```php
// Google Fonts in Editor
/**
 * Registers an editor stylesheet for the current theme.
 */
// function wpdocs_theme_add_editor_styles() {
//     $font_url = str_replace( ',', '%2C', '//fonts.googleapis.com/css?family=Lato:300,400,700' );
//     add_editor_style( $font_url );
// }
// add_action( 'after_setup_theme', 'wpdocs_theme_add_editor_styles' );
```

<a id="site-settings"></a>
## Site Settings

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

