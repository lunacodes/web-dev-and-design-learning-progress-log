# WordPress Snippets

<!-- MarkdownTOC -->

* [Header Functions](#header-functions)
* [WP Admin Bar Wrap Fix](#wp-admin-bar-wrap-fix)
* [Navigation](#navigation)
  * [Default Navigation Menu](#default-navigation-menu)
  * [Specific Navigation Menu](#specific-navigation-menu)
  * [Page Based Navigation](#page-based-navigation)
* [Breadcrumbs](#breadcrumbs)
* [Images](#images)
  * [Lazy Load](#lazy-load)
  * [Replace Uploaded Images](#replace-uploaded-images)
* [Other](#other)
  * [Use $ in jQuery Code](#use-%24-in-jquery-code)
  * [WP_User_Query](#wpuserquery)
  * [Passing parameters through add_action](#passing-parameters-through-add_action)
  * [Social Media Sharing Icons](#social-media-sharing-icons)
  * [Customize Excerpt Read More Text](#customize-excerpt-read-more-text)
* [Jetpack](#jetpack)
  * [Known Issues](#known-issues)
  * [Related Posts](#related-posts)
* [Needs Sorting](#needs-sorting)

<!-- /MarkdownTOC -->

<a id="header-functions"></a>
## Header Functions
* site_url();
* wp_title();
* bloginfo('name');
* bloginfo('description');
* get_stylesheet_directory_uri();
* bloginfo('template_url');
* bloginfo('atom_url');
* bloginfo('rss2_url');

<a id="wp-admin-bar-wrap-fix"></a>
## WP Admin Bar Wrap Fix

```css
/* Media Query - Min-Width: 782px */
@media screen and (min-width: 48.875em) {
   // Prevent wrapping of admin bar that has more items than admin bar area
  #wpadminbar .quicklinks {
    justify-content: space-between;
  }

  #wpadminbar .quicklinks,
  #wpadminbar .quicklinks > ul {
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    -ms-flex-wrap: nowrap;
    flex-wrap: nowrap;
    min-width: 0 !important;
  }

  #wpadminbar #wp-admin-bar-top-secondary {
    -ms-flex-direction: row-reverse;
    flex-direction: row-reverse;
  }

  #wpadminbar .quicklinks > ul > li {
    float: none !important;
  }

  #wpadminbar .quicklinks > ul > li,
  #wpadminbar .quicklinks .ab-item {
    max-width: 100px;
    min-width: 0 !important;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  #wpadminbar .quicklinks .ab-item {
    overflow: hidden;
  }

  #wpadminbar .quicklinks .ab-item .ab-label,
  #wpadminbar .quicklinks .ab-item .display-name {
    display: inline;
    float: none;
  }
}

/* Media Query - Min-Width: 1061px */
@media only screen and (min-width: 66.3125em) {
  #wpadminbar .quicklinks > ul > li,
  #wpadminbar .quicklinks .ab-item {
    max-width: initial;
    text-overflow: clip;
  }
}
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

<a id="breadcrumbs"></a>
## Breadcrumbs

```php
/**
 * http://genesis.wp-a2z.org/oik_api/genesis_breadcrumbget_cpt_crumb/
 *
 * Description
 * Get breadcrumb for single custom post type entry, including any parent (CPT name) crumbs.
 *
 * Usage
 * $string = Genesis_Breadcrumb::get_cpt_crumb();
 * Parameters
 * Returns
 * string HTML markup for a single custom post type entry breadcrumb, including any parent (CPT name) breadcrumbs.
 *
 * Source
 * File name: genesis/lib/classes/class-genesis-breadcrumb.php
 * Lines: 1 to 33 of 33
 */

  protected function get_cpt_crumb() {

    $post_type        = get_query_var( 'post_type' );
    $post_type_object = get_post_type_object( $post_type );

    if ( null === $post_type_object ) {
      return '';
    }

    $cpt_archive_link = get_post_type_archive_link( $post_type );
    if ( $cpt_archive_link ) {
      $crumb = $this->get_breadcrumb_link(
        $cpt_archive_link,
        '',
        $post_type_object->labels->name
      );
    } else {
      $crumb = $post_type_object->labels->name;
    }

    $crumb .= $this->args['sep'] . single_post_title( '', false );


/**
 * Filter the Genesis CPT breadcrumb.
 *
 * @since 2.5.0
 *
 * @param string $crumb HTML markup for the CPT breadcrumb.
 * @param array  $args  Arguments used to generate the breadcrumbs. Documented in Genesis_Breadcrumbs::get_output().
 */
    return apply_filters( 'genesis_cpt_crumb', $crumb, $this->args );

  }
```

<a id="images"></a>
## Images

<a id="lazy-load"></a>
### Lazy Load

**BJ Lazy Load:**

```php
// Applying the_content filter to our image markup to work with BJ Lazy Load plugin
$neat_responsive_image_id = get_field('responsive_image');
$neat_responsive_image_markup = wp_get_attachment_image( $neat_responsive_image_id, 'full', false, array( 'class' => 'bio-image' ) );
echo apply_filters( 'the_content', $neat_responsive_image_markup );
```

**ACR Responsive Image Helper Function:**

```php
function awesome_acf_responsive_image($image_id,$image_size,$max_width){
  // check the image ID is not blank
  if($image_id != '') {

    // set the default src image size
    $image_src = wp_get_attachment_image_url( $image_id, $image_size );

    // set the srcset with various image sizes
    $image_srcset = wp_get_attachment_image_srcset( $image_id, $image_size );

    // generate the markup for the responsive image
    echo 'src="'.$image_src.'" srcset="'.$image_srcset.'" sizes="(max-width: '.$max_width.') 100vw, '.$max_width.'"';
  }
}
```

**Tweaking Srcset Sizes:**

```php
// In WordPress 4.4 max srcset size is set to 1600px wide by default,
// if you have images larger than that size that you’d like included
// in the srcset you can use this filter:

add_filter( 'max_srcset_image_width', 'awesome_acf_max_srcset_image_width', 10 , 2 );

// set the max image width
function awesome_acf_max_srcset_image_width() {
  return 2200;
}
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



<a id="wpuserquery"></a>
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

<a id="customize-excerpt-read-more-text"></a>
### Customize Excerpt Read More Text
```php
function new_excerpt_more($more) {
    return '...';
}
add_filter('excerpt_more', 'new_excerpt_more');
```

<a id="jetpack"></a>
## Jetpack

<a id="known-issues"></a>
### Known Issues
From: https://jetpack.com/support/getting-started-with-jetpack/known-issues/

* W3TC - Minify
* reCaptcha & Jetpack Comments
* [Delete Duplicate Posts Plugin](https://wordpress.org/plugins/delete-duplicate-posts/)


<a id="related-posts"></a>
### Related Posts

**Remove Related Posts:**

```php
function jetpackme_remove_rp() {
    if ( class_exists( 'Jetpack_RelatedPosts' ) ) {
        $jprp = Jetpack_RelatedPosts::init();
        $callback = array( $jprp, 'filter_add_target_to_dom' );
        remove_filter( 'the_content', $callback, 40 );
    }
}

add_filter( 'wp', 'jetpackme_remove_rp', 20 );
```

**Custom Related Posts:**

```php
function jetpackme_custom_related( $atts ) {
$posts_titles = array();

if ( class_exists( 'Jetpack_RelatedPosts' ) && method_exists( 'Jetpack_RelatedPosts', 'init_raw' ) ) {
$related = Jetpack_RelatedPosts::init_raw()
->set_query_name( 'jetpackme-shortcode' ) // Optional, name can be anything
->get_for_post_id(
get_the_ID(),
array( 'size' => 3 )
);

if ( $related ) {
foreach ( $related as $result ) {
// Get the related post IDs
$related_post = get_post( $result[ 'id' ] );
// From there you can do just about anything. Here we get the post titles
$posts_titles[] = $related_post->post_title;
}
}
}

// Return a list of post titles separated by commas
return implode( ', ', $posts_titles );
}
// Create a [jprel] shortcode
add_shortcode( 'jprel', 'jetpackme_custom_related' );
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
