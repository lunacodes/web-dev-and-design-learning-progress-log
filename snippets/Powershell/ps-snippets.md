# Powershell Snippets

<!-- MarkdownTOC -->

* [Setup](#setup)
* [Basic Commands](#basic-commands)
  * [Powershell Profile](#powershell-profile)
  * [History](#history)
  * [Aliases](#aliases)
    * [Overriding Powershell Defaults](#overriding-powershell-defaults)
* [Chords](#chords)
* [Restart Powershell as Admin](#restart-powershell-as-admin)
  * [Explanation:](#explanation)
* [Diff Files](#diff-files)
* [Copying](#copying)
  * [Copy Directories](#copy-directories)
* [Colors](#colors)
* [Download Files](#download-files)
* [Miscellaneous](#miscellaneous)
* [To Add](#to-add)

<!-- /MarkdownTOC -->

<a id="setup"></a>
## Setup

[Mike MacCana - Powershell Profile - How To Set Up Windows Console If You've Been Using \*nix For 20 Years](https://github.com/mikemaccana/powershell-profile)

<a id="basic-commands"></a>
## Basic Commands

<a id="powershell-profile"></a>
### Powershell Profile

* Find Profile path by typing `$PROFILE`
* Edit with `subl $PROFILE`
* Find Powershell version `$PSVersionTable.PSVersion`

<a id="history"></a>
### History

`Invoke-History` is really buggy - don't use!!

`F8`: search the history for a particular command. Example: `p`, `F8` will let you cycle through all the previous `p` commands beginning with p. Hold `Shift` + `F8` to cycle in reverse

<a id="aliases"></a>
### Aliases

Set-Alias example:

```powershell
# Check if module exists
function Get-PS-Module {
  # Function code here
}
Set-Alias getmodule Get-PS-Module
```

Check if Alias Exists: `Test-Path alias:\ls`.
  This might work as `Test-Path alias:ls` too?? Uncertain

```ps
# Check if function exists
if (Test-Path alias:\cd) {
    echo "cd exists"
    rename-item alias:\cd cdo -force
} else {
    echo "no cd"
}
```

<a id="overriding-powershell-defaults"></a>
#### Overriding Powershell Defaults

If `rename-item : The AllScope option cannot be removed from the alias 'cdo'`, the specify `-Option AllScope`

Example:

```ps
Set-Alias -Name dir -Value Set-ChildItemColor -Option AllScope```

Remove Powershell defaults via `foreach`:

```powershell
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
```

<a id="run-multiple-commands"></a>
## Run Multiple Commands

Running multiple commands in terminal:

```powershell
<#Note: see https://superuser.com/questions/612409/how-do-i-run-multiple-commands-on-one-line-in-powershell for more discussion
around powershell's idiosyncratic behavior#>
command1; command2; command 3;```

<!-- (Note: the ``` above need to stay at the end of the line, otherwish the other headings get left out. No idea why) -->

<a id="chords"></a>
## Chords

```powershell
<a id="powershell-key-combinations---aka-chords"></a>
# Powershell Key COmbinations - aka Chords!!
Set-PSReadlineKeyHandler -Chord Ctrl+F -ScriptBlock { google-chrome https://www.facebook.com }

Set-PSReadlineKeyHandler -Chord Ctrl+G -ScriptBlock {
        $message = Read-Host "Please enter a commit message"
        /usr/bin/git commit -m "$message" | Write-Host
        $branch = (/usr/bin/git rev-parse --abbrev-ref HEAD)
        Write-Host "Pushing ${branch} to remote"
        /usr/bin/git push origin $branch | Write-Host
}
```

<a id="restart-powershell-as-admin"></a>
## Restart Powershell as Admin

For a fancier way of doing this, see [here](/scripts/restart-powershell-as-admin.md)

```powershell
from: https://blogs.technet.microsoft.com/benshy/2012/06/04/using-a-powershell-script-to-run-as-a-different-user-elevate-the-process/

Start-Process powershell.exe -Credential "TestDomain\Me" -NoNewWindow -ArgumentList "Start-Process powershell.exe -Verb runAs"
```

<a id="explanation"></a>
### Explanation:

The following section starts the PowerShell command-line process with `Start-Process` prompting for user credentials. You may not need this dependent on UAC settings, as you might already get an over-the-shoulder prompt for creds during elevation.

`Start-Process powershell.exe -Credential "TestDomain\Me"`

The `-NoNewWindow` parameter re-uses the same PowerShell command window.

Here I’m using `-ArgumentList` parameter to pass in the second `Start-Process` leveraging `–Verb runAs` to force the elevation prompt.

I just saved this PowerShell script to a scratch share on the lab machines, and when I need to elevate and run PowerShell as a different user. I’d just double click on the script. It’s not the most elegant code, but it gets the job done and ideally shows some fairly cool optional parameters of Start-Process.

<a id="diff-files"></a>
## Diff Files

```powershell
compare-object (get-content one.txt) (get-content two.txt)
```

<a id="copying"></a>
## Copying

<a id="copy-directories"></a>
### Copy Directories

1. Copy directory:
```powershell
Copy-Item -Path C:\fso -Filter *.jpg -Destination c:\fsox –Recurse
```

2. Copy all files w/ jpg extension in dir:
```powershell
Copy-Item -Path C:\fso -Filter *.jpg -Destination c:\fsox –Recurse
```

<a id="colors"></a>
## Colors

Just Use Concfg instead:
[Concfg - Presets](https://github.com/lukesampson/concfg/blob/master/preset_examples/README.md)

Fancy Snippet:

```powershell
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
```

General:

```powershell
<a id="options-retrieved-via-get-ps-readline-options"></a>
# Options retrieved via Get-PS-Readline-Options
ContinuationPromptForegroundColor : Gray
ContinuationPromptBackgroundColor : Black
DefaultTokenForegroundColor       : White
CommentForegroundColor            : DarkMagenta
KeywordForegroundColor            : DarkGreen
StringForegroundColor             : DarkBlue
OperatorForegroundColor           : DarkRed
VariableForegroundColor           : DarkGreen
CommandForegroundColor            : Blue
ParameterForegroundColor          : DarkGreen
TypeForegroundColor               : DarkGray
NumberForegroundColor             : DarkGray
MemberForegroundColor             : DarkGray
DefaultTokenBackgroundColor       : Black
CommentBackgroundColor            : Black
KeywordBackgroundColor            : Black
StringBackgroundColor             : Black
OperatorBackgroundColor           : Black
VariableBackgroundColor           : Black
CommandBackgroundColor            : Black
ParameterBackgroundColor          : Black
TypeBackgroundColor               : Black
NumberBackgroundColor             : Black
MemberBackgroundColor             : Black
EmphasisForegroundColor           : Cyan
EmphasisBackgroundColor           : Black
ErrorForegroundColor              : Red
ErrorBackgroundColor              : Black

<a id="parameters"></a>
# Parameters
[[-ForegroundColor] <ConsoleColor>]
Set-PSReadlineOption -TokenKind Command -ForegroundColor White
Set-PSReadlineOption -TokenKind Command -ForegroundColor White

<a id="command-line-usage-examples"></a>
#Command Line Usage Examples
$Host.PrivateData.ErrorForegroundColor = "White"
$host.ui.rawui.ForegroundColor = <ConsoleColor>
$Host.PrivateData.ErrorForegroundColor = <ConsoleColor>
$Host.PrivateData.WarningForegroundColor = <ConsoleColor>
$Host.PrivateData.DebugForegroundColor = <ConsoleColor>
$Host.PrivateData.VerboseForegroundColor = <ConsoleColor>
$Host.PrivateData.ProgressForegroundColor = <ConsoleColor>
```

<a id="download-files"></a>
## Download Files

Note: wget and curl are both options in PS6

```powershell
$url = "https://gist.githubusercontent.com/hallettj/64478/raw/f69f6958533da8c7e0af3288bbca38dd33f77564/global-variables-are-bad.js"
$output = "global-variables-are-bad.js"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
```

<a id="miscellaneous"></a>
## Miscellaneous

```powershell
<a id="turn-off-bell-for-hitting-backspace-at-beginning-of-prompt"></a>
# Turn off bell for hitting backspace at beginning of prompt
Set-PSReadlineOption -BellStyle None
```

<a id="to-add"></a>
## To Add

```powershell
# Using Get-childitem to get a list of files modified in the last 3 days

(Get-ChildItem -Path c:\pstbak\*.* -Filter *.pst | ? {
  $_.LastWriteTime -gt (Get-Date).AddDays(-3)
}).Count
```

```ps
# How to get N files in a directory order by last modified date?
Get-ChildItem -Path 'D:\Temp' |
    Where-Object { -not $_.PsIsContainer } |
    Sort-Object LastWriteTime -Descending |
    Select-Object -firs
```

```ps
# Powershell script to list folders that have files with date modified in a range
# Actually this may be iffy. Check further answers here:
# https://community.spiceworks.com/topic/2143488-powershell-script-to-list-folders-that-have-files-with-date-modified-in-a-range
Get-ChildItem 'C:\Filepath -File -Recurse' |
    Where-Object { $_.LastWriteTime -ge '01/01/2015' -and $_.LastWriteTime -le '12/31/2018' } |
    select-Object FullName, LastWriteTime
```

Add in something w/ pushd and popd
