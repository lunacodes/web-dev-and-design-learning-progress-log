# Vim Configuration
<!-- MarkdownTOC -->

* [Color scheme list](#color-scheme-list)
* [Top 50 Vim Configuration Options Article](#top-50-vim-configuration-options-article)
  * [Indentation Options](#indentation-options)
    * [Snippets and Plugins](#snippets-and-plugins)
  * [Search Options](#search-options)
  * [Performance Options](#performance-options)
  * [Text Rendering Options](#text-rendering-options)
  * [User Interface Options](#user-interface-options)
  * [Code Folding Options](#code-folding-options)
  * [Miscellaneous Options](#miscellaneous-options)
* [Plugins](#plugins)
  * [Vim Multiple Cursors](#vim-multiple-cursors)
* [Quick Start](#quick-start)
  * [normal mode / visual mode](#normal-mode--visual-mode)
  * [visual mode when multiple lines are selected](#visual-mode-when-multiple-lines-are-selected)
  * [command](#command)
* [Mapping](#mapping)
* [Settings](#settings)
  * [```g:multi_cursor_exit_from_visual_mode``` \(Default: 1\)](#gmulti_cursor_exit_from_visual_mode-default-1)
  * [```g:multi_cursor_exit_from_insert_mode``` \(Default: 1\)](#gmulti_cursor_exit_from_insert_mode-default-1)
  * [```g:multi_cursor_normal_maps``` \(Default: see below\)](#gmulti_cursor_normal_maps-default-see-below)
  * [```g:multi_cursor_visual_maps``` \(Default: see below\)](#gmulti_cursor_visual_maps-default-see-below)
  * [Interactions with other plugins](#interactions-with-other-plugins)
  * [```Multiple_cursors_before/Multiple_cursors_after``` \(Default: `nothing`\)](#multiple_cursors_beforemultiple_cursors_after-default-nothing)
  * [Highlight](#highlight)
* [FAQ](#faq)
    * [**Q** ALT+n doesn't seem to work in VIM but works in gVIM, why?](#q-altn-doesnt-seem-to-work-in-vim-but-works-in-gvim-why)
    * [**Q** CTRL+n doesn't seem to work in gVIM?](#q-ctrln-doesnt-seem-to-work-in-gvim)
  * [**Q** deoplete insert giberrish, how to fix this?](#q-deoplete-insert-giberrish-how-to-fix-this)
    * [**Q** is it also working on Mac?](#q-is-it-also-working-on-mac)
    * [**Q** How can I select `n` keywords with several keystrokes? `200` does not work.](#q-how-can-i-select-n-keywords-with-several-keystrokes-200-does-not-work)
  * [Lightline.vim](#lightlinevim)
  * [Vim Eunuch](#vim-eunuch)
  * [Vim Surround](#vim-surround)

<!-- /MarkdownTOC -->

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

<a id="top-50-vim-configuration-options-article"></a>
## Top 50 Vim Configuration Options Article

From: https://www.shortcutfoo.com/blog/top-50-vim-configuration-options
/
Apr 30th, 2016 11:02 AM

<a id="indentation-options"></a>
### Indentation Options

* `set autoindent`: New lines inherit the indentation of previous lines.
* `set expandtab`: Convert tabs to spaces.
* `set filetype indent on`: Enable indentation rules that are file-type specific.
* `set shiftround`: When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
* `set shiftwidth=4`: When shifting, indent using four spaces.
* `set smarttab`: Insert “tabstop” number of spaces when the “tab” key is pressed.
* `set tabstop=4`: Indent using four spaces.

```bash
set autoindent # New lines inherit the indentation of previous lines.
set expandtab # Convert tabs to spaces.
set filetype indent on # Enable indentation rules that are file-type specific.
set list # Show Indentations
set listchars= # These must be done altogether, in a single line
  eol # End of Line
  tab:┆ # Set how tabs are displayed. Other options: \|- <- !· ▸\  etc
# Other options for tab: |, ¦, ┆, ┊
  precedes:«,extends:» # These apply to when you have long lines and :set nowrap is set
  trail:· # Trailing spaces
# Current setting is:
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:'┆',nbsp:·
set shiftround # When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftwidth=4 # When shifting, indent using four spaces.
set smarttab # Insert “tabstop” number of spaces when the “tab” key is pressed.
set tabstop=4 # Indent using four spaces.
```

<a id="snippets-and-plugins"></a>
#### Snippets and Plugins

```bash
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
"
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
```

The [Yggdroot - indentLine plugin is a great option!](https://github.com/Yggdroot/indentLine)

<a id="search-options"></a>
### Search Options

* `set hlsearch`: Enable search highlighting.
* `set ignorecase`: Ignore case when searching.
* `set incsearch`: Incremental search that shows partial matches.
* `set smartcase`: Automatically switch search to case-sensitive when search query contains an uppercase letter.

<a id="performance-options"></a>
### Performance Options

* `set complete-=i`: Limit the files searched for auto-completes.
* `set lazyredraw`: Don’t update screen during macro and script execution.

<a id="text-rendering-options"></a>
### Text Rendering Options

* `set display+=lastline`: Always try to show a paragraph’s last line.
* `set encoding=utf-8`: Use an encoding that supports unicode.
* `set linebreak`: Avoid wrapping a line in the middle of a word.
* `set scrolloff=1`: The number of screen lines to keep above and below the cursor.
* `set sidescrolloff=5`: The number of screen columns to keep to the left and right of the cursor.
* `syntax enable`: Enable syntax highlighting.
* `set wrap`: Enable line wrapping.

<a id="user-interface-options"></a>
### User Interface Options

* `set laststatus=2`: Always display the status bar.
* `set ruler`: Always show cursor position.
* `set wildmenu`: Display command line’s tab complete options as a menu.
* `set tabpagemax=50`: Maximum number of tab pages that can be opened from the command line.
* `set colorscheme wombat256mod`: Change color scheme.
* `set cursorline`: Highlight the line currently under cursor.
* `set number`: Show line numbers on the sidebar.
* `set relativenumber`: Show line number on the current line and relative numbers on all other lines.
* `set noerrorbells`: Disable beep on errors.
* `set visualbell`: Flash the screen instead of beeping on errors.
* `set mouse=a`: Enable mouse for scrolling and resizing.
* `set title`: Set the window’s title, reflecting the file currently being edited.
* `set background=dark`: Use colors that suit a dark background.

<a id="code-folding-options"></a>
### Code Folding Options

* `set foldmethod=indent`: Fold based on indention levels.
* `set foldnestmax=3`: Only fold up to three nested levels.
* `set nofoldenable`: Disable folding by default.

<a id="miscellaneous-options"></a>
### Miscellaneous Options

* `set autoread`: Automatically re-read files if unmodified inside Vim.
* `set backspace=indent,eol,start`: Allow backspacing over indention, line breaks and insertion start.
* `set backupdir=~/.cache/vim`: Directory to store backup files.
* `set confirm`: Display a confirmation dialog when closing an unsaved file.
* `set dir=~/.cache/vim`: Directory to store swap files.
* `set formatoptions +=j`: Delete comment characters when joining lines.
* `set hidden`: Hide files in the background instead of closing them.
* `set history=1000`: Increase the undo limit.
* `set nomodeline`: Ignore file’s mode lines; use vimrc configurations instead.
* `set noswapfile`: Disable swap files.
* `set nrformats-=octal`: Interpret octal as decimal when incrementing numbers.
* `set shell`: The shell used to execute commands.
* `set spell`: Enable spellchecking.
* `set wildignore+=.pyc,.swp`: Ignore files matching these patterns when opening files based on a glob pattern.

<a id="plugins"></a>
## Plugins

* [fuzzy finder](https://github.com/junegunn/fzf.vim) - similar to `ctrl-r` in Sublime text. Iffy on how well it actually works...
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) - Sublime's `Ctrl-d` functionality!!
* [lightline.vim](https://github.com/itchyny/lightline.vim) - make the status bar look beautiful, and incorporate git info!!
* [vim eunuch](https://github.com/tpope/vim-eunuch)

<a id="vim-multiple-cursors"></a>
### Vim Multiple Cursors

<a id="quick-start"></a>
## Quick Start
<a id="normal-mode--visual-mode"></a>
### normal mode / visual mode
  * start:          `<C-n>` start multicursor and add a _virtual cursor + selection_ on the match
    * next:         `<C-n>` add a new _virtual cursor + selection_ on the next match
    * skip:         `<C-x>` skip the next match
    * prev:         `<C-p>` remove current _virtual cursor + selection_ and go back on previous match
  * select all:     `<A-n>` start muticursor and directly select all matches

You can now change the _virtual cursors + selection_ with **visual mode** commands.
For instance: `c`, `s`, `I`, `A` work without any issues.
You could also go to **normal mode** by pressing `v` and use normal commands there.

At any time, you can press `<Esc>` to exit back to regular Vim.

**NOTE**: start with `g<C-n>` to match without boundaries (behaves like `g*` instead of `*`)

<a id="visual-mode-when-multiple-lines-are-selected"></a>
### visual mode when multiple lines are selected
  * start: `<C-n>` add _virtual cursors_ on each line

You can now change the _virtual cursors_ with **normal mode** commands.
For instance: `ciw`.

<a id="command"></a>
### command
The command `MultipleCursorsFind` accepts a range and a pattern (regexp), it creates a _visual cursor_ at the end of each match.
If no range is passed in, then it defaults to the entire buffer.


<a id="mapping"></a>
## Mapping
If you don't like the plugin taking over your key bindings, you can turn it off and reassign them the way you want:

```bash
let g:multi_cursor_use_default_mapping=0

\" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
```

**NOTE:** Please make sure to always map something to `g:multi_cursor_quit_key`, otherwise you'll have a tough time quitting from multicursor mode.

<a id="settings"></a>
## Settings
Currently there are four additional global settings one can tweak:

<a id="gmulti_cursor_exit_from_visual_mode-default-1"></a>
### ```g:multi_cursor_exit_from_visual_mode``` (Default: 1)
If set to 0, then pressing `g:multi_cursor_quit_key` in _Visual_ mode will not quit and delete all existing cursors.
Useful if you want to go back to Normal mode, and still be able to operate on all the cursors.

<a id="gmulti_cursor_exit_from_insert_mode-default-1"></a>
### ```g:multi_cursor_exit_from_insert_mode``` (Default: 1)
If set to 0, then pressing `g:multi_cursor_quit_key` in _Insert_ mode will not quit and delete all existing cursors.
Useful if you want to go back to Normal mode, and still be able to operate on all the cursors.

<a id="gmulti_cursor_normal_maps-default-see-below"></a>
### ```g:multi_cursor_normal_maps``` (Default: see below)
`{'@': 1, 'F': 1, 'T': 1, '[': 1, '\': 1, ']': 1, '!': 1, '"': 1, 'c': 1, 'd': 1, 'f': 1, 'g': 1, 'm': 1, 'q': 1, 'r': 1, 't': 1, 'y': 1, 'z': 1, '<': 1, '=': 1, '>': 1}`

Any key in this map (values are ignored) will cause multi-cursor _Normal_ mode
to pause for map completion just like normal vim. Otherwise keys mapped in
normal mode will "fail to replay" when multiple cursors are active.
For example: `{'d':1}` makes normal-mode command `dw` work in multi-cursor mode.

The default list contents should work for anybody, unless they have remapped a
key from an operator-pending command to a non-operator-pending command or
vice versa.

These keys must be manually listed because vim doesn't provide a way to
automatically see which keys _start_ mappings, and trying to run motion commands
such as `j` as if they were operator-pending commands can break things.


<a id="gmulti_cursor_visual_maps-default-see-below"></a>
### ```g:multi_cursor_visual_maps``` (Default: see below)
`{'T': 1, 'a': 1, 't': 1, 'F': 1, 'f': 1, 'i': 1}`

Same principle as `g:multi_cursor_normal_maps`

<a id="interactions-with-other-plugins"></a>
### Interactions with other plugins

<a id="multiple_cursors_beforemultiple_cursors_after-default-nothing"></a>
### ```Multiple_cursors_before/Multiple_cursors_after``` (Default: `nothing`)

Other plugins may be incompatible in insert mode.
That is why we provide hooks to disable those plug-ins when vim-multiple-cursors is active:

For example, if you are using [Neocomplete](https://github.com/Shougo/neocomplete.vim),
add this to your vimrc to prevent conflict:

```bash
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
```

Plugins themselves can register `User` autocommands on `MultipleCursorsPre` and
`MultipleCursorsPost` for automatic integration.

<a id="highlight"></a>
### Highlight
The plugin uses the highlight group `multiple_cursors_cursor` and `multiple_cursors_visual` to highlight the virtual cursors and their visual selections respectively. You can customize them by putting something similar like the following in your vimrc:

```bash
\" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
```

<a id="faq"></a>
## FAQ

<a id="q-altn-doesnt-seem-to-work-in-vim-but-works-in-gvim-why"></a>
#### **Q** <kbd>ALT</kbd>+<kbd>n</kbd> doesn't seem to work in VIM but works in gVIM, why?
**A** This is a well known terminal/Vim [issue](http://vim.wikia.com/wiki/Get_Alt_key_to_work_in_terminal), different terminal have different ways to send ```Alt+key```.
Try adding this in your `.vimrc` and **make sure to replace the string**:
```vim
if !has('gui_running')
  map "in Insert mode, type Ctrl+v Alt+n here" <A-n>
endif
```
Or remap the following:
```vim
g:multi_cursor_start_key
g:multi_cursor_select_all_key
```

<a id="q-ctrln-doesnt-seem-to-work-in-gvim"></a>
#### **Q** <kbd>CTRL</kbd>+<kbd>n</kbd> doesn't seem to work in gVIM?
**A** Try setting `set selection=inclusive` in your `~/.gvimrc`

**A** Alternatively, you can just temporarily disable _exclusive_ selection whenever the plugin is active:
```bash
augroup MultipleCursorsSelectionFix
    autocmd User MultipleCursorsPre  if &selection ==# 'exclusive' | let g:multi_cursor_save_selection = &selection | set selection=inclusive | endif
    autocmd User MultipleCursorsPost if exists('g:multi_cursor_save_selection') | let &selection = g:multi_cursor_save_selection | unlet g:multi_cursor_save_selection | endif
augroup END
```

<a id="q-deoplete-insert-giberrish-how-to-fix-this"></a>
### **Q** deoplete insert giberrish, how to fix this?
**A** use the `Multiple_cursors` functions, add this in your vimrc:

```bash
    func! Multiple_cursors_before()
      if deoplete#is_enabled()
        call deoplete#disable()
        let g:deoplete_is_enable_before_multi_cursors = 1
      else
        let g:deoplete_is_enable_before_multi_cursors = 0
      endif
    endfunc
    func! Multiple_cursors_after()
      if g:deoplete_is_enable_before_multi_cursors
        call deoplete#enable()
      endif
    endfunc
```

<a id="q-is-it-also-working-on-mac"></a>
#### **Q** is it also working on Mac?
**A** On Mac OS, [MacVim](https://code.google.com/p/macvim/) is known to work.

<a id="q-how-can-i-select-n-keywords-with-several-keystrokes-200-does-not-work"></a>
#### **Q** How can I select `n` keywords with several keystrokes? `200<C-n>` does not work.
**A** You can use :MultipleCursorsFind keyword. I have this binding in my vimrc:

```bash
nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
```

This allows one to search for the keyword using `*` and turn search results into cursors with `Alt-j`.


<a id="lightlinevim"></a>
### Lightline.vim

Settings I didn't get to and may/may not want to integrate:
Can I display the plugin name at the mode component?
Yes, overwrite the mode component.

```bash
let g:lightline = {
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \ },
      \ }

function! LightlineMode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction
```

Can I trim the bar between the filename and modified sign?
Yes, by joining the two components.

```bash
let g:lightline = {
      \ 'component_function': {
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
```

<a id="vim-eunuch"></a>
### Vim Eunuch

Vim sugar for the UNIX shell commands that need it the most. Features include:


* `:Delete`: Delete a buffer and the file on disk simultaneously.
* `:Unlink`: Like :Delete, but keeps the now empty buffer.
* `:Move`: Rename a buffer and the file on disk simultaneously.
* `:Rename`: Like :Move, but relative to the current file's containing directory.
* `:Chmod`: Change the permissions of the current file.
* `:Mkdir`: Create a directory, defaulting to the parent of the current file.
* `:Cfind`: Run find and load the results into the quickfix list.
* `:Clocate`: Run locate and load the results into the quickfix list.
* `:Lfind`/:Llocate: Like above, but use the location list.
* `:Wall`: Write every open window. Handy for kicking off tools like guard.
* `:SudoWrite`: Write a privileged file with sudo.
* `:SudoEdit`: Edit a privileged file with sudo.
* File type detection for sudo -e is based on original file name.
* New files created with a shebang line are automatically made executable.
* New init scripts are automatically prepopulated with /etc/init.d/skeleton.

<a id="vim-surround"></a>
### Vim Surround

It's easiest to explain with examples.  Press `cs"'` inside

`"Hello world!"`

to change it to

`'Hello world!'`

Now press `cs'<q>` to change it to

`<q>Hello` world!</q>

To go full circle, press `cst"` to get

`"Hello world!"`

To remove the delimiters entirely, press `ds"`.

`Hello world!`

Now with the cursor on "Hello", press `ysiw]` (`iw` is a text object).

`[Hello] world!`

Let's make that braces and add some space (use `}` instead of `{` for no
space): `cs]{`

`{ Hello } world!`

Now wrap the entire line in parentheses with `yssb` or `yss)`.

`({ Hello } world!)`

Revert to the original text: `ds{ds)`

`Hello world!`

Emphasize hello: `ysiw<em>`

```html
<em>Hello</em> world!
```

Finally, let's try out visual mode. Press a capital V (for linewise
visual mode) followed by `S<p class="important">`.

```html
<p class="important">
  <em>Hello</em> world!
</p>`
```

This plugin is very powerful for HTML and XML editing, a niche which
currently seems underfilled in Vim land.  (As opposed to HTML/XML
*inserting*, for which many plugins are available).  Adding, changing,
and removing pairs of tags simultaneously is a breeze.

The `.` command will work with `ds`, `cs`, and `yss` if you install
[repeat.vim](https://github.com/tpope/vim-repeat).
