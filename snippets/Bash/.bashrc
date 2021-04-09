#!/usr/bin/bash

## HISTORY ##
## SHELL OPTIONS ##
## COMMAND PROMPT ##
## COLORS ##
## ALIAS DEFINITIONS ##
## COMPLETIONS ##
## KEYMAP ##
## SSH ##
## FINISH ##

#############
## HISTORY ##
#############

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Immediately add commands to our history instead of waiting for the end of each session
# This enables commands to be available across terminals
# -a append -c clear -r read
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

function hgrep() {
  history | grep "$1"
}

###################
## SHELL OPTIONS ##
###################

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

####################
## COMMAND PROMPT ##
####################

# Color and string variables
green='\[\033]0;]\n\[\033[32m\]'
green2='[\033[01;32m\]'
user='\u'
host='@\h '
pink='\[\033[35m\]'
purple='[\033[01;34m\]'
yellow='\[\033[33m\]'
pwd_abbr='\w'
gitps1='\[\033[36m\]`__git_ps1`'
grey='\[\033[0m'
new_line='\]\n'
prompt='$ '
# PWD Depth (defalt): ~/.../../../pwd
# 1=Shorter, 5=Longer
PROMPT_DIRTRIM=3

# No Host: user + MINGFW64 + ~/../../pwd + (git)
PS1="$green$user$host$pink $MSYSTEM $yellow$pwd_abbr$gitps1$grey$new_line$prompt"

# if [ "#!/bin/bash" == $bash_type ]
# then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\$purple\w\[\033[00m\]\$ '
# fi

############
## COLORS ##
############

# enable color support of ls and also add handy aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -a --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    # alias find='find . -exec ls --color -d {} \;'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#######################
## ALIAS DEFINITIONS ##
#######################

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#################
## COMPLETIONS ##
#################

# Bash Tab Completions
bind 'set show-all-if-ambiguous off'
bind 'TAB:menu-complete'

if [ -f ~/bin/wp-completion.bash ]; then
    . ~/bin/wp-completion.bash
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


############
## KEYMAP ##
############

if [ -f ~/.inputrc ]; then
    . ~/.inputrc
fi

#########
## SSH ##
#########

# Uncomment this if SSH gives me trouble
# eval `ssh-agent -s`
# ssh-add

############
## FINISH ##
############

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

while [[ "$PWD" = "/" ]] ; do
    cd ~/
done

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
