# How To Structure Your Sass Projects:

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
