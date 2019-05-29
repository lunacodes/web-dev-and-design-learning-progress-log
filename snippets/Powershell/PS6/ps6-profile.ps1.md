###### POWERSHELL 6 PROFILE - LUNA ######

## ENVIRONMENT SETUP ##

# Set-ExecutionPolicy unrestricted
# Get PS Version
# $PSVersionTable.PSVersion

# So we can launch pwsh in subshells if we need
Add-PathVariable "${env:ProgramFiles}\PowerShell\6-preview"
# $env:DOCUMENTS = [Environment]::GetFolderPath("mydocuments")
$scripts = "$(split-path $profile)\Scripts"
$modules = "$(split-path $profile)\Modules"
$docs    =  $(resolve-path "$env:DOCUMENTS")
$desktop =  $(resolve-path "$Env:userprofile\desktop")
$PSScriptRoot = $scripts;
$profileDir = $PSScriptRoot;
$gdrive = $home + '\Google Drive'
$phs = $gdrive + '\Post Hacker School'

$luna_imports_list = (
    "alias",
    "defaults",
    # "openssl",
    # "aws",
    "unix",
    # "development",
    "bash-luna",
    # "colors",
    # "node",
    # Leave other-luna in to ignore annoying , error
    "other-luna"
)
foreach ( $includeFile in $luna_imports_list ) {
    Unblock-File $profileDir\$includeFile.ps1
. "$profileDir\$includeFile.ps1"
}

# Import-Module $modules\defaults
# Import-Module $modules\unix
# Import-Module $modules\sys-admin
Import-Module posh-git

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Emacs Tab Completions
# http://stackoverflow.com/questions/39221953/can-i-make-powershell-tab-complete-show-me-all-options-rather-than-picking-a-sp
# Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

## END ENVIRONMENT SETUP ##

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

function aliases-quick-edit { subl $scripts/alias.ps1 }
Set-Alias sblrca aliases-quick-edit

function update-powershell-profile {
  & $profile
}
Set-Alias sbrc update-powershell-profile

function set-title([string]$newtitle) {
    $host.ui.RawUI.WindowTitle = $newtitle + ' – ' + $host.ui.RawUI.WindowTitle
}

# From http://stackoverflow.com/questions/7330187/how-to-find-the-windows-version-from-the-powershell-command-line
function get-windows-build {
    [Environment]::OSVersion
}

# function disable-windows-search {
#     Set-Service wsearch -StartupType disabled
#     stop-service wsearch
# }


## Note: If I have trouble with this, try disabling my 7z alias
# http://mohundro.com/blog/2009/03/31/quickly-extract-files-with-powershell/
# and https://stackoverflow.com/questions/1359793/programmatically-extract-tar-gz-in-a-single-step-on-windows-with-7zip
function expand-archive([string]$file, [string]$outputDir = '') {
    if (-not (Test-Path $file)) {
        $file = Resolve-Path $file
    }

    $baseName = get-childitem $file | select-object -ExpandProperty "BaseName"

    if ($outputDir -eq '') {
        $outputDir = $baseName
    }

    # Check if there's a tar inside
    # We use the .net method as this file (x.tar) doesn't exist!
    $secondExtension = [System.IO.Path]::GetExtension($baseName)
    $secondBaseName = [System.IO.Path]::GetFileNameWithoutExtension($baseName)

    if ( $secondExtension -eq '.tar' ) {
        # This is a tarball
        $outputDir = $secondBaseName
        write-output "Output dir will be $outputDir"
        7z x $file -so | 7z x -aoa -si -ttar -o"$outputDir"
        return
    }
    # Just extract the file
    7z x "-o$outputDir" $file
}

set-alias unzip expand-archive

function get-path {
    ($Env:Path).Split(";")
}

function Test-FileInSubPath([System.IO.DirectoryInfo]$Child, [System.IO.DirectoryInfo]$Parent) {
    write-host $Child.FullName | select-object '*'
    $Child.FullName.StartsWith($Parent.FullName)
}

# See development.ps1
# function stree {
#     $SourceTreeFolder =  get-childitem ("${env:LOCALAPPDATA}" + "\SourceTree\app*") | Select-Object -first 1
#     & $SourceTreeFolder/SourceTree.exe -f .
# }

# function get-serial-number {
#   Get-CimInstance -ClassName Win32_Bios | select-object serialnumber
# }

# function get-process-for-port($port) {
#     Get-Process -Id (Get-NetTCPConnection -LocalPort $port).OwningProcess
# }

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

# set-location $env:DOCUMENTS
