<a id="top"></a>
# Reading Log

A log of my daily reading for web design and web development from April 2018 to present.

<!-- MarkdownTOC -->

* [January 2019](#january-2019)
* [October 2018](#october-2018)
* [September 2018](#september-2018)
* [August 2018](#august-2018)
* [June 2018](#june-2018)
* [May 2018](#may-2018)
* [April 2018](#april-2018)
* [In-Progress](#in-progress)

<!-- /MarkdownTOC -->

<a id="january-2019"></a>
## January 2019

**1/16**
* [keep a changelog](https://keepachangelog.com/en/1.0.0/)

**1/14**
* [Sass Techniques from the Trenches](https://css-tricks.com/sass-techniques-from-the-trenches/)

<a id="october-2018"></a>
## October 2018

**10/22**
* [Media Temple - The Different Logical Ways to Group CSS Properties](http://mediatemple.net/blog/tips/different-logical-ways-group-css-properties/)

<a id="september-2018"></a>
## September 2018

**9/12**
* [engage - Top 10 CSS Mixins](https://engageinteractive.co.uk/blog/top-10-scss-mixins)

**9/2**
* [Zack Leatherman - No @font-face Syntax will ever be Bulletproof -  Nor Should It Be](https://www.zachleat.com/web/retire-bulletproof-syntax/)

<a id="august-2018"></a>
## August 2018

**8/9**
* [WP Tavern - Gutenberg 1.8 Adds Greater Extensibility for Plugin Developers](https://wptavern.com/gutenberg-1-8-adds-greater-extensibility-for-plugin-developers)
    * Exciting: Plugin authors can explicitly declare Gutenberg incompatibility when registering meta boxes. This will trigger a warning to the end user, and WordPress will fallback to the classic editor!

<a id="june-2018"></a>
## June 2018

**6/18**
* Assorted questions
    * [Quora - In JavaScript is much better use ternary if instead of if/else?](https://www.quora.com/In-JavaScript-is-much-better-use-ternary-if-instead-of-if-else)

**6/12**
* [Henry Stanley - Becoming a dramatically better programmer](https://recurse.henrystanley.com/post/better/)
    * Notes [here](notes/notes-from-becoming-a-dramatically-better-programmer-6-12-18.md)
* [Azeria - The Importance of Deep Work & The 30-Hour Method for Learning a New Skill](https://azeria-labs.com/the-importance-of-deep-work-the-30-hour-method-for-learning-a-new-skill/)
    * Excellent article, and highly recommended read!

<a id="may-2018"></a>
## May 2018

**5/31**
* [webapplog - Top 10 ES6 Features Every Busy JavaScript Developer Must Know](https://webapplog.com/es6/)
* [Tom McFarlin - Does WordPress Hold You Back as a Developer, Really?](https://tommcfarlin.com/does-wordpress-hold-you-back/)
* [Tom McFarlin - Let the Code Review Process Stand on Its Own](https://tommcfarlin.com/code-review-process/)

**5/29**
* [How much JavaScript basic is required to jump into a framework like React?](https://www.quora.com/How-much-JavaScript-basic-is-required-to-jump-into-a-framework-like-React)

**5/23**
* [Daijiro Wachi - Cheers to a Node.js conference in Japan](https://medium.com/@watilde/cheers-to-a-node-js-conference-in-japan-b9e6e90acd46)
    * I Created [Commit Log Examples](notes/commit-log-examples.md), as a result of reading this
* [Daijiro Wachi - What's the one thing you would change on GitHub?](https://medium.com/@watilde/whats-the-one-thing-you-would-change-on-github-21693066196c)
* [Delicious Brains - GDPR For WordPress Developers: Announcing The (Free) Anonymization Addon](https://deliciousbrains.com/gdpr-local-development/)
    * Specific to WP Migrate DB - but otherwise great information, as well as a PHP snippet for complying with the EU's new GDPR legislation

**5/22**
* [Daijiro Wachi - dep: a little Node.js dependency installer](https://medium.com/@watilde/dep-a-little-node-js-dependency-installer-b8fead7596d3)
    * npm is overly complicated, relative to the amount of sub-commands people use on a daily basis
    * The end user is who makes a software with the modules and doesn’t make their own module to publish.
    * The end user does 3 things:
        * Install dependencies defined in package.json
        * Deploy an app to production with locked dependencies
        * Run test/build/release scripts defined in package.json
    * [dep.js](https://github.com/depjs/dep) only has the following 3 features:
        * Install the dependencies defined in a local package.json.
        * [WIP]Lock the dependencies installed in a local node_modules.
        * Run an arbitrary command from scripts in a local package.json.
* [Hacker Noon - It's OK to not use Yarn](BMtrSe{bZ;cH6zZ5]p'9L+Gh2&zn)
    * npm works fine offline:
        * `npm install` works just fine offline
        * `npm install some-package` updates `package.json` by default without appending `--save`
        * `npm install some-package` creates/updates `package-lock.json` by default
* [Kat Marchán - On the Design of Women’s Spaces](https://medium.com/@maybekatz/on-the-design-of-womens-spaces-72bf8f396dc0)
* [Kat Marchán - Kat’s Short Guide To JS Devops Ecosystem](https://medium.com/@maybekatz/kat-s-short-guide-to-js-devops-ecosystem-9ffef67fdb8e)
* [Kat Marchán - Introducing npx: an npm package runner](https://medium.com/@maybekatz/introducing-npx-an-npm-package-runner-55f7d4bd282b)
* [Jedi Saboteur - Creating a React App… From Scratch](https://blog.usejournal.com/creating-a-react-app-from-scratch-f3c693b84658?token=Y1V_ksk1Ow-IyWWo)
    * Outlines the basic directory structure of a React Project in an accessible manner.
* [IT Pro - Powershell Basics: Console Configuration](http://www.itprotoday.com/management-mobility/powershell-basics-console-configuration)
    * You can modify the console's appearance through its property settings. Click the PowerShell icon in the top-left corner of the console window and click Properties to open the Properties dialog box.

**5**
* [AirBnb - GitHub Issues - Why are underscore prefixes for internal methods of a React component considered bad?](https://github.com/airbnb/javascript/issues/1024)
    * Underscores give people a false sense of "private"ness that could lead to bugs.
    * Private means inaccessible. Your intent to privacy is irrelevant if the value is reachable, ie public.
    * The point of a private property is that you can trust private variables not to be changed by outside code.
    * Javascript **doesn't have private properties**
        * The logical thing to do is therefore to treat every property as a public property (because it is) - your code needs to assume that it can change at any time.

**5/16**
* [The Sass Way - Nested selectors: the inception rule](http://thesassway.com/beginner/the-inception-rule)
    * Avoid chaining yourself to the DOM - never nest selecters more than 4 layers deep!
    * Think about how the compiler will build your code.
        * Is the code it's generating really needed in your CSS?
        * Can it be achieved in less selectors?
    * Be creative: Is there a way to make the HTML code easier to work with CSS without adding extra classes?
        * If there is, and it doesn't affect semantics: Do it!
            - (ex: using adjacent selectors, targeting direct child elements, etc)
* [The Sass Way - How to structure a Sass project](http://thesassway.com/beginner/how-to-structure-a-sass-project)
    * See [notes here](notes/notes-from-structuring-sass-projects-article.md)
* [The Sass Way - Choosing great variable names](http://thesassway.com/beginner/variable-naming)
    * Name your variables semantically (ex: $brand-color, $accent-color)
        * Note: [naming variables modularly](https://webdesign.tutsplus.com/articles/quick-tip-name-your-sass-variables-modularly--webdesign-13364) (ex: $border-blue, $border-blue-light, $border-blue-lightest) may be a better solution.
            * Insightful comment from article: "CSS preprocessors don't teach bad code, but they DO often expose bad CSS authoring practices. Preprocessors are extremely convenient for design systems, where you would expect some style reuse. They're most beneficial when your design already has structure".
    * Keep all variables in a central `__config.scss` file that you `@import`.
        * Note: this can lead to variable stew (i.e. variables accross files) issues! Do this at your own discretion.
* [The Sass Way - Getting started with Sass and Compass](http://thesassway.com/beginner/getting-started-with-sass-and-compass)

**5/15**
* [WP Beginner - How to Create a Custom WordPress Widget](http://www.wpbeginner.com/wp-tutorials/how-to-create-a-custom-wordpress-widget/)
* [Sass Basics](https://sass-lang.com/guide)

**5/11**
* [Tobias Van Schneider - Why Are Our Portfolios Written in Third Person?](https://medium.com/@vanschneider/why-are-our-portfolios-written-in-third-person-71cbad1dd226)

**5/9**
* [Breaking Through The Vim Learning Curve](https://www.stridenyc.com/blog/breaking-through-the-vim-learning-curve)

**5/1**
* [freeCodeCamp - How to write your first React.js component - React’s function and class components, props, state, and event handlers](https://medium.freecodecamp.org/how-to-write-your-first-react-js-component-d728d759cabc)

Note: Progress between 5/1 and 5/9 was lost due to a laptop failure, and not having pushed to the remote branch in that time

<a id="april-2018"></a>
## April 2018

**4/26**
* [UX Movement - the Best Place for Error Messages on Forms](http://uxmovement.com/forms/the-best-place-for-error-messages-on-forms/)
    * Placing form validation error messages in the wrong location causes high cognitive load on user memory and results in more mistakes.
        * [Research Study 1](http://doc.rero.ch/record/304897/files/iwc24-0107.pdf): the distance between the erroneous field and error message influences the efficiency of error correction.
        * [Research Study 2](https://www.researchgate.net/publication/221054469_Online_Form_Validation_Don't_Show_Errors_Right_Away): displaying all error messages at the top of the form puts a high cognitive load on user memory. This forces users to recall each error message for each erroneous field.
    * For Western English speakers, placing validation errors to the right of the field is ideal, because it goes along with the natural flow of reading.
        * For mobile users with limited horizontal screen place, placing the error messages below the field is ideal
        * Left of Field and Top of Field are the worst choices, because they go against the natural flow of reading and rereading
* [Design For Hackers - Design Pitfalls: Kill Your Color Clashes](https://designforhackers.com/)
    * Combining colors is even more complex than combining fonts - using 4-5 colors in design schemes can get incredibly overwhelming
    * Combining complementary colors (on the color wheel) causes color clash, and makes text nearly unreadable.
    * Most Icons and App interfaces only make use of 1 color (along with either White or Black)
        * Spotify, Instagram, Twitter, Facebook, etc
    * Recommendation: pick one color and 1-2 shades of grey
* [Design For Hackers - Cool Your Column Soup](https://designforhackers.com/)
    * Point: "the grid system is an aid, not a guarantee."
    * You don't need to use all 12 columns
        * (My note: It is usually a bad idea to use all 12 columns, since it takes away margins/whitespace, and makes things vastly harder for users to read)
    * Don't get locked in the grid unnecessarily
* [Design For Hackers - Design Pitfalls: See through your "Nerd-Eye Blindness"](https://designforhackers.com/)
    * UI and UX design needs to come first, before planning technologies.
        * Technologies are a means to make your design happen
    * Instead of using a code first approach, get a comfortable chair, a bubbly drink, and a moleskin notebook, and close your eyes.
        * Really imagine what the experience could be like apart from all your technological constraints
            * This will result in fresher and more insightful solutions


<a id="42418"></a>
**4/24**
* [UX Movement - Why Users Make More Errors with Instant Inline Validation](http://uxmovement.com/forms/why-users-make-more-errors-with-instant-inline-validation/?ref=webdesignernews.com)
    * Point: using premature inline validation causes users to make more
    errors. Only use where appropriate
    * Comment: heard of ‘onBlur’? The field is validated once the user
    leaves it.

<a id="42318"></a>
**4/23**
* [freeCodeCamp - Useful tricks you might not know about git stash](https://medium.freecodecamp.org/useful-tricks-you-might-not-know-about-git-stash-e8a9490f0a1a)

<a id="42018"></a>
**4/20**
* [Design For Hackers - Design Pitfalls: Stop Your Size Stress](https://designforhackers.com/)
    * Reduce your worries about font size by exclusively using a 3:4 typographic scale
        * 5 7 9 12 16 21 28 37 50 67 89 119 159
            * Each font is approximately 75% the size of the larger font
            * For pixels: 12px, 16px, etc
            * For rems: 1.2rem, 1.6rem, etc

<a id="41918"></a>
**4/19**
* [Design For Hackers - Design Pitfalls: Eliminate Your Font Anxiety](https://designforhackers.com/)
    * Font Anxiety - you can waste immense time and mental resources trying to choose a single font
        * There is no design choice that has a higher stress-to-results ration than choosing fonts
    * Pairing Fonts adds unnecessary complexity and makes the problem even worse!
    * Recommendations:
        * Use one font per project
        * Have a small number of "go-to" fonts
            * Georgia for a sophisticated serif
            * Helvetica for a clean and neutral design
            * Lato for a friendly and "natural" look
            * Raleway for a more modern geometric look
        * Start worrying about other things, like font sizes, capitalization, bolds, and italics
            * [My note: italics are often a very bad idea for accessibility]

<br>

<a id="in-progress"></a>
# In-Progress
* [freeCodeCamp - These JavaScript methods will boost your skills in just a few minutes](https://medium.freecodecamp.org/7-javascript-methods-that-will-boost-your-skills-in-less-than-8-minutes-4cc4c3dca03f)
    * Added: `Spread` operator, and `for... of` iterator to my [Javascript Snippets](snippets/Javascript/js.md) file


[Back to Top](#top)
