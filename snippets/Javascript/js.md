# Javascript Snippets

<!-- MarkdownTOC -->

* [Mechanical](#mechanical)
* [Websites & User Interaction](#websites--user-interaction)
* [Positioning](#positioning)

<!-- /MarkdownTOC -->

<a id="mechanical"></a>
## Mechanical

1. Spread Operator: list all items in array w/o for loop: 

```js 
// from: https://medium.freecodecamp.org/7-javascript-methods-that-will-boost-your-skills-in-less-than-8-minutes-4cc4c3dca03f
const favoriteFood = ['Pizza', 'Fries', 'Swedish-meatballs']

console.log(...favoriteFood);
// Pizza, Fries, Swedish-Meatballs
```

2. for... of iterator: iterates through a collection, and provides the ability to modify specific items; replaces conventional for loop

```js
// from: https://medium.freecodecamp.org/7-javascript-methods-that-will-boost-your-skills-in-less-than-8-minutes-4cc4c3dca03f
const toolBox = ['Hammer', 'Screwdriver', 'Ruler'];

for (const item of toolBox) {
    console.log(item);
}

// Hammer
// Screwdriver
// Ruler
```

<a id="websites--user-interaction"></a>
# Websites & User Interaction

1. Add Source Link When Someone Copies Text
    * from: [techwelkin](https://techwelkin.com/add-source-link-copyright-copied-text-clipboard)
    * original source: [stackOverflow - How to add extra info to copied web text](https://stackoverflow.com/questions/2026335/how-to-add-extra-info-to-copied-web-text)

```js
// from: [techwelkin](https://techwelkin.com/add-source-link-copyright-copied-text-clipboard)
// original source: [stackOverflow - How to add extra info to copied web text](https://stackoverflow.com/questions/2026335/how-to-add-extra-info-to-copied-web-text)

function addLink() {
    // Get the selected text and append the extra info
    var selection = window.getSelection();
    pagelink = ". Read more at: " + document.location.href;
    copytext = selection + pagelink;
    /**
     * Note: to add © symbol, use \u2117 inside double quotes
     * In html:
        * &copy; and &#169; both produce the standard copyright symbol ©
        * &#9400; produce a circled capital letter C Ⓒ
        * &#9426; produce a circled small letter c ⓒ
     */ 

    // Create a new div to hold the prepared text
    newdiv = document.createElement('div');

    // hide the newly created container
    newdiv.style.position = 'absolute';
    newdiv.style.left = '-99999px';

    // insert the container, fill it with the extended text, and define the new selection
    document.body.appendChild(newdiv);
    newdiv.innerHTML = copytext;
    selection.selectAllChildren(newdiv);
    window.setTimeout(function () {
        document.body.removeChild(newdiv);
    }, 100);
}
document.addEventListener('copy', addLink);


/**
 * jQuery version
 */

jQuery(document).on('copy', function(e)
{
  var sel = window.getSelection();
  var copyFooter = 
        "<br /><br /> Source: <a href='" + document.location.href + "'>" + document.location.href + "</a><br />© YourSite";
  var copyHolder = $('<div>', {html: sel+copyFooter, style: {position: 'absolute', left: '-99999px'}});
  $('body').append(copyHolder);
  sel.selectAllChildren( copyHolder[0] );
  window.setTimeout(function() {
      copyHolder.remove();
  },0);
});


```

<a id="positioning"></a>
## Positioning

1. Get Browser Width and Height: 

```js
function getBrowserWidth() {
  return Math.max(
    document.body.scrollWidth,
    document.documentElement.scrollWidth,
    document.body.offsetWidth,
    document.documentElement.offsetWidth,
    document.documentElement.clientWidth
  );
}

function getBrowserHeight() {
  return Math.max(
    document.body.scrollHeight,
    document.documentElement.scrollHeight,
    document.body.offsetHeight,
    document.documentElement.offsetHeight,
    document.documentElement.clientHeight
  );
}
```