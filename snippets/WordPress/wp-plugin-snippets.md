<!-- MarkdownTOC -->

* [WordPress Plugin Snippets](#wordpress-plugin-snippets)
  * [Extending Plugins](#extending-plugins)
  * [Conditional Display of Widgets](#conditional-display-of-widgets)
  * [Custom Dashboard Widgets](#custom-dashboard-widgets)
  * [Authors Box Widget](#authors-box-widget)

<!-- /MarkdownTOC -->
<a id="wordpress-plugin-snippets"></a>
# WordPress Plugin Snippets
<a id="wordpress-plugin-snippets"></a>

<a id="extending-plugins"></a>
## Extending Plugins

* [Liam Bailey - How to Extend a WordPress Plugin – My Plugin Boilerplate](https://codeable.io/how-to-extend-a-wordpress-plugin-my-plugin-boilerplate/)

1. If ( function_exists() ):

```php

if exists:
if ( function_exists( ‘SOME FUNCTION NAME’ ) ) { YOUR CODE HERE }

// Action and Filter Hooks
One way you could try is checking if the plugin provides any actions or filters you can hook into. These allow you to transform data that will be passed around the plugin at various stages of its execution, and also allow you to perform extra actions when something happens. See: https://codex.wordpress.org/Plugin_API

// A way to find available hooks would be to search the plugin code for "do_action" and "apply_filters".
```

2. Action and Filter Hooks

One way you could try is checking if the plugin provides any actions or filters you can hook into. These allow you to transform data that will be passed around the plugin at various stages of its execution, and also allow you to perform extra actions when something happens. See: [WordPress Codex - Plugin API](https://codex.wordpress.org/Plugin_API)

<a id="conditional-display-of-widgets"></a>
## Conditional Display of Widgets

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
## Custom Dashboard Widgets

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

<a id="authors-box-widget"></a>
## Authors Box Widget

```php
function display_author_avatars() {
  remove_filter('widget_text_content', 'wpautop');
  $args = array(
    'role' => 'subscriber'
  );

  $author_query = new WP_User_Query($args);
  // var_dump($author_query);
  $authors = $author_query->get_results();

  if( $authors ) {
      ob_start(); ?>
      <div class="author-avatars">
      <?php

      foreach( $authors as $author ) {

       if ( count_user_posts( $author->ID ) >= 1 ) {
        $name = $author->display_name;
        // $author_posts = $author->url;
        $author_posts = get_author_posts_url( $author->ID );

        // var_dump($author);
        ?>

        <div class="authors-wrap">
          <div class="author-box">
            <a href="<?php echo($author_posts); ?>">
              <div class="avatar-box"><?php echo( get_avatar( $author->ID ) ); ?>
              </div>
              <span class="author-name"><?php echo( $name ); ?>
              </span>
            </a>
          </div>
        </div>
        <?php
      }
    }
  } else {
      echo "no users found";
  }
  ?>
        </div>
  <?php

  $output_string = ob_get_contents();
  ob_end_clean();
  wp_reset_postdata();
  return $output_string;
}
```
