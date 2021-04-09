# Genesis Snippets

<!-- MarkdownTOC -->

* [Genesis Action Hooks](#genesis-action-hooks)
* [Needs Sorting](#needs-sorting)
* [Custom Footer](#custom-footer)
* [Genesis Column Classes](#genesis-column-classes)
* [Archive and Category Pages](#archive-and-category-pages)
    * [Remove Archive Page Titles](#remove-archive-page-titles)
    * [Remove Category Page Titles](#remove-category-page-titles)
* [Custom Taxonomy](#custom-taxonomy)
* [Author Box](#author-box)
* [AdSense](#adsense)
* [Full-Width Header Image](#full-width-header-image)
* [General Settings](#general-settings)
* [CSS](#css)
* [Unsorted](#unsorted)
* [Mobile Menu](#mobile-menu)
    * [Remove text from next to hamburger menu:](#remove-text-from-next-to-hamburger-menu)
    * [Prevent Ugly Load of Mobile Menu](#prevent-ugly-load-of-mobile-menu)
* [Add Classes or Other Attributes to Markup](#add-classes-or-other-attributes-to-markup)

<!-- /MarkdownTOC -->

<a id="genesis-action-hooks"></a>
## Genesis Action Hooks
For a list of all the Genesis Action Hooks, see the [Genesis Action Hooks](genesis-action-hooks.md) file.

<a id="needs-sorting"></a>
## Needs Sorting
```php
acf_form_head();
get_header();
$author_id = get_the_author_meta('ID');
$avatar_image= get_field('avatar_image', 'user_'. $author_id );
$linkedin_link= get_field('linkedin_link', 'user_'. $author_id );
$twitter_handle= get_field('twitter_handle', 'user_'. $author_id );
?>

<img src="<?php echo $avatar_image['url']; ?>" alt="<?php echo $avatar_image['alt']; ?>" />
<a href="<?php echo $linkedin_link; ?>">LinkedIn</a>
<a href="https://twitter.com/<?php echo $twitter_handle; ?>">Twitter</a>
```

<a id="custom-footer"></a>
## Custom Footer

```php
add_filter('genesis_footer_creds_text', 'sp_footer_creds_filter');
function sp_footer_creds_filter( $creds ) {
        $creds = 'Copyright [footer_copyright] <a href="https://hasepharadi.com">haSepharadi</a>. All rights reserved.';
        return $creds;
}
```

<a id="genesis-column-classes"></a>
## Genesis Column Classes

```css
/* Column Classes
    Link: http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css
--------------------------------------------- */

.five-sixths,
.four-sixths,
.one-fourth,
.one-half,
.one-sixth,
.one-third,
.three-fourths,
.three-sixths,
.two-fourths,
.two-sixths,
.two-thirds {
    float: left;
    margin-left: 2.564102564102564%;
}

.one-half,
.three-sixths,
.two-fourths {
    width: 48.717948717948715%;
}

.one-third,
.two-sixths {
    width: 31.623931623931625%;
}

.four-sixths,
.two-thirds {
    width: 65.81196581196582%;
}

.one-fourth {
    width: 23.076923076923077%;
}

.three-fourths {
    width: 74.35897435897436%;
}

.one-sixth {
    width: 14.52991452991453%;
}

.five-sixths {
    width: 82.90598290598291%;
}

.first {
    clear: both;
    margin-left: 0;
}
```

<a id="archive-and-category-pages"></a>
## Archive and Category Pages

<a id="remove-archive-page-titles"></a>
### Remove Archive Page Titles

```php
//Removes Title and Description on CPT Archive
remove_action( 'genesis_before_loop', 'genesis_do_cpt_archive_title_description' );
//Removes Title and Description on Blog Archive
remove_action( 'genesis_before_loop', 'genesis_do_posts_page_heading' );
//Removes Title and Description on Date Archive
remove_action( 'genesis_before_loop', 'genesis_do_date_archive_title' );
//Removes Title and Description on Archive, Taxonomy, Category, Tag
remove_action( 'genesis_before_loop', 'genesis_do_taxonomy_title_description', 15 );
//Removes Title and Description on Author Archive
remove_action( 'genesis_before_loop', 'genesis_do_author_title_description', 15 );
//Removes Title and Description on Blog Template Page
remove_action( 'genesis_before_loop', 'genesis_do_blog_template_heading' );
```
<a id="remove-category-page-titles"></a>
### Remove Category Page Titles
```php
remove_action( 'genesis_archive_title_descriptions', 'genesis_do_archive_headings_open', 5, 3 );

remove_action( 'genesis_archive_title_descriptions', 'taxonomy-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'author-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'taxonomy-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'author-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'cpt-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'date-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'posts-page-description' );

remove_action( 'genesis_archive_title_descriptions', 'genesis_do_archive_headings_open', 5, 3 );

remove_action( 'genesis_archive_title_descriptions', 'genesis_do_archive_headings_close', 15, 3 );

remove_action( 'genesis_archive_title_descriptions', 'genesis_do_archive_headings_headline', 10, 3 );

remove_action( 'genesis_archive_title_descriptions', 'genesis_do_archive_headings_intro_text', 12, 3 );



// These did not work for category page - but may be useful for anything else

remove_action( 'genesis_archive_title_descriptions', 'genesis_do_archive_headings_open', 5, 3 );

remove_action( 'genesis_archive_title_descriptions', 'taxonomy-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'author-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'taxonomy-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'author-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'cpt-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'date-archive-description' );

remove_action( 'genesis_archive_title_descriptions', 'posts-page-description' );

remove_action( 'genesis_archive_title_descriptions', 'genesis_do_archive_headings_intro_text', 12, 3 );

//* Remove custom headline and / or description to category / tag / taxonomy archive pages.

remove_action( 'genesis_before_loop', 'genesis_do_taxonomy_title_description', 15 );

//* Remove custom headline and description to blog template pages.

remove_action( 'genesis_before_loop', 'genesis_do_blog_template_heading' );

//* Remove custom headline and description to date archive pages.

remove_action( 'genesis_before_loop', 'genesis_do_date_archive_title' );

// * Remove custom headline and description to author archive pages.

remove_action( 'genesis_before_loop', 'genesis_do_author_title_description', 15 );

// * Remove custom headline and description to relevant custom post type archive pages.

remove_action( 'genesis_before_loop', 'genesis_do_cpt_archive_title_description' );
remove_action( 'genesis_before_loop', 'genesis_do_archive_title_description', 8 );
remove_action( 'genesis_before_loop', 'genesis_do_archive_title_description', 15 );
```

<a id="custom-taxonomy"></a>
## Custom Taxonomy

```php
/**
 * https://www.billerickson.net/code/add-taxonomy-to-genesis-breadcrumb/
 * Add Category to Event Breadcrumb
 * @author Bill Erickson
 * @link http://www.billerickson.net/code/add-taxonomy-to-genesis-breadcrumb
 *
 * @param string $crumb, current breadcrumb
 * @param array $args, the breadcrumb arguments
 * @return string $crumb, modified breadcrumb
 */
function be_event_breadcrumb( $crumb, $args ) {
    // Only modify the breadcrumb if in the 'events' post type
    if( 'events' !== get_post_type() )
        return $crumb;

    // Grab terms
    $terms = get_the_terms( get_the_ID(), 'event-category' );
    if( empty( $terms ) || is_wp_error( $terms ) )
        return $crumb;

    // Only use one term
    $term = array_shift( $terms );

    // Build the breadcrumb
    $crumb = '<a href="' . get_post_type_archive_link( 'events' ) . '">Events</a>' . $args['sep'] . '<a href="' . get_term_link( $term, 'event-category' ) . '">' . $term->name . '</a>' . $args['sep'] . get_the_title();

    return $crumb;
}
add_filter( 'genesis_single_crumb', 'be_event_breadcrumb', 10, 2 );
```

<a id="author-box"></a>
## Author Box

```php

//* Display author box on single posts
add_filter( 'get_the_author_genesis_author_box_single', '__return_true' );

//* Display author box on archive pages
add_filter( 'get_the_author_genesis_author_box_archive', '__return_true' );

//* Customize the author box title
add_filter( 'genesis_author_box_title', 'custom_author_box_title' );
function custom_author_box_title() {
    return '<strong>About the Author</strong>';
}

//* Modify the size of the Gravatar in the author box
add_filter( 'genesis_author_box_gravatar_size', 'author_box_gravatar_size' );
function author_box_gravatar_size( $size ) {
    return 80;
}
```

<a id="adsense"></a>
## AdSense
```php
// Set AdSense ID to always be an empty string - stops meta box from appearing on Post screens.
add_filter( 'genesis_pre_get_option_adsense_id', '__return_empty_string' );

// Remove AdSense metabox from Theme Settings.
add_action( 'genesis_theme_settings_metaboxes', 'child_remove_adsense_metabox' );
function child_remove_adsense_metabox() {
    remove_meta_box( 'genesis-theme-settings-adsense', 'toplevel_page_genesis', 'main' );
}

add_filter( 'genesis_customizer_theme_settings_config', 'child_remove_adsense_customizer' );
function child_remove_adsense_customizer( $config ) {
    unset( $config['genesis']['sections']['genesis_adsense'] );

    return $config;
}
```

<a id="full-width-header-image"></a>
## Full-Width Header Image

```php
// Add support for custom header.
add_theme_support( 'custom-header', array(
'width' => 1140,
'height' => 244,
'header-selector' => '.site-header .title-area',
'header-text' => false,
) );
```

```css
.header-image .site-title a {
background-repeat: no-repeat;
background-size: contain !important;
background: url(‘your-image-url’);
float: left;
margin: 0;
max-width: ####px;
min-height: ###px;
padding: 0;
width: 100%;
}
```


<a id="general-settings"></a>
## General Settings
```php
//* Show page content above posts
add_action( 'genesis_loop', 'genesis_standard_loop', 5 );
genesis();

//* Add support for after entry widget
add_theme_support( 'genesis-after-entry-widget-area' );

//* Unregister primary sidebar
unregister_sidebar( 'sidebar' );

//* Unregister secondary sidebar
unregister_sidebar( 'sidebar-alt' );

//* Add support for structural wraps
add_theme_support( 'genesis-structural-wraps', array(
    'header',
    'menu-primary',
    'menu-secondary',
    'site-inner',
    'footer-widgets',
    'footer'
) );

//* Remove support for structural wraps
remove_theme_support( 'genesis-structural-wraps' );

//* Add HTML5 markup structure
add_theme_support( 'html5', array( 'search-form', 'comment-form', 'comment-list', 'gallery', 'caption' ) );

//* Remove the header right widget area
unregister_sidebar( 'header-right' );

//* Modify the header URL - HTML5 Version
add_filter( 'genesis_seo_title', 'child_header_title', 10, 3 );
function child_header_title( $title, $inside, $wrap ) {
    $inside = sprintf( '<a href="http://example.com/" title="%s">%s</a>', esc_attr( get_bloginfo( 'name' ) ), get_bloginfo( 'name' ) );
    return sprintf( '<%1$s class="site-title">%2$s</%1$s>', $wrap, $inside );
}

//* Remove the site title
remove_action( 'genesis_site_title', 'genesis_seo_site_title' );

//* Add Viewport meta tag for mobile browsers (requires HTML5 theme support)
add_theme_support( 'genesis-responsive-viewport' );

//* Add custom Viewport meta tag for mobile browsers
add_action( 'genesis_meta', 'sp_viewport_meta_tag' );
function sp_viewport_meta_tag() {
    echo '<meta name="viewport" content="width=device-width, initial-scale=1.0"/>';
}

//* Remove the entry footer markup (requires HTML5 theme support)
remove_action( 'genesis_entry_footer', 'genesis_entry_footer_markup_open', 5 );
remove_action( 'genesis_entry_footer', 'genesis_entry_footer_markup_close', 15 );

//* Remove the entry meta in the entry footer (requires HTML5 theme support)
remove_action( 'genesis_entry_footer', 'genesis_post_meta' );

//* Customize the entry meta in the entry footer (requires HTML5 theme support)
add_filter( 'genesis_post_meta', 'sp_post_meta_filter' );
function sp_post_meta_filter($post_meta) {
    $post_meta = '[post_categories] [post_tags]';
    return $post_meta;
}

//* Reposition the footer
remove_action( 'genesis_footer', 'genesis_footer_markup_open', 5 );
remove_action( 'genesis_footer', 'genesis_do_footer' );
remove_action( 'genesis_footer', 'genesis_footer_markup_close', 15 );
add_action( 'genesis_after', 'genesis_footer_markup_open', 11 );
add_action( 'genesis_after', 'genesis_do_footer', 12 );
add_action( 'genesis_after', 'genesis_footer_markup_close', 13 );

//* Change the footer text
add_filter('genesis_footer_creds_text', 'sp_footer_creds_filter');
function sp_footer_creds_filter( $creds ) {
    $creds = '[footer_copyright] &middot; <a href="http://mydomain.com">My Custom Link</a> &middot; Built on the <a href="http://www.studiopress.com/themes/genesis" title="Genesis Framework">Genesis Framework</a>';
    return $creds;
}

//* Customize the entire footer
remove_action( 'genesis_footer', 'genesis_do_footer' );
add_action( 'genesis_footer', 'sp_custom_footer' );
function sp_custom_footer() {
    ?>
    <p>&copy; Copyright 2012 <a href="http://mydomain.com/">My Domain</a> &middot; All Rights Reserved &middot; Powered by <a href="http://wordpress.org/">WordPress</a> &middot; <a href="http://mydomain.com/wp-admin">Admin</a></p>
    <?php
}
```

```php
//* Customize the return to top of page text
add_filter( 'genesis_footer_backtotop_text', 'sp_footer_backtotop_text' );
function sp_footer_backtotop_text($backtotop) {
    $backtotop = '[footer_backtotop text="Return to Top"]';
    return $backtotop;
}

//* Add custom body class to the head
add_filter( 'body_class', 'sp_body_class' );
function sp_body_class( $classes ) {

    $classes[] = 'custom-class';
    return $classes;

}

//* Add custom body class to the head
add_filter( 'body_class', 'sp_body_class' );
function sp_body_class( $classes ) {
    if ( is_page( 'sample-page' ) )
        $classes[] = 'custom-class';
        return $classes;
}

//* Add custom body class to the head
add_filter( 'body_class', 'sp_body_class' );
function sp_body_class( $classes ) {
    if ( is_page( '1' ) )
        $classes[] = 'custom-class';
        return $classes;
}

//* Add custom body class to the head
add_filter( 'body_class', 'sp_body_class' );
function sp_body_class( $classes ) {

    if ( is_category( 'sample-category' ) )
        $classes[] = 'custom-class';
        return $classes;

}

//* Add custom body class to the head
add_filter( 'body_class', 'sp_body_class' );
function sp_body_class( $classes ) {

    if ( is_category( '1' ) )
        $classes[] = 'custom-class';
        return $classes;
}

//* Add custom body class
add_filter( 'body_class', 'sp_body_class' );
function sp_body_class( $classes ) {
    if ( is_tag( 'sample-tag' ) )
        $classes[] = 'custom-class';
        return $classes;

}

//* Add custom body class to the head
add_filter( 'body_class', 'sp_body_class' );
function sp_body_class( $classes ) {

    if ( is_tag( '1' ) )
        $classes[] = 'custom-class';
        return $classes;

}

//* Add support for structural wraps
add_theme_support( 'genesis-structural-wraps', array(
    'header',
    'menu-primary',
    'menu-secondary',
    'site-inner',
    'footer-widgets',
    'footer'
) );

//* Enable Genesis Accessibility Components
add_theme_support( 'genesis-accessibility', array(
    '404-page',
    'drop-down-menu',
    'headings',
    'rems',
    'search-form',
    'skip-links',
) );

//* Remove Skip Links from a template
remove_action ( 'genesis_before_header', 'genesis_skip_links', 5 );
//* Dequeue Skip Links Script
add_action( 'wp_enqueue_scripts','child_dequeue_skip_links' );
function child_dequeue_skip_links() {
    wp_dequeue_script( 'skip-links' );
}

//* Force content-sidebar layout setting
add_filter( 'genesis_pre_get_option_site_layout', '__genesis_return_content_sidebar' );
//* Force sidebar-content layout setting
add_filter( 'genesis_pre_get_option_site_layout', '__genesis_return_sidebar_content' );
//* Force content-sidebar-sidebar layout setting
add_filter( 'genesis_pre_get_option_site_layout', '__genesis_return_content_sidebar_sidebar' );
//* Force sidebar-sidebar-content layout setting
add_filter( 'genesis_pre_get_option_site_layout', '__genesis_return_sidebar_sidebar_content' );
//* Force sidebar-content-sidebar layout setting
add_filter( 'genesis_pre_get_option_site_layout', '__genesis_return_sidebar_content_sidebar' );
//* Force full-width-content layout setting
add_filter( 'genesis_pre_get_option_site_layout', '__genesis_return_full_width_content' );

//* Register a widget:
genesis_register_sidebar(
    array(
        'id'          => 'custom-widget-area',
        'name'        => 'Custom Widget Area',
        'description' => 'This widget area can be used to display custom content as desired.'
   )
);

//* Display custom widget area
add_action( 'genesis_before_footer', 'bt_display_custom_widget_area', 5 );
function bt_display_custom_widget_area() {
    genesis_widget_area( 'custom-widget-area',  // ID of the widget area that we registered earlier
        array(
            'before' => '<aside class="custom-widget-area widget-area"><div class="wrap">',  // Markup to  be added before the widget output
            'after'  => '</div></aside>' // Markup to  be added after the widget output
        )
    );
}


//* Add markup for widget
add_action( 'genesis_before_footer', 'bt_display_custom_widget_area', 5 );
function bt_display_custom_widget_area() {

    genesis_widget_area( 'custom-widget-area',  // ID of the widget area registered earlier
        array(
            'before' => '<section class="custom-widget-area"><div class="wrap">',  // Markup to  be added before the widget output
            'after'  => '</div></section>', // Markup to  be added after the widget output
        ) );
}


//* Unregister Genesis widgets
add_action( 'widgets_init', 'unregister_genesis_widgets', 20 );
function unregister_genesis_widgets() {
    unregister_widget( 'Genesis_eNews_Updates' );
    unregister_widget( 'Genesis_Featured_Page' );
    unregister_widget( 'Genesis_Featured_Post' );
    unregister_widget( 'Genesis_Latest_Tweets_Widget' );
    unregister_widget( 'Genesis_Menu_Pages_Widget' );
    unregister_widget( 'Genesis_User_Profile_Widget' );
    unregister_widget( 'Genesis_Widget_Menu_Categories' );
}


add_filter( 'genesis_pre_get_option_site_layout', 'custom_set_single_posts_layout' );
/**
 * Apply Content Sidebar content layout to single posts.
 *
 * @return string layout ID.
 */
function custom_set_single_posts_layout() {
    if ( is_single() ) {
        return 'content-sidebar';
    }
}

//* Remove the header right widget area
unregister_sidebar( 'header-right' );


/** Add support for custom header **/
add_theme_support( ‘genesis-custom-header’, array( ‘width’ => 960, ‘height’ => 100 ) );

// The code above should be placed anywhere after this:
// require_once(TEMPLATEPATH.’/lib/init.php’);

// And before the following closing code (if it exists):
// Custom Header Parameters
// ‘width’ integer, default is 960
// ‘height’ integer, default is 80
// ‘textcolor’ hexadecimal value with no leading #, default is 333333
// ‘no_header_text’ boolean, default is false
// ‘header_image’ path/to/image.png, defaults to child theme’s images/header.png
// ‘header_callback’ function name, default is genesis_custom_header_style
// ‘admin_header_callback’ function name, default is genesis_custom_header_admin_style.


//* Modify the length of post excerpts
add_filter( 'excerpt_length', 'sp_excerpt_length' );
function sp_excerpt_length( $length ) {
    return 50; // pull first 50 words
}

//* Remove the post meta function
remove_action( 'genesis_after_post_content', 'genesis_post_meta' );

//* Remove the entry meta in the entry footer (requires HTML5 theme support)
remove_action( 'genesis_entry_footer', 'genesis_post_meta' );

//* Customize the post meta function
add_filter( 'genesis_post_meta', 'sp_post_meta_filter' );
function sp_post_meta_filter($post_meta) {
if ( !is_page() ) {
    $post_meta = '[post_categories before="Filed Under: "] [post_tags before="Tagged: "]';
    return $post_meta;
}}

//* Add Viewport meta tag for mobile browsers (requires HTML5 theme support)
add_theme_support( 'genesis-responsive-viewport' );

//* Modify the Genesis content limit read more link
add_filter( 'get_the_content_more_link', 'sp_read_more_link' );
function sp_read_more_link() {
    return '... <a class="more-link" href="' . get_permalink() . '">[Continue Reading]</a>';
}
//* Modify the length of post excerpts
add_filter( 'excerpt_length', 'sp_excerpt_length' );
function sp_excerpt_length( $length ) {
    return 50; // pull first 50 words
}

//* Modify the WordPress read more link
add_filter( 'the_content_more_link', 'sp_read_more_link' );
function sp_read_more_link() {
    return '<a class="more-link" href="' . get_permalink() . '">[Continue Reading]</a>';
}


/**
 * Remove the post content and display post excerpt.
 */
remove_action('genesis_entry_content',       'genesis_do_post_content');
add_action('genesis_entry_content', 'the_excerpt');

/**
 * Override the default string for automatic excerpts
 *
 * @param type $more
 * @return string
*/
function custom_excerpt_more($more) {
    return '';// return empty string
}
add_filter('excerpt_more', 'custom_excerpt_more');

/**
 * Append ellipses to excerpts and then show "Read More"  button for manual & automatic excerpts.
 *
 * @param type $text
 * @return string
 */

// Simple way
function new_excerpt_more($more) {
    return '...';
}
add_filter('excerpt_more', 'new_excerpt_more');

// Fancy way
 function custom_excerpt($text) {
//    $text= substr_replace($text,"...",strpos($text, "</p>"),0);
$excerpt = $text . '<a href="' . get_permalink() . '"><button class="read-more-btn" type="button" value="read_more">Read More</button></a>';
return $excerpt;
}

add_filter('the_excerpt', 'custom_excerpt');

//* Disable the superfish script
add_action( 'wp_enqueue_scripts', 'sp_disable_superfish' );
function sp_disable_superfish() {
    wp_deregister_script( 'superfish' );
    wp_deregister_script( 'superfish-args' );
}


```


<a id="css"></a>
## CSS

```css
/* ## Accessible Menu
--------------------------------------------- */

.menu .menu-item:focus {
    position: static;
}

.menu .menu-item > a:focus + ul.sub-menu,
.menu .menu-item.sf-hover > ul.sub-menu {
    left: auto;
    opacity: 1;
}

/* ## Screen reader text
--------------------------------------------- */

.screen-reader-text,
.screen-reader-text span,
.screen-reader-shortcut {
    border: 0;
    clip: rect(0, 0, 0, 0);
    height: 1px;
    overflow: hidden;
    position: absolute !important;
    width: 1px;
    word-wrap: normal !important;
}

.screen-reader-text:focus,
.screen-reader-shortcut:focus,
.genesis-nav-menu .search input[type="submit"]:focus,
.widget_search input[type="submit"]:focus  {
    background: #fff;
    box-shadow: 0 0 2px 2px rgba(0,0,0,.6);
    clip: auto !important;
    color: #333;
    display: block;
    font-size: 1em;
    font-weight: bold;
    height: auto;
    padding: 15px 23px 14px;
    text-decoration: none;
    width: auto;
    z-index: 100000; /* Above WP toolbar. */
}

.more-link {
    position: relative;
}

/* Skip Links
---------------------------------------------------------------------------------------------------- */
.genesis-skip-link {
    margin: 0;
}

.genesis-skip-link li {
    height: 0;
    list-style: none;
    width: 0;
}

/* Display outline on focus */
:focus {
    color: #333;
    outline: #ccc solid 1px;
}
```

<a id="unsorted"></a>
## Unsorted

<a id="mobile-menu"></a>
## Mobile Menu

<a id="remove-text-from-next-to-hamburger-menu"></a>
### Remove text from next to hamburger menu:
To change or remove the text, find the following code in the functions file:

```php
$output = array(
    'mainMenu' => __( 'Menu', 'genesis-sample' ),
    'subMenu'  => __( 'Menu', 'genesis-sample' ),
);

// Simply remove the text from around line 38 like this:
$output = array(
    'mainMenu' => __( '', 'genesis-sample' ),
    'subMenu'  => __( '', 'genesis-sample' ),
);
```

<a id="prevent-ugly-load-of-mobile-menu"></a>
### Prevent Ugly Load of Mobile Menu

```php
<?php

add_filter( 'body_class', function ( $classes ) {
    $classes[] = 'no-js';
    return $classes;
} );
add_action( 'genesis_before', function () {
    ?>
    <script>
        //<![CDATA[
        (function () {
            var c = document.body.classList;
            console.log(c);
            c.remove('no-js');
            c.add('js');
            console.log(c);
        })();
        //]]>
    </script>
    <?php
}, 1 );
```

<a id="add-classes-or-other-attributes-to-markup"></a>
## Add Classes or Other Attributes to Markup

```php
<?php
add_filter( 'genesis_attr_content', 'genesis_main_content_class' );
function genesis_main_content_class( $attributes ) {
    $attributes['class'] = '.genesis-content';
    return $attributes;
}
```
