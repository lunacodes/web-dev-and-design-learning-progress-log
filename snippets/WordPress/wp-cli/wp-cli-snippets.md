<!-- MarkdownTOC -->

* [WP-CLI Snippets](#wp-cli-snippets)
  * [My Snippets](#my-snippets)
  * [Bash Completions](#bash-completions)
  * [Cache](#cache)
  * [Cap](#cap)
  * [Cli](#cli)
  * [Comment](#comment)
  * [Config](#config)
  * [Core](#core)
  * [Cron](#cron)
  * [Db](#db)
  * [Embed](#embed)
  * [Language](#language)
  * [Media](#media)
  * [Menu](#menu)
  * [Network](#network)
  * [Option](#option)
  * [Package](#package)
  * [Plugin](#plugin)
  * [Post-type](#post-type)
  * [Post](#post)
  * [Profile](#profile)
  * [Rewrite](#rewrite)
  * [Role](#role)
  * [Scaffold](#scaffold)
  * [Sidebar](#sidebar)
  * [Site](#site)
  * [Super-admin](#super-admin)
  * [Taxonomy](#taxonomy)
  * [Term](#term)
  * [Theme](#theme)
  * [Transient](#transient)
  * [User](#user)
  * [Widget](#widget)
  * [W3TC - total-cache](#w3tc---total-cache)
  * [Global Parameters](#global-parameters)
  * [Extending WP-CLI Commands](#extending-wp-cli-commands)

<!-- /MarkdownTOC -->
<a id="wp-cli-snippets"></a>
# WP-CLI Snippets
<a id="wp-cli-snippets"></a>

<a id="my-snippets"></a>
## My Snippets
```sh
# WPCLI Aliases
# Plugins
alias wpla='wp plugin activate'
alias wpld='wp plugin deactivate'
alias wplg='wp plugin get'
alias wplrm='wp plugin delete'
alias wpls='wp plugin list'
alias wplsa='wp plugin list --status=active'
alias wplsi='wp plugin list --status=inactive'
alias wplsr='wp plugin search'
alias wplu='wp plugin update'
alias wplua='wp plugin update --all'
alias wpflsh='wp cache flush'

# Debugging and Config
wp_debug_on () {
    wp config set WP_DEBUG true
    wp config set WP_DEBUG_LOG true
    wp config set WP_DEBUG_DISPLAY true
    wp config set SCRIPT_DEBUG true
}
alias wpdbgon='wp_debug_on'

wp_debug_off () {
    wp config set WP_DEBUG false
    wp config set WP_DEBUG_LOG false
    wp config set WP_DEBUG_DISPLAY false
    wp config set SCRIPT_DEBUG false
}
alias wpdbgoff='wp_debug_off'
alias wpcfgls='wp config get'
alias wpcfset='wp config set'
```

<a id="bash-completions"></a>
## Bash Completions

Bash Completions for the `wp` command

```sh
# bash completion for the `wp` command

_wp_complete() {
  local OLD_IFS="$IFS"
  local cur=${COMP_WORDS[COMP_CWORD]}

  IFS=$'\n';  # want to preserve spaces at the end
  local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")"

  if [[ "$opts" =~ \<file\>\s* ]]
  then
    COMPREPLY=( $(compgen -f -- $cur) )
  elif [[ $opts = "" ]]
  then
    COMPREPLY=( $(compgen -f -- $cur) )
  else
    COMPREPLY=( ${opts[*]} )
  fi

  IFS="$OLD_IFS"
  return 0
}
complete -o nospace -F _wp_complete wp
```

<a id="cache"></a>
## Cache
* wp cache add
* wp cache decr
* wp cache delete
* wp cache flush
* wp cache get
* wp cache incr
* wp cache replace
* wp cache set
* wp cache type

<a id="cap"></a>
## Cap
* wp cap add
* wp cap list
* wp cap remove

<a id="cli"></a>
## Cli
* wp cli alias
* wp cli check-update
* wp cli cmd-dump
* wp cli completions
* wp cli has-command
* wp cli info
* wp cli param-dump
* wp cli update
* wp cli version

<a id="comment"></a>
## Comment
* wp comment approve
* wp comment count
* wp comment create
* wp comment delete
* wp comment exists
* wp comment generate
* wp comment get
* wp comment list
* wp comment meta
* wp comment recount
* wp comment spam
* wp comment status
* wp comment trash
* wp comment unapprove
* wp comment unspam
* wp comment untrash
* wp comment update
* wp comment meta add
* wp comment meta delete
* wp comment meta get
* wp comment meta list
* wp comment meta patch
* wp comment meta pluck
* wp comment meta update

<a id="config"></a>
## Config
* wp config create
* wp config delete
* wp config get
* wp config has
* wp config list
* wp config path
* wp config set

<a id="core"></a>
## Core
* wp core check-update
* wp core download
* wp core install
* wp core is-installed
* wp core multisite-convert
* wp core multisite-install
* wp core update-db
* wp core update
* wp core verify-checksums
* wp core version

<a id="cron"></a>
## Cron
* wp cron event
* wp cron schedule
* wp cron test
* wp cron event delete
* wp cron event list
* wp cron event run
* wp cron event schedule
* wp cron schedule list

<a id="db"></a>
## Db
* wp db check
* wp db cli
* wp db create
* wp db drop
* wp db export
* wp db import
* wp db optimize
* wp db prefix
* wp db query
* wp db repair
* wp db reset
* wp db search
* wp db size
* wp db tables

<a id="embed"></a>
## Embed
* wp embed cache
* wp embed fetch
* wp embed handler
* wp embed provider
* wp embed cache clear
* wp embed cache find
* wp embed cache trigger
* wp embed handler list
* wp embed provider list
* wp embed provider match

<a id="language"></a>
## Language
* wp language core
* wp language core activate
* wp language core install
* wp language core list
* wp language core uninstall
* wp language core update

<a id="media"></a>
## Media
* wp media image-size
* wp media import
* wp media regenerate

<a id="menu"></a>
## Menu
* wp menu create
* wp menu delete
* wp menu item
* wp menu list
* wp menu location
* wp menu item add-custom
* wp menu item add-post
* wp menu item add-term
* wp menu item delete
* wp menu item list
* wp menu item update
* wp menu location assign
* wp menu location list
* wp menu location remove

<a id="network"></a>
## Network
* wp network meta
* wp network meta add
* wp network meta delete
* wp network meta get
* wp network meta list
* wp network meta patch
* wp network meta pluck
* wp network meta update

<a id="option"></a>
## Option
* wp option add
* wp option delete
* wp option get
* wp option list
* wp option patch
* wp option pluck
* wp option update

<a id="package"></a>
## Package
* wp package browse
* wp package install
* wp package list
* wp package path
* wp package uninstall
* wp package update

<a id="plugin"></a>
## Plugin
* wp plugin activate
* wp plugin deactivate
* wp plugin delete
* wp plugin get
* wp plugin install
* wp plugin is-installed
* wp plugin list
* wp plugin path
* wp plugin search
* wp plugin status
* wp plugin toggle
* wp plugin uninstall
* wp plugin update
* wp plugin verify-checksums

<a id="post-type"></a>
## Post-type
* wp post-type get
* wp post-type list

<a id="post"></a>
## Post
* wp post create
* wp post delete
* wp post edit
* wp post generate
* wp post get
* wp post list
* wp post meta
* wp post term
* wp post update
* wp post meta add
* wp post meta delete
* wp post meta get
* wp post meta list
* wp post meta patch
* wp post meta pluck
* wp post meta update
* wp post term add
* wp post term list
* wp post term remove
* wp post term set

<a id="profile"></a>
## Profile
* wp profile eval-file
* wp profile eval
* wp profile hook
* wp profile stage

<a id="rewrite"></a>
## Rewrite
* wp rewrite flush
* wp rewrite list
* wp rewrite structure

<a id="role"></a>
## Role
* wp role create
* wp role delete
* wp role exists
* wp role list
* wp role reset

<a id="scaffold"></a>
## Scaffold
* wp scaffold _s
* wp scaffold block
* wp scaffold child-theme
* wp scaffold plugin-tests
* wp scaffold plugin
* wp scaffold post-type
* wp scaffold taxonomy
* wp scaffold theme-tests

<a id="sidebar"></a>
## Sidebar
* wp sidebar list

<a id="site"></a>
## Site
* wp site activate
* wp site archive
* wp site create
* wp site deactivate
* wp site delete
* wp site empty
* wp site list
* wp site mature
* wp site option
* wp site private
* wp site public
* wp site spam
* wp site unarchive
* wp site unmature
* wp site unspam
* wp site option add
* wp site option delete
* wp site option get
* wp site option list
* wp site option patch
* wp site option pluck
* wp site option update

<a id="super-admin"></a>
## Super-admin
* wp super-admin add
* wp super-admin list
* wp super-admin remove

<a id="taxonomy"></a>
## Taxonomy
* wp taxonomy get
* wp taxonomy list

<a id="term"></a>
## Term
* wp term create
* wp term delete
* wp term generate
* wp term get
* wp term list
* wp term meta
* wp term recount
* wp term update
* wp term meta add
* wp term meta delete
* wp term meta get
* wp term meta list
* wp term meta patch
* wp term meta pluck
* wp term meta update

<a id="theme"></a>
## Theme
* wp theme activate
* wp theme delete
* wp theme disable
* wp theme enable
* wp theme get
* wp theme install
* wp theme is-installed
* wp theme list
* wp theme mod
* wp theme path
* wp theme search
* wp theme status
* wp theme update
* wp theme mod get
* wp theme mod remove
* wp theme mod set

<a id="transient"></a>
## Transient
* wp transient delete
* wp transient get
* wp transient set
* wp transient type

<a id="user"></a>
## User
* wp user add-cap
* wp user add-role
* wp user create
* wp user delete
* wp user generate
* wp user get
* wp user import-csv
* wp user list-caps
* wp user list
* wp user meta
* wp user remove-cap
* wp user remove-role
* wp user reset-password
* wp user session
* wp user set-role
* wp user spam
* wp user term
* wp user unspam
* wp user update
* wp user meta add
* wp user meta delete
* wp user meta get
* wp user meta list
* wp user meta patch
* wp user meta pluck
* wp user meta update
* wp user session destroy
* wp user session list
* wp user term add
* wp user term list
* wp user term remove
* wp user term set

<a id="widget"></a>
## Widget
* wp widget add
* wp widget deactivate
* wp widget delete
* wp widget list
* wp widget move
* wp widget reset
* wp widget update

<a id="w3tc---total-cache"></a>
## W3TC - total-cache

cdn_purge               Purges URL's from cdn and varnish if enabled
fix_environment         Creates missing files, writes apache/nginx rules.
flush                   Clear something from the cache.
import                  Imports configuration file
opcache_flush           SNS/local file.php Tells opcache to compile files
opcache_flush_file      Tell opcache to reload PHP files
option                  Get or set option.
pgcache_cleanup         Generally triggered from a cronjob, performs manual page cache Garbage collection
pgcache_prime           Generally triggered from a cronjob, performs manual page cache priming
querystring             Update query string for all static files


<a id="global-parameters"></a>
## Global Parameters

GLOBAL PARAMETERS

```php
--path=<path>
  Path to the WordPress files.

--url=<url>
  Pretend request came from given URL. In multisite, this argument is how the target site is specified.

--ssh=[<scheme>:][<user>@]<host|container>[:<port>][<path>]
  Perform operation against a remote server over SSH (or a container using scheme of "docker", "docker-compose",
  "vagrant").

--http=<http>
  Perform operation against a remote WordPress install over HTTP.

--user=<id|login|email>
  Set the WordPress user.

  --skip-themes[=<themes>]
      Skip loading all themes, or a comma-separated list of themes.

  --skip-packages
      Skip loading all installed packages.

  --require=<path>
      Load PHP file before running the command (may be used more than once).

  --[no-]color
      Whether to colorize the output.

  --debug[=<group>]
      Show all PHP errors and add verbosity to WP-CLI output. Built-in groups include: bootstrap, commandfactory, and
      help.

  --prompt[=<assoc>]
      Prompt the user to enter values for all command arguments, or a subset specified as comma-separated values.

  --quiet
      Suppress informational messages.

```

<a id="extending-wp-cli-commands"></a>
## Extending WP-CLI Commands

WP-CLI supports registering any callable class, function, or closure as a command. It reads usage details from the callback's PHPdoc. WP_CLI::add_command() (doc) is used for both internal and third-party command registration.

```php
/**
 * Delete an option from the database.
 *
 * Returns an error if the option didn't exist.
 *
 * ## OPTIONS
 *
 * <key>
 * : Key for the option.
 *
 * ## EXAMPLES
 *
 *     $ wp option delete my_option
 *     Success: Deleted 'my_option' option.
 */
$delete_option_cmd = function( $args ) {
  list( $key ) = $args;

  if ( ! delete_option( $key ) ) {
    WP_CLI::error( "Could not delete '$key' option. Does it exist?" );
  } else {
    WP_CLI::success( "Deleted '$key' option." );
  }
};
WP_CLI::add_command( 'option delete', $delete_option_cmd );
```
