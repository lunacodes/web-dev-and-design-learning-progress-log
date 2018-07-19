# CSS Snippets

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