# WordPress Core Functions and Concepts Snippets

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

