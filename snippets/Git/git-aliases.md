# Git Aliases

## Git Aliases - Bash Cheatsheet 1

```sh
# Note: cool way to integrate this here: https://gist.github.com/mwhite/6887990
cite 'about-alias'
about-alias 'common git abbreviations'

# Aliases
alias gcl='git clone'
alias ga='git add'
alias gaa='git add -A'
alias grm='git rm'
alias grmc='git rm --cached'
alias gap='git add -p'
alias gall='git add -A'
alias gf='git fetch --all --prune'
alias gft='git fetch --all --prune --tags'
alias gfv='git fetch --all --prune --verbose'
alias gftv='git fetch --all --prune --tags --verbose'
alias gus='git reset HEAD'
alias gpristine='git reset --hard && git clean -dfx'
alias gclean='git clean -fd'
alias gm="git merge"
alias gmv='git mv'
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias gsu='git submodule update --init --recursive'
alias gl='git pull'
alias glum='git pull upstream master'
alias gpr='git pull --rebase'
alias gpp='git pull && git push'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin'
alias gpu='git push --set-upstream'
alias gpuo='git push --set-upstream origin'
alias gpom='git push origin master'
alias gr='git remote'
alias grmt='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias grao='git remote add origin'
alias grau='git remote add upstream'
alias grmv='git remote remove'
alias gd='git diff'
alias gdmom='git diff master origin/master'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gcam="git commit -v -am"
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gbt='git branch --track'
alias gbm='git branch -m'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gcob='git checkout -b'
alias gct='git checkout --track'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn"
alias gwc="git whatchanged"
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"
alias ggui="git gui"
alias gcsam="git commit -S -am"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gh='cd "$(git rev-parse --show-toplevel)"'

case $OSTYPE in
  darwin*)
    alias gtls="git tag -l | gsort -V"
    ;;
  *)
    alias gtls='git tag -l | sort -V'
    ;;
esac

```

## Git Aliases - Powershell

```sh
# from: https://gist.githubusercontent.com/dunckr/8334213/raw/99de0a4eaca1114edf343fd5823bfb08037dfed5/$profile.ps1
# Remove Defaults
rename-item alias:\gcm gcmd -force
rename-item alias:\gc gct -force
rename-item alias:\gl gll -force

## Not currently using these aliases
# rename-item alias:\gc gk -force
# rename-item alias:\gcm gkm -force
# rename-item alias:\gsn gsnn -force
# rename-item alias:\gm gmm -force


# Git
function git-status { git status }
Set-Alias -Name gst -Value git-status

function git-addall { git add -A }
Set-Alias -Name gaa -Value git-addall

function git-branch { git branch $args }
Set-Alias -Name gb -Value git-branch

function git-diff { git diff $args }
Set-Alias -Name gd -Value git-diff

function git-diff-cached { git diff --cached }
Set-Alias -Name gdc -Value git-diff-cached

function git-diff-master { git diff master }
Set-Alias -Name gdm -Value git-diff-master

function git-diff-dev { git diff dev }
Set-Alias -Name gdd -Value git-diff-dev

function git-commit { git commit $args }
Set-Alias -Name gc -Value git-commit

function git-commit-all { git commit -a }
Set-Alias -Name gca -Value git-commit-all

function git-commit-am { git commit -am $args }
Set-Alias -Name gcam -Value git-commit-am

function git-commit-m { git commit -m $args }
Set-Alias -Name gcm -Value git-commit-m

function git-checkout { git checkout $args }
Set-Alias -Name gco -Value git-checkout

function git-log { git log }
Set-Alias -Name gl -Value git-log

function git-fetch { git fetch }
Set-Alias -Name gf -Value git-fetch

function git-rebase-continue { git rebase --continue }
Set-Alias -Name grc -Value git-rebase-continue

function git-clone { git clone $args }
Set-Alias -Name gcl -Value git-clone

function git-remote { git remote $args }
Set-Alias -Name gr -Value git-remote

function git-remote-view { git remote -v }
Set-Alias -Name grv -Value git-remote-view

function git-remote-add { git remote add $args }
Set-Alias -Name gra -Value git-remote-add

function git-remote-add-origin { git remote add origin $args }
Set-Alias -Name gro -Value git-remote-add-origin

function git-push-origin-master { git push origin master $args }
Set-Alias -Name gpom -Value git-push-origin-master

function git-remote-remove { git remote remove $args }
Set-Alias -Name gmrv -Value git-remote-remove

# Misc
function back-dir { cd .. }
Set-Alias -Name .. -Value back-dir
```
