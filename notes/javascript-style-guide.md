# Javascript Style Guide

## Official Style Guides

### Airbnb

[Airbnb - JavaScript Style Guide](https://github.com/airbnb/javascript)

#### Naming Conventions

* Avoid single letter names
* Use camelCase for objects, functions, and instances. eslint: `camelcase`
* Use PascalCase only when naming constructors or classes. eslint: `new-cap`
* Do not use trailing or leading underscores - *JavaScript does not have privacy*. eslint: `no-underscore-dangle`
* Don't save references to `this`. Use arrow functions or [Function#bind](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind)
* A base filename should exactly match the name of its default export. ex:


```js
// file 1 contents
class CheckBox {
  // ...
}
export default CheckBox;

// file 2 contents
export default function fortyTwo() { return 42; }

// file 3 contents
export default function insideDirectory() {}

// good
import CheckBox from './CheckBox'; // PascalCase export/import/filename
import fortyTwo from './fortyTwo'; // camelCase export/import/filename
import insideDirectory from './insideDirectory'; // camelCase export/import/directory name/implicit "index"
// ^ supports both insideDirectory.js and insideDirectory/index.js
```

* Use camelCase when you export-default a function. Your filename should be identical to your function's name
* Use PascalCase when you export a constructor / class / singleton / function library / bare object
* Acronyms and initialisms should always be all capitalized, or all lowercased - *names are for readability, not to appease a compiler*. ex:

```js
// good
import SMSContainer from './containers/SMSContainer';

// good
const HTTPRequests = [
  // ...
];

// best
import TextMessageContainer from './containers/TextMessageContainer';

// best
const requests = [
  // ...
];
// ^ not sure if I agree with the "best" examples

```

* You may optionally uppercase a constant only if it (1) is exported, (2) is a const (it can not be reassigned), and (3) the programmer can trust it (and its nested properties) to never change.
    * See [Airbnb Javascript Naming Conventions - 23.10](https://github.com/airbnb/javascript#naming--uppercase). I'm not sure I see the point in doing this

#### Other Notes:

* CAPITAL_CASE_WITH_UNDERSCORES for constants
    * I prefer this over Airbnb.
    * Have also seen CAPITALCASEFORCONSTS
* SelectUserRolesViewModel and SelectRoleEditorViewModel are confusing. SelectUserRoles_ViewModel and SelectRole_EditorViewModel are not. So, why not mix where appropriate?
* I find that if I'm constantly typing the same words in a name it's probably because they need to be grouped together in an object... ie: viewModel.selectUserRoles, viewModel.selectRoleEditor
<br> JavaScript is made of objects... use them.
