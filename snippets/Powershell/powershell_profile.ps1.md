# My Powershell Profile

```powershell
## IMPORTS ##

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Posh Git
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'

## END IMPORTS ##


function Restart-PowerShell {
  Start-Process Powershell #Launch Powershell host in new window
  exit #Exit existing Powershell Host window
}

# Start a new Powershell window, while keeping current one open
function Start-Powershell {
  Start-Process Powershell
}
Set-Alias -Name nps -Value Start-Powershell

$scripts = "$(split-path $profile)\Scripts"
$modules = "$(split-path $profile)\Modules"
$docs    =  $(resolve-path "$Env:userprofile\documents")
$desktop =  $(resolve-path "$Env:userprofile\desktop")

Set-Alias -Name idlepy -Value "C:\Users\Luna\AppData\Local\Programs\Python\Python36-32\Lib\idlelib\idle.bat"

# Close Powershell window, and open new window
Set-Alias -Name rps -Value Restart-PowerShell


## PS READLINE ##
# Emacs style tab completions
function Set-Emacs-Tab-Completions {Set-PSReadlineOption -EditMode Emacs }
Set-Alias -Name emacs -Value Set-Emacs-Tab-Completions

# Get List of PS Readline Settings
function Get-PS-Readline-Options { Get-PSReadlineOption }
Set-Alias -Name gpsro -Value Get-PS-Readline-Options
## END PS READLINE ##


# Show silent error statuses
function prompt {
  $lastResult = Invoke-Expression '$?'
  if (!$lastResult) {
    Write-Host "Last command exited with error status." -ForegroundColor Red
  }
  Write-Output "${msg}$(
  # Show time as 12:05PM
  Get-Date -UFormat "%I:%M%p"
  # Show current directory
  ) $(Get-Location)> "
}


## COLORS ##

# Options # Black # DarkBlue # DarkGreen # DarkCyan # DarkRed # DarkMagenta # DarkYellow # Gray # DarkGray # Blue # Green # Cyan # Red # Magenta # Yellow # White
$colorScheme = @{
  None      = "DarkGreen";
  Comment   = "Magenta";
  Keyword   = "DarkGreen";
  String    = "Magenta";
  Operator  = "DarkRed";
  Variable  = "DarkGreen";
  Command   = "DarkCyan";
  Parameter = "DarkGreen";
  Type      = "DarkGray";
  Number    = "DarkGreen";
  Member    = "DarkGray";
}

$colorScheme.Keys | % { Set-PSReadlineOption -TokenKind $_ -ForegroundColor $colorScheme[$_] }

function show-colors { Show-TMOutputColor }
Set-Alias -Name colors -Value show-colors

## END COLORS ##


## CD ALIASES ##
function cd-glennys { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\glennys\public_html\wp-content\themes\riverhouse }
Set-Alias -Name glennys -Value cd-glennys
function cd-haseph { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\haseph\public_html\wp-content\themes\haSepharadi }
Set-Alias -Name haseph -Value cd-haseph
function cd-rakov { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\rakov\public_html\wp-content\themes\rakov }
Set-Alias -Name rakov -Value cd-rakov
function cd-webdv { cd 'C:\Users\Luna\Google Drive\Current Freelancing\GitHub - Lunacodes\web-dev-and-design-learning-progress-log\' }
Set-Alias -Name webdv -Value cd-webdv
function cd-zmn { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\haseph\public_html\wp-content\plugins\luna-zemanim-widget }
Set-Alias -Name zmn -Value cd-zmn

## END CD ALIASES ##


## GIT ALIASES ##
# Remove Powershell Defaults
rename-item alias:\gcm gcmd -force
rename-item alias:\gc gct -force
rename-item alias:\gl gll -force

# Git
# Add
function g-add { git add $args }
Set-Alias -Name ga -Value g-add

function ga-all { git add -A }
Set-Alias -Name gaa -Value ga-all

# Branch
function g-branch { git branch $args }
Set-Alias -Name gb -Value g-branch

function gb-checkout { git checkout $args }
Set-Alias -Name gco -Value gb-checkout

function gb-delete { git branch -d $args }
Set-Alias -Name gbd -Value gb-delete

# Clone
function g-clone { git clone $args }
Set-Alias -Name gcl -Value g-clone

# Commit
function g-commit { git commit -v $args }
Set-Alias -Name gc -Value g-commit

function gc-all { git commit -v -a }
Set-Alias -Name gca -Value gc-all

function gc-all-message { git commit -v -am $args }
Set-Alias -Name gcam -Value gc-all-message

function gc-amend { git commit -a --amend -C HEAD }
Set-Alias -Name gcama -Value gc-amend

# Diff
function g-diff { git diff $args }
Set-Alias -Name gd -Value g-diff

function gd-origin-master { git diff master origin/master }
Set-Alias -Name gdom -Value gd-origin-master

# Fetch
function g-fetch { git fetch }
Set-Alias -Name gf -Value g-fetch

function gf-origin-master { git fetch origin master }
Set-Alias -Name gfo -Value gf-origin-master

# Log
function g-log { git log $args }
Set-Alias -Name gl -Value g-log

function gl-changes-only { git log -p }
Set-Alias -Name glp -Value gl-changes-only

function gl-graph-pretty-old { git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative }
Set-Alias -Name ggo -Value gl-graph-pretty-old

function gl-graph-pretty { git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(red)<%an>%Creset' --abbrev-commit --date=relative }
Set-Alias -Name gg -Value gl-graph-pretty

# Not Working - Git Issue
# function gl-since-last-pull { git log HEAD@{1}..HEAD@{0} }
# Set-Alias -Name gnew -Value gl-since-last-pull

# Merge
function g-merge { git merge $args }
Set-Alias -Name gmg -Value g-merge

# Push
function g-push-origin-master { git push origin master $args }
Set-Alias -Name gpom -Value g-push-origin-master

# Remote
function g-remote { git remote $args }
Set-Alias -Name gr -Value g-remote

function gr-view { git remote -v }
Set-Alias -Name grv -Value gr-view

function gr-add { git remote add $args }
Set-Alias -Name gra -Value gr-add

function gr-add-origin { git remote add origin $args }
Set-Alias -Name grao -Value gr-add-origin

function git-remote-remove { git remote remove $args }
Set-Alias -Name grrmv -Value git-remote-remove

# Remove
function g-remove { git rm $args }
Set-Alias -Name grm -Value g-remove

function grm-cached { git rm --cached $args }
Set-Alias -Name grmc -Value grm-cached

function grm-cached-recurse { git rm --cached -r $args }
Set-Alias -Name grmcr -Value grm-cached-recurse

# Status
function g-status { git status }
Set-Alias -Name gst -Value g-status
Set-Alias -Name gs -Value g-status

# Tree
function g-tree-list-files { git ls-tree -r master --name-only }
Set-Alias -Name gtree -Value g-tree-list-files

# What Changed
function g-what-changed { git whatchanged }
Set-Alias -Name gwc -Value g-what-changed

## END GIT ALIASES ##

## SCSS ##
function sass-compile-style-css { sass style.scss "../style.css"}
Set-Alias -Name scssy -Value sass-compile-style-css
## END SCSS ##


## Unused Snippets ##

# Powershell Key COmbinations - aka Chords!!
# Set-PSReadlineKeyHandler -Chord Ctrl+F -ScriptBlock { google-chrome https://www.facebook.com }

# Set-PSReadlineKeyHandler -Chord Ctrl+G -ScriptBlock {
#         $message = Read-Host "Please enter a commit message"
#         /usr/bin/git commit -m "$message" | Write-Host
#         $branch = (/usr/bin/git rev-parse --abbrev-ref HEAD)
#         Write-Host "Pushing ${branch} to remote"
#         /usr/bin/git push origin $branch | Write-Host
# }

# # Turn off bell for hitting backspace at beginning of prompt
# Set-PSReadlineOption -BellStyle None

# Select only files that are Added (A), Copied (C), Deleted (D), Modified (M), Renamed (R), have their type (i.e. regular file, symlink, submodule, …​) changed (T), are Unmerged (U), are Unknown (X), or have had their pairing Broken (B)
# Exclude via lowercase
#
# function git-diff-filter {git diff --diff-filter=ADM }
# Set-Alias -Name gdf -Value git-diff-filter
```
