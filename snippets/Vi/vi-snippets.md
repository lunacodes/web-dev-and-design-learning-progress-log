# Vi Snippets

<!-- MarkdownTOC -->

* [File Commands](#file-commands)
* [Editor Configuration - View](#editor-configuration---view)
* [Motion \(Movement\)](#motion-movement)
* [Text Editing](#text-editing)
	* [Inserting Text](#inserting-text)
	* [Other](#other)
* [Copy, Cut, Paste](#copy-cut-paste)
* [Indent](#indent)
* [Color scheme list](#color-scheme-list)
* [Search & Replace](#search--replace)

<!-- /MarkdownTOC -->

<a id="file-commands"></a>
## File Commands
* `:w` Save file
* `:x` or `ZZ` Save and Exit
* `:q` Exit if no changes were made
* `:q!` Exit without save

<a id="editor-configuration---view"></a>
## Editor Configuration - View
* `:nu` Display single line number
* `:set number` Display all line numbers
* `:set nonumber` Hide line numbers
* `:set` List everything you've set

<a id="motion-movement"></a>
## Motion (Movement)
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
* `1G` Move to first line of file
* `G` Move to last line of file
* `:n` Move to nth line of file. Ex: `:120` moves to ln. 120
	* `nG` also does this. Ex: `120G`
* Unclear:
	* `fc` Move forward to c
	* `Fc` Move back to c
* `H` Move to top of screen
* `M` Move to middle of screen
* `L` Move to bottom of screen
* `%` Move to associated `( )`, `{ }`, `[ ]` (similar to Bracket Highlighter in Sublime Text)




<a id="text-editing"></a>
## Text Editing

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

<a id="other"></a>
### Other
* `~` Toggle upper and lower case
* `J` Join lines
* `.` Repeat last text-changing command

<a id="copy-cut-paste"></a>
## Copy, Cut, Paste
* Selectors:
    * `v` selects characters.
    * `V` select line
        * `V` `up` selects multiple lines.
        * `V` `Shift+up` functions as `select + PgUp`
    * `Ctrl+v` selects rectangular blocks
        * If `Ctrl+v` is mapped to paste, use `Ctrl+q`
* Functions:
    * `d` cut (delete)
    * `y ` copy (yank)
    * `P` paste before cursor

<a id="indent"></a>
## Indent

```sh
# doesn't seem to work
# * block select with ctrl+v
# * Insert comment sign (//) with I
# * escape with ESC

# ctrl+v → jjjj → I → // → ESC
```

<a id="color-scheme-list"></a>
## Color scheme list

* blue.vim
* darkblue.vim (preferred)
* default.vim
* delek.vim
* desert.vim
* elflord.vim
* evening.vim
* koehler.vim
* morning.vim
* murphy.vim
* pablo.vim
* peachpuff.vim
* ron.vim
* shine.vim
* slate.vim
* torte.vim
* zellner.vim

<a id="search--replace"></a>
## Search & Replace

Search:
* Search forward: `:/string` ex: `:/red`
* Search backward: `?string` ex: `?blue`
* Next instance: `n`
* Previous instance: `N`

Replace:
* Single: `:s/string` ex: `:/color`
	* Flags:
	* All Instances: `g`
	* Confirm Replaces: `c`
* Repeat last `:s` command: `&`

Note: Replace seems to only work on a single line, but you can combine it w/ the Search function


