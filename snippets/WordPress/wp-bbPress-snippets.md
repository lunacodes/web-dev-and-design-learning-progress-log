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
