# Vi Snippets

<!-- MarkdownTOC -->

* [File Commands](#file-commands)
* [Auto Commenting and Indenting](#auto-commenting-and-indenting)
* [Editor Configuration - View](#editor-configuration---view)
  * [Color Schemes](#color-schemes)
* [Motion \(Movement\)](#motion-movement)
* [Tabbing & Split Screen](#tabbing--split-screen)
  * [Tabbing](#tabbing)
  * [Split Screen](#split-screen)
* [Text Editing](#text-editing)
  * [Case Switching](#case-switching)
  * [Copy, Cut, Paste](#copy-cut-paste)
  * [Indentation](#indentation)
  * [Inserting Text](#inserting-text)
  * [Multiselect](#multiselect)
    * [Repeated Insertion](#repeated-insertion)
  * [Other](#other)
  * [Add Blank Line at EOF](#add-blank-line-at-eof)
  * [Matching, Highlighting, and Jumping](#matching-highlighting-and-jumping)
* [Search & Replace](#search--replace)
* [Troubleshooting](#troubleshooting)
* [Word Text Objects](#word-text-objects)
  * [Spellcheck](#spellcheck)

<!-- /MarkdownTOC -->

<a id="file-commands"></a>
## File Commands
* `:w` Save file
* `:x` or `ZZ` Save and Exit
  * Don't use `:x` - danger of conflation with `:X`, which will encrypt your file
* `:q` Exit if no changes were made
* `:q!` or `ZQ` Exit without save
* `:qa` Close all files and exit

Show File Path:

`1`,`ctrl-g` - Show full path

```bash
:pwd                    # show present working directory
:echo @%                # directory/name of file (relative to pwd)
:echo expand('%:t')     # filename (aka 'tail')
:echo expand('%:p')     # full path
:echo expand('%:p:h')   # directory containing file ('head')
:echo expand('%:p:h:t') # def First get the full path with :p (/abc/def/my.txt), then get the head of that with :h (/abc/def), then get the tail of that with :t (def)
:echo expand('%:r')     # filename less one extension ('root')
:echo expand('%:e')     # txt name of file's extension ('extension')
# For more info run :help expand

:!realpath %            # get path from the shell (no idea why you would do this)


```

<a id="auto-commenting-and-indenting"></a>
## Auto Commenting and Indenting

* block select with `ctrl-v`
* `shift-I` to enter `Insert` mode
* Insert comment symbol
	* `Tab` for indent
* Press `Esc`

ctrl-v → jjjj → I → // → ESC

<a id="editor-configuration---view"></a>
## Editor Configuration - View
* `:nu` Display single line number
* `:set number` Display all line numbers
* `:set nonumber` Hide line numbers
* `:set` List everything you've set

<a id="color-schemes"></a>
### Color Schemes
Go to [Vim Colors](http://vimcolors.com/) for color schemes!!

For customization, see [vi-config.md](vi-config.md)

<a id="motion-movement"></a>
## Motion (Movement)
* `gg` Goto Beginning of File
* `77 gg` Goto ln. 77
* `h` Move left
* `j` Move down
* `k` Move up
* `l` Move right
* `w` Move to `next word`
* `W` Move to `next blank delimited word` (ignores chars like -, =, etc)
* `b` Move to `beginning of word`
* `B` Move to beginning of blank delimited word
* `e` Move to end of word
* `E` Move to end of blank delimited word
* `(` Move a sentence back
* `)` Move a sentence forward
* `{` Move a paragraph back
* `}` Move a paragraph forward
* `0` Move to beginning of line
* `$` Move to end of line
* `gg` Move to first line of file
	* `1G` also does this
* `G` Move to last line of file
* `:n` Move to nth line of file. Ex: `:120` moves to ln. 120
	* `nG` also does this. Ex: `120G`
	* `ngg` also does this
* Unclear:
	* `fc` Move forward to c
	* `Fc` Move back to c
* `H` Move to top of screen
* `M` Move to middle of screen
* `L` Move to bottom of screen
* `%` Move to associated `( )`, `{ }`, `[ ]` (similar to Bracket Highlighter in Sublime Text)

<a id="tabbing--split-screen"></a>
## Tabbing & Split Screen

<a id="tabbing"></a>
### Tabbing

* `:tabedit file` - opens a new tab and will take you to edit `file`
* `gt` - move to the next tab
* `gT` - move to the previous tab
* `#gt` - move to a specific tab number (e.g. 2gt takes you to the second tab)
* `:tabs` - list all open tabs :tabclose - close a single tab

```bash
                    :tabmove 0  " as above
                    :tabmove    " move the tab page to the last
                    :$tabmove   " as above
                    :tabmove $  " as above

:tabm[ove] +[N]
:tabm[ove] -[N]
                Move the current tab page N places to the right (with +) or to
                the left (with -).
                    :tabmove -  " move the tab page to the left
                    :tabmove -1 " as above
                    :tabmove +  " move the tab page to the right
                    :tabmove +1 " as above


Note that although it is possible to move a tab behind the N-th one by using
:Ntabmove. And move it by N places by using :+Ntabmove. For clarification what
+N means in this context see [range].
```

<a id="split-screen"></a>
### Split Screen

```bash
ctrl-w v # open a new vertical split
ctrl-w s # open a new horizontal split
ctrl-w l # move to the right window
ctrl-w h # move to left window
ctrl-w j # move to window below
ctrl-w k # move to window above
ctrl-w > # increase window width
ctrl-w < # decrease window width
ctrl-w + # increase window height
ctrl-w - # decrease window height
ctrl-w = # reset to equal width & height
ctrl-w
```

<a id="text-editing"></a>
## Text Editing

<a id="case-switching"></a>
### Case Switching

* `~` Toggle upper and lower case
	* `shift-v` select block `~` toggles all the selected lines
	* Use `.` to toggle back

<a id="copy-cut-paste"></a>
### Copy, Cut, Paste
* Selectors:
	* `v` selects characters.
	* `V` select line
		* `V` `up` selects multiple lines.
		* `V` `shift-up` functions as `select - PgUp`
	* `ctrl-v` selects rectangular blocks
		* If `ctrl-v` is mapped to paste, use `ctrl-q`
* Functions:
	* `d` cut (delete)
	* `y ` copy (yank)
	* `P` paste before cursor

<a id="indentation"></a>
### Indentation

**Normal Mode**

`>` Increase Indent
`<` Decrease Indent

<a id="inserting-text"></a>
### Inserting Text
`i` Insert before cursor
`I` Insert before line
`a` Append after cursor
`A` Append after line
`o` Open a new line after current line
`O` Open a new line before current line
`r` Replace one character
`R` Replace many characters (equivalent to toggling the `Insert` key on Windows)

<a id="multiselect"></a>
### Multiselect

Use `Ctrl-n` via https://github.com/terryma/vim-multiple-cursors

<a id="repeated-insertion"></a>
#### Repeated Insertion

For when there are multiple instances of the same string to be changed

1. Search with `/`
2. Append some text to the end of the line. Ex `A[DO NOT PAY] [Esc]`
3. Type `n` `.` to move to next search result, and re-execute the most recent command

<a id="other"></a>
### Other
* `J` Join lines
* `.` Repeat last text-changing command

`G` `o` - Go to last line. Open line beneath current line.

<a id="add-blank-line-at-eof"></a>
### Add Blank Line at EOF

**Note:** this is different than adding a newline at eof (which is the default behavior). This adds an **additional** line - just like sublime text would.

<a id="matching-highlighting-and-jumping"></a>
### Matching, Highlighting, and Jumping

```bash
:set showmatch		# turn matching on
%					# go to matching opening bracket, comment symbol
#					# matching C/C++ preprocessor conditiona
#					# can also jump between appropriate keywords, if
#					# supported by the ftplugin file,
#					# for example, between begin and end in a Pascal file.
% v% 				# jump to the matching object, and visually select
# 					# all the text in between.
=% 					# jump to opening indentation

# I don't get what these
# The 'showmatch' option will not scroll the screen. To scroll the screen you can use a mapping like:

# jump between blank links
inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
# jump between function blocks (from 'function' to next 'function')
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
# jump between uppermost symbols or keywords
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
```

<a id="search--replace"></a>
## Search & Replace

Search:
* Search forward: `:/string` ex: `:/red`
* Search backward: `?string` ex: `?blue`
* Next instance: `n`
* Previous instance: `N`

Replace:
* Single: `:s/string` ex: `:/color`
* All Instances: `:g string` `enter`
	* Confirm Replaces: `c`
* Repeat last `:s` command: `&`

Note: Replace seems to only work on a single line, but you can combine it w/ the Search function

<a id="troubleshooting"></a>
## Troubleshooting

If Vim isn't starting correctly, then try `vim -Nu NONE` to rule out `.vimrc` as the issue.

<a id="word-text-objects"></a>
## Word Text Objects

Targets (Objects):
* `iw` inside word
* `aw` around word
* `is` in sentence
* `as` around sentence
* `ip` inside paragraph
* `ap` around paragraph
* `i'` inside quotes
* `a'` around quotes
* `i"` inside quotes
* `a"` around quotes
* ``` i` ``` inside backticks
* ``` a` ``` around backticks
* `i(` inside parenthesis
* `a(` around parenthesis
* `i[` inside brackets
* `a[` around brackets
* `i{` inside braces
* `a{` around braces
* `it` inside tags
* `at` around tags

Actions:

* `da` delete around
* `ci` change in

Examples:

* `daw` delete around word (actually it's just delete word)
* `cis` change in sentence. Nukes the entire sentence (up until there are 2 line breaks), and puts you in `Insert` Mode

<a id="spellcheck"></a>
### Spellcheck

In ~/.vimrc: `set spell spelllang=en_us`. You can also enable or disable this by running :set spell and :set nospell.

```bash
# Go to the next misspelled word
]s
# Go to the last misspelled word
[s
# When on a misspelled word, get some suggestions
z=
# Mark a misspelled word as correct
zg
# Mark a good word as misspelled
zw
```

