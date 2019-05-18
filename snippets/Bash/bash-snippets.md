# Bash Snippets

<!-- MarkdownTOC -->

* [Shell Basics](#shell-basics)
	* [Customizing The Command Prompt](#customizing-the-command-prompt)
	* [Navigation](#navigation)
* [Packages](#packages)
* [File Commands](#file-commands)
	* [File Command Examples](#file-command-examples)
* [User Prompts](#user-prompts)
* [Piping Tricks](#piping-tricks)

<!-- /MarkdownTOC -->

<a id="shell-basics"></a>
## Shell Basics

```sh
#!/bin/bash
env                             # displays all environment variables
echo $SHELL                     # displays the shell you're using
echo $BASH_VERSION              # displays bash version
where bash                      # find where bash is on    your system
which bash                      # finds out which program is executed as 'bash' (default: /bin/bash, can change across environments)
clear                           # clears content, no scrollback
ctrl+l                          # clears window content, but allows for scrollback

```

<a id="customizing-the-command-prompt"></a>
### Customizing The Command Prompt

* See [bash-customization.md](bash-customization.md) for more.
* See [ArchWiki - Bash/Prompt customization](https://wiki.archlinux.org/index.php/Bash/Prompt_customization) for much more

Normal Prompt:
`Luna@DESKTOP-AC4AJ8A MINGW64 ~/Documents/vagrant-sites/vvv/www (develop)`


```sh
# Normal - User + MINGW 64 + long pwd
PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$'
# Preferred - User + long pwd + git
PS1='\[\033]0;]\n\[\033[32m\]\u \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '

# PWD Depth
PROMPT_DIRTRIM=1

# Without Colors
# User + MINGW 64 + long pwd
PS1='\u MINGW64 \w\$ '
# User + host + long pwd
PS1='\u@\H MINGW64 \w\$ '
# User + long pwd
PS1='\u \w\$ '
# User + short pwd
PS1='\u \W\$ '

# With Colors
# User + host + long pwd + git
PS1='\[\033]0;$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\] \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
# User + long pwd + git
PS1='\[\033]0;]\n\[\033[32m\]\u \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
# User + short pwd + git
PS1='\[\033]0;]\n\[\033[32m\]\u \[\033[33m\]\W\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '

```

**ANSI Escape Sequences Used Above**
```sh
33 = Yellow

```

Explanation:

```
non-printing escape sequences have to be enclosed in \[\033[ and \]

Black       0;30     Dark Gray     1;30
Blue        0;34     Light Blue    1;34
Green       0;32     Light Green   1;32
Cyan        0;36     Light Cyan    1;36
Red         0;31     Light Red     1;31
Purple      0;35     Light Purple  1;35
Brown       0;33     Yellow        1;33
Light Gray  0;37     White         1;37

So, if you want your console prompt to be blue, you would use the following escape sequence (in the filename I'm forgetting):

\[\033[34m\]

more: https://askubuntu.com/questions/831971/what-type-of-sequences-are-escape-sequences-starting-with-033
```

**Default Code in `/etc/bash.bashrc` file**

```sh
# If MSYS2_PS1 is set, use that as default PS1;
# if a PS1 is already set and exported, use that;
# otherwise set a default prompt
# of user@host, MSYSTEM variable, and current_directory
[[ -n "${MSYS2_PS1}" ]] && export PS1="${MSYS2_PS1}"
# if we have the "High Mandatory Level" group, it means we're elevated
#if [[ -n "$(command -v getent)" ]] && id -G | grep -q "$(getent -w group 'S-1-16-12288' | cut -d: -f2)"
#  then _ps1_symbol='\[\e[1m\]#\[\e[0m\]'
#  else _ps1_symbol='\$'
#fi
[[ $(declare -p PS1 2>/dev/null | cut -c 1-11) = 'declare -x ' ]] || \
  export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]$MSYSTEM\[\e[0m\] \[\e[33m\]\w\[\e[0m\]\n'"${_ps1_symbol}"' '
unset _ps1_symbol

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

```
<a id="navigation"></a>
### Navigation

```sh
#!/bin/bash
ctrl-a                          # move to beginning of line
ctrl-d                          # same as delete key
ctrl-e                          # move to end of line
ctrl-k                          # deletes (kill) forward to end of line
ctrl-n                          # next line in command history
ctrl-o                          # same as Return key, then displays next line in command history
ctrl-p                          # previous line in command history
ctrl-t                          # transposes two chars
ctrl-u                          # same as ctrl-backspace, kills backward from point to beggining of line
ctrl-w                          # same as ctrl-shift-backspace, kills the word behind the cursor
ctrl-y                          # retrieves (yank) last item killed
ctrl-z                          # stops current command, resume with fg in the foreground or bg in the background
alt-d                           # deletes next word
!!                              # repeats the last command

```

<a id="packages"></a>
## Packages

Install packages in `/usr/bin/`

<a id="file-commands"></a>
## File Commands

```sh
du                              # disk usage for all dirs
du -a                           # disk usage for all dirs and files
du -c                           # print total disk space usage at the end
du --exclude='pattern'          # exclude files and folders with pattern
du -h                           # human readable format
du -m                           # disk usage in megabytes
du --max-depth                  # maximum number of directories to recurse
du -s                           # single summary for the entire query
du -t                           # disk usage based on time
find dir -name "php"            # list all files, dirs named "php"
find . -iname "php"             # case-insensitive list all items named "php"
find . -maxdepth 1
find . -print0                  # prints filenames followed by a null char instead of a newline
find . -type                    # list items of type f (files) or d (dirs)
gzip -d file.gz                 # gzip file
gunzip file.gz                  # un-gzip file
ls -a                           # list all files including hidden file starting with '.'
ls --color                      # colored list [=always/never/auto]
ls -d                           # list directories # with ' */'
ls -F                           # add one char of */=>@| to enteries
ls -i                           # list file's inode index number
ls -l                           # list with long format # show permissions
ls -la                          # list long format including hidden files
ls -lh                          # list long format with readable file size
ls -ls                          # list with long format with file size
ls -r                           # list in reverse order
ls -R                           # list recursively directory tree
ls -s                           # list file size
ls -S                           # sort by file size
ls -t                           # sort by time & date
ls -X                           # sort by extension name
mv dir1 dir2                    # no need for recursive
mv dir1 ..                      # mv dir up one dir
mv dir1/* ..                    # mv all files in dir up one dir
$ rm file.txt 2> /dev/null      # redirect error messages to /dev/null??
rm *.xvg                        # delete all .zvg files in current dir
tree                            # list files and folders under current dir
tree dir/                       # list files and folders under specific dir
tree -L 2 dir/                  # limit recursion depth of tree
tree -d                         # list only directories
$ tree -d /etc/ | less          # list directories line by line
tree -a dir/                    # include hidden files and folders
tree -C dir/                    # color your tree

zip -r filename.zip folder      # zip file
zip -r filename.zip folder1 folder2 # add multiple folders to new zip
zip -r filename.zip /path/to/folder1 /path/to/file2
zip -r -e data.zip data/        # encrypt zip file

```

<a id="file-command-examples"></a>
### File Command Examples

```sh
## Disk Usage
# human readable, total at end, max-depth 1, multiple excluded patterns
du -ch --max-depth=1 --exclude='haseph*' --exclude='glennys*' --exclude='lgluna*' --exclude='lunacodes*'

## Find
find . -name "*.7z" -type f     # recursively list all files ending with .7z
find . -name "*.7z*" -type f    # recursively list all files containing .7z
find . -maxdepth 1 -name "*.7z" -type f # list all files in present directory ending in .7z

```

<a id="user-prompts"></a>
## User Prompts

```sh
select                          # select words from a list and execute commands
select_example() {
select FILENAME in *;
do
    echo "$FILENAME";
done;
}

```

<a id="piping-tricks"></a>
## Piping Tricks

```sh
# Delete files ending in extension type. Always check file list first!!
find . -iname '*.psd' -print0 | du -ch --files0-from=-
find . -name "*.psd" -type f -delete
find . -iname '*.psd' -print0 | du -ch --files0-from=- -delete

```
