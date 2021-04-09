# Emmet-vim

<!-- MarkdownTOC -->

* [Installation](#installation)
* [Quick Tutorial](#quick-tutorial)
* [Full Tutorial](#full-tutorial)
* [Enable in different mode](#enable-in-different-mode)
* [Enable just for html/css](#enable-just-for-htmlcss)
* [Redefine trigger key](#redefine-trigger-key)
* [Adding custom snippets](#adding-custom-snippets)
* [Project Authors](#project-authors)
* [Links](#links)
  * [Emmet official site:](#emmet-official-site)
  * [zen-coding official site:](#zen-coding-official-site)
  * [emmet.vim:](#emmetvim)
  * [development repository:](#development-repository)
  * [my blog posts about zencoding-vim:](#my-blog-posts-about-zencoding-vim)
  * [Japanese blog posts about zencoding-vim:](#japanese-blog-posts-about-zencoding-vim)
  * [A Chinese translation of the tutorial:](#a-chinese-translation-of-the-tutorial)

<!-- /MarkdownTOC -->

[emmet-vim](http://mattn.github.com/emmet-vim) is a vim plug-in
which provides support for expanding abbreviations similar to
[emmet](http://emmet.io/).

![screenshot](https://raw.githubusercontent.com/mattn/emmet-vim/master/doc/screenshot.gif)

<a id="installation"></a>
## Installation

[Download zip file](http://www.vim.org/scripts/script.php?script_id=2981):

    cd ~/.vim
    unzip emmet-vim.zip

To install using pathogen.vim:

    cd ~/.vim/bundle
    git clone https://github.com/mattn/emmet-vim.git

To install using [Vundle](https://github.com/gmarik/vundle):

    " add this line to your .vimrc file
    Plugin 'mattn/emmet-vim'

To install using [Vim-Plug](https://github.com/junegunn/vim-plug):

    " add this line to your .vimrc file
    Plug 'mattn/emmet-vim'

To checkout the source from repository:

    cd ~/.vim/bundle
    git clone https://github.com/mattn/emmet-vim.git

or:

    git clone https://github.com/mattn/emmet-vim.git
    cd emmet-vim
    cp plugin/emmet.vim ~/.vim/plugin/
    cp autoload/emmet.vim ~/.vim/autoload/
    cp -a autoload/emmet ~/.vim/autoload/


<a id="quick-tutorial"></a>
## Quick Tutorial

Open or create a New File:

    vim index.html

Type ("\_" is the cursor position):

    html:5_

Then type `<c-y>,` (<kbd>Ctrl</kbd><kbd>y</kbd><kbd>,</kbd>), and you should see:

```html
<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
</head>
<body>
  _
</body>
</html>
```

[More Tutorials](https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL)

<a id="full-tutorial"></a>
## Full Tutorial

```html
Tutorial for Emmet.vim

mattn <mattn.jp@gmail.com>

1. Expand an Abbreviation

  Type the abbreviation as 'div>p#foo$*3>a' and type '<c-y>,'.
  ---------------------
  <div>
      <p id="foo1">
          <a href=""></a>
      </p>
      <p id="foo2">
          <a href=""></a>
      </p>
      <p id="foo3">
          <a href=""></a>
      </p>
  </div>
  ---------------------

2. Wrap with an Abbreviation

  Write as below.
  ---------------------
  test1
  test2
  test3
  ---------------------
  Then do visual select(line wise) and type '<c-y>,'.
  Once you get to the 'Tag:' prompt, type 'ul>li*'.
  ---------------------
  <ul>
      <li>test1</li>
      <li>test2</li>
      <li>test3</li>
  </ul>
  ---------------------

  If you type a tag, such as 'blockquote', then you'll see the following:
  ---------------------
  <blockquote>
      test1
      test2
      test3
  </blockquote>
  ---------------------

3. Balance a Tag Inward

  type '<c-y>d' in insert mode.

4. Balance a Tag Outward

  type '<c-y>D' in insert mode.

5. Go to the Next Edit Point

  type '<c-y>n' in insert mode.

6. Go to the Previous Edit Point

  type '<c-y>N' in insert mode.

7. Update an <img>’s Size

  Move cursor to the img tag.
  ---------------------
  <img src="foo.png" />
  ---------------------
  Type '<c-y>i' on img tag
  ---------------------
  <img src="foo.png" width="32" height="48" />
  ---------------------

8. Merge Lines

  select the lines, which include '<li>'
  ---------------------
  <ul>
    <li class="list1"></li>
    <li class="list2"></li>
    <li class="list3"></li>
  </ul>
  ---------------------
  and then type '<c-y>m'
  ---------------------
  <ul>
    <li class="list1"></li><li class="list2"></li><li class="list3"></li>
  </ul>
  ---------------------

9. Remove a Tag

  Move cursor in block
  ---------------------
  <div class="foo">
    <a>cursor is here</a>
  </div>
  ---------------------
  Type '<c-y>k' in insert mode.
  ---------------------
  <div class="foo">

  </div>
  ---------------------

  And type '<c-y>k' in there again.
  ---------------------

  ---------------------

10. Split/Join Tag

  Move the cursor inside block
  ---------------------
  <div class="foo">
    cursor is here
  </div>
  ---------------------
  Type '<c-y>j' in insert mode.
  ---------------------
  <div class="foo"/>
  ---------------------

  And then type '<c-y>j' in there again.
  ---------------------
  <div class="foo">
  </div>
  ---------------------

11. Toggle Comment

  Move cursor inside the block
  ---------------------
  <div>
    hello world
  </div>
  ---------------------
  Type '<c-y>/' in insert mode.
  ---------------------
  <!-- <div>
    hello world
  </div> -->
  ---------------------
  Type '<c-y>/' in there again.
  ---------------------
  <div>
    hello world
  </div>
  ---------------------

12. Make an anchor from a URL

  Move cursor to URL
  ---------------------
  http://www.google.com/
  ---------------------
  Type '<c-y>a'
  ---------------------
  <a href="http://www.google.com/">Google</a>
  ---------------------

13. Make some quoted text from a URL

  Move cursor to the URL
  ---------------------
  http://github.com/
  ---------------------
  Type '<c-y>A'
  ---------------------
  <blockquote class="quote">
    <a href="http://github.com/">Secure source code hosting and collaborative development - GitHub</a><br />
    <p>How does it work? Get up and running in seconds by forking a project, pushing an existing repository...</p>
    <cite>http://github.com/</cite>
  </blockquote>
  ---------------------

14. Installing emmet.vim for the language you are using:

  # cd ~/.vim
  # unzip emmet-vim.zip

  Or if you are using pathogen.vim:

  # cd ~/.vim/bundle # or make directory
  # unzip /path/to/emmet-vim.zip

  Or if you get the sources from the repository:

  # cd ~/.vim/bundle # or make directory
  # git clone http://github.com/mattn/emmet-vim.git

15. Enable emmet.vim for the language you using.

  You can customize the behavior of the languages you are using.

  ---------------------
  # cat >> ~/.vimrc
  let g:user_emmet_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}
  ---------------------
```

<a id="enable-in-different-mode"></a>
## Enable in different mode

If you don't want to enable emmet in all modes,
you can use set these options in `vimrc`:

```vim
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
```

<a id="enable-just-for-htmlcss"></a>
## Enable just for html/css

```vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
```

<a id="redefine-trigger-key"></a>
## Redefine trigger key
To remap the default `<C-Y>` leader:

```vim
let g:user_emmet_leader_key='<C-Z>'
```

Note that the trailing `,` still needs to be entered, so the new keymap would be `<C-Z>,`.

<a id="adding-custom-snippets"></a>
## Adding custom snippets
If you have installed the [web-api](https://github.com/mattn/webapi-vim) for **emmet-vim** you can also add your own snippets using a custom **snippets.json** file.

Once you have installed the [web-api](https://github.com/mattn/webapi-vim) add this line to your **.vimrc**:
```
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
```
You can change the **path** to your **snippets_custom.json** according to your preferences.

[Here](http://docs.emmet.io/customization/snippets/) you can find instructions about creating your customized **snippets.json** file.

<a id="project-authors"></a>
## Project Authors

[Yasuhiro Matsumoto](http://mattn.kaoriya.net/)

<a id="links"></a>
## Links

<a id="emmet-official-site"></a>
### Emmet official site:

* <http://emmet.io/>

<a id="zen-coding-official-site"></a>
### zen-coding official site:

* <http://code.google.com/p/zen-coding/>

<a id="emmetvim"></a>
### emmet.vim:

* <http://mattn.github.com/emmet-vim>

<a id="development-repository"></a>
### development repository:

* <https://github.com/mattn/emmet-vim>

<a id="my-blog-posts-about-zencoding-vim"></a>
### my blog posts about zencoding-vim:

* <http://mattn.kaoriya.net/software/vim/20100222103327.htm>

* <http://mattn.kaoriya.net/software/vim/20100306021632.htm>

<a id="japanese-blog-posts-about-zencoding-vim"></a>
### Japanese blog posts about zencoding-vim:

* <http://d.hatena.ne.jp/idesaku/20100424/1272092255>

* <http://d.hatena.ne.jp/griefworker/20110118/vim_zen_coding>

* <http://d.hatena.ne.jp/sakurako_s/20110126/1295988873>

* <http://looxu.blogspot.jp/2010/02/zencodingvimhtml.html>

<a id="a-chinese-translation-of-the-tutorial"></a>
### A Chinese translation of the tutorial:

* <http://www.zfanw.com/blog/zencoding-vim-tutorial-chinese.html>


