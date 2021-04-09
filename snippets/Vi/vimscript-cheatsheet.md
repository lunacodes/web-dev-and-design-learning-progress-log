### Start hacking

```bash
let name = "John"
echo "Hello, " . name
```

You can either put this in a script (`script.vim`) and run it (`:source script.vim`), or you can type the commands individually in normal mode as `:let` and `:echo`.

### Learn by example

```bash
function! SuperTab()
  let l:part = strpart(getline('.'),col('.')-2,1)
  if (l:part=~'^\W\?$')
      return "\<Tab>"
  else
      return "\<C-n>"
  endif
endfunction

imap <Tab> <C-R>=SuperTab()<CR>
```

[Here](http://www.vimbits.com/bits/46)'s another example with [functions](#functions), [variables](#variables) and [mapping](#mapping).

Variables
---------

### Defining
{: .-prime}

```bash
let var = "hello"
```

### Variable prefixes

```bash
let g:ack_options = '-s -H'    " g: global
let s:ack_program = 'ack'      " s: local (to script)
let l:foo = 'bar'              " l: local (to function)
```

The `s:` prefix is also available in function names. See `:help local-variables`

### Other prefixes

```bash
let w:foo = 'bar'    " w: window
let b:state = 'on'   " b: buffer
let t:state = 'off'  " t: tab
echo v:var           " v: vim special
```

```bash
let @/ = ''          " @  register (this clears last search pattern)
echo $PATH           " $  env
```

### Vim options

```bash
echo 'tabstop is ' . &tabstop
if &insertmode
echo &g:option
echo &l:option
```

Prefix Vim options with `&`

### Operators

```bash
a + b             " numbers only!
'hello ' . name   " concat
```

```bash
let var -= 2
let var += 5
let var .= 'string'   " concat
```

## Strings

### Strings

```bash
let str = "String"
let str = "String with \n newline"

let literal = 'literal, no \ escaping'
let literal = 'that''s enough'  " double '' => '

echo "result = " . re   " concatenation
```

Also see `:help literal-string` and `:help expr-quote`.
See: [Strings](http://learnvimscriptthehardway.stevelosh.com/chapters/26.html)

### String functions

```bash
strlen(str)    " length
len(str)       " same
strchars(str)  " character length

split("one two three")       "=> ['one', 'two', 'three']
split("one.two.three", '.')  "=> ['one', 'two', 'three']

join(['a', 'b'], ',')  "=> 'a,b'

tolower('Hello')
toupper('Hello')
```

Also see `:help functions`
See: [String functions](http://learnvimscriptthehardway.stevelosh.com/chapters/27.html)

Functions
---------

### Functions
{: .-prime}

```bash
" prefix with s: for local script-only functions
function! s:Initialize(cmd, args)
  " a: prefix for arguments
  echo "Command: " . a:cmd

  return true
endfunction
```

See: [Functions](http://learnvimscriptthehardway.stevelosh.com/chapters/23.html)

### Namespacing

```bash
function! myplugin#hello()
```

### Calling functions

```bash
call s:Initialize()
call s:Initialize("hello")
```

### Consuming return values

```bash
echo "Result: " . s:Initialize()
```

### Abortable

```bash
function! myfunction() abort
endfunction
```

Aborts when an error occurs.

### Var arguments

```bash
function! infect(...)
  echo a:0    "=> 2
  echo a:1    "=> jake
  echo a:2    "=> bella

  for s in a:000  " a list
    echon ' ' . s
  endfor
endfunction

infect('jake', 'bella')
```

See `:help function-argument`.  See: [Var arguments](http://learnvimscriptthehardway.stevelosh.com/chapters/24.html)

Loops
-----

```bash
for s in list
  echo s
  continue  " jump to start of loop
  break     " breaks out of a loop
endfor
```

```bash
while x < 5
endwhile
```

Custom commands
---------------

### Custom commands
{: .-prime}

```bash
command! Save :set fo=want tw=80 nowrap
```

Custom commands start with uppercase letters. The `!` redefines a command if it already exists.

### Commands calling functions

```bash
command! Save call <SID>foo()
```
{: .-setup}

```bash
function! s:foo()
  ...
endfunction
```

### Commands with arguments

```bash
command! -nargs=? Save call script#foo(<args>)
```
{: .-setup}

| What | What |
| ---- | ---- |
| `-nargs=0` | 0 arguments, default |
| `-nargs=1` | 1 argument, includes spaces |
| `-nargs=?` | 0 or 1 argument |
| `-nargs=*` | 0+ arguments, space separated |
| `-nargs=+` | 1+ arguments, space reparated |

Flow
----

### Conditionals

```bash
let char = getchar()
if char == "\<LeftMouse>"
  " ...
elseif char == "\<RightMouse>"
  " ...
else
  " ...
endif
```

### Truthiness

```bash
if 1 | echo "true"  | endif
if 0 | echo "false" | endif
```

```bash
if 1       "=> 1 (true)
if 0       "=> 0 (false)
if "1"     "=> 1 (true)
if "456"   "=> 1 (true)
if "xfz"   "=> 0 (false)
```

No booleans. `0` is false, `1` is true.
See: [Truthiness](http://learnvimscriptthehardway.stevelosh.com/chapters/21.html)

### Operators

```bash
if 3 > 2
if a && b
if (a && b) || (c && d)
if !c
```

See `:help expression-syntax`.
See: [Operators](http://learnvimscriptthehardway.stevelosh.com/chapters/22.html)

### Strings

```bash
if name ==# 'John'     " case-sensitive
if name ==? 'John'     " case-insensitive
if name == 'John'      " depends on :set ignorecase

" also: is#, is?, >=#, >=?, and so on
```

### Identity operators

```bash
a is b
a isnot b
```

Checks if it's the same instance object.

### Regexp matches

```bash
"hello" =~ '/x/'
"hello" !~ '/x/'
```

### Single line

```bash
if empty(a:path) | return [] | endif
a ? b : c
```

Use `|` to join lines together.

### Boolean logic

```bash
if g:use_dispatch && s:has_dispatch
  ···
endif
```

Lists
-----

### Lists

```bash
let mylist = [1, two, 3, "four"]

let first = mylist[0]
let last  = mylist[-1]

" Suppresses errors
let second = get(mylist, 1)
let second = get(mylist, 1, "NONE")
```

### Functions

```bash
len(mylist)
empty(mylist)

sort(list)
let sortedlist = sort(copy(list))

split('hello there world', ' ')
```

### Concatenation

```bash
let longlist = mylist + [5, 6]
let mylist += [7, 8]
```

### Sublists

```bash
let shortlist = mylist[2:-1]
let shortlist = mylist[2:]     " same

let shortlist = mylist[2:2]    " one item
```

### Push

```bash
let alist = [1, 2, 3]
let alist = add(alist, 4)
```

### Map

```bash
call map(files, "bufname(v:val)")  " use v:val for value
call filter(files, 'v:val != ""')
```

Dictionaries
------------

### Dictionaries

```bash
let colors = {
  \ "apple": "red",
  \ "banana": "yellow"
}

echo colors["a"]
echo get(colors, "apple")   " suppress error
```

See `:help dict`

### Using dictionaries

```bash
remove(colors, "apple")
```

```bash
" :help E715
if has_key(dict, 'foo')
if empty(dict)
keys(dict)
len(dict)
```

```bash
max(dict)
min(dict)
```

```bash
count(dict, 'x')
string(dict)
```

```bash
map(dict, '<>> " . v:val')
```

### Iteration

```bash
for key in keys(mydict)
  echo key . ': ' . mydict(key)
endfor
```

### Prefixes

```bash
keys(s:)
```

Prefixes (`s:`, `g:`, `l:`, etc) are actually dictionaries.

### Extending

```bash
" Extending with more
let extend(s:fruits, { ... })
```

Casting
-------

```bash
str2float("2.3")
str2nr("3")
float2nr("3.14")
```

Numbers
-------

### Numbers
{: .-prime}

```bash
let int = 1000
let int = 0xff
let int = 0755   " octal
```

See `:help Number`.
See: [Numbers](http://learnvimscriptthehardway.stevelosh.com/chapters/25.html)

### Floats

```bash
let fl = 100.1
let fl = 5.4e4
```

See `:help Float`

### Arithmetic

```bash
3 / 2     "=> 1, integer division
3 / 2.0   "=> 1.5
3 * 2.0   "=> 6.0
```

### Math functions

```bash
sqrt(100)
floor(3.5)
ceil(3.3)
abs(-3.4)

sin() cos() tan()
sinh() cosh() tanh()
asin() acos() atan()
```

Vim-isms
--------

### Execute a command

```bash
execute "vsplit"
execute "e " . fnameescape(filename)
```

Runs an ex command you typically run with `:`. Also see `:help execute`.
See: [Execute a command](http://learnvimscriptthehardway.stevelosh.com/chapters/28.html)

### Running keystrokes

```bash
normal G
normal! G   " skips key mappings

execute "normal! gg/foo\<cr>dd"
```

Use `:normal` to execute keystrokes as if you're typing them in normal mode. Combine with `:execute` for special keystrokes.
See: [Running keystrokes](http://learnvimscriptthehardway.stevelosh.com/chapters/29.html)

### Getting filenames

```bash
echo expand("%")      " path/file.txt
echo expand("%:t")    " file.txt
echo expand("%:p:h")  " /home/you/path/file.txt
echo expand("%:r")    " path/file
echo expand("%:e")    " txt
```

See `:help expand`

### Silencing

```bash
silent g/Aap/p
```

Suppresses output. See `:help silent`

### Echo

```bash
echoerr 'oh it failed'
echomsg 'hello there'
echo 'hello'

echohl WarningMsg | echomsg "=> " . a:msg | echohl None
```


### Settings

```bash
set number
set nonumber
set number!     " toggle
set numberwidth=5
set guioptions+=e
```

### Prompts

```bash
let result = confirm("Sure?")
execute "confirm q"
```

### Built-ins

```bash
has("feature")  " :h feature-list
executable("python")
globpath(&rtp, "syntax/c.vim")

exists("$ENV")
exists(":command")
exists("variable")
exists("+option")
exists("g:...")
```

Mapping
-------
{: .-three-column}

### Mapping commands

```bash
nmap
vmap
imap
xmap
nnoremap
vnoremap
inoremap
xnoremap
...
```

### Explanation

```bash
[nvixso](nore)map
```

```
 │       └ don't recurse
 │
 └ normal, visual, insert,
   eX mode, select, operator-pending
```
{: .-setup}

### Arguments

| `<buffer>` | only in current buffer |
| `<silent>` | no echo |
| `<nowait>` | |

Syntax
------

### Highlights

```bash
hi Comment
  term=bold,underline
  gui=bold
  ctermfg=4
  guifg=#80a0ff
```

### Filetype detection

```bash
augroup filetypedetect
  au! BufNewFile,BufRead *.json setf javascript
augroup END

au Filetype markdown setlocal spell
```

### Conceal

```bash
set conceallevel=2
syn match newLine "<br>" conceal cchar=}
hi newLine guifg=green
```

### Region conceal

```bash
syn region inBold concealends matchgroup=bTag start="<b>" end="</b>"
hi inBold gui=bold
hi bTag guifg=blue
```

### Syntax

```bash
syn match :name ":regex" :flags

syn region Comment  start="/\*"  end="\*/"
syn region String   start=+"+    end=+"+   skip=+\\"+

syn cluster :name contains=:n1,:n2,:n3...

flags:
  keepend
  oneline
  nextgroup=
  contains=
  contained

hi def link markdownH1 htmlH1
```

### Include guards

```bash
if exists('g:loaded_myplugin')
  finish
endif

" ...

let g:loaded_myplugin = 1
```
