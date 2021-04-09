#!/usr/bin/bash

##  TABLE OF CONTENTS ###
##  Program Aliases ##
##  Config and Sourcing Aliases ##
##  Bash Aliases ##
##  Sys Admin Aliases ##
### PHP Config Aliases ###
##  CD and LS Aliases ##
##  VirtualBox Aliases ##
###  Shared Folder Aliases ###
##  Compression Aliases ##
###  Tar Functions ###
###  7-Zip Functions ###
##  Python Aliases ##
##  JSON Aliases ##
##  Git Aliases ##
##  WPCLI Aliases ##
###  Plugins ###
###  Debugging and Config ###
##  Vagrant Aliases ##
##  SCSS Aliases ##

######################
##  Program Aliases ##
######################
#
alias chrome="start chrome"
alias sbl="/c/Program\ Files/Sublime\ Text\ 3/subl.exe"
alias subl="/c/Program\ Files/Sublime\ Text\ 3/subl.exe"
alias vs='code'

## Config and Sourcing Aliases ##
alias term="bash -c 'echo $TERM'"
alias sbrc='source ~/.bashrc'
# VS Code
alias cbrc='code ~/.bashrc'
alias vsbrc='code ~/.bashrc'
alias cbrca='code ~/.bash_aliases'
alias cbrca='code ~/.bash_aliases'
# Sublime
alias sblrc='subl $( echo ~/.bashrc)'
alias sblrca='subl $( echo ~/.bash_aliases)'
alias sblvimrc='subl ~/.vimrc'
alias sblvmrc='subl ~/.vimrc'
alias sblvrc='subl ~/.vimrc'
#Vim
#The color schemes are hard-coded due to issues with sharing with powershell
alias vi='vi -c ":colo monokai" -c ":colo sublimemonokai"'
alias vim='vim -c ":colo monokai" -c ":colo sublimemonokai"'
alias vm='vim -c ":colo monokai" -c ":colo sublimemonokai"'
alias vbrc='vi ~/.bashrc'
alias vrc='vi ~/.bashrc'
alias vibrc='vi ~/.bashrc'
alias vbrca='vi ~/.bash_aliases'
alias vimrc='vi ~/.vimrc'
alias vmrc='vi ~/.vimrc'
alias vmrcbak='cp ~/.vimrc ~/.vimrc.bak'
alias vmrcbk='cp ~/.vimrc ~/.vimrc.bak'
alias vmrcbky='cp -f  ~/.vimrc ~/.vimrc.bak'

##################
## Bash Aliases ##
##################

alias bashreload="source ~/.bashrc && echo Bash config reloaded"
alias bk='backupf'
alias bkrm='backupfrm'
alias cmds='ls /bin'
alias cp="cp -v"
alias cpf='cp -f'
alias cpsafe='cp -n' # No Clobber - don't overwrite files
alias cpr='cp -r'
alias cprn='cp -rn'
alias diff='colordiff'
# Print remembered dirs - 1 per line
# Use with pushd and popd
alias dirs='dirs -p'
# alias du='du -h'
alias duh='du -h'
alias duhs='du -hs'
alias du10='du -sk * | sort -n | tail' # List 10 largest dirs in current dir
alias grep="grep --color" # Usage: grep str/pattern dir
alias grepp="grep -P --color"
alias h='history'
alias l='ls -lah --color=auto' # long list
alias ld='ls -dlh */ --color=auto' # dirs long list
alias ll='ls -lah --color=auto' # all files, long list
alias lh='ls -d .* --color=auto' # hidden files
alias l.='ls -d .* --color=auto' # hidden files
alias ls='ls -a --color=auto'
alias lsa='ls -a --color=auto'
alias lsd='ls -d */ --color=auto'
# scrollable output of ls
alias lsls='ls | less'
alias lsx='ls -X' # sort by extension name
alias lx='l -X' # long list by extension name
alias lz='l -S' #sort by file size
alias lsz='ls -S'
# Create parent directories on demand
alias mkpdir='mkdir -pv'
alias mv="mv -v"
alias now='date +"%T"'
# alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias path='echo -e ${PATH//:/\\n}'
# do not delete / or prompt if deleting more than 3 files at a time #
# alias rm='rm -I --preserve-root'
# alias rm="rm -vi"
alias rm='rm -v'
alias rmd='rm -dv' # Remove Directory
alias rmdf='rm -dfv' # rmd no prompt
alias rmr='rm -r'
alias rmrf='rm -rf'
alias rmrfr='rm -rf -r'
# do not treat '/' specially
alias rmnpr='rm --no-preserve-root'
alias tree='tree -a -C' # colors
alias treed='tree -a -C -d' # all dirs, including hidden
alias treedmax='tree -a -C -d -L' # max-dept
alias treenc='tree -a'
alias treesz='tree -a -C -s' # size
alias treemax='tree -f -a -C -L' # max-dept
alias treemax2='tree -a -C -L 2' # max-dept
# alias tree='cmd //c tree //a'
# Safety Nets
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

function backupf() {
    cp "$1" "$1.bak"
}

function backupfrm() {
    cp "$1" "$1.bak"
    rm "$1"
}

function dumax() {
    du -h --max-depth="$1"
}

function lsgrep() {
    ls "$1" | grep --color $2
}

function man() {
    "$1" --help
}

function version() {
    echo "$BASH_VERSION"
}

function nanobk() {
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read -r nul
    cp "$1" "$1.bak"
    nano "$1"
}

# Automation
function repeat()
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

## Sys Admin Aliases ##
# get web server headers #
alias header='curl -I'
 # find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compressed'
alias mount='mount |column -t'
alias sha1='openssl sha1'

### PHP Config Aliases ###
# alias phpconfig=''
alias phpinfo='php -i;' # cli version
# alias phpinfo='php -c /etc/php/apache2/php.ini -i' # webserver info

## CD and LS Aliases ##
source ~/bin/z.sh # Jump around to different dirs, based on history
alias cd='cd'

alias ..='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
alias .9='cd ../../../../../../../../../'
alias .10='cd ../../../../../../../../../../'
alias .11='cd ../../../../../../../../../../../'
alias .12='cd ../../../../../../../../../../../../'

alias ls1='ls -a --color=auto ../'
alias ls2='ls -a --color=auto ../../'
alias ls3='ls -a --color=auto ../../../'
alias ls4='ls -a --color=auto ../../../../'
alias ls5='ls -a --color=auto ../../../../../'
alias ls6='ls -a --color=auto ../../../../../../'
alias ls7='ls -a --color=auto ../../../../../../../'

## VirtualBox Aliases ##
alias vbm='VBoxManage'
alias vboffUS='vboff Ubuntu_Server'
# alias vbmoffUS='vboff Ubuntu_Server'
alias vbon='vbstart'
alias vbonUS='VBoxManage startvm Ubuntu_Server --type headless'
# alias vbmon='vbstart'
alias vbmonUS='VBoxManage startvm Ubuntu_Server --type headless'
alias vbmsrun='VBoxManage list runningvms'
alias vbinfUS='vbinfo Ubuntu_Server'
alias vbinfoUS='vbinfo Ubuntu_Server'
alias vbsshluna='ssh luna@192.168.1.25'
### Shared Folder Aliases ###
alias lscommon='ls ~/VirtualBox\ VMs/Ubuntu_Server/Shared/common'
alias common='cd ~/VirtualBox\ VMs/Ubuntu_Server/Shared/common'
alias commonvim='cd ~/VirtualBox\ VMs/Ubuntu_Server/Shared/common/vim'
alias shared='cd ~/VirtualBox\ VMs/Ubuntu_Server/Shared/'
alias ubuntu='cd ~/VirtualBox\ VMs/Ubuntu_Server/Shared/'

alias gitvm='cd /c/Program\ Files/Git/usr/share/vim/vim81/'
alias gvmcolors='cd /c/Program\ Files/Git/usr/share/vim/vim81/colors'
alias gvmcolorsdir='/c/Program\ Files/Git/usr/share/vim/vim81/colors'

function copy_color_scheme {
    cp ~/VirtualBox\ VMs/Ubuntu_Server/Shared/common/vim/"$1".vim /c/Program\ Files/Git/usr/share/vim/vim81/colors/
}

function vbinfo {
    VBoxManage showvminfo "$1"
}
function vboff {
    VBoxManage controlvm "$1" poweroff
}
function vbstart {
    VBoxManage startvm "$1"
}

## Compression Aliases ##
### Tar Functions ###
# archive-name source
targz() {
  tar -zcvf "$1".tar.gz "$2"
}

targzu() {
  tar -zxvf "$1"
}

### 7-Zip Functions ###
# Uses the 7a package

# alias 7z='7z a '
# Usage: 7z archive.7z file1 file2
# Note: for multiple dirs, remove / at end of dir-name
7z() {
    7za a "$1".7z "$2"
}

# Max Compression
7zmax() {
    # Note: may need to use -mx=9 instead?
    7za a "$1".7z "$2" -mx9
}

# Extract Archive
7ze() {
    7za e "$1"
}

# List Archive Contents
7zl() {
    7za l "$1"
}
if [[ 7zl ]]; then
    alias 7zls='7zl'
fi

# Update Archive
7zup() {
  7za u "$1" "$2"
}

## Python Aliases ##
# alias python='/c/Users/lunac/AppData/Local/Programs/Python/Python37/python'
# alias py='/c/Users/lunac/AppData/Local/Programs/Python/Python37/python'

## JSON Aliases ##
# Json tools (pipe unformatted to these to nicely format the JSON)
alias json="python -m json.tool"
alias jsonf="python -m json.tool"

## Git Aliases ##
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
# -a Show local and remote
alias gba='git branch -a'
# gb delete
alias gbd='git branch -d'
# alias gc='git commit -v -m'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -v -am'
# Add uncommitted and unstaged changes to the last commit
alias gcama='git commit -a --amend -C HEAD'
alias gcfg='git config'
alias gcfgls='git config -l'
alias gcfglsg='git config --global -l'
alias gcl='git clone'
alias gco='git checkout'
alias gcom='git checkout master'
alias gd='git diff'
alias gdf='git diff --diff-filter'
# Diff Filter Added
alias gda='git diff --diff-filter=A --name-only'
alias gdav='git diff --diff-filter=A'
# Diff filter deleted
alias gdd='git diff --diff-filter=D --name-only'
alias gddv='git diff --diff-filter=D'
# Diff Filter Modified
alias gdm='git diff --diff-filter=M --name-only'
alias gdmv='git diff --diff-filter=M'
alias gdom='git diff master origin/master'
alias gdomn='git diff master origin/master --name-only'
alias gdnm='git diff master origin/master --name-only'
alias gf='git fetch'
alias gfo='git fetch origin master'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gl='git log'
alias gm='git merge'
# List files being tracked under master
alias glst='git ls-tree -r master --name-only'
# List all files that ever existed (including deleted)
# alias glsa='git log --pretty=format: --name-only --diff-filter=A | sort - | sed '/^$/d''
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
alias gs='git status'
alias gp='git push'
alias gpl='git pull'
alias gplom='git pull origin master'
alias gplum='git pull upstream master'
alias gpo='git push origin'
alias gpod='git push origin --delete'
alias gpom='git push origin master'
alias gpomf='git push origin master -f'
alias grm='git rm'
alias grv='git remote -v'
alias gra='git remote add'
alias grao='git remote add origin'
alias grau='git remote add upstream'
alias grmc='git rm --cached'
alias grmcr='git rm --cached -r'
alias grmt='git remote'
alias grmv='git remote remove'
alias gwc="git whatchanged"
alias sblgi='subl .gitignore'

## WPCLI Aliases ##
### Plugins ###
alias wpla='wp plugin activate'
alias wpld='wp plugin deactivate'
alias wplg='wp plugin get'
alias wpflsh='wp cache flush'
alias wplrm='wp plugin delete'
alias wpls='wp plugin list'
alias wplsa='wp plugin list --status=active'
alias wplsi='wp plugin list --status=inactive'
alias wplsr='wp plugin search'
alias wplu='wp plugin update'
alias wplua='wp plugin update --all'
alias wpup='wp core update'

### Debugging and Config ###
wp_debug_on () {
    wp config set WP_DEBUG true
    wp config set WP_DEBUG_LOG true
    wp config set WP_DEBUG_DISPLAY true
    wp config set SCRIPT_DEBUG true
}
alias wpdbgon='wp_debug_on'

wp_debug_off () {
    wp config set WP_DEBUG false
    wp config set WP_DEBUG_LOG false
    wp config set WP_DEBUG_DISPLAY false
    wp config set SCRIPT_DEBUG false
}
alias wpdbgoff='wp_debug_off'
alias wpcfgls='wp config get'
alias wpcfset='wp config set'

## Vagrant Aliases ##
alias gclv='git clone https://github.com/Varying-Vagrant-Vagrants/VVV.git'
alias vgup='vagrant up';
alias vgupr='vagrant up --provision';
alias vgrl='vagrant reload';
alias vgrs='vagrant reload';
alias vgrsp='vagrant reload --provision';
# VV tab completions
# source $( echo ~/Documents/vagrant-dev$VVVich vv)-completions)
# source ~/Documents/vagrant-dev/VVV/vv/vv-completions

## SCSS Aliases ##
alias scssy='sass style.scss ../style.css';

# function findir {
#     ls . --recursive --color=auto -d
# }
# export -f findir

