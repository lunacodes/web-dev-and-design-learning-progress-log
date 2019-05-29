## CD ALIASES ##

# General
function cd-home { cd $home\ }
Set-Alias home cd-home

function cd-ps-home { cd $docs\Powershell }
Set-Alias ps-home cd-ps-home

function cd-post-hacker-school {cd $phs }
Set-Alias phs cd-post-hacker-school

function cd-webdv {
  $webdv_path = $home + '\Google Drive\Current Freelancing\GitHub - Lunacodes\web-dev-and-design-learning-progress-log\'
  cd $webdv_path }
Set-Alias webdv cd-webdv

function cd-webdvs {
  $webdvs_path = $home + '\Google Drive\Current Freelancing\GitHub - Lunacodes\web-dev-and-design-learning-progress-log\Snippets'
  cd $webdvs_path }
Set-Alias webdvs cd-webdvs

# Vagrant & Dev Sites
function cd-glennys { cd $docs\vagrant-dev\VVV\www\glennys\public_html\wp-content\themes\riverhouse }
Set-Alias glennys cd-glennys

function cd-haseph { cd $docs\vagrant-dev\VVV\www\haseph\public_html\wp-content\themes\haSepharadi }
Set-Alias haseph cd-haseph

function cd-haseph-public-html { cd $docs\vagrant-dev\VVV\www\haseph\public_html\ }
Set-Alias hspub cd-haseph-public-html

function cd-haseph-wp-content { cd $docs\vagrant-dev\VVV\www\haseph\public_html\wp-content }
Set-Alias hswpc cd-haseph-wp-content

function cd-lunacodes { cd $docs\vagrant-dev\VVV\www\lunacodes\public_html\wp-content\themes\lunacodes }
Set-Alias lunacodes cd-lunacodes

function cd-rakov { cd $docs\vagrant-dev\VVV\www\rakov\public_html\wp-content\themes\rakov }
Set-Alias rakov cd-rakov

function cd-vvv { cd $docs\vagrant-dev\VVV\ }
Set-Alias vvv cd-vvv

function cd-vvw { cd $docs\vagrant-dev\VVV\www }
Set-Alias vvw cd-vvw

function cd-zmn { cd $docs\vagrant-dev\VVV\www\haseph\public_html\wp-content\plugins\luna-zemanim-widget }
Set-Alias zmn cd-zmn


## COMPRESSION ALIASES ##
# 7Zip (Uses 7Zip4Powershell Package)
function 7Zip-Compress($path, $filename) {
  Compress-7Zip -Path $path -ArchiveFileName $filename
}
Set-Alias 7zc 7Zip-Compress

function 7Zip-Expand { Expand-7Zip $args }
Set-Alias 7ze 7Zip-Expand

# Zip
function zip-file($path, $filename) {
  Compress-Archive -Path $path -DestinationPath $filename
}
Set-Alias zip zip-file
function unzip-zip-file($path, $filename) {
  Expand-Archive -Path $path -DestinationPath $filename
}
Set-Alias unzip unzip-zip-file


## GIT ALIASES ##

function gg {
  # Replace file:linenumber:content with file:linenumber:content
  # so you can just click the file:linenumber and go straight there.
  & git grep -n -i @args | foreach-object { $_ -replace '(\d+):','$1 ' }
}

function get-git-ignored {
  git ls-files . --ignored --exclude-standard --others
}

function get-git-untracked {
  git ls-files . --exclude-standard --others
}

# For git rebasing
# --wait required, see https://github.com/Microsoft/vscode/issues/23219
$env:EDITOR = 'code --wait'

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
## Graph
function git-log-graph-pretty-old { git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative }
Set-Alias ggo git-log-graph-pretty-old
function git-log-all-files-ever {
  git log --graph --pretty=format: --name-only --diff-filter=A | sort - | sed '/^$/d'
}
Set-Alias glsa git-log-all-files-ever
function git-log-graph-pretty { git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(red)<%an>%Creset' --abbrev-commit --date=relative }
Set-Alias gg git-log-graph-pretty
function git-graph-stat {
  gg --stat
}
Set-Alias ggs git-graph-stat
function git-log-since-last-pull { git log HEAD~1..HEAD~0 }
Set-Alias gnew git-log-since-last-pull
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

## PROGRAMMING ALIASES

## Powershell
# pretty useless
# function diff-files-same {
#   compare-object (get-content one.txt) (get-content two.txt) -includeequal
# }
# function diff-files-same { compare-object (get-content one.txt) (get-content two.txt) -includeequal }
# Set-Alias diff-same diff-files-same

# function diff-files-diff { compare-object (get-content one.txt) (get-content two.txt) -exclude }
# Set-Alias diff-diff diff-files-diff


Compare-Object (gc $File1) (gc $File2)
# Python
Set-Alias idlepy "$home\AppData\Local\Programs\Python\Python36-32\Lib\idlelib\idle.bat"

# Make Python 3 the default
function python3 { py -3 }
Set-Alias python python3

function start-python2 { py -2 }
Set-Alias python2 start-python2
Set-Alias py2 start-python2

# SCSS
function sass-compile-style-css { sass style.scss "../style.css"}
Set-Alias scssy sass-compile-style-css

# Sublime Text
function short-sublime { subl }
Set-Alias sbl short-sublime

# cd '$docs\vagrant-dev\VVV\www'
