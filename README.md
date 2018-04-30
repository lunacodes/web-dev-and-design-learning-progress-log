A progress log of my daily web design and development learning and growth. Also contains useful tools and resources.

# Table of Contents

<!-- MarkdownTOC -->

* [Reading Log](#reading-log)
    * [April 2018](#april-2018)
* [Tutorials Log](#tutorials-log)
    * [April 2018](#april-2018-1)
* [Tools & Resources](#tools--resources)
    * [Tools](#tools)
        * [Git & Github](#git--github)
        * [Sublime Text](#sublime-text)
    * [Resources](#resources)
        * [Documentation](#documentation)
        * [Design](#design)
            * [Icons](#icons)
        * [DOM](#dom)
        * [Markdown](#markdown)
* [Techniques & Best Practices](#techniques--best-practices)
    * [Form Design](#form-design)
    * [Typography](#typography)
        * [Font Choices](#font-choices)
            * [Short List \(Web Only\)](#short-list-web-only)
            * [Extended List \(Grouped By Letter Structure\)](#extended-list-grouped-by-letter-structure)
        * [Font Sizes](#font-sizes)

<!-- /MarkdownTOC -->

<a id="reading-log"></a>
# Reading Log

<a id="april-2018"></a>
## April 2018

**4/26/18**
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
**4/24/18**
* [UX Movement - Why Users Make More Errors with Instant Inline Validation](http://uxmovement.com/forms/why-users-make-more-errors-with-instant-inline-validation/?ref=webdesignernews.com) 
    * Point: using premature inline validation causes users to make more 
    errors. Only use where appropriate
    * Comment: heard of ‘onBlur’? The field is validated once the user 
    leaves it.

<a id="42318"></a>
**4/23/18**
* [freeCodeCamp - Useful tricks you might not know about git stash](https://medium.freecodecamp.org/useful-tricks-you-might-not-know-about-git-stash-e8a9490f0a1a)

<a id="42018"></a>
**4/20/18**
* [Design For Hackers - Design Pitfalls: Stop Your Size Stress](https://designforhackers.com/)
    * Reduce your worries about font size by exclusively using a 3:4 typographic scale
        * 5 7 9 12 16 21 28 37 50 67 89 119 159
            * Each font is approximately 75% the size of the larger font
            * For pixels: 12px, 16px, etc
            * For rems: 1.2rem, 1.6rem, etc

<a id="41918"></a>
**4/19/18**
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

<a id="tutorials-log"></a>
# Tutorials Log

<a id="april-2018-1"></a>
## April 2018
**4/30/18**
* [Tutorial: Intro to React](https://reactjs.org/tutorial/tutorial.html#functional-components)

<a id="42518"></a>
**4/25/18**
* [Drawing with CSS - part 1: box shadows](https://trueskawka.github.io/blog/programming/2018/02/07/drawing-with-CSS-part-1-box-shadows.html) by Alicja Raszkowska 

<a id="tools--resources"></a>
# Tools & Resources

<a id="tools"></a>
## Tools

<a id="git--github"></a>
### Git & Github
* [Git Tips](https://github.com/git-tips/tips): The most commonly used git tips and tricks.
* [GitHub Help](https://help.github.com/categories/writing-on-github/): Writing on GitHub

<a id="sublime-text"></a>
### Sublime Text
* [MultiMarkdown Syntax](https://github.com/SublimeText-Markdown/MarkdownEditing): Syntax highlighting supports Standard Markdown, GitHub flavored Markdown, MultiMarkdown
* [MarkdownTOC](https://github.com/naokazuterada/MarkdownTOC): Autogenerate a Table of Contents - can autogenerate anchor links as well

<a id="resources"></a>
## Resources

<a id="documentation"></a>
### Documentation
* [DevDocs.io](https://devdocs.io): the number one goto resource for 
Documentation in any language - absolutely essential

<a id="design"></a>
### Design

<a id="icons"></a>
#### Icons
* [Font Awesome](https://fontawesome.com/)
* [Glyphicons](http://glyphicons.com/)

<a id="dom"></a>
### DOM
* [onBlur attribute](https://devdocs.io/dom/globaleventhandlers/onblur): behavior when user leaves a field/element

<a id="markdown"></a>
### Markdown
* [Adam P - Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet): extremely useful Markdown cheatsheet
* [Daring Fireball - Markdown](https://daringfireball.net/projects/markdown/): the original Markdown spec by creator John Guber

<a id="techniques--best-practices"></a>
# Techniques & Best Practices

<a id="form-design"></a>
## Form Design
* Inline error validation for username and passwords
    * Premature inline validation causes more user errors and frustrations
* onBlur for post-field validation

<a id="typography"></a>
## Typography

<a id="font-choices"></a>
### Font Choices
* Only use a small list of "go-to" fonts:

<a id="short-list-web-only"></a>
#### Short List (Web Only) 
* Georgia for a sophisticated serif
* Helvetica for a clean and neutral design
* Lato for a friendly and "natural" look
* Raleway for a more modern geometric look

<a id="extended-list-grouped-by-letter-structure"></a>
#### Extended List (Grouped By Letter Structure)
* Humanist:
    * Adobe Garamond (Print)
    * Gill Sans (Print)
    * Lucida Grande (Web)
    * Museo Slab (Print/Web)
    * Palatino (Print/Web)
    * Tahoma (Web)
    * Trebuchet MS (Web)
    * Verdana (Web)
* Realist:
    * Arial (Web)
    * Bodoni (Print - Also Geometric)
    * Baskerville (Print)
    * Georgia (Web)
    * Helvetica (Print)
* Geometric:
    * Bodoni (Print - also Realist)
    * Futura (Print)
    * Rockwell (Print)

<a id="font-sizes"></a>
### Font Sizes
* Only use a 3:4 typographic scale 
    * 5 7 9 12 16 21 28 37 50 67 89 119 159
    * For pixels: 12px, 16px, etc
    * For rems: 1.2rem, 1.6rem, etc
