# Bash Aliases

[BASH and PowerShell Quick Reference](https://cecs.wright.edu/~pmateti/Courses/233/Labs/Scripting/bashVsPowerShellTable.html) - Table of equivalient commands in Bash and PS

## My Aliases
```sh
alias subl="/c/Program\ Files/Sublime\ Text\ 3/subl.exe"

alias ls='ls -a --color=auto'
alias lsa='ls -a --color=auto'
alias lsd='ls -d */ --color=auto'
alias sblrc='subl $( echo ~/.bashrc)'
alias sbrc='source ~/.bashrc'
alias rmr='rm -r'
alias rmrf='rm -rf'
alias rmrfr='rm -rf -r'
alias vbrc='vi ~/.bashrc'
alias vibrc='vi ~/.bashrc'

alias gclv='git clone https://github.com/Varying-Vagrant-Vagrants/VVV.git'
alias vgup='vagrant up';
alias vgupr='vagrant up --provision';
alias vgrl='vagrant reload';
alias vgrs='vagrant reload';
alias vgrsp='vagrant reload --provision';

alias scssy='sass style.scss ../style.css';

```

## Other Aliases

```sh
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

for al in `__git_aliases`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done


[alias]
    # one-line log
    l = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short

    a = add
    ap = add -p
    c = commit --verbose
    ca = commit -a --verbose
    cm = commit -m
    cam = commit -a -m
    m = commit --amend --verbose

    d = diff
    ds = diff --stat
    dc = diff --cached

    s = status -s
    co = checkout
    cob = checkout -b
    # list branches sorted by last modified
    b = "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"

    # list aliases
    la = "!git config -l | grep alias | cut -c 7-"


    #other aliases
    rao = remote add origin
    ac = !git add . && git commit -am
    pushitgood = push -u origin --all
    #variation on pushitgood
    po = !echo 'Ah push it' && git push origin && echo 'PUSH IT REAL GOOD'

    undo-commit = reset --soft HEAD~1

    # see comments here, for more: https://gist.github.com/mwhite/6887990
```
