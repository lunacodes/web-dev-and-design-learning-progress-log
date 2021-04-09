# Bash Customization

<!-- MarkdownTOC -->

* [Shell Prompt](#shell-prompt)
  * [Colors Reference](#colors-reference)
  * [Default Code](#default-code)
  * [Prompt Variables and Options](#prompt-variables-and-options)
* [Window Title](#window-title)

<!-- /MarkdownTOC -->

<a id="shell-prompt"></a>
## Shell Prompt

<a id="colors-reference"></a>
### Colors Reference

```sh
# non-printing escape sequences have to be enclosed in \[\033[ and \]
Black       0;30     Dark Gray     1;30
Blue        0;34     Light Blue    1;34
Green       0;32     Light Green   1;32
Cyan        0;36     Light Cyan    1;36
Red         0;31     Light Red     1;31
Purple      0;35     Light Purple  1;35
Brown       0;33     Yellow        1;33
Light Gray  0;37     White         1;37

# So, if you want your console prompt to be blue, you would use the following escape sequence (in the filename I'm forgetting):

# \[\033[34m\]

# more: https://askubuntu.com/questions/831971/what-type-of-sequences-are-escape-sequences-starting-with-033
```


<a id="default-code"></a>
### Default Code

Default Code found in `/etc/bash.bashrc` file

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


<a id="prompt-variables-and-options"></a>
### Prompt Variables and Options

* `PS1` – The value of this parameter is expanded (see PROMPTING below) and used as the primary prompt string. The default value is \s-\v\$ .
* `PS2` – The value of this parameter is expanded as with `PS1` and used as the secondary prompt string (i.e. for newlines). The default is `>`
* `PS3` – The value of this parameter is used as the prompt for the select command
* `PS4` – The value of this parameter is expanded as with PS1 and the value is printed before each command bash displays during an execution trace. The first character of `PS4` is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is +

```sh
\a : an ASCII bell character (07)
\d : the date in “Weekday Month Date” format (e.g., “Tue May 26”)
\D{format} :	the format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required
\e : an ASCII escape character (033)
\h : the hostname up to the first ‘.’
\H : the hostname
\j : the number of jobs currently managed by the shell
\l : the basename of the shellâ€™s terminal device name
\n : newline
\r : carriage return
\s : the name of the shell, the basename of $0 (the portion following the final slash)
\t : the current time in 24-hour HH:MM:SS format
\T : the current time in 12-hour HH:MM:SS format
\@ : the current time in 12-hour am/pm format
\A : the current time in 24-hour HH:MM format
\u : the username of the current user
\v : the version of bash (e.g., 2.00)
\V : the release of bash, version + patch level (e.g., 2.00.0)
\w : the current working directory, with $HOME abbreviated with a tilde
\W : the basename of the current working directory, with $HOME abbreviated with a tilde
\! : the history number of this command
\# : the command number of this command
\$ : if the effective UID is 0, a #, otherwise a $
\nnn : the character corresponding to the octal number nnn
\\ : a backslash
\[ : begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
\] : end a sequence of non-printing characters

```

<a id="window-title"></a>
## Window Title

```bash
if test -f /etc/profile.d/git-sdk.sh
then
    TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
    TITLEPREFIX=$MSYSTEM
fi
name=$1
PS1='\[\033]0;$name\007\]' # set window title
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[32m\]'       # change to green
PS1="$PS1"'\u@\h '             # user@host<space>
#PS1="$PS1"'\[\033[35m\]'       # change to purple
#PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
PS1="$PS1"'\w'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if test -f "$COMPLETION_PATH/git-prompt.sh"
    then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        PS1="$PS1"'\[\033[36m\]'  # change color to cyan
        PS1="$PS1"'`__git_ps1`'   # bash function
    fi
fi
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: always $
MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK\'s bash.basrc

```

