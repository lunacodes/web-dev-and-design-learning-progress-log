# Genesis Snippets

<!-- MarkdownTOC -->

* [Genesis Template Action Hooks](#genesis-template-action-hooks)
    * [genesis/comments.php](#genesiscommentsphp)
    * [genesis/footer.php](#genesisfooterphp)
    * [genesis/header.php](#genesisheaderphp)
    * [genesis/sidebar-alt.php](#genesissidebar-altphp)
    * [genesis/sidebar.php](#genesissidebarphp)
* [Genesis Structural Action Hooks](#genesis-structural-action-hooks)
    * [genesis/lib/framework.php](#genesislibframeworkphp)
    * [genesis/lib/init.php](#genesislibinitphp)
    * [genesis/lib/structure/archive.php](#genesislibstructurearchivephp)
    * [genesis/lib/structure/comments.php](#genesislibstructurecommentsphp)
    * [genesis/lib/structure/header.php](#genesislibstructureheaderphp)
    * [genesis/lib/structure/loops.php](#genesislibstructureloopsphp)
* [Genesis Filter Hooks](#genesis-filter-hooks)
    * [/genesis/404.php](#genesis404php)
    * [/genesis/lib/admin/cpt-archive-settings.php](#genesislibadmincpt-archive-settingsphp)
    * [/genesis/lib/admin/import-export.php](#genesislibadminimport-exportphp)
    * [/genesis/lib/admin/term-meta.php](#genesislibadminterm-metaphp)
    * [/genesis/lib/admin/user-meta.php](#genesislibadminuser-metaphp)
    * [/genesis/lib/classes/breadcrumb.php](#genesislibclassesbreadcrumbphp)
    * [/genesis/lib/classes/class-genesis-script-loader.php](#genesislibclassesclass-genesis-script-loaderphp)
    * [/genesis/lib/classes/sanitization.php](#genesislibclassessanitizationphp)
    * [/genesis/lib/functions/formatting.php](#genesislibfunctionsformattingphp)
    * [/genesis/lib/functions/general.php](#genesislibfunctionsgeneralphp)
    * [/genesis/lib/functions/head.php](#genesislibfunctionsheadphp)
    * [/genesis/lib/functions/image.php](#genesislibfunctionsimagephp)
    * [/genesis/lib/functions/layout.php](#genesislibfunctionslayoutphp)
    * [/genesis/lib/functions/markup.php](#genesislibfunctionsmarkupphp)
    * [/genesis/lib/functions/menu.php](#genesislibfunctionsmenuphp)
    * [/genesis/lib/functions/options.php](#genesislibfunctionsoptionsphp)
    * [/genesis/lib/functions/widgetize.php](#genesislibfunctionswidgetizephp)
    * [/genesis/lib/init.php](#genesislibinitphp-1)
    * [/genesis/lib/shortcodes/footer.php](#genesislibshortcodesfooterphp)
    * [/genesis/lib/shortcodes/post.php](#genesislibshortcodespostphp)
    * [/genesis/lib/structure/archive.php](#genesislibstructurearchivephp-1)
    * [/genesis/lib/structure/comments.php](#genesislibstructurecommentsphp-1)
    * [/genesis/lib/structure/footer.php](#genesislibstructurefooterphp)
    * [/genesis/lib/structure/header.php](#genesislibstructureheaderphp-1)
    * [/genesis/lib/structure/loops.php](#genesislibstructureloopsphp-1)
    * [/genesis/lib/structure/post.php](#genesislibstructurepostphp)
    * [/genesis/lib/structure/search.php](#genesislibstructuresearchphp)
    * [/genesis/lib/widgets/featured-page-widget.php](#genesislibwidgetsfeatured-page-widgetphp)
    * [/genesis/lib/widgets/featured-post-widget.php](#genesislibwidgetsfeatured-post-widgetphp)
    * [/genesis/lib/widgets/user-profile-widget.php](#genesislibwidgetsuser-profile-widgetphp)
* [Snippets](#snippets)
    * [Genesis Column Classes](#genesis-column-classes)
    * [Other](#other)
* [CSS](#css)
* [Unsorted](#unsorted)
* [Mobile Menu](#mobile-menu)
    * [Remove text from next to hamburger menu:](#remove-text-from-next-to-hamburger-menu)
    * [Prevent Ugly Load of Mobile Menu](#prevent-ugly-load-of-mobile-menu)

<!-- /MarkdownTOC -->

<a id="genesis-template-action-hooks"></a>
## Genesis Template Action Hooks

From: [Carrie Dils - Genesis Hook Reference: A Complete List of Hooks & Filters for the Genesis Framework](https://carriedils.com/genesis-hook-reference/)

Hint: To find available action hooks in any theme or plugin, search the codebase for do_action.

<a id="genesiscommentsphp"></a>
### genesis/comments.php

* genesis_before_comments
* genesis_comments
* genesis_after_comments
* genesis_before_pings
* genesis_pings
* genesis_after_pings
* genesis_before_comment_form
* genesis_comment_form
* genesis_after_comment_form

<a id="genesisfooterphp"></a>
### genesis/footer.php

* genesis_before_footer
* genesis_footer
* genesis_after_footer
* genesis_after

<a id="genesisheaderphp"></a>
### genesis/header.php

* genesis_doctype
* genesis_title
* genesis_meta
* genesis_before
* genesis_before_header
* genesis_header
* genesis_after_header

<a id="genesissidebar-altphp"></a>
### genesis/sidebar-alt.php

* genesis_before_sidebar_alt_widget_area
* genesis_sidebar_alt
* genesis_after_sidebar_alt_widget_area

<a id="genesissidebarphp"></a>
### genesis/sidebar.php

* genesis_before_sidebar_widget_area
* genesis_sidebar
* genesis_after_sidebar_widget_area


<a id="genesis-structural-action-hooks"></a>
## Genesis Structural Action Hooks


<a id="genesislibframeworkphp"></a>
### genesis/lib/framework.php

* genesis_before_content_sidebar_wrap
* genesis_before_content
* genesis_before_loop
* genesis_loop
* genesis_after_loop
* genesis_after_content
* genesis_after_content_sidebar_wrap

<a id="genesislibinitphp"></a>
### genesis/lib/init.php

* genesis_pre
* genesis_pre_framework
* genesis_init
* genesis_setup

<a id="genesislibstructurearchivephp"></a>
### genesis/lib/structure/archive.php

* genesis_archive_title_descriptions

<a id="genesislibstructurecommentsphp"></a>
### genesis/lib/structure/comments.php

* genesis_list_comments
* genesis_list_pings
* genesis_before_comment
* genesis_after_comment

<a id="genesislibstructureheaderphp"></a>
### genesis/lib/structure/header.php

* genesis_site_title
* genesis_site_description
* genesis_header_right

<a id="genesislibstructureloopsphp"></a>
### genesis/lib/structure/loops.php


Note that I’m only including HTML5 hooks added in Genesis 2.0+. The old XHTML hooks should be thrown down the garbage disposal.

* genesis_before_while
* genesis_before_entry
* genesis_entry_header
* genesis_before_entry_content
* genesis_entry_content
* genesis_after_entry_content
* genesis_entry_footer
* genesis_after_entry
* genesis_after_endwhile
* genesis_loop_else
* genesis_before_post
* genesis_before_post_title
* genesis_post_title
* genesis_after_post_title
* genesis_before_post_content
* genesis_post_content
* genesis_after_post_content
* genesis_after_post
* genesis_after_endwhile
* genesis_loop_else
* genesis/lib/structure/post.php
* genesis_reset_loops
* genesis/lib/structure/menu.php
* genesis_register_nav_menus
* genesis/lib/admin/menu.php
* genesis_admin_menu
* genesis/lib/classes/admin.php
* genesis_admin_init


<a id="genesis-filter-hooks"></a>
## Genesis Filter Hooks

Hint: To search for what filter hooks are available in any theme or plugin, search the codebase for apply_filters.


<a id="genesis404php"></a>
### /genesis/404.php

* genesis_404_entry_title
* genesis_404_entry_content

<a id="genesislibadmincpt-archive-settingsphp"></a>
### /genesis/lib/admin/cpt-archive-settings.php

* genesis_cpt_archive_settings_page_label
* genesis_cpt_archive_settings_menu_label
* genesis_cpt_archive_settings_capability_ . $this->post_type->name
* genesis_cpt_archive_settings_label

<a id="genesislibadminimport-exportphp"></a>
### /genesis/lib/admin/import-export.php

* genesis_export_options

<a id="genesislibadminterm-metaphp"></a>
### /genesis/lib/admin/term-meta.php

* genesis_term_meta_defaults
* genesis_term_meta
* `genesis_term_meta_{$meta_key*}`

<a id="genesislibadminuser-metaphp"></a>
### /genesis/lib/admin/user-meta.php

* genesis_user_meta_defaults

<a id="genesislibclassesbreadcrumbphp"></a>
### /genesis/lib/classes/breadcrumb.php

* genesis_breadcrumb_args
* genesis_build_crumbs
* genesis_archive_crumb
* genesis_single_crumb
* genesis_home_crumb
* genesis_blog_crumb
* genesis_search_crumb
* genesis_404_crumb
* genesis_page_crumb
* genesis_attachment_crumb
* genesis_post_crumb
* genesis_cpt_crumb
* genesis_category_crumb
* genesis_tag_crumb
* genesis_tax_crumb
* genesis_year_crumb
* genesis_month_crumb
* genesis_day_crumb
* genesis_author_crumb
* genesis_post_type_crumb
* genesis_breadcrumb_link

<a id="genesislibclassesclass-genesis-script-loaderphp"></a>
### /genesis/lib/classes/class-genesis-script-loader.php

* genesis_superfish_args_url
* genesis_toggles

<a id="genesislibclassessanitizationphp"></a>
### /genesis/lib/classes/sanitization.php

* genesis_available_sanitizer_filters

<a id="genesislibfunctionsformattingphp"></a>
### /genesis/lib/functions/formatting.php

* get_the_content_limit_allowedtags
* get_the_content_more_link
* get_the_content_limit
* the_content_limit

<a id="genesislibfunctionsgeneralphp"></a>
### /genesis/lib/functions/general.php

* genesis_sitemap_output
* genesis_canonical_url

<a id="genesislibfunctionsheadphp"></a>
### /genesis/lib/functions/head.php

* genesis_get_seo_meta_description
* genesis_get_seo_meta_keywords
* genesis_get_robots_meta_content
* genesis_pre_load_favicon
* genesis_favicon_url

<a id="genesislibfunctionsimagephp"></a>
### /genesis/lib/functions/image.php

* genesis_get_image_default_args
* genesis_pre_get_image
* genesis_get_image

<a id="genesislibfunctionslayoutphp"></a>
### /genesis/lib/functions/layout.php

* genesis_initial_layouts
* genesis_get_layouts
* genesis_site_layout
* genesis_structural_wrap-{$context}

<a id="genesislibfunctionsmarkupphp"></a>
### /genesis/lib/functions/markup.php

* genesis_markup_{$args[‘context’]}
* genesis_markup_{$args[‘context’]}_output
* genesis_markup_{$args[‘context’]}_open
* genesis_markup_{$args[‘context’]}_close
* genesis_markup_open
* genesis_markup_close
* genesis_attr_{$context}
* `genesis_attr_{$context}_output`

<a id="genesislibfunctionsmenuphp"></a>
### /genesis/lib/functions/menu.php

* genesis_superfish_enabled

<a id="genesislibfunctionsoptionsphp"></a>
### /genesis/lib/functions/options.php

* genesis_pre_get_option_{$key}
* genesis_options

<a id="genesislibfunctionswidgetizephp"></a>
### /genesis/lib/functions/widgetize.php

* genesis_register_sidebar_defaults
* genesis_register_widget_area_defaults
* genesis_widget_area_defaults
* genesis_sidebar_title_output

<a id="genesislibinitphp-1"></a>
### /genesis/lib/init.php

* genesis_theme_support_menus
* genesis_theme_support_structural_wraps
* genesis_settings_field
* genesis_seo_settings_field
* genesis_cpt_archive_settings_field_prefix

<a id="genesislibshortcodesfooterphp"></a>
### /genesis/lib/shortcodes/footer.php

* genesis_footer_backtotop_shortcode
* genesis_footer_copyright_shortcode
* genesis_footer_childtheme_link_shortcode
* genesis_footer_genesis_link_shortcode
* genesis_footer_studiopress_link_shortcode
* genesis_footer_wordpress_link_shortcode
* genesis_footer_site_title_shortcode
* genesis_footer_home_link_shortcode
* genesis_footer_loginout_shortcode

<a id="genesislibshortcodespostphp"></a>
### /genesis/lib/shortcodes/post.php

* genesis_post_date_shortcode
* genesis_post_time_shortcode
* genesis_post_modified_date_shortcode
* genesis_post_modified_time_shortcode
* genesis_post_author_shortcode
* genesis_post_author_link_shortcode
* genesis_post_author_posts_link_shortcode
* genesis_post_comments_shortcode
* genesis_post_tags_shortcode
* genesis_post_categories_shortcode
* genesis_post_terms_shortcode
* genesis_edit_post_link
* genesis_post_edit_shortcode

<a id="genesislibstructurearchivephp-1"></a>
### /genesis/lib/structure/archive.php

* genesis_term_intro_text_output
* genesis_author_intro_text_output
* genesis_cpt_archive_intro_text_output

<a id="genesislibstructurecommentsphp-1"></a>
### /genesis/lib/structure/comments.php

* genesis_title_comments
* genesis_prev_comments_link_text
* genesis_next_comments_link_text
* genesis_no_comments_text
* genesis_comments_closed_text
* genesis_title_pings
* genesis_no_pings_text
* genesis_comment_list_args
* genesis_ping_list_args
* comment_author_says_text
* genesis_comment_awaiting_moderation
* genesis_show_comment_date
* genesis_comment_awaiting_moderation
* genesis_comment_form_args

<a id="genesislibstructurefooterphp"></a>
### /genesis/lib/structure/footer.php

* genesis_footer_widget_areas
* genesis_footer_backtotop_text
* genesis_footer_creds_text
* genesis_footer_output
* genesis_footer_scripts

<a id="genesislibstructureheaderphp-1"></a>
### /genesis/lib/structure/header.php

* genesis_viewport_value
* genesis_canonical
* genesis_header_scripts
* genesis_site_title_wrap
* genesis_seo_title
* genesis_site_description_wrap
* genesis_seo_description
* genesis_skip_links_output

<a id="genesislibstructureloopsphp-1"></a>
### /genesis/lib/structure/loops.php

* genesis_custom_loop_args
* genesis_grid_loop_post_class

<a id="genesislibstructurepostphp"></a>
### /genesis/lib/structure/post.php

* genesis_post_title_text
* genesis_link_post_title
* genesis_entry_title_wrap
* genesis_post_title_output
* genesis_post_info
* genesis_edit_post_link
* genesis_post_permalink
* genesis_noposts_text
* genesis_post_meta
* genesis_author_box_gravatar_size
* genesis_author_box_title
* genesis_author_box
* genesis_prev_link_text
* genesis_next_link_text

<a id="genesislibstructuresearchphp"></a>
### /genesis/lib/structure/search.php

* genesis_search_text
* genesis_search_button_text
* genesis_search_form_label
* genesis_search_form

<a id="genesislibwidgetsfeatured-page-widgetphp"></a>
### /genesis/lib/widgets/featured-page-widget.php

* genesis_featured_page_title

<a id="genesislibwidgetsfeatured-post-widgetphp"></a>
### /genesis/lib/widgets/featured-post-widget.php

* genesis_featured_post_title

<a id="genesislibwidgetsuser-profile-widgetphp"></a>
### /genesis/lib/widgets/user-profile-widget.php

* genesis_gravatar_sizes/genesis/search.php
* genesis_search_title_text
* genesis_search_title_output


<a id="snippets"></a>
## Snippets

<a id="genesis-column-classes"></a>
### Genesis Column Classes

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

<a id="other"></a>
### Other

```php
<?php

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

Remove Archive Page Titles

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
