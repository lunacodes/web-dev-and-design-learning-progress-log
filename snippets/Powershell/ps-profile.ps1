###### POWERSHELL 6 PROFILE ######

## TABLE OF CONTENTS ##
# ENVIRONMENT SETUP
##  PACKAGE MANAGEMENT
##  POWERSHELL TRICKS
# PS READLINE
# COLORS
# BASH ALIASES AND UNIX
# PROGRAM ALIASES
# CD ALIASES
# GIT ALIASES
# COMPRESSION ALIASES
##  7ZIP ALIASES
##  ZIP ALIASES
# SCSS
## END TABLE OF CONTENTS ##

## ENVIRONMENT SETUP ##
Add-PathVariable "${env:ProgramFiles}\PowerShell\6-preview"

$scripts = "$(split-path $profile)\Scripts"
$modules = "$(split-path $profile)\Modules"
$docs    =  $(resolve-path "$Env:userprofile\documents")
$desktop =  $(resolve-path "$Env:userprofile\desktop")
$PSScriptRoot = $scripts;
$profileDir = $PSScriptRoot;

Set-Alias idlepy "C:\Users\Luna\AppData\Local\Programs\Python\Python36-32\Lib\idlelib\idle.bat"

Import-Module $modules\defaults
Import-Module $modules\unix
# Import-Module $modules\sys-admin
Import-Module posh-git

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

## END ENVIRONMENT SETUP ##


### PACKAGE MANAGEMENT ###
function Get-PS-Module {
  Install-Module $args
}
Set-Alias getmodule Get-PS-Module

function Import-PS-Module {
  Import-Module $args
}
Set-Alias imp Import-PS-Module

function List-PS-Modules {
  Get-Module -ListAvailable
}
Set-Alias lsmods List-PS-Modules

function List-PS-Module-By-Name {
  Get-Module -ListAvailable -Name $args
}
Set-Alias lsmodsname List-PS-Module-By-Name

### END PACKAGE MANAGEMENT ###


### POWERSHELL TRICKS ###
# Close Powershell window, and open new window
function Restart-PowerShell {
  Start-Process pwsh #Launch Powershell host in new window
  exit #Exit existing Powershell Host window
}
Set-Alias rps Restart-PowerShell

# Start a new Powershell window, while keeping current one open
function Start-Powershell {
  Start-Process pwsh
}
Set-Alias nps Start-Powershell

function profile-quick-edit { subl $PROFILE }
Set-Alias sblpr profile-quick-edit
Set-Alias sblrc profile-quick-edit

function update-powershell-profile {
  & $profile
}
Set-Alias sbrc update-powershell-profile

### END POWERSHELL TRICKS ###


## PS READLINE ##
# Emacs style tab completions
function Set-Emacs-Tab-Completions {Set-PSReadlineOption -EditMode Emacs }
Set-Alias emacs Set-Emacs-Tab-Completions

# Get List of PS Readline Settings
function Get-PS-Readline-Options { Get-PSReadlineOption }
Set-Alias gpsro Get-PS-Readline-Options
## END PS READLINE ##


## COLORS ##
function prompt {
  # Write-Host $(limit-HomeDirectory("$pwd")) -ForegroundColor Yellow -NoNewline
  $ESC = [char]27
  $time = Get-Date -UFormat %I:%M%p
  $tmp = $(get-Location).Path.Split("\")
  $myPrompt ="$ESC[1;36m" + $time + " " + "$ESC[1;34m" + "~\" + $tmp[($tmp.count-3)] + "\" + $tmp[($tmp.count-2)] + "\" + $tmp[($tmp.count-1)]

  # $tmp = $(get-Location).Path.Split("\")
  # $tmpStr = $tmp[($tmp.count-3)] + "\" + $tmp[($tmp.count-2)] + "\" + $tmp[($tmp.count-1)]
  $GitPromptSettings.DefaultPromptSuffix = '`n$'
  # $GitPromptSettings.DefaultPromptSuffix = ' $((Get-History -Count 1).id + 1)$(">" * ($nestedPromptLevel + 1)) '
  $GitPromptSettings.DefaultPromptPath = $myPrompt
  $prompt += & $GitPromptScriptBlock

  if ($prompt) { "$prompt " } else { " " }
}

function show-colors { Show-TMOutputColor }
Set-Alias colors show-colors

## END COLORS ##


## BASH ALIASES AND UNIX ##
function list-all {
  $ls_hidden_dir = Get-ChildItem -Force -Hidden -Directory $args
  $ls_all_files = Get-ChildItem $args
  $ls_types = $ls_hidden_dir, $ls_all_files

  foreach($i in $ls_types) {
    echo $i
  }
}
Set-Alias lsa list-all

function list-dirs {
  # (gci -Path .\ *.*|Resolve-Path -Relative) -replace "\.",""
  (ls -Directory | Resolve-Path -Relative) -replace "\.", ""
}
Set-Alias lsd list-dirs

function list-dirs-pipe-output-to-file {
  (gci -Path .\ *.*|Resolve-Path -Relative) -replace "\.","" | Out-File -FilePath output.txt -Encoding ascii}
Set-Alias lsdp list-dirs-pipe-output-to-file

function list-dirs-recurse-depth-2 {
  (gci -Path .\ -Recurse -Depth 2 *.*|Resolve-Path -Relative) -replace "\.",""
}
Set-Alias lsdr list-dirs-recurse-depth-2

function list-dirs-pipe-depth-2 {
  (gci -Path .\ -Recurse -Depth 2 *.*|Resolve-Path -Relative) -replace "\.","" | Out-File -FilePath output.txt -Encoding ascii
}
Set-Alias lsdrp list-dirs-pipe-depth-2

function open-git-bash {
  start 'C:\Program Files\Git\bin\sh.exe' $args
}
Set-Alias gbash open-git-bash

function vi ($File){
    bash -c "vi $File"
}

function nano ($File){
    bash -c "nano $File"
}
## END BASH ALIASES AND UNIX ##


## PROGRAM ALIASES ##
function short-sublime { subl }
Set-Alias sbl short-sublime

function pswget($url, $output) {
  Invoke-WebRequest -Uri $url -OutFile $output
  Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
}

## END PROGRAM ALIASES ##


## CD ALIASES ##
function cd-glennys { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\glennys\public_html\wp-content\themes\riverhouse }
Set-Alias glennys cd-glennys

function cd-home { cd C:\Users\Luna\ }
Set-Alias home cd-home

function cd-haseph { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\haseph\public_html\wp-content\themes\haSepharadi }
Set-Alias haseph cd-haseph

function cd-haseph-public-html { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\haseph\public_html\ }
Set-Alias hspub cd-haseph-public-html

function cd-haseph-wp-content { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\haseph\public_html\wp-content }
Set-Alias hswpc cd-haseph-wp-content

function cd-lunacodes { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\lunacodes\public_html\wp-content\themes\lunacodes }
Set-Alias lunacodes cd-lunacodes

function cd-ps-home { cd C:\Users\Luna\Documents\Powershell }
Set-Alias ps-home cd-ps-home

function cd-rakov { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\rakov\public_html\wp-content\themes\rakov }
Set-Alias rakov cd-rakov

function cd-vvv { cd C:\Users\Luna\Documents\vagrant-sites\VVV\ }
Set-Alias vvv cd-vvv

function cd-vvw { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www }
Set-Alias vvw cd-vvw

function cd-webdv { cd 'C:\Users\Luna\Google Drive\Current Freelancing\GitHub - Lunacodes\web-dev-and-design-learning-progress-log\' }
Set-Alias webdv cd-webdv

function cd-zmn { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\haseph\public_html\wp-content\plugins\luna-zemanim-widget }
Set-Alias zmn cd-zmn

## END CD ALIASES ##


## GIT ALIASES ##
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


## COMPRESSION ALIASES ##

### 7ZIP ALIASES ###
# Uses 7Zip4Powershell Package
# function 7Zip-Compress { Compress-7Zip $args }
function 7Zip-Compress($path, $filename) {
  Compress-7Zip -Path $path -ArchiveFileName $filename
}
Set-Alias 7zc 7Zip-Compress

function 7Zip-Expand { Expand-7Zip $args }
Set-Alias 7ze 7Zip-Expand
### END 7ZIP ALIASES ###

### ZIP ALIASES ###
function zip-file($path, $filename) {
  Compress-Archive -Path $path -DestinationPath $filename
}
Set-Alias zip zip-file
function unzip-zip-file($path, $filename) {
  Expand-Archive -Path $path -DestinationPath $filename
}
Set-Alias unzip unzip-zip-file
### END ZIP ALIASES ###

## END COMPRESSION ALIASES ##


## SCSS ##
function sass-compile-style-css { sass style.scss "../style.css"}
Set-Alias scssy sass-compile-style-css
## END SCSS ##

# cd 'C:\Users\Luna\Documents\vagrant-sites\VVV\www'
