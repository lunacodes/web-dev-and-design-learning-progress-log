# WordPress Snippets

do_action( string $tag,  $arg = '' )
Execute functions hooked on a specific action hook.

### Description
This function invokes all functions attached to action hook $tag. It is possible to create new action hooks by simply calling this function, specifying the name of the new hook using the $tag parameter.

You can pass extra arguments to the hooks, much like you can with apply_filters().

### Parameters
$tag
(string) (Required) The name of the action to be executed.

$arg,...
(mixed) (Optional) Additional arguments which are passed on to the functions hooked to the action. Default empty.



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

## Include Tags

Use these tags to include templates to your theme.

* <?php get_header(); ?> – Includes header.php and display its content.
* <?php get_sidebar(); ?> – Includes sidebar.php.
* <?php get_footer(); ?> – Includes the footer.php.
* <?php comments_template(); ?> – Load specific template for comments.

### Useful Header Functions
site_url();
wp_title();
bloginfo('name');
bloginfo('description');
get_stylesheet_directory_uri();
bloginfo('template_url');
bloginfo('atom_url');
bloginfo('rss2_url');

### The Loop

The Loop is PHP code used by WordPress to return posts. It processes individual posts and displays them on the current page. It also formats the post according to how it matches specified parameters.

```php
<?php if ( have_posts() ) : ?>
 <?php while ( have_posts() ) : the_post(); ?>
 // Display post content
 <?php endwhile; ?>
<?php endif; ?>
```

### Navigation 
#### Default Navigation Menu
* <?php wp_nav_menu(); ?>

#### Specific Navigation Menu
```
<?php wp_nav_menu( array('menu' => My Navigation' )); ?>
Category Based Navigation
<ul id="menu">
<li <?php if(is_home()) { ?> class="current-cat" <?php } ?>>
<a href="<?php bloginfo('home'); ?>">Home</a></li>
<?php wp_list_categories('title_li=&orderby=id');?>
</ul>
```

#### Page Based Navigation
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
