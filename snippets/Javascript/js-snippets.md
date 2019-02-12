# Javascript Snippets

<!-- MarkdownTOC -->

* [General](#general)
* [Mechanical](#mechanical)
* [Websites & User Interaction](#websites--user-interaction)
* [Positioning](#positioning)
* [Networking](#networking)
  * [Fetch](#fetch)
* [Geolocation](#geolocation)
* [Time & Dates](#time--dates)

<!-- /MarkdownTOC -->

<a id="general"></a>
## General
1. Optional Parameters:

```js
// With ES6:
function myFunc(a, b = 0) {
   // function body
}
```

Please keep in mind that ES6 checks the values against undefined and not against truthy-ness (so only real undefined values get the default value - falsy values like null will not default).

```js
With ES5:

function myFunc(a,b) {
  b = b || 0;

  // b will be set either to b or to 0.
}
```

This works as long as all values you explicitly pass in are truthy. Values that are not truthy as per MiniGod's comment: null, undefined, 0, false, ''

It's pretty common to see JavaScript libraries to do a bunch of checks on optional inputs before the function actually starts.

`null, undefined, 0, false, '', NaN` will all get the default value.

If you only want the default value if b is omitted, use `if (typeof b === 'undefined') b = 0;`

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

<a id="networking"></a>
## Networking

<a id="fetch"></a>
### Fetch

1. Fetch API Example

```js
// Basic Fetch Request
let urlStr = 'https://api.db-ip.com/v2/free/self';
fetch(urlStr)
  .then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    console.log(myJson);
  });
```

2. Get visitor's IP Address

```js
async function getIP(sub) {
  const URL = 'https://api.ipify.org?format=json';
  const fetchResult = fetch(URL);
  const response = await fetchResult;
  const jsonData = await response.json();
  let ip = jsonData["ip"];
  // const res = new Array(jsonData);
  getGeoDetailsByIp(ip);
}
getIP('javascript');
```

<a id="geolocation"></a>
## Geolocation

1. Get User Lattitude and Longitude via HTML5 Geolocation API

```js
// navigator = new google.maps.LatLng(lat, long);
if (navigator.geolocation) {
    var testing = navigator.geolocation;
    console.log(testing);
    navigator.geolocation.getCurrentPosition(showPosition);
}
else {
    // console.log("fail");
    zemanim.innerHtml = "Please enable location services to display the most up-to-date Zemanim";

    console.log("Geolocation is not supported by this browser");
}

function showPosition(position) {
  var posLog = position;
  console.log(posLog);
  console.log(JSON.stringify(posLog));
  console.log(posLog.toString());
  var lat = position.coords.latitude;
  var long = position.coords.longitude;
}


```

2. GetUser Latitude and Longitude via JSON API
  * https://ipapi.co/json/
  * https://stackoverflow.com/questions/391979/how-to-get-clients-ip-address-using-javascript

<a id="time--dates"></a>
## Time & Dates

1. Convert from `YYYY-MM-DD` to `Month, DD, YYYY`

```js
var date3 = new Date(2009, 10, 10);  // 2009-11-10
var localizedDate = date3.toLocaleString('en-us', { month: 'long', day: 'numeric', year: 'numeric' });
console.log(localizedDate);
```

2. Convert `ISO 8601` to `UTC Seconds`

```js
let right_now = new Date();
convToUTC(right_now);

function convToUTC(dateObj) {
    let time = dateObj;
    time = time.toISOString();
    time = Date.parse(time);
    time = time.toString();
    time = time.slice(0,10);

    return time;
}
```

