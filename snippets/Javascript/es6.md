# ES6 Notes

From: [webapplog - 
Top 10 ES6 Features Every Busy JavaScript Developer Must Know](https://webapplog.com/es6/)

<!-- MarkdownTOC -->

* [1. Default Paramaeters](#1-default-paramaeters)
* [2. Template Literals](#2-template-literals)
* [3. Multiline Strings](#3-multiline-strings)
* [4. Destructuring Assignments](#4-destructuring-assignments)
* [5. Enhanced Object Literals in ES6](#5-enhanced-object-literals-in-es6)
* [6. Arrow Functions](#6-arrow-functions)
* [7. Promises](#7-promises)
* [8. Block-Scoped Constructs Let and Const](#8-block-scoped-constructs-let-and-const)
    * [let](#let)
    * [const](#const)
* [9. Classes in ES6](#9-classes-in-es6)
* [10. Modules in ES6](#10-modules-in-es6)
* [Other Notewory Features](#other-notewory-features)
* [Additional Resources](#additional-resources)

<!-- /MarkdownTOC -->

<a id="1-default-paramaeters"></a>
## 1. Default Paramaeters

```js
var link = function(height = 50, color = 'red', url = 'http://azat.co') {
  ...
}
```

<a id="2-template-literals"></a>
## 2. Template Literals

```js
var name = `Your name is ${first} ${last}.`
var url = `http://localhost:3000/api/messages/${id}`
```

<a id="3-multiline-strings"></a>
## 3. Multiline Strings

Simply utilize single backticks - no need for multiple split lines w/ plus signs!

```js
var roadPoem = `Then took the other, as just as fair,
    And having perhaps the better claim
    Because it was grassy and wanted wear,
    Though as for that the passing there
    Had worn them really about the same,`

var fourAgreements = `You have the right to be you.
    You can only be you when you do your best.`
```

<a id="4-destructuring-assignments"></a>
## 4. Destructuring Assignments

Note: Read up on [destructuring assignments](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment) in order to understand this code

Old:
```js
// Example 1
var data = $('body').data(), // data has properties house and mouse
  house = data.house,
  mouse = data.mouse

//Example 2
var jsonMiddleware = require('body-parser').json

var body = req.body, // body has username and password
  username = body.username,
  password = body.password  
```

New: 
```js
// Combined Solution
var {house, mouse} = $('body').data() // we'll get house and mouse variables

var {json: jsonMiddleware} = require('body-parser')

var {username, password} = req.body
```

Can also be used with arrays:
```js
// Unclear to me what this code is doing/addressing - likely due to temporary sleep deprivation
var [col1, col2]  = $('.column'),
  [line1, line2, line3, , line5] = file.split('\n')
```

<a id="5-enhanced-object-literals-in-es6"></a>
## 5. Enhanced Object Literals in ES6

Come back to this later

<a id="6-arrow-functions"></a>
## 6. Arrow Functions

**Example 1**

Old:
```js
var _this = this
ES5: 
$('.btn').click(function(event){
  _this.sendData()
})
```

ES6:
```js
$('.btn').click((event) =>{
  this.sendData()
})
```

**Example 2**

ES5:
```js
var logUpperCase = function() {
  var _this = this

  this.string = this.string.toUpperCase()
  return function () {
    return console.log(_this.string)
  }
}

logUpperCase.call({ string: 'es6 rocks' })()
```

ES6:
```js
var logUpperCase = function() {
  this.string = this.string.toUpperCase()
  return () => console.log(this.string)
}

logUpperCase.call({ string: 'es6 rocks' })()
```

Note: you can mix and match old `function` with => in ES6 as you see fit. And when an arrow function is used with one line statement, it becomes an expression, i.e,. it will implicitly return the result of that single statement. If you have more than one line, then you’ll need to use `return` explicitly.

**Example 3**

ES5:
```js
var ids = ['5632953c4e345e145fdf2df8','563295464e345e145fdf2df9']
var messages = ids.map(function (value) {
  return "ID is " + value // explicit return
})
```

ES6:
```js
var ids = ['5632953c4e345e145fdf2df8','563295464e345e145fdf2df9']
var messages = ids.map(value => `ID is ${value}`) // implicit return
// Note the use of the template literal ${value} above
```

**Example 4**

Note: parantheses () are optional for single params in an arrow function signature. You need them when you use more than one param

ES5:
```js
var ids = ['5632953c4e345e145fdf2df8', '563295464e345e145fdf2df9'];
var messages = ids.map(function (value, index, list) {
  return 'ID of ' + index + ' element is ' + value + ' ' // explicit return
})
```

ES6:
```var ids = ['5632953c4e345e145fdf2df8','563295464e345e145fdf2df9']
var messages = ids.map((value, index, list) => `ID of ${index} element is ${value} `) // implicit return
```

<a id="7-promises"></a>
## 7. Promises

Regular Callbacks:
```js
setTimeout(function(){
  console.log('Yay!')
  setTimeout(function(){
    console.log('Wheeyee!')
  }, 1000)
}, 1000)
```

Promises:
Author suggests [Introduction to ES6 Promises – The Four Functions You Need To Avoid Callback Hell](http://jamesknelson.com/grokking-es6-promises-the-four-functions-you-need-to-avoid-callback-hell/) for further reading

```js
var wait1000 =  ()=> new Promise((resolve, reject)=> {setTimeout(resolve, 1000)})

wait1000()
  .then(function() {
    console.log('Yay!')
    return wait1000()
  })
  .then(function() {
    console.log('Wheeyee!')
  })
```

<a id="8-block-scoped-constructs-let-and-const"></a>
## 8. Block-Scoped Constructs Let and Const

<a id="let"></a>
### let

* `let` is a new var which allows you to scope the variable to the blocks 
* Blocks are defined by curly braces

<br> 

In ES5, the blocks did NOTHING to the vars:
```js
function calculateTotalAmount (vip) {
  var amount = 0
  if (vip) {
    var amount = 1
  }
  { // more crazy blocks!
    var amount = 100
    {
      var amount = 1000
      }
  }  
  return amount
}

console.log(calculateTotalAmount(true))

/* Results in 1000. Wow! That's a really bad bug
```

ES6:
```js
function calculateTotalAmount (vip) {
  var amount = 0 // probably should also be let, but you can mix var and let
  if (vip) {
    let amount = 1 // first amount is still 0
  } 
  { // more crazy blocks!
    let amount = 100 // first amount is still 0
    {
      let amount = 1000 // first amount is still 0
      }
  }  
  return amount
}

console.log(calculateTotalAmount(true))
```

Note: all of the `amount` vars are particular to the specific block (defined by parens and indicated by indentation) they're in!

<a id="const"></a>
### const
* block scoped and immutable

```js
function calculateTotalAmount (vip) {
  const amount = 0  
  if (vip) {
    const amount = 1 
  } 
  { // more crazy blocks!
    const amount = 100 
    {
      const amount = 1000
      }
  }  
  return amount
}

console.log(calculateTotalAmount(true))
```

All of the above are okay because they belong to different blocks.

<br>

As the author notes: `let` and `const` result in multiple bad behavior scenarios to consider. Use carefully!

<a id="9-classes-in-es6"></a>
## 9. Classes in ES6

ES6 Class uses proptoyptes, not the function factory approach. We have a class `baseModel` in which we can define a `constructor` and a `getName()` method

```js
class baseModel {
  // note the use of the default parameter values
  constructor(options = {}, data = []) { // class constructor
    this.name = 'Base'
    this.url = 'http://azat.co/api'
    this.data = data
    this.options = options
  }

    getName() { // class method
      console.log(`Class name: ${this.name}`)
    }
}
```

Note:
* Method names don't need to have the word `function` or the colon (:) anymore
* You can't assign properties `this.NAME` the same way as methods
    * i.e. you can't say `name` at the same indentation level as a method.
* To set the value of a property, simply assign a value in the constructor. (see next example)

The `AccountModel` inherits from `baseModel` with `class NAME extends PARENT_NAME`:

```js
class AccountModel extends baseModel {
  constructor(options, data) {
    super({private: true}, ['32113123123', '524214691']) //call the parent method with super
     this.name = 'Account Model'
     this.url +='/accounts/'
   }
  
  // Adding in a getter - meaning accountsData will be a property
  get accountsData() { //calculated attribute getter
    // ... make XHR
    return this.data
  }
}

// then...
let accounts = new AccountModel(5)
accounts.getName()
console.log('Data is %s', accounts.accountsData)

/* Outputs:
  Class name: Account Model
  Data is %s 32113123123,524214691
*/
```

<a id="10-modules-in-es6"></a>
## 10. Modules in ES6

Prior to ES6 there was no native modules support. People came up with AMD, RequireJS, CommonJS, etc. In ES6 you use `import` and `export` operands. In ES5 you'd use `<script>` tags w/ an IIFE (immediately-invoked function expression) or some library like AMD.

Note from author: I am a Node.js guy, so I’ll use CommonJS which is also a Node.js syntax. It’s straightforward to use CommonJS on the browser with the Browserify bunder. Let’s say we have `port` variable and `getAccounts` method in ES5 `module.js`:

```js
module.exports = {
  port: 3000,
  getAccounts: function() {
    ...
  }
}
```

In ES5 Node.js syntax:
```js
var service = require('module.js')
console.log(service.port) // 3000
```

In ES6 syntax:
```js
// main.js
import {port, getAccounts} from 'module'
console.log(port) // 3000

// or import the entire module as a variable called "server"
import * as service from 'module'
console.log(service.port) // 3000
```

Author notes: Personally, I find the ES6 modules confusing. Yes, they are more eloquent, but Node.js modules won’t change anytime soon. It’s better to have only one style for browser and server JavaScript, so I’ll stick with CommonJS/Node.js style for now.

The support for ES6 modules in the browsers are not coming anytime soon (as of this writing), so you’ll need something like jspm to use ES6 modules.

For additional reading: [Exploring ES6 - Ch 16. Modules](http://exploringjs.com/es6/ch_modules.html) by Dr. Axel Rauschmayer (free html book - paid PDF, EPUB, and MOBI versions available)

<a id="other-notewory-features"></a>
# Other Notewory Features

* New Math, Number, String, Array and Object methods
* Binary and octal number types
* Default rest spread
* For of comprehensions (hello again mighty CoffeeScript!)
* Symbols
* Tail calls
* Generators
* New data structures like Map and Set* 

<a id="additional-resources"></a>
# Additional Resources

1. [ES6 Cheatsheet (Free PDF)](https://github.com/azat-co/cheatsheets/tree/master/es6)
2. [Exploring ES6 - Ch 16. Modules](http://exploringjs.com/es6/ch_modules.html)
3. [Understanding ECMAScript 6 by Nicolas Zakas (book)](https://leanpub.com/understandinges6)
4. [ES6 at Node University (paid online course)](https://node.university/p/es6)
5. [ES7 and ES8 at Node University (paid online course)](https://node.university/p/es7-es8)
