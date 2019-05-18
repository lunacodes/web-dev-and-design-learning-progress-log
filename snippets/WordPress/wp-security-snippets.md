# WP Security Snippets

<!-- MarkdownTOC -->

* [Scripts & Actions to Remove](#scripts--actions-to-remove)
	* [Windows Live Write](#windows-live-write)
	* [Trackbacks & Pingbacks](#trackbacks--pingbacks)

<!-- /MarkdownTOC -->

<a id="scripts--actions-to-remove"></a>
## Scripts & Actions to Remove

<a id="windows-live-write"></a>
### Windows Live Write
```php
remove_action('wp_head', 'wlwmanifest_link');
```

<a id="trackbacks--pingbacks"></a>
### Trackbacks & Pingbacks
```php

function remove_trackback_metabox() {
	remove_meta_box( 'trackbacksdiv','post','normal' );
}
add_action('admin_menu','remove_trackback_metabox');

/**
 * Disable Pingbacks
 */

// This still seems to show the link rel="pingback" in the site headers tho - idk if this is a Genesis thing or something else??

add_filter( ‘wp_headers’, function( $headers ) {
	unset( $headers[‘X-Pingback’] );
	return $headers;
}, 20);

add_filter( ‘xmlrpc_methods’, function( $methods ) {
	unset( $methods[‘pingback.ping’] );
	unset( $methods[‘pingback.extensions.getPingbacks’] );
	return $methods;
}, 20);
```
