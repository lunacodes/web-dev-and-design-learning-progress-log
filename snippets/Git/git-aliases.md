# Git Aliases

<!-- MarkdownTOC -->

* [Git Aliases - Bash Cheatsheet](#git-aliases---bash-cheatsheet)
	* [Git Aliases - Bash - My List](#git-aliases---bash---my-list)
* [Git Aliases - Powershell](#git-aliases---powershell)
	* [Git Aliases - Powershell - My List](#git-aliases---powershell---my-list)

<!-- /MarkdownTOC -->


<a id="git-aliases---bash-cheatsheet"></a>
## Git Aliases - Bash Cheatsheet

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
alias gfo='git fetch origin master'
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
# Diff Filter Added
alias gda='git diff --diff-filter=A --name-only'
alias gdav='git diff --diff-filter=A'
# Diff filter deleted
alias gdd='git diff --diff-filter=D --name-only'
alias gddv='git diff --diff-filter=D'
# Diff Filter Modified
alias gdm='git diff --diff-filter=M --name-only'
alias gdmv='git diff --diff-filter=M'
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
# List files being tracked under master
alias glst='git ls-tree -r master --name-only'
# List all files that ever existed (including deleted)
alias glsa='git log --pretty=format: --name-only --diff-filter=A | sort - | sed '/^$/d''
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

<a id="git-aliases---bash---my-list"></a>
### Git Aliases - Bash - My List

```sh
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

# Vagrant
alias gclv='git clone https://github.com/Varying-Vagrant-Vagrants/VVV.git'
alias vgup='vagrant up';
alias vgupr='vagrant up --provision';
alias vgrl='vagrant reload';
alias vgrs='vagrant reload';
alias vgrsp='vagrant reload --provision';
```

<a id="git-aliases---powershell"></a>
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

<a id="git-aliases---powershell---my-list"></a>
### Git Aliases - Powershell - My List

```sh
# Remove Powershell Defaults
foreach ( $name in ("gcm", "gc", "gl") ) {
  if (Test-Path alias:$name) {
    if ( $name -eq "gcm") {
      rename-item alias:\gcm gcmd -force
    } elseif ( $name -eq "gc") {
      rename-item alias:\gc gct -force
    } elseif ( $name -eq "gl" ) {
      rename-item alias:\gl gll -force
    }
  }
}

# Git
# Add
function git-add { git add $args }
Set-Alias ga git-add

function git-add-all { git add -A }
Set-Alias gaa git-add-all

# Branch
function git-branch { git branch $args }
Set-Alias gb git-branch

function git-branch-checkout { git checkout $args }
Set-Alias gco git-branch-checkout

function git-branch-delete { git branch -d $args }
Set-Alias gbd git-branch-delete

# Clone
function git-clone { git clone $args }
Set-Alias gcl git-clone

# Commit
function git-commit { git commit -v $args }
Set-Alias gc git-commit

function git-commit-all { git commit -v -a }
Set-Alias gca git-commit-all

function git-commit-all-message { git commit -v -am $args }
Set-Alias gcam git-commit-all-message

function git-commit-amend { git commit -a --amend -C HEAD }
Set-Alias gcama git-commit-amend

# Diff
function git-diff { git diff $args }
Set-Alias gd git-diff

function gd-origin-master { git diff master origin/master }
Set-Alias gdom gd-origin-master

function gd-origin-master-name-only {
  git diff master origin/master --name-only
}
Set-Alias gdomn gd-origin-master-name-only

# Fetch
function git-fetch { git fetch }
Set-Alias gf git-fetch

function gf-origin-master { git fetch origin master }
Set-Alias gfo gf-origin-master

# Log
function git-log { git log $args }
Set-Alias gl git-log

function git-log-changes-only { git log -p }
Set-Alias glp git-log-changes-only

function git-log-graph-pretty-old { git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative }
Set-Alias ggo git-log-graph-pretty-old

function git-log-graph-pretty { git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(red)<%an>%Creset' --abbrev-commit --date=relative }
Set-Alias gg git-log-graph-pretty

# Not Working - Git Issue
# function git-log-since-last-pull { git log HEAD@{1}..HEAD@{0} }
# Set-Alias gnew git-log-since-last-pull

# Merge
function git-merge { git merge $args }
Set-Alias gmg git-merge

# Pull
function git-pull { git pull $args }
Set-Alias gpl git-pull

# Push
function git-push-origin-master { git push origin master $args }
Set-Alias gpom git-push-origin-master

# Remote
function git-remote { git remote $args }
Set-Alias gr git-remote

function git-remote-view { git remote -v }
Set-Alias grv git-remote-view

function git-remote-add { git remote add $args }
Set-Alias gra git-remote-add

function git-remote-add-origin { git remote add origin $args }
Set-Alias grao git-remote-add-origin

function git-remote-remove { git remote remove $args }
Set-Alias grrmv git-remote-remove

# Remove
function git-remove { git rm $args }
Set-Alias grm git-remove

function git-remove-cached { git rm --cached $args }
Set-Alias grmc git-remove-cached

function git-remove-cached-recurse { git rm --cached -r $args }
Set-Alias grmcr git-remove-cached-recurse

# Status
function git-status { git status }
Set-Alias gst git-status
Set-Alias gs git-status

# Tree
function git-tree-list-files { git ls-tree -r master --name-only }
Set-Alias gtree git-tree-list-files

# What Changed
function git-what-changed { git whatchanged }
Set-Alias gwc git-what-changed

## END GIT ALIASES ##
```
