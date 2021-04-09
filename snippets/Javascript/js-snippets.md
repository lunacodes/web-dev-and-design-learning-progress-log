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
  * [Getters](#getters)
  * [Conversions](#conversions)
* [Gravatar](#gravatar)

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

<a id="getters"></a>
### Getters

```js
function getDaysInMonth(month, year) {
  return new Date(year, month, 0).getDate();
}

var now = new Date();
var month = now.getMonth() + 1;
var year = now.getYear();
console.log("now, month, year", now, month, year);
var daysInMonth = getDaysInMonth(month, year);
var tmpDayNum = now.getDate();
if ( daysInMonth === tmpDayNum ) {
    month = month + 1;
}

console.log("diM, dayNum, Month", daysInMonth, tmpDayNum, month);
```

<a id="conversions"></a>
### Conversions
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

<a id="gravatar"></a>
## Gravatar

See https://en.gravatar.com/site/implement/images/

```js
function get_gravatar(email, size, default_image) {

  // MD5 (Message-Digest Algorithm) by WebToolkit
  //

  var MD5=function(s){function L(k,d){return(k<<d)|(k>>>(32-d))}function K(G,k){var I,d,F,H,x;F=(G&2147483648);H=(k&2147483648);I=(G&1073741824);d=(k&1073741824);x=(G&1073741823)+(k&1073741823);if(I&d){return(x^2147483648^F^H)}if(I|d){if(x&1073741824){return(x^3221225472^F^H)}else{return(x^1073741824^F^H)}}else{return(x^F^H)}}function r(d,F,k){return(d&F)|((~d)&k)}function q(d,F,k){return(d&k)|(F&(~k))}function p(d,F,k){return(d^F^k)}function n(d,F,k){return(F^(d|(~k)))}function u(G,F,aa,Z,k,H,I){G=K(G,K(K(r(F,aa,Z),k),I));return K(L(G,H),F)}function f(G,F,aa,Z,k,H,I){G=K(G,K(K(q(F,aa,Z),k),I));return K(L(G,H),F)}function D(G,F,aa,Z,k,H,I){G=K(G,K(K(p(F,aa,Z),k),I));return K(L(G,H),F)}function t(G,F,aa,Z,k,H,I){G=K(G,K(K(n(F,aa,Z),k),I));return K(L(G,H),F)}function e(G){var Z;var F=G.length;var x=F+8;var k=(x-(x%64))/64;var I=(k+1)*16;var aa=Array(I-1);var d=0;var H=0;while(H<F){Z=(H-(H%4))/4;d=(H%4)*8;aa[Z]=(aa[Z]|(G.charCodeAt(H)<<d));H++}Z=(H-(H%4))/4;d=(H%4)*8;aa[Z]=aa[Z]|(128<<d);aa[I-2]=F<<3;aa[I-1]=F>>>29;return aa}function B(x){var k="",F="",G,d;for(d=0;d<=3;d++){G=(x>>>(d*8))&255;F="0"+G.toString(16);k=k+F.substr(F.length-2,2)}return k}function J(k){k=k.replace(/rn/g,"n");var d="";for(var F=0;F<k.length;F++){var x=k.charCodeAt(F);if(x<128){d+=String.fromCharCode(x)}else{if((x>127)&&(x<2048)){d+=String.fromCharCode((x>>6)|192);d+=String.fromCharCode((x&63)|128)}else{d+=String.fromCharCode((x>>12)|224);d+=String.fromCharCode(((x>>6)&63)|128);d+=String.fromCharCode((x&63)|128)}}}return d}var C=Array();var P,h,E,v,g,Y,X,W,V;var S=7,Q=12,N=17,M=22;var A=5,z=9,y=14,w=20;var o=4,m=11,l=16,j=23;var U=6,T=10,R=15,O=21;s=J(s);C=e(s);Y=1732584193;X=4023233417;W=2562383102;V=271733878;for(P=0;P<C.length;P+=16){h=Y;E=X;v=W;g=V;Y=u(Y,X,W,V,C[P+0],S,3614090360);V=u(V,Y,X,W,C[P+1],Q,3905402710);W=u(W,V,Y,X,C[P+2],N,606105819);X=u(X,W,V,Y,C[P+3],M,3250441966);Y=u(Y,X,W,V,C[P+4],S,4118548399);V=u(V,Y,X,W,C[P+5],Q,1200080426);W=u(W,V,Y,X,C[P+6],N,2821735955);X=u(X,W,V,Y,C[P+7],M,4249261313);Y=u(Y,X,W,V,C[P+8],S,1770035416);V=u(V,Y,X,W,C[P+9],Q,2336552879);W=u(W,V,Y,X,C[P+10],N,4294925233);X=u(X,W,V,Y,C[P+11],M,2304563134);Y=u(Y,X,W,V,C[P+12],S,1804603682);V=u(V,Y,X,W,C[P+13],Q,4254626195);W=u(W,V,Y,X,C[P+14],N,2792965006);X=u(X,W,V,Y,C[P+15],M,1236535329);Y=f(Y,X,W,V,C[P+1],A,4129170786);V=f(V,Y,X,W,C[P+6],z,3225465664);W=f(W,V,Y,X,C[P+11],y,643717713);X=f(X,W,V,Y,C[P+0],w,3921069994);Y=f(Y,X,W,V,C[P+5],A,3593408605);V=f(V,Y,X,W,C[P+10],z,38016083);W=f(W,V,Y,X,C[P+15],y,3634488961);X=f(X,W,V,Y,C[P+4],w,3889429448);Y=f(Y,X,W,V,C[P+9],A,568446438);V=f(V,Y,X,W,C[P+14],z,3275163606);W=f(W,V,Y,X,C[P+3],y,4107603335);X=f(X,W,V,Y,C[P+8],w,1163531501);Y=f(Y,X,W,V,C[P+13],A,2850285829);V=f(V,Y,X,W,C[P+2],z,4243563512);W=f(W,V,Y,X,C[P+7],y,1735328473);X=f(X,W,V,Y,C[P+12],w,2368359562);Y=D(Y,X,W,V,C[P+5],o,4294588738);V=D(V,Y,X,W,C[P+8],m,2272392833);W=D(W,V,Y,X,C[P+11],l,1839030562);X=D(X,W,V,Y,C[P+14],j,4259657740);Y=D(Y,X,W,V,C[P+1],o,2763975236);V=D(V,Y,X,W,C[P+4],m,1272893353);W=D(W,V,Y,X,C[P+7],l,4139469664);X=D(X,W,V,Y,C[P+10],j,3200236656);Y=D(Y,X,W,V,C[P+13],o,681279174);V=D(V,Y,X,W,C[P+0],m,3936430074);W=D(W,V,Y,X,C[P+3],l,3572445317);X=D(X,W,V,Y,C[P+6],j,76029189);Y=D(Y,X,W,V,C[P+9],o,3654602809);V=D(V,Y,X,W,C[P+12],m,3873151461);W=D(W,V,Y,X,C[P+15],l,530742520);X=D(X,W,V,Y,C[P+2],j,3299628645);Y=t(Y,X,W,V,C[P+0],U,4096336452);V=t(V,Y,X,W,C[P+7],T,1126891415);W=t(W,V,Y,X,C[P+14],R,2878612391);X=t(X,W,V,Y,C[P+5],O,4237533241);Y=t(Y,X,W,V,C[P+12],U,1700485571);V=t(V,Y,X,W,C[P+3],T,2399980690);W=t(W,V,Y,X,C[P+10],R,4293915773);X=t(X,W,V,Y,C[P+1],O,2240044497);Y=t(Y,X,W,V,C[P+8],U,1873313359);V=t(V,Y,X,W,C[P+15],T,4264355552);W=t(W,V,Y,X,C[P+6],R,2734768916);X=t(X,W,V,Y,C[P+13],O,1309151649);Y=t(Y,X,W,V,C[P+4],U,4149444226);V=t(V,Y,X,W,C[P+11],T,3174756917);W=t(W,V,Y,X,C[P+2],R,718787259);X=t(X,W,V,Y,C[P+9],O,3951481745);Y=K(Y,h);X=K(X,E);W=K(W,v);V=K(V,g)}var i=B(Y)+B(X)+B(W)+B(V);return i.toLowerCase()};

  var size = size || 80;
  var default_image = "mp";


  return 'http://www.gravatar.com/avatar/' + MD5(email) + '.jpg?s=' + size + '&d=' + default_image;
}
```

To display:

```js
