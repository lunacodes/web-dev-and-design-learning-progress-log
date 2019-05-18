###### POWERSHELL 6 PROFILE ######

## TABLE OF CONTENTS ##
# PACKAGES AND IMPORTS
# PS READLINE
# COLORS
# CD ALIASES
# GIT ALIASES
# SCSS
# Unused Snippets
## END TABLE OF CONTENTS ##

## PACKAGES AND IMPORTS ##
$scripts = "$(split-path $profile)\Scripts"
$modules = "$(split-path $profile)\Modules"
$docs    =  $(resolve-path "$Env:userprofile\documents")
$desktop =  $(resolve-path "$Env:userprofile\desktop")

Set-Alias -Name idlepy -Value "C:\Users\Luna\AppData\Local\Programs\Python\Python36-32\Lib\idlelib\idle.bat"

Import-Module $modules\defaults
Import-Module $modules\unix
Import-Module $modules\sys-admin
Import-Module posh-git

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Install items without further prompts:
# Set-PSRepository -name PSGallery -InstallationPolicy Trusted

### MODULE ALIASES ###
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
### END MODULE ALIASES ###

## END PACKAGES AND IMPORTS ##

# Close Powershell window, and open new window
function Restart-PowerShell {
  Start-Process pwsh #Launch Powershell host in new window
  exit #Exit existing Powershell Host window
}
Set-Alias -Name rps -Value Restart-PowerShell

# Start a new Powershell window, while keeping current one open
function Start-Powershell {
  Start-Process pwsh
}
Set-Alias -Name nps -Value Start-Powershell

function profile-quick-edit { subl $PROFILE }
Set-Alias -Name sblpr -Value profile-quick-edit
Set-Alias -Name sblrc -Value profile-quick-edit

function update-powershell-profile {
  & $profile
}
Set-Alias sbrc update-powershell-profile

## PS READLINE ##
# Emacs style tab completions
function Set-Emacs-Tab-Completions {Set-PSReadlineOption -EditMode Emacs }
Set-Alias -Name emacs -Value Set-Emacs-Tab-Completions

# Get List of PS Readline Settings
function Get-PS-Readline-Options { Get-PSReadlineOption }
Set-Alias -Name gpsro -Value Get-PS-Readline-Options
## END PS READLINE ##


function prompt {
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

## COLORS ##
# Blue      # DarkBlue
# Green     # DarkGreen
# Cyan      # DarkCyan
# Red       # DarkRed
# Magenta   # DarkMagenta
# Yellow    # DarkYellow
# Gray      # DarkGray
# White     # Black

# $colorScheme = @{
#   None      = "Green";
#   Command   = "Red";
#   Comment   = "Magenta";
#   Keyword   = "Green";
#   String    = "Magenta";
#   Operator  = "DarkRed";
#   Variable  = "Green";
#   # Command   = "Cyan";
#   Parameter = "Green";
#   Type      = "Red";
#   Number    = "Green";
#   Member    = "Red";
# }

# $colorScheme.Keys | % { Set-PSReadlineOption -TokenKind $_ -ForegroundColor $colorScheme[$_] }

function show-colors { Show-TMOutputColor }
Set-Alias -Name colors -Value show-colors

## END COLORS ##

## UNIX ALIASES ##
function list-dirs {
  (gci -Path .\ *.*|Resolve-Path -Relative) -replace "\.",""
}
Set-Alias -Name lsd -Value list-dirs

function list-dirs-pipe-output-to-file {
  (gci -Path .\ *.*|Resolve-Path -Relative) -replace "\.","" | Out-File -FilePath output.txt -Encoding ascii}
Set-Alias -Name lsdp -Value list-dirs-pipe-output-to-file

function list-dirs-recurse-depth-2 {
  (gci -Path .\ -Recurse -Depth 2 *.*|Resolve-Path -Relative) -replace "\.",""
}
Set-Alias -Name lsdr -Value list-dirs-recurse-depth-2

function list-dirs-pipe-depth-2 {
  (gci -Path .\ -Recurse -Depth 2 *.*|Resolve-Path -Relative) -replace "\.","" | Out-File -FilePath output.txt -Encoding ascii
}
Set-Alias -Name lsdrp -Value list-dirs-pipe-depth-2

## END UNIX ALIASES ##

## CD ALIASES ##
function cd-glennys { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\glennys\public_html\wp-content\themes\riverhouse }
Set-Alias -Name glennys -Value cd-glennys
function cd-haseph { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\haseph\public_html\wp-content\themes\haSepharadi }
Set-Alias -Name haseph -Value cd-haseph
function cd-haseph-public-html { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\haseph\public_html\ }
Set-Alias -Name hspub -Value cd-haseph-public-html
function cd-rakov { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\rakov\public_html\wp-content\themes\rakov }
Set-Alias -Name rakov -Value cd-rakov
function cd-vvv { cd C:\Users\Luna\Documents\vagrant-sites\VVV\ }
Set-Alias -Name vvv -Value cd-vvv
function cd-vvw { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www }
Set-Alias -Name vvw -Value cd-vvw
function cd-webdv { cd 'C:\Users\Luna\Google Drive\Current Freelancing\GitHub - Lunacodes\web-dev-and-design-learning-progress-log\' }
Set-Alias -Name webdv -Value cd-webdv
function cd-zmn { cd C:\Users\Luna\Documents\vagrant-sites\VVV\www\haseph\public_html\wp-content\plugins\luna-zemanim-widget }
Set-Alias -Name zmn -Value cd-zmn

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

# Git
# Add
function git-add { git add $args }
Set-Alias -Name ga -Value git-add

function git-add-all { git add -A }
Set-Alias -Name gaa -Value git-add-all

# Branch
function git-branch { git branch $args }
Set-Alias -Name gb -Value git-branch

function git-branch-checkout { git checkout $args }
Set-Alias -Name gco -Value git-branch-checkout

function git-branch-delete { git branch -d $args }
Set-Alias -Name gbd -Value git-branch-delete

# Clone
function git-clone { git clone $args }
Set-Alias -Name gcl -Value git-clone

# Commit
function git-commit { git commit -v $args }
Set-Alias -Name gc -Value git-commit

function git-commit-all { git commit -v -a }
Set-Alias -Name gca -Value git-commit-all

function git-commit-all-message { git commit -v -am $args }
Set-Alias -Name gcam -Value git-commit-all-message

function git-commit-amend { git commit -a --amend -C HEAD }
Set-Alias -Name gcama -Value git-commit-amend

# Diff
function git-diff { git diff $args }
Set-Alias -Name gd -Value git-diff

function gd-origin-master { git diff master origin/master }
Set-Alias -Name gdom -Value gd-origin-master

# Fetch
function git-fetch { git fetch }
Set-Alias -Name gf -Value git-fetch

function gf-origin-master { git fetch origin master }
Set-Alias -Name gfo -Value gf-origin-master

# Log
function git-log { git log $args }
Set-Alias -Name gl -Value git-log

function git-log-changes-only { git log -p }
Set-Alias -Name glp -Value git-log-changes-only

function git-log-graph-pretty-old { git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative }
Set-Alias -Name ggo -Value git-log-graph-pretty-old

function git-log-graph-pretty { git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(red)<%an>%Creset' --abbrev-commit --date=relative }
Set-Alias -Name gg -Value git-log-graph-pretty

# Not Working - Git Issue
# function git-log-since-last-pull { git log HEAD@{1}..HEAD@{0} }
# Set-Alias -Name gnew -Value git-log-since-last-pull

# Merge
function git-merge { git merge $args }
Set-Alias -Name gmg -Value git-merge

# Push
function git-push-origin-master { git push origin master $args }
Set-Alias -Name gpom -Value git-push-origin-master

# Remote
function git-remote { git remote $args }
Set-Alias -Name gr -Value git-remote

function git-remote-view { git remote -v }
Set-Alias -Name grv -Value git-remote-view

function git-remote-add { git remote add $args }
Set-Alias -Name gra -Value git-remote-add

function git-remote-add-origin { git remote add origin $args }
Set-Alias -Name grao -Value git-remote-add-origin

function git-remote-remove { git remote remove $args }
Set-Alias -Name grrmv -Value git-remote-remove

# Remove
function git-remove { git rm $args }
Set-Alias -Name grm -Value git-remove

function git-remove-cached { git rm --cached $args }
Set-Alias -Name grmc -Value git-remove-cached

function git-remove-cached-recurse { git rm --cached -r $args }
Set-Alias -Name grmcr -Value git-remove-cached-recurse

# Status
function git-status { git status }
Set-Alias -Name gst -Value git-status
Set-Alias -Name gs -Value git-status

# Tree
function git-tree-list-files { git ls-tree -r master --name-only }
Set-Alias -Name gtree -Value git-tree-list-files

# What Changed
function git-what-changed { git whatchanged }
Set-Alias -Name gwc -Value git-what-changed

## END GIT ALIASES ##

## COMPRESSION ALIASES ##

### 7ZIP ALIASES ###

# Uses 7Zip4Powershell Package
# function 7Zip-Compress { Compress-7Zip $args }
function 7Zip-Compress($path, $filename) {
  Compress-7Zip -Path $path -ArchiveFileName $filename
}
Set-Alias -Name 7zc -Value 7Zip-Compress
function 7Zip-Expand { Expand-7Zip $args }
Set-Alias -Name 7ze -Value 7Zip-Expand
### END 7ZIP ALIASES ###

### ZIP ALIASES ###
function zip-file($path, $filename) {
  Compress-Archive -Path $path -DestinationPath $filename
}
Set-Alias -Name zip -Value zip-file
function unzip-zip-file($path, $filename) {
  Expand-Archive -Path $path -DestinationPath $filename
}
Set-Alias -Name unzip -Value unzip-zip-file
### END ZIP ALIASES ###

## SCSS ##
function sass-compile-style-css { sass style.scss "../style.css"}
Set-Alias -Name scssy -Value sass-compile-style-css
## END SCSS ##

# cd 'C:\Users\Luna\Documents\vagrant-sites\VVV\www'