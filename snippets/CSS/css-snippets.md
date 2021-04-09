# CSS Snippets

<!-- MarkdownTOC -->

* [Selectors](#selectors)
* [Canvas](#canvas)
* [Media Queries](#media-queries)
  * [Bootstrap Breakpoints](#bootstrap-breakpoints)
* [Sticky Footer Fix](#sticky-footer-fix)

<!-- /MarkdownTOC -->

<a id="selectors"></a>
## Selectors

* https://css-tricks.com/child-and-sibling-selectors/
* https://gist.github.com/magicznyleszek/809a69dd05e1d5f12d01
* https://codepen.io/Skrypt/pen/jCzkA
* https://css-tricks.com/spacing-the-bottom-of-modules/
		* Note: Replace with Lobotomized Owl: `* + *`

<a id="canvas"></a>
## Canvas

1. Canvas Positioning:

```css
#canvas {
    --width: 100vw;
    --height: 100vh;
    background: #fff;
    left: calc(var(--width) * 0.25);
    margin: auto;
    position: absolute;
    top: calc( var(--height) * 0.25);
}
```

<a id="media-queries"></a>
## Media Queries

* [MDN](https://hacks.mozilla.org/2016/08/using-feature-queries-in-css/)

<a id="bootstrap-breakpoints"></a>
### Bootstrap Breakpoints

```scss
// Extra small devices (portrait phones, less than 576px)
// No media query since this is the default in Bootstrap

// Small devices (landscape phones, 576px and up)
@media (min-width: 576px) { ... }

// Medium devices (tablets, 768px and up)
@media (min-width: 768px) { ... }

// Large devices (desktops, 992px and up)
@media (min-width: 992px) { ... }

// Extra large devices (large desktops, 1200px and up)
@media (min-width: 1200px) { ... }
```

```scss
@include media-breakpoint-up(xs) { ... }
@include media-breakpoint-up(sm) { ... }
@include media-breakpoint-up(md) { ... }
@include media-breakpoint-up(lg) { ... }
@include media-breakpoint-up(xl) { ... }

// Example usage:
@include media-breakpoint-up(sm) {
  .some-class {
    display: block;
  }
}
```

```scss
// Note that since browsers do not currently support range context queries, we work around the limitations of min- and max- prefixes and viewports with fractional widths (which can occur under certain conditions on high-dpi devices, for instance) by using values with higher precision for these comparisons.

// Extra small devices (portrait phones, less than 576px)
@media (max-width: 575.98px) { ... }

// Small devices (landscape phones, less than 768px)
@media (max-width: 767.98px) { ... }

// Medium devices (tablets, less than 992px)
@media (max-width: 991.98px) { ... }

// Large devices (desktops, less than 1200px)
@media (max-width: 1199.98px) { ... }

// Extra large devices (large desktops)
// No media query since the extra-large breakpoint has no upper bound on its width

// Once again, these media queries are also available via Sass mixins:
@include media-breakpoint-down(xs) { ... }
@include media-breakpoint-down(sm) { ... }
@include media-breakpoint-down(md) { ... }
@include media-breakpoint-down(lg) { ... }
```

```scss
// There are also media queries and mixins for targeting a single segment of screen sizes using the minimum and maximum breakpoint widths.

// Extra small devices (portrait phones, less than 576px)
@media (max-width: 575.98px) { ... }

// Small devices (landscape phones, 576px and up)
@media (min-width: 576px) and (max-width: 767.98px) { ... }

// Medium devices (tablets, 768px and up)
@media (min-width: 768px) and (max-width: 991.98px) { ... }

// Large devices (desktops, 992px and up)
@media (min-width: 992px) and (max-width: 1199.98px) { ... }

// Extra large devices (large desktops, 1200px and up)
@media (min-width: 1200px) { ... }
// These media queries are also available via Sass mixins:

@include media-breakpoint-only(xs) { ... }
@include media-breakpoint-only(sm) { ... }
@include media-breakpoint-only(md) { ... }
@include media-breakpoint-only(lg) { ... }
@include media-breakpoint-only(xl) { ... }
Similarly, media queries may span multiple breakpoint widths:

// Example
// Apply styles starting from medium devices and up to extra large devices
@media (min-width: 768px) and (max-width: 1199.98px) { ... }
The Sass mixin for targeting the same screen size range would be:

@include media-breakpoint-between(md, xl) { ... }
```

<a id="sticky-footer-fix"></a>
## Sticky Footer Fix

```css
html,
body {
  height: 100%;
}

body {
  display: flex;
  flex-direction: column;
}

.site-footer {
  margin: auto auto 0;
}
```

Alternate:

```css
/**
 * Fix for Sticky Footer
 */
.site-wrapper {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  padding: 61px 0 0;
}

.content-wrapper {
  /* Double-check if these are equivalent */
  flex: 1 0 auto;
  flex: 1;
}
```
