A progress log of my daily web design and development learning and growth. Also contains useful tools and resources.

# Table of Contents

<!-- MarkdownTOC -->

* [Reading Log](#reading-log)
    * [4/24/18](#42418)
    * [4/23/18](#42318)
    * [4/20/18](#42018)
    * [4/19/18](#41918)
* [Tools & Resources](#tools--resources)
    * [Tools](#tools)
        * [Git & Github](#git--github)
        * [Sublime Text](#sublime-text)
    * [Resources](#resources)
        * [Documentation](#documentation)
        * [DOM](#dom)
        * [Markdown](#markdown)
* [Techniques & Best Practices](#techniques--best-practices)
    * [Form Design](#form-design)

<!-- /MarkdownTOC -->

<a id="reading-log"></a>
# Reading Log

<a id="42418"></a>
## 4/24/18
* [UX Movement - Why Users Make More Errors with Instant Inline Validation](http://uxmovement.com/forms/why-users-make-more-errors-with-instant-inline-validation/?ref=webdesignernews.com) 
    * Point: using premature inline validation causes users to make more 
    errors. Only use where appropriate
    * Comment: heard of ‘onBlur’? The field is validated once the user 
    leaves it.

<a id="42318"></a>
## 4/23/18
* [freeCodeCamp - Useful tricks you might not know about git stash](https://medium.freecodecamp.org/useful-tricks-you-might-not-know-about-git-stash-e8a9490f0a1a)

<a id="42018"></a>
## 4/20/18
* Reduce your worries about font size by exclusively using a 3:4 typographic scale
    * 5 7 9 12 16 21 28 37 50 67 89 119 159
        * Each font is approximately 75% the size of the larger font
        * For pixels: 12px, 16px, etc
        * For rems: 1.2rem, 1.6rem, etc

<a id="41918"></a>
## 4/19/18
* [Design For Hackers - Design Pitfalls - Font Anxiety](https://designforhackers.com/)
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
