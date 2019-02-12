# Javascript Documentation Standards

Source: https://make.wordpress.org/core/handbook/best-practices/inline-documentation-standards/javascript/

## Example - Partial List

```php
/**
 * Summary. (use period)
 *
 * Description. (use period)
 *
 * @since      x.x.x
 * @deprecated x.x.x Use new_function_name() instead.
 * @access     private
 *
 * @class
 * @augments parent
 * @mixes    mixin
 *
 * @alias    realName
 * @memberof namespace
 *
 * @see  Function/class relied on
 * @link URL
 * @global
 *
 * @fires   eventName
 * @fires   className#eventName
 * @listens event:eventName
 * @listens className~event:eventName
 *
 * @param {type}   var           Description.
 * @param {type}   [var]         Description of optional variable.
 * @param {type}   [var=default] Description of optional variable with default variable.
 * @param {Object} objectVar     Description.
 * @param {type}   objectVar.key Description of a key in the objectVar parameter.
 *
 * @return {type} Description.
 */
```

## Full List with Descriptions

|               |                               |
|-------------- |-------------------------------|
| @abstract     | This method can be implemented (or overridden) by the inheritor.  |
| @access       | Specify the access level of this member (private, public, or protected).  |
| @alias        | Treat a member as if it had a different name.  |
| @augments     | This class inherits from a parent class.  |
| @author       | Identify the author of an item.  |
| @borrows      | This object uses something from another object.  |
| @callback     | Document a callback function.  |
| @class        | This function is a class constructor.  |
| @classdesc    | Use the following text to describe the entire class.  |
| @constant     | Document an object as a constant.  |
| @constructs   | This function member will be the constructor for the previous class.  |
| @copyright    | Document some copyright information.  |
| @default      | Document the default value.  |
| @deprecated   | Document that this is no longer the preferred way.  |
| @description  | Describe a symbol.  |
| @enum         | Document a collection of related properties.  |
| @event        | Document an event.  |
| @example      | Provide an example of how to use a documented item.  |
| @exports      | Identify the member that is exported by a JavaScript module.  |
| @external     | Document an external class/namespace/module.  |
| @file         | Describe a file.  |
| @fires        | Describe the events this method may fire.  |
| @function     | Describe a function or method.  |
| @global       | Document a global object.  |
| @ignore       | [todo] Remove this from the final output.  |
| @inner        | Document an inner object.  |
| @instance     | Document an instance member.  |
| @kind         | What kind of symbol is this?  |
| @lends        | Document properties on an object literal as if they belonged to a symbol with a given name.  |
| @license      | [todo] Document the software license that applies to this code.  |
| @link         | Inline tag – create a link.  |
| @member       | Document a member.  |
| @memberof     | This symbol belongs to a parent symbol.  |
| @mixes        | This object mixes in all the members from another object.  |
| @mixin        | Document a mixin object.  |
| @module       | Document a JavaScript module.  |
| @name         | Document the name of an object.  |
| @namespace    |  Document a namespace object.  |
| @param        |  Document the parameter to a function.  |
| @private      |  This symbol is meant to be private.  |
| @property     |  Document a property of an object.  |
| @protected    |  This member is meant to be protected.  |
| @public       |  This symbol is meant to be public.  |
| @readonly     |  This symbol is meant to be read-only.  |
| @requires     |  This file requires a JavaScript module.  |
| @return       |  Document the return value of a function.  |
| @see          |  Refer to some other documentation for more information.  |
| @since        |  When was this feature added?  |
| @static       |  Document a static member.  |
| @this         |  What does the ‘this’ keyword refer to here?  |
| @throws       |  Describe what errors could be thrown.  |
| @todo         |  Document tasks to be completed.  |
| @tutorial     |  Insert a link to an included tutorial file.  |
| @type         |  Document the type of an object.  |
| @typedef      |  Document a custom type.  |
| @variation    |  Distinguish different objects with the same name.  |
| @version      |  Documents the version number of an item.
