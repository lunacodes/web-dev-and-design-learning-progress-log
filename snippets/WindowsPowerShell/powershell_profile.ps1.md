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

# Note: maybe name this "restart" instead?
#
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
```