# My Powershell Profile

```powershell
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function Restart-PowerShell {
    Start-Process Powershell #Launch Powershell host in new window
    exit #Exit existing Powershell Host window
}

# Close Powershell window, and open new window
Set-Alias -Name rps -Value Restart-PowerShell

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

## Git Aliases ##
# Remove Defaults
rename-item alias:\gcm gcmd -force
rename-item alias:\gc gct -force
rename-item alias:\gl gll -force

# Git
function git-status { git status }
Set-Alias -Name gst -Value git-status
Set-Alias -Name gs -Value git-status

function git-diff { git diff $args }
Set-Alias -Name gd -Value git-diff

function git-add { git add $args }
Set-Alias -Name ga -Value git-add

function git-commit { git commit $args }
Set-Alias -Name gc -Value git-commit

function git-commit-all { git commit -a }
Set-Alias -Name gca -Value git-commit-all

function git-commit-am { git commit -am $args }
Set-Alias -Name gcam -Value git-commit-am

function git-checkout { git checkout $args }
Set-Alias -Name gco -Value git-checkout

function git-log { git log }
Set-Alias -Name gl -Value git-log

function git-fetch { git fetch }
Set-Alias -Name gf -Value git-fetch

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


```