# SCSS Snippets

<!-- MarkdownTOC -->

* [Automatically Center a Block Element](#automatically-center-a-block-element)
* [Clearfix](#clearfix)
* [Responsive Ratio](#responsive-ratio)
* [CSS Triangles](#css-triangles)
* [Font styles](#font-styles)
* [Media Queries](#media-queries)
* [Z-index](#z-index)
* [Hardware ACceleration](#hardware-acceleration)
* [Truncate](#truncate)
* [Sources](#sources)
* [Resources](#resources)
* [Needs Sorting](#needs-sorting)
  * [Part 1](#part-1)
  * [Part 2](#part-2)

<!-- /MarkdownTOC -->

<a id="automatically-center-a-block-element"></a>
## Automatically Center a Block Element

```scss
// Automatically center a block element
// Note: original name push--auto
@mixin center--auto {
  margin: {
    left: auto;
    right: auto;
  }
}
```

<a id="clearfix"></a>
## Clearfix

```scss
// Standard clearfix code
@mixin clearfix($display: block, $position: absolute, $content: '') {
  content: $content;
  display: $display;
  position: $position;
}

// Can also be used without any arguments
div::after {
  @include clearfix;
  left:-1rem;
  height: 1rem;
  top: -1rem;
  width: 1rem;
}
```

<a id="responsive-ratio"></a>
## Responsive Ratio

Useful for creating scalable elements (usually images/background images) that maintain a ratio.

```scss
// Create scalable elements
@mixin responsive-ratio($x, $y, $pseudo: false) {
  $padding: unquote( ( $y / $x ) * 100 + '%' );
  @if($pseudo) {
    &:before {
      @include pseudo($pos: relative);
      padding-top: $padding;
      width: 100%;
    }
  } @else {
    padding-top: $padding;
  }
}

// Example: Div that uses common video ratio
div {
  @include responsive-ratio(16, 9);
}
```

<a id="css-triangles"></a>
## CSS Triangles

```scss
// Triangles made easy!!
@mixin css-triangle($color, $direction, $size: 6px, $position: absolute, $round: false){
    @include pseudo($pos: $position);
    width: 0;
    height: 0;
    @if $round {
        border-radius: 3px;
    }
    @if $direction == down {
        border-left: $size solid transparent;
        border-right: $size solid transparent;
        border-top: $size solid $color;
        margin-top: 0 - round( $size / 2.5 );
    } @else if $direction == up {
        border-left: $size solid transparent;
        border-right: $size solid transparent;
        border-bottom: $size solid $color;
        margin-bottom: 0 - round( $size / 2.5 );
    } @else if $direction == right {
        border-top: $size solid transparent;
        border-bottom: $size solid transparent;
        border-left: $size solid $color;
        margin-right: -$size;
    } @else if  $direction == left {
        border-top: $size solid transparent;
        border-bottom: $size solid transparent;
        border-right: $size solid $color;
        margin-left: -$size;
    }
}
```

<a id="font-styles"></a>
## Font styles

```scss
// Font-Sizes made easy
@mixin font-source-sans($size: false, $color: false, $weight: false, $lh: false) {
  font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif;
  @if $size { font-size: $size; }
  @if $color {color: $color; }
  @if $weight { font-weight: $weight; }
  @if $lh { line-height: $lh; }
}
```

<a id="media-queries"></a>
## Media Queries

```scss
// List of Media Queries
$breakpoints: (
  "phone":        400px,
  "phone-wide":   480px,
  "phablet":      560px,
  "tablet-small": 640px,
  "tablet":       768px,
  "tablet-wide":  1024px,
  "desktop":      1248px,
  "desktop-wide": 1440px
);

@mixin mq($width, $type: min) {
  @if map_has_key($breakpoints, $width) {
    width: map_get($breakpoints, $width);
    @if $type == max {
      $width: $width - 1px;
    }
    @media only screen and (#{$type}-width: $width) {
      @content;
    }
  }
}

// Usage:
.site-header {
  padding: 2rem;
  font-size: 1.8rem;
  @include mq('tablet-wide') {
    padding-top: 4rem;
    font-size: 2.4rem;
  }
}
```

<a id="z-index"></a>
## Z-index

Keep all your z-indices in one place via this function.

```scss
// Keeps all your z-indices in one place - for sanity!!
@function z($name) {
  @if index($z-indexes, $name) {
    @return (length($z-indexes) - index($z-indexes, $name)) + 1;
  } @else {
    @warn 'There is no item "#{$name}" in this list; choose one of #{$z-indexes}';
    @return null;
  }
}

$z-indexes: (
  "outdated-browser",
  "modal",
  "site-header",
  "page-wrapper",
  "site-footer"
);

// Usage: name the z-index value the same as your class.
// Add it into your variables/settings file as follows:
.site-header {
  z-index: z('site-header');
}
```

<a id="hardware-acceleration"></a>
## Hardware ACceleration

Trigger hardware acceleration for some animation.

```scss
// Easy Hardware Acceleration
@mixin hardware($backface: true, $perspective: 1000) {
  @if $backface {
    backface-visibility: hidden;
  }
  perspective: $perspective;
}
```

<a id="truncate"></a>
## Truncate

```scss
// Simplify truncation
@mixin truncate($truncation-boundary) {
  max-width: $trunaction-boundary;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
```

<a id="sources"></a>
## Sources
* [engage - Top 10 SCSS mixins](https://engageinteractive.co.uk/blog/top-10-scss-mixins)

<a id="resources"></a>
## Resources
* [GitHub - Engage Interactive: _mixins.scss](https://github.com/engageinteractive/front-end-baseplate/blob/master/src/scss/utility/_mixins.scss) - Giant list of Mixins
    * Part of the [Front End Baseplate](https://github.com/engageinteractive/front-end-baseplate) Project
* https://css-tricks.com/the-sass-ampersand/
* https://github.com/sasstools/sass-lint
* https://github.com/brigade/scss-lint/blob/master/config/default.yml
* https://github.com/RadValentin/postcss-prefix-selector


<a id="needs-sorting"></a>
## Needs Sorting

<a id="part-1"></a>
### Part 1

```scss
/// Power function
/// @param {Number} $x
/// @param {Number} $n
/// @return {Number}
/// @source https://github.com/adambom/Sass-Math/blob/master/math.scss Sass-Math
@function pow($x, $n) {
  $result: 1;

  @if $n >= 0 {
    @for $i from 1 through $n {
        $result: $result * $x;
    }
  } @else {
      @for $i from $n to 0 {
        $result: $result / $x;
      }
    }
  @return $result;
}

https://github.com/at-import/Sassy-math
https://unindented.org/articles/trigonometry-in-sass/
http://thesassway.com/advanced/inverse-trigonometric-functions-with-sass


http://sass-guidelin.es/#lightening-and-darkening-colors

/// Slightly lighten a color
/// @access public
/// @param {Color} $color - color to tint
/// @param {Number} $percentage - percentage of `$color` in returned color
/// @return {Color}
@function tint($color, $percentage) {
  @return mix($color, white, $percentage);
}

/// Slightly darken a color
/// @access public
/// @param {Color} $color - color to shade
/// @param {Number} $percentage - percentage of `$color` in returned color
/// @return {Color}
@function shade($color, $percentage) {
  @return mix($color, black, $percentage);
}



Sprite Builders:
https://github.com/filamentgroup/grunticon
  Runs on Grunt: http://gruntjs.com/
    Browser-based app: http://grumpicon.com/
      Released by: http://www.filamentgroup.com/
```

<a id="part-2"></a>
### Part 2

```scss
When you find yourself writing the same code over and over again, it feels like Sass mixins might help you out.

Sass mixins are CSS functions that you can include whenever you want.

#Syntax
Remember how we wrote @keyframes when creating CSS animations? The Sass mixin syntax is fairly similar:

@mixin overlay() {
  bottom: 0;
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
}
The name of this mixin is overlay. You can reference this mixin in any CSS rule by using @include:

.modal-background{
  @include overlay();
  background: black;
  opacity: 0.9;
}
As usual, this .scss will be compiled into .css:

.modal-background{
  bottom: 0;
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
  background: black;
  opacity: 0.9;
}
#Reusability
The main purpose of a mixin is to make a set of properties reusable.

Like Sass variables (where you define your values on a single location), Sass mixins allow you to define properties on a single location.

The previous mixin can be reused in other rules:

.modal-background{
  @include overlay();
}

.product-link{
  @include overlay();
}

.image-pattern{
  @include overlay();
}
.modal-background{
  bottom: 0;
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
}

.product-link{
  bottom: 0;
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
}

.image-pattern{
  bottom: 0;
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
}
#Parameters
Because mixins are functions and because you might want to alter the output, mixins can accept parameters.

For example, this border-radius mixin prevents rewriting vendor prefixes and takes the actual radius value as a parameter:

@mixin border-radius($radius) {
  -webkit-border-radius: $radius;
     -moz-border-radius: $radius;
      -ms-border-radius: $radius;
          border-radius: $radius;
}

.box{
  @include border-radius(3px);
}
.box{
  -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
      -ms-border-radius: 3px;
          border-radius: 3px;
}
The mixin circumvents the hassle of having to write all vendor prefixes, and uses the $radius to allow defining the same radius value for every vendor property.

#Optional parameters
If you want a parameter to have a default value while providing the possibility to set one occasionally, you can create optional paramaters:

@mixin label($text: "Code", $background: $yellow, $color: rgba(black, 0.5)) {
  position: relative;
  &:before{
    background: $background;
    color: $color;
    content: $text;
    display: inline-block;
    font-size: 0.6rem;
    font-weight: 700;
    height: 1rem;
    left: 0;
    letter-spacing: 0.1em;
    line-height: 1rem;
    padding: 0 0.5em;
    position: absolute;
    text-transform: uppercase;
    top: 0;
  }
}
This mixin is the one used by this website to add labels in the top left corner of code snippets. It has 3 optional parameters, each of them with their own default value set with a colon :.

This mixin is used several times throughout the code:

div.highlighter-rouge{
  @include label();
  &.css{
    @include label("CSS", $blue, white);
  }
  &.scss{
    @include label("SCSS", #c69, white);
  }
}
The div.highlighter-rouge will use the mixin’s default values:

text "Code"
background: $yellow
color: rgba(black, 0.5)
The .css and .scss versions, because their parameters are set, will use different labels and colors.

#Mixin libraries
If you don’t want to spend time writing your own Sass mixins, you can use any of the following mixin libraries:

Bourbon: bourbon.io
Compass: compass-style.org
Susy: susy.oddbird.net
```
