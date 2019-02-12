# PHP Documentation Standards

Source: [Make WordPress Core - PHP Documentation Standards](https://make.wordpress.org/core/handbook/best-practices/inline-documentation-standards/php/)

## What Should Be Documented?
* Functions and class methods
* Classes
* Class members (including properties and constants)
* Requires and includes
* Hooks (actions and filters)
* Inline comments
* File headers
* Constants

## Language

### Summaries
* Should be clear, simple, and brief.
    * Avoid describing "why" an element exists
    * Focus on the "what" and "when"
* Use 3rd-person language to describe a function, hook, class, or method

#### Examples
* Functions:
    * Good: "Displays the last modifed date for a post"
    * Bad: "Display the date on which the post was last modified"
* Filters
    * Good: "Filters the post content "
    * Bad: "Lets you edit the post content that is outpust in the post template"
* Actions
    * Good: "Fires after most of core is loaded, and user is authenticated"
    Bad: "Allows you to register custom post types, custom taxonomies, and other general hosuekeeping tasks after a lot of WordPress core has loaded"

### Grammar
* Descriptive elements should be written as complete sentences.
    * Exception: file header summaries, which are intended as file "titles" more than sentences.
    * Oxford comma should be used when listing elements in summaries, descriptions, and parameter or return descriptions

### Miscellaneous
* See [PHP Developer Handbook - PHP Documentation Standards - Miscellaneous ](https://make.wordpress.org/core/handbook/best-practices/inline-documentation-standards/php/#miscellaneous)

## Formatting Guidelines

### General
* Docblocks directly precede the hook, action, function, method or class lin.
    * No opening/closing tags or other parser-confusing items

### Summary (formerly Short Description)
* No HTML markup or Markdown of any kind should be used here
    * If the text refers to an HTML element or tag, then it should be written as "image tag" or "img" element, not "<img>"
* Good: Fires when printing the link tag in header
* Bad: Fires when printing the <link> tag in the header
* Inline PHPDoc tags may be used.

### Description (formerly Long Description)
* HTML markup should never be used outside of code examples
    * Markdown can be used, as needed, in the description.

1. Lists:

Use a hypen (-) to create an unordered list, with a blank line before and after

```php
* Description which includes an unordered list:
*
* - This is item 1.
* - This is item 2.
* - This is item 3.
*
* The description continues on ...
```

Use numbers to create an ordered list, with a blank line before and after.

```php
* Description which includes an ordered list:
*
* 1. This is item 1.
* 2. This is item 2.
* 3. This is item 3.
*
* The description continues on ...
###@since Section (Changelogs)
```

2. Code samples would be created by indenting every line of the code by 4 spaces, with a blank line before and after
    * Blank linkes in code samples also need to be indented by four spaces
    * Examples added this way will output in `<pre>` tags and not syntax-highlighted

```php
* Description including a code sample:
*
*    $status = array(
*        'draft'   => __( 'Draft' ),
*        'pending' => __( 'Pending Review' ),
*        'private' => __( 'Private' ),
*        'publish' => __( 'Published' )
*    );
*
* The description continues on ...
```

3. Links in the form of URLs should be added in the appropriate place in the DoBlock unsing the @link tag

```php
* Description text.
*
* @link https://core.trac.wordpress.org/ticket/20000
*
```
4. `@since Section` (Changelogs)
    Every function, hook, class, and method should have a corresponding `@since` version associated with it

* No HTML
* Limited Markdown ok as necessary.
    ex: backticks around variables, arguments, or parameter names
* Versions should be expressed in the 3-digit x.x.x style:

```php
* @since 4.4.0
```
If significant changes have been made to a function, hook, class, or method, additional `@since` tags, versions, and descriptions should be added to provide a changelog for that function.

Significant Changes include, but are not limited to:
* Adding new arguments or parameters
* Required arguments becoming optional
* Changing default/expected behaviors
* Functions or methods becoming wrappers for new APIs

PHPDoc supports multiple `@since` versions in DocBlocks for this reason.
* When adding changelog entries to the @since block, a version should be cited, and a description should be added in sentence case and form, and end with a period:

```php
* @since 3.0.0
* @since 3.8.0 Added the `post_in` argument.
* @since 4.1.0 The `#force` parameter is now optional
```

### Other Descriptions

* `@param`, `@type`, `@return`: no HTML should be used in the descriptions for these tags.
    * Limited Markdown may be used as necessary.
* Inline `@see` tags, can also be used to auto-link hooks in core. Examples:
    * Hooks: {`@see` 'save_post'}
    * Dynamic hooks: {`@see` '$old_status_to_$new_status'} (Note that any extra curly braces have been removed inside the quotes)
* Default or available values should use single quotes ex `draft.`
    * Translatable strings should be identified as such in the description
* HTML elements and tags should be written as "audio element" or "link tag"

### Line wrapping
* DocBlock text should wrap to the next line after 80 characters
    * If the DocBlock itself is indented on the left 20 character position, the wrap could occur as position 100, but should not extend beyond a total of 120 characters wide.

## Functions & Class Methods
Functions and class methods should be formatted as follows:

* **Summary:** A brief, one sentence explanation of the purpose of the function spanning a maximum of two lines. Use a period at the end.
* **Description:** A supplement to the summary, providing a more detailed description. Use a period at the end of sentences.
* **@ignore:** Used when an element is meant only for internal use and should be skipped from parsing.
* **@since x.x.x:** Should always be 3-digit (e.g. @since 3.9.0). Exception is @since MU (3.0.0).
* **@access:** Only used for core-only functions or classes implementing “private” core APIs. If the element is private it will be output with a message stating its intention for internal use.
* **@see:** Reference to a function, method, or class that is heavily-relied on within. See the note above about inline @see tags for expected formatting.
* **@link:** URL that provides more information. This should never been used to reference another function, hook, class, or method, see @see.
* **@global:** List PHP globals that are used within the function or method, with an optional description of the global. If multiple globals are listed, they should be aligned by type, variable, and description, with each other as a group.
* **@param:** Note if the parameter is Optional before the description, and include a period at the end. The description should mention accepted values as well as the default. For example: Optional. This value does something. Accepts ‘post’, ‘term’, or empty. Default empty.
* **@return:** Should contain all possible return types, and a description for each. Use a period at the end. Note: @return void should not be used outside of the default bundled themes.

```php
/**
 * Summary.
 *
 * Description.
 *
 * @since x.x.x
 *
 * @see Function/method/class relied upon
 * @link URL
 * @global  type $varname Description.
 *
 * @param  type $var Description.
 * @param  type $var Optional. Description. Default.
 * @return type Description.
 */
```

### 1.1 Parameters That Are Arrays
* Should be documented in the "originating" function only, and cross-references via an @see tag in corresponding DocBlocks.
* Array values should be documented using WordPress' flavor of hash notation style similar to how Hooks can be documented, each array value beginning with the @type tag, and taking the form of:

```php
*    @type type $key Description. Default 'value'. Accepts 'value', 'value'.
*                    (aligned with Description, if wraps to a new line)
```

An example of an "originating" function and re-use of an argument array is [wp_remote_reqest|post|get|head().](https://core.trac.wordpress.org/browser/branches/4.0/src/wp-includes/http.php#L115).

```php
/**
 * Summary.
 *
 * Description.
 *
 * @since  x.x.x.
 *
 * @param type $var Description.
 * @param array $args {
 *     Optional. An array of arguments.
 *
 *     @type type $key Description. Default 'value'. Accepts 'value', 'value'.
 *                     (aligned with Description, if wraps toa  new line)
 *     @type type $key Description.
 * }
 * @param type $var Description.
 * @return type Description.
 */

```

* In most cases, there's no need to mark individual arguments in hash notation as optional (as arrays are usually optional).
    * Specifying "Optional." in the hash notation description should suffice.
    * If an array is NOT optional, individual key/value pairs may be options and should be marked as such as necessary.

#### 1.2 Deprecated Functions
* Deprecated functions should include `@deprecated` tag, version, and description of what to use instead (via an `@see` tag).

```php
/**
 * Summary.
 *
 * Description.
 *
 * @since x.x.x
 * @deprecated x.x.x Use new_function_name()
 * @see new_function_name()
 *
 * @param type $var Optional. Description.
 * @param type $var Description.
 * @return type Description.
 */
```

### 2. Classes
class DocBlocks should be formatted as follows:

* **Summary:** one sentence explanation of the purpose fo the class. Max-length: two lines. Use a period at the end
* **Description:** More detailed supplement. Use a period at the end
* **since x.x.x:** should always be 3-digit (ex `@since 3.9.0`).
    * Exception: `@since MU (3.0.0)`.

```php
/**
 * Summary.
 *
 * Description.
 *
 * @since x.x.x
 */
```

If documenting a sub-class, it's also helpful to include an `@see` tag reference to the super class:

```php
/**
 * Summary.
 *
 * Description.
 *
 * @since x.x.x
 *
 * @see Super_Class
 */
```


#### 2.1 Class Members


### 3. Requires and Includes


### 4. Hooks (Actions and Filters)


#### 4.1 Duplicate Hooks


### 5. Inline Comments


### 5.1 Single line comments


#### 5.2 Multi-line comments


### 6. File Headers


### 7. Constants


## PHPDoc Tags
List of PHP Doc Tags

### Table
<table>
<tbody>
<tr>
<th style="width: 10%">Tag</th>
<th style="width: 20%">Usage</th>
<th style="width: 70%">Description</th>
</tr>
<tr>
<td><strong>@access</strong></td>
<td>private</td>
<td>Only used in limited circumstances, and only when private, such as for core-only functions or core classes implementing “private” APIs. Used directly below the <strong>@since</strong> line in block.</td>
</tr>
<tr>
<td><strong>@deprecated</strong></td>
<td>version x.x.x<br>
replacement function name</td>
<td>What version of WordPress the function/method was deprecated. Use 3-digit version number. Should be accompanied by a matching <code>@see</code> tag.</td>
</tr>
<tr>
<td><strong>@global</strong></td>
<td>type global<br>
$varname<br>
description</td>
<td>Document global(s) used in the function/method. For boolean and integer types, use <code>bool</code> and <code>int</code>, respectively.</td>
</tr>
<tr>
<td><strong>@internal</strong></td>
<td>information string</td>
<td>Typically used for adding notes for internal use only.</td>
</tr>
<tr>
<td><strong>@ignore</strong></td>
<td>(standalone)</td>
<td>Used to skip parsing of the entire element.</td>
</tr>
<tr>
<td><strong>@link</strong></td>
<td>URL</td>
<td>Link to additional information for the function/method.<br>
For an external script/library, links to source.<br>
Not to be used for related functions/methods; use <strong>@see</strong> instead.</td>
</tr>
<tr>
<td><strong>@method</strong></td>
<td>returntype<br>
description</td>
<td>Shows a “magic” method found inside the class.</td>
</tr>
<tr>
<td><strong>@package</strong></td>
<td>packagename</td>
<td>Specifies package that all functions, includes, and defines in the file belong to. Found in DocBlock at top of the file. For core (and bundled themes), this is always <strong>WordPress</strong>.</td>
</tr>
<tr>
<td><strong>@param</strong></td>
<td>datatype $variable<br>
description</td>
<td>Function/method parameter of the format: parameter type, variable name, description, default behavior. For boolean and integer types, use <code>bool</code> and <code>int</code>, respectively.</td>
</tr>
<tr>
<td><strong>@return</strong></td>
<td>datatype description</td>
<td>Document the return value of functions or methods. <code>@return void</code> should not be used outside of the default bundled themes. For boolean and integer types, use <code>bool</code> and <code>int</code>, respectively.</td>
</tr>
<tr>
<td><strong>@see</strong></td>
<td>elementname</td>
<td>References another function/method/class the function/method relies on. Should only be used inline for “linking” hooks.</td>
</tr>
<tr>
<td><strong>@since</strong></td>
<td>version x.x.x</td>
<td>Documents release version function/method was added. Use 3-digit version number – this is to aid with version searches, and for use when comparing versions in code. Exception is <code>@since MU (3.0.0)</code>.</td>
</tr>
<tr>
<td><strong>@static</strong></td>
<td>(standalone)</td>
<td>Note: This tag has been used in the past, but should no longer be used.<br>
Just using the static keyword in your code is enough for PhpDocumentor on PHP5 to recognize static variables and methods, and PhpDocumentor will mark them as static.</td>
</tr>
<tr>
<td><strong>@subpackage</strong></td>
<td>subpackagename</td>
<td>For page-level DocBlock, specifies the Component that all functions and defines in file belong to. For class-level DocBlock, specifies the subpackage/component the class belongs to.</td>
</tr>
<tr>
<td><strong>@todo</strong></td>
<td>information string</td>
<td>Documents planned changes to an element that have not been implemented.</td>
</tr>
<tr>
<td><strong>@type</strong></td>
<td>datatype description for an argument array value</td>
<td>Used to denote argument array value types. See the <strong>Hooks</strong> or <strong>Parameters That Are Arrays</strong> sections for example syntax.</td>
</tr>
<tr>
<td><strong>@uses</strong></td>
<td>class::methodname()<br>
class::$variablename<br>
functionname()</td>
<td><strong>Note:</strong> This tag has been used in the past, but should no longer be used.<br>
References a key function/method used. May include a short description.</td>
</tr>
<tr>
<td><strong>@var</strong></td>
<td>datatype description</td>
<td>Data type for a class variable and short description. Callbacks are marked <strong>callback</strong>.</td>
</tr>
</tbody>
</table>

### List - No Descriptions

```php
@access
@since
@deprecated
@see
@global
@internal
@ignore
@link
@see
@method
@package
@param
@return
@return
@see
@since
@since
@static
@subpackage
@todo
@type
@uses
@var
```
### Deprecated Tags

### Other Tags
* `@author`: not used in Core, except for maintaining it in external libraries.
* `@copyright` and `@license`: used in external libraries and scripts. Should not be used in Core.
    * `@copyright`: used to specify external script copyrights.
    * `@license`: used to specify external script licenses.

## Resources
