# CSS Snippets

## Selectors

* https://css-tricks.com/child-and-sibling-selectors/
* https://gist.github.com/magicznyleszek/809a69dd05e1d5f12d01
* https://codepen.io/Skrypt/pen/jCzkA
* https://css-tricks.com/spacing-the-bottom-of-modules/
		* Note: Replace with Lobotomized Owl: `* + *`

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

## Media Queries

* [MDN](https://hacks.mozilla.org/2016/08/using-feature-queries-in-css/)

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
