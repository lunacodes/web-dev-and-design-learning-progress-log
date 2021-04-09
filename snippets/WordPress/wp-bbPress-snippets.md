# WP bbPress Snippets

## Breadcrumbs

```php
function modify_breadcrumb_args() {
    $args['home_text'] = 'newname';

    return $args;
}

add_filter( 'bbp_before_get_breadcrumb_parse_args', 'modify_breadcrumb_args' );

add_filter( 'bbp_get_forum_archive_title', 'tcv_forum');

function tcv_forum () {
  Return 'Forum' ;
}
or create a page called forum, and put this in the content, and then point your menu at this page
[bbp-forum-index]
```


```php
function lab_logged_in_bbptopics($have_posts){
    if (!is_user_logged_in()){
        header("Location: /forum-login/");
        exit ;
        }
return $have_posts;
}
add_filter('bbp_has_topics', 'lab_logged_in_bbptopics');
add_filter('bbp_has_forums', 'lab_logged_in_bbptopics');
add_filter('bbp_has_replies', 'lab_logged_in_bbptopics');


You must be both registered AND a member of the club to use the forums.

If you are not a member, why not <a href="/join-us/"> Join the club </a>

Otherwise please login in

[bbp-login]
```
