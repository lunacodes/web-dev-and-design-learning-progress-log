# Javascript Snippets


1. Spread Operator: list all items in array w/o for loop: 

from: [freeCodeCamp - These Javascript methods will boost your skills in just a few minutes](https://medium.freecodecamp.org/7-javascript-methods-that-will-boost-your-skills-in-less-than-8-minutes-4cc4c3dca03f)

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

<hr >

# Sharing and Social Media

1. Add Source Link When Someone Copies Text

```js
/**
 * from: [techwelkin](https://techwelkin.com/add-source-link-copyright-copied-text-clipboard)
 * original source: [stackOverflow - How to add extra info to copied web text](https://stackoverflow.com/questions/2026335/how-to-add-extra-info-to-copied-web-text)
 */

function addLink() {
    //Get the selected text and append the extra info
    var selection = window.getSelection();
    pagelink = ". Read more at: " + document.location.href;
    copytext = selection + pagelink;

    //Create a new div to hold the prepared text
    newdiv = document.createElement('div');

    //hide the newly created container
    newdiv.style.position = 'absolute';
    newdiv.style.left = '-99999px';

    //insert the container, fill it with the extended text, and define the new selection
    document.body.appendChild(newdiv);
    newdiv.innerHTML = copytext;
    selection.selectAllChildren(newdiv);
    window.setTimeout(function () {
        document.body.removeChild(newdiv);
    }, 100);
}
document.addEventListener('copy', addLink);
```
