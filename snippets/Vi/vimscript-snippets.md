# Vimscripting

<!-- MarkdownTOC -->

* [Mapping](#mapping)
	* [Leader](#leader)
	* [Modal Mapping](#modal-mapping)
	* [Keycodes List \(Special Characters\)](#keycodes-list-special-characters)
	* [Alias and Override](#alias-and-override)
		* [Recursion](#recursion)
* [Substitutions](#substitutions)

<!-- /MarkdownTOC -->


<a id="mapping"></a>
## Mapping

**Selection**

* `map <space> viw` highlight word
* `map - dd ` delete line
* `map <c-d> dd ` ctrl-d - delete line
* `imap <c-d> <esc>ddi ` delete line. stay in `interactive` mode
* `map - ddp ` move line down 1
* `map - ddkP ` move line up 1
* `nmap \ dd`


**Text Manipulation**

```bash

# Selection ##
# highlight word
:map <space> viw

# Motion ##
# BOL
:nnoremap H ^
# EOL
:nnoremap L $

# Line Manipulation ##
# Delete Line
:nmap - dd
:nmap \ dd
':nmap <c-d> dd'
# delete line and stay in interactive mode
':imap <c-d> <esc>ddi'
:nmap - ddp # switch line down 1
:nmap - ddkP # switch line up 1

# Word Manipulation ##
# convert to uppercase
:vmap \ U
# convert to uppercase and move cursor to beginning of word
':imap <c-u> <esc>lviwUi'
':nmap <c-u> viwU'

# type \' to add single quotes around word
# :nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
# type \" to add double quotes around visual selection
# :vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`<lv`>l
```

<a id="leader"></a>
### Leader

A `<leader>` mapping allows you to perform an action by typing `\` plus the `<leader>` key. Ex:

`:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel` lets you type `\` `'` to put quotes around a single word

<a id="modal-mapping"></a>
### Modal Mapping

* `nmap` - apply map to `normal` mode
* `vmap` - apply map to `visual` mode
* `imap` - apply map to `insert` mode

<a id="keycodes-list-special-characters"></a>
### Keycodes List (Special Characters)

```powershell
notation        meaning             equivalent  decimal value(s)
-----------------------------------------------------------------------
<Nul>           zero                    CTRL-@    0 (stored as 10) <Nul>
<BS>            backspace               CTRL-H    8     backspace
<Tab>           tab                     CTRL-I    9     tab Tab
                                                        linefeed
<NL>            linefeed                CTRL-J   10 (used for <Nul>)
<FF>            formfeed                CTRL-L   12     formfeed
<CR>            carriage return         CTRL-M   13     carriage-return
<Return>        same as <CR>                            <Return>
<Enter>         same as <CR>                            <Enter>
# <Esc>           escape                  CTRL-[   27     escape <Esc>
<Space>         space                            32     space
<lt>            less-than               <        60     *<lt>*
<Bslash>        backslash               \        92     backslash <Bslash>
<Bar>           vertical bar            |       124     <Bar>
<Del>           delete                          127
<CSI>           command sequence intro  ALT-Esc 155     <CSI>
<xCSI>          CSI when typed in the GUI               <xCSI>

<EOL>           end-of-line (can be <CR>, <LF> or <CR><LF>,
                depends on system and 'fileformat')     <EOL>

<Up>            cursor-up                       cursor-up cursor_up
<Down>          cursor-down                     cursor-down cursor_down
<Left>          cursor-left                     cursor-left cursor_left
<Right>         cursor-right                    cursor-right cursor_right
<S-Up>          shift-cursor-up
<S-Down>        shift-cursor-down
<S-Left>        shift-cursor-left
<S-Right>       shift-cursor-right
<C-Left>        control-cursor-left
<C-Right>       control-cursor-right
<F1> - <F12>    function keys 1 to 12           function_key function-key
<S-F1> - <S-F12> shift-function keys 1 to 12    <S-F1>
<Help>          help key
<Undo>          undo key
<Insert>        insert key
<Home>          home                            home
<End>           end                             end
<PageUp>        page-up                         page_up page-up
<PageDown>      page-down                       page_down page-down
<kHome>         keypad home (upper left)        keypad-home
<kEnd>          keypad end (lower left)         keypad-end
<kPageUp>       keypad page-up (upper right)    keypad-page-up
<kPageDown>     keypad page-down (lower right)  keypad-page-down
<kPlus>         keypad +                        keypad-plus
<kMinus>        keypad -                        keypad-minus
<kMultiply>     keypad *                        keypad-multiply
<kDivide>       keypad /                        keypad-divide
<kEnter>        keypad Enter                    keypad-enter
<kPoint>        keypad Decimal point            keypad-point
<k0> - <k9>     keypad 0 to 9                   keypad-0 keypad-9
<S-...>         shift-key                       shift <S-
<C-...>         control-key                     control ctrl <C-
<M-...>         alt-key or meta-key             meta alt <M-
<A-...>         same as <M-...>                 <A-
<D-...>         command-key (Macintosh only)    <D-
<t_xx>          key with "xx" entry in termcap
-----------------------------------------------------------------------
```

<a id="alias-and-override"></a>
### Alias and Override

Running the following will alias `\` to the new `-` map:

```sh
:nmap - dd # set - to delete line
:nmap \ -  # set \ to - (aka delete line)
```

Avoid this by using `noremap`

```sh
:nmap x dd
:nnoremap \ x

```

<a id="recursion"></a>
#### Recursion

Aliasing (and mapping in general) can get dangerous, b/c Vim will recurse. For example: `:nmap dd O<esc>jddk` will endlessly add new lines until you `ctrl-c`

<a id="substitutions"></a>
## Substitutions

```bash
:%s /foo/bar/g # Change "foo" to "bar" on every line
:s /foo/bar/g # Change "foo" to "bar" only on current line
```

