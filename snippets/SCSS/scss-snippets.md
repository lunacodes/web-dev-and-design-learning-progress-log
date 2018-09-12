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
