# How To Structure Your Sass Projects:

## Basic Directory Structure

```
stylesheets/
|
|-- modules/              # Common modules
|   |-- _all.scss         # Include to get all modules
|   |-- _utility.scss     # Module name
|   |-- _colors.scss      # Etc...
|   ...
|
|-- partials/             # Partials
|   |-- _base.sass        # imports for all mixins + global project variables
|   |-- _buttons.scss     # buttons
|   |-- _figures.scss     # figures
|   |-- _grids.scss       # grids
|   |-- _typography.scss  # typography
|   |-- _reset.scss       # reset
|   ...
|
|-- vendor/               # CSS or Sass from other projects
|   |-- _colorpicker.scss
|   |-- _jquery.ui.core.scss
|   ...
|
`-- main.scss            # primary Sass file
```

This keeps main.scss extremely clean:

```scss
// Modules and Variables
@import "partials/base";

// Partials
@import "partials/reset";
@import "partials/typography";
@import "partials/buttons";
@import "partials/figures";
@import "partials/grids";
// ...

// Third-party
@import "vendor/colorpicker";
@import "vendor/jquery.ui.core";
```

## Explanation:

* Modules: reserved for Sass code that doesn't cause Sass to actually output CSS. Things like mixin declarations, functions, and variables.
* Partials: main project files. Some people break them down into header, content, sidebar, footer, and other components.
    * Another option is [SMACSS](https://smacss.com/) (Scalable and Modular Architecture for CSS) - ex: typography, buttons, textboxes, selectboxes, etc.
* Vendor: third-party CSS - useful when using pre-packaged components developed by other people (ex: jQuery UI, Color Picker), or your own components that are maintained in another project.
    * General rule: don't modify files in Vendor directly. If modifications are needed, make them after the vendored files are loaded by the primary stylesheet.
        * This helps keep the third-party stylesheets easy to update to more current versions, in the future

## Using a base partial

* Base Partial: loads up Sass environment so that it's easy to constsruct a stylesheet. Example:

```scss
// Use Compass ('cause it rocks!)
@import "compass";

// Font weights
$light: 100;
$regular: 400;
$bold: 600;

// Base Font
$base-font-family: sans-serif;
$base-font-weight: $regular;
$base-font-size: 13px;
$base-line-height: 1.4;

// Fixed Font
$fixed-font-family: monospace;
$fixed-font-size: 85%;
$fixed-line-height: $base-line-height;

// Headings
$header-font-weight: $bold;

@import "modules/all";
```

* Sets a couple of global variables, and loads up all the Sass modules.
    - Ties all the variables and modules into the base partial
    - Gives access to the entire Sass environment whenever we're setting up a new stylesheet.
    - This allows for building multiple stylesheets by importing different partials.

## Expanding to account for multiple bundled sub-projects
* [UserVoice](http://uservoice.com/) runs multiple sub-projects all bundled together in a single Rails app. 
    * Each sub-project is bundled into a separate top-level directory

```
stylesheets/
|
|-- admin/           # Admin sub-project
|   |-- modules/
|   |-- partials/
|   `-- _base.scss
|
|-- account/         # Account sub-project
|   |-- modules/
|   |-- partials/
|   `-- _base.scss
|
|-- site/            # Site sub-project
|   |-- modules/
|   |-- partials/
|   `-- _base.scss
|
|-- vendor/          # CSS or Sass from other projects
|   |-- _colorpicker-1.1.scss
|   |-- _jquery.ui.core-1.9.1.scss
|   ...
|
|-- admin.scss       # Primary stylesheets for each project
|-- account.scss
`-- site.scss
```

