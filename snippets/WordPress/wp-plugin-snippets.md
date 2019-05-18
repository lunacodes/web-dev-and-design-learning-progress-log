<!-- MarkdownTOC -->

* [WordPress Plugin Snippets](#wordpress-plugin-snippets)
  * [Extending Plugins](#extending-plugins)
  * [Filter Plugin Updates](#filter-plugin-updates)
  * [Conditional Display of Widgets](#conditional-display-of-widgets)
  * [Custom Dashboard Widgets](#custom-dashboard-widgets)
  * [Authors Box Widget](#authors-box-widget)
  * [Contact Form 7](#contact-form-7)
    * [Email Address & Reply-To Configuation](#email-address--reply-to-configuation)
    * [Configuration Validator](#configuration-validator)
      * [Resolve Configuration Errors](#resolve-configuration-errors)
      * [Disable Configuration Validator](#disable-configuration-validator)
    * [Hide the reCaptcha Badge](#hide-the-recaptcha-badge)
      * [General](#general)
      * [CSS](#css)
      * [PHP](#php)

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

//Plugin_API

// A way to find available hooks would be to search the plugin code for "do_action" and "apply_filters".
```

2. Action and Filter Hooks

One way you could try is checking if the plugin provides any actions or filters you can hook into. These allow you to transform data that will be passed around the plugin at various stages of its execution, and also allow you to perform extra actions when something happens. See: [WordPress Codex - Plugin API](https://codex.wordpress.org/Plugin_API)

<a id="filter-plugin-updates"></a>
## Filter Plugin Updates

```php
function filter_plugin_updates( $value ) {
    unset( $value->response['akismet/akismet.php'] );
    return $value;
}
add_filter( 'site_transient_update_plugins', 'filter_plugin_updates' );
```

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

<a id="contact-form-7"></a>
## Contact Form 7

<a id="email-address--reply-to-configuation"></a>
### Email Address & Reply-To Configuation

Why does the email address in the From field have to belong to the site domain?
For example, if a mail had “your-name@yahoo.com” in the From field, but was actually sent from your web server (it’s not yahoo.com), it would be highly possible that relaying mail servers consider it as a spoofed address. If you use an email address in the same domain as the site, you can reduce the risk of being treated like that.

But if the From field is not the form submitter’s address, I can’t reply to the submitter.
You can still reply to the submitter by setting the Reply-To mail header field. When “your-email” is the field name that the submitter inputs their email address, you put the following line to the Additional Headers field:

`Reply-To: [your-email]`
Then, the reply mail will head to `[your-email] (the submitter’s address)`.

<a id="configuration-validator"></a>
### Configuration Validator

<a id="resolve-configuration-errors"></a>
#### Resolve Configuration Errors

See [Contact Form 7 - How to Resolve Configuration Errors](https://contactform7.com/configuration-errors/)
<a id="disable-configuration-validator"></a>

<a id="disable-configuration-validator"></a>
#### Disable Configuration Validator
You can disable the configuration validator by adding:

`define( 'WPCF7_VALIDATE_CONFIGURATION', false );`

to your wp-config.php, or adding:

`add_filter( 'wpcf7_validate_configuration', '__return_false' );`

to your theme’s functions.php.

<a id="hide-the-recaptcha-badge"></a>
### Hide the reCaptcha Badge

<a id="general"></a>
#### General
**NOTE:** When removing the reCaptcha Badge, one must add the following text:

This site is protected by reCAPTCHA and the Google [Privacy Policy](https://policies.google.com/privacy) and [Terms of Service](https://policies.google.com/terms) apply.

<a id="css"></a>
#### CSS

```css
/* Bad Method!! */
body:not(.page-id-XX) .grecaptcha-badge {
    display: none;
}
```

```
/*---Hide reCaptcha v3 visible seal---*/
.grecaptcha-badge {
opacity:0 !important;
}

.grecaptcha-badge{
  visibility: collapse !important;
}
```

<a id="php"></a>
#### PHP

Method 1:

```php
<?php

function conditionally_load_plugin_js_css(){
    if(!is_page(array(40,534)) ) { # Only load CSS and JS on needed Pages
        wp_dequeue_script('contact-form-7'); # Restrict scripts.
        wp_dequeue_script('google-recaptcha');
        wp_dequeue_style('contact-form-7'); # Restrict css.
    }
add_action( 'wp_enqueue_scripts', 'conditionally_load_plugin_js_css' );


remove_action( 'wp_enqueue_scripts', 'wpcf7_recaptcha_enqueue_scripts' );

if ( function_exists( 'wpcf7_enqueue_scripts' ) ) {
    add_action( 'wp_enqueue_scripts', 'wpcf7_recaptcha_enqueue_scripts', 10, 0 );
}
```

Method 2:
```php
function oiw_load_recaptcha_badge_page(){
    if ( !is_page( array( 'contact','other_pages' ) ) ) {
        wp_dequeue_script('google-recaptcha');
    }
}
add_action( 'wp_enqueue_scripts', 'oiw_load_recaptcha_badge_page' );
```


Method 3:
* Add this code to your theme’s functions.php file or in a site-specific plugin.
* Edit the IDs in lines 3 and 9. Currently the IDs are 8 and 10.

```php
add_action( 'wp_print_scripts', 'deregister_cf7_javascript', 100 );
function deregister_cf7_javascript() {
    if ( !is_page(array(8,10)) ) {
        wp_deregister_script( 'contact-form-7' );
    }
}
add_action( 'wp_print_styles', 'deregister_cf7_styles', 100 );
function deregister_cf7_styles() {
    if ( !is_page(array(8,10)) ) {
        wp_deregister_style( 'contact-form-7' );
    }
}
```

* To deregister Contact Form 7’s CSS style sheet on all pages, use this snippet:

```php
add_action( 'wp_print_styles', 'wps_deregister_styles', 100 );
function wps_deregister_styles() {
    wp_deregister_style( 'contact-form-7' );


function contactform_dequeue_scripts() {

    $load_scripts = false;

    if( is_singular() ) {
      $post = get_post();

      if( has_shortcode($post->post_content, 'contact-form-7') ) {
          $load_scripts = true;
      }

    }

    if( ! $load_scripts ) {
        wp_dequeue_script( 'contact-form-7' );
        wp_dequeue_style( 'contact-form-7' );
    }

}

add_action( 'wp_enqueue_scripts', 'contactform_dequeue_scripts', 99 );
```

* Method 4:

```php

// Deregister Contact Form 7 JavaScript & Css files on all pages without a form
function contactform2_deregister_javascript_css() {
    if ( ! is_page( 'contact-us' ) ) {
        wp_deregister_script( 'contact-form-7' );
        wp_deregister_style( 'contact-form-7' );
    }
}
add_action( 'wp_enqueue_scripts', 'contactform2_deregister_javascript_css', 100 );


