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
rename-item alias:\gl gll -force

# Git
function git-status { git status }
Set-Alias -Name gst -Value git-status
Set-Alias -Name gs -Value git-status

function git-diff { git diff $args }
Set-Alias -Name gd -Value git-diff

function git-commit-all { git commit -a }
Set-Alias -Name gca -Value git-commit-all

# Note: this is the same as 'git commit -am'
function git-commit-m { git commit -m $args }
Set-Alias -Name gcm -Value git-commit-m
Set-Alias -Name gcam -Value git-commit-m

function git-checkout { git checkout $args }
Set-Alias -Name gco -Value git-checkout

function git-log { git log }
Set-Alias -Name gl -Value git-log

function git-fetch { git fetch }
Set-Alias -Name gf -Value git-fetch

function git-clone { git clone $args }
Set-Alias -Name gcl -Value git-clone

function git-push-origin-master { git push origin master $args }
Set-Alias -Name gpom -Value git-push-origin-master

```