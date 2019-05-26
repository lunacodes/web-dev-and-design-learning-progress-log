#!bash
# Program Aliases
alias subl="/c/Program\ Files/Sublime\ Text\ 3/subl.exe"

# Bash Tab Completions
bind 'set show-all-if-ambiguous off'
bind 'TAB:menu-complete'

# Bash Aliases
alias cpf='cp -f'
# No Clobber - don't overwrite files
alias cpsafe='cp -n'
alias cpr='cp -r'
alias cprn='cp -rn'
alias ls='ls -a --color=auto'
alias lsa='ls -a --color=auto'
alias lsd='ls -d */ --color=auto'
# scrollable output of ls
alias lsls='ls | less'
alias sblrc='subl $( echo ~/.bashrc)'
alias sbrc='source ~/.bashrc'
alias rmr='rm -r'
alias rmrf='rm -rf'
alias rmrfr='rm -rf -r'
alias vbrc='vi ~/.bashrc'
alias vibrc='vi ~/.bashrc'

# CD Aliases
alias glennys='cd ~/Documents/vagrant-sites/vvv/www/glennys/public_html/wp-content/themes/riverhouse'
alias haseph='cd ~/Documents/vagrant-sites/vvv/www/haseph/public_html/wp-content/themes/haSepharadi'
alias hspub='cd ~/Documents/vagrant-sites/vvv/www/haseph/public_html/'
alias hswpc='cd ~/Documents/vagrant-sites/vvv/www/haseph/public_html/wp-content/'
alias luna='cd ~/Documents/vagrant-sites/vvv/www/luna/public_html/wp-content/themes/lunacodes'
alias rakov='cd ~/Documents/vagrant-sites/vvv/www/rakov/public_html/wp-content/themes/rakov'
alias vvv='cd ~/Documents/vagrant-sites/VVV/'
alias vvw='cd ~/Documents/vagrant-sites/VVV/www'
alias vvvw='cd ~/Documents/vagrant-sites/VVV/www'
alias webdv='cd ~/Google\ Drive/Current\ Freelancing/GitHub\ -\ Lunacodes/web-dev-and-design-learning-progress-log/'
alias zmn='cd ~/Documents/vagrant-sites/vvv/www/haseph/public_html/wp-content/plugins/luna-zemanim-widget'

# 7-Zip Functions
# Uses the 7a package

# alias 7z='7z a '
7z() {
    7za a "$1".7z "$2"
}

7zu() {
    7za e "$1"
}

# Git Aliases
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
# alias gc='git commit -v -m'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -v -am'
# Add uncommitted and unstaged changes to the last commit
alias gcama="git commit -a --amend -C HEAD"
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
alias gf='git fetch'
alias gfo='git fetch origin master'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gl='git log'
alias gm='git merge'
# List files being tracked under master
alias glst='git ls-tree -r master --name-only'
# List all files that ever existed (including deleted)
alias glsa='git log --pretty=format: --name-only --diff-filter=A | sort - | sed '/^$/d''
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

# WPCLI Aliases
# Plugins
alias wpla='wp plugin activate'
alias wpld='wp plugin deactivate'
alias wplg='wp plugin get'
alias wplrm='wp plugin delete'
alias wpls='wp plugin list'
alias wplsa='wp plugin list --status=active'
alias wplsi='wp plugin list --status=inactive'
alias wplsr='wp plugin search'
alias wplu='wp plugin update'
alias wplua='wp plugin update --all'
alias wpflsh='wp cache flush'

# Debugging and Config
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

# Vagrant
alias gclv='git clone https://github.com/Varying-Vagrant-Vagrants/VVV.git'
alias vgup='vagrant up';
alias vgupr='vagrant up --provision';
alias vgrl='vagrant reload';
alias vgrs='vagrant reload';
alias vgrsp='vagrant reload --provision';
# VV tab completions
# source $( echo ~/Documents/vagrant-sites$(which vv)-completions)
# source ~/Documents/vagrant-sites/lib/vv/vv-completions

# SCSS
alias scssy='sass style.scss ../style.css';

# Short Prompt
PS1='\[\033]0;]\n\[\033[32m\]\u \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
PROMPT_DIRTRIM=3

# Colors
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -a --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

cd ~/Documents/vagrant-sites/vvv/www/

