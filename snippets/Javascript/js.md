# Javascript Snippets

<!-- from: https://medium.freecodecamp.org/7-javascript-methods-that-will-boost-your-skills-in-less-than-8-minutes-4cc4c3dca03f -->
1. Spread Operator: list all items in array w/o for loop: 

```js 
const favoriteFood = ['Pizza', 'Fries', 'Swedish-meatballs']

console.log(...favoriteFood);
// Pizza, Fries, Swedish-Meatballs
```

2. for... of iterator: iterates through a collection, and provides the ability to modify specific items; replaces conventional for loop

```js
const toolBox = ['Hammer', 'Screwdriver', 'Ruler'];

for (const item of toolBox) {
    console.log(item);
}

// Hammer
// Screwdriver
// Ruler
```