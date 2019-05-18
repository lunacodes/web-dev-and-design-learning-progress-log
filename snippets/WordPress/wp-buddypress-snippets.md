# buddyPress Snippets

## Groups

```php
add_filter( 'bp_is_profile_cover_image_active', '__return_false' );
add_filter( 'bp_is_groups_cover_image_active', '__return_false' );
```

## Filters & Constants Reference

BuddyPress Core Filters and Constants

BudyPress provides a series of filters and constants you can add to your bp-custom.php or functions.php files to modify the behaviour of your BP install. These range from defining the avatar sizes BP will look for as defined defaults to filters that can be set to deactivate components fully such as @mentions

### Constants

```php
/**
 * Define default values for BP avatars – shown are the BP default values; ‘ORIGINAL_MAX_FILESIZE’ is a value generally taken from WP site settings.
 */
define( 'BP_AVATAR_THUMB_WIDTH', 50 );
define( 'BP_AVATAR_THUMB_HEIGHT', 50 );
define( 'BP_AVATAR_FULL_WIDTH', 150 );
define( 'BP_AVATAR_FULL_HEIGHT', 150 );
define( 'BP_AVATAR_ORIGINAL_MAX_WIDTH', 450 );
define( 'BP_AVATAR_ORIGINAL_MAX_FILESIZE', 5120000 );

// Force BP to display usernames with spaces
define('BP_ENABLE_USERNAME_COMPATIBILITY_MODE', true);

// Define the user account tab that is designated as the default to open with
define( 'BP_DEFAULT_COMPONENT', 'profile' )

// Do the same as user account screens default page for Groups.
define( 'BP_GROUPS_DEFAULT_EXTENSION', 'members' );

/**
 * Enabling this constant allows you remove the portion of the url path /members/ and have your member name at the ‘Root‘ of the domain url.
 * N.B. If you use BP_ENABLE_ROOT_PROFILES there might be a situation where some user profiles get the same url as some posts or pages rendering either of them inaccessible. This might also be true of sub-sites if you’re running multisite with subdirectories. See ticket #1426 for more information.
 */
define('BP_ENABLE_ROOT_PROFILES', true )

// Allow User screens to be viewed under the domain path of MS sub domains / sub directories N.B. As of 1.7 it is recommended not to define this constant as BP will activate on individual sites.
define( 'BP_ENABLE_MULTIBLOG', true );

/**
 * Enable private messaging to all users
 * By default you can only send private messages to people in your friends list, to change this behaviour you can add this constant to your wp-config.php or bp-custom.php file
 */
define( 'BP_MESSAGES_AUTOCOMPLETE_ALL', true );
// If you do allow this please consider that it allows possible spamming of you members , this is why if only friends can PM it’s by consent.
```

### Filters

BP functions are well specified with filters available for most of them, these are a few that are provided to act as simple switches.

BP `@-mention` functionality is enabled by default If you don’t wish to use `@-mention`s, disable them completely.

```php
// BP by default converts certain strings in user profiles to links, to disable this behaviour add:
add_filter( 'bp_activity_do_mentions', '__return_false' );
remove_filter( 'bp_get_the_profile_field_value', 'xprofile_filter_link_profile_data', 9, 2 );

/**
 * Admin Bar: Since BP 1.6 the default behaviour has been to use the WP adminbar for BP related links deprecating the older BP buddybar
 * You may alter this behaviour and return to using the older style buddybar by adding this filter
 */
add_filter('bp_use_wp_admin_bar', __return_false);
```
