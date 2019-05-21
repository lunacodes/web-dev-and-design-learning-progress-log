# Powershell Snippets

<!-- MarkdownTOC -->

* [Setup](#setup)
* [Basic Commands](#basic-commands)
  * [Powershell Profile](#powershell-profile)
  * [Aliases](#aliases)
* [Run Multiple Commands](#run-multiple-commands)
* [Chords](#chords)
* [Restart Powershell as Admin](#restart-powershell-as-admin)
  * [Explanation:](#explanation)
* [Diff Files](#diff-files)
* [Copying](#copying)
  * [Copy Directories](#copy-directories)
* [Colors](#colors)
* [Miscellaneous](#miscellaneous)

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

<a id="aliases"></a>
### Aliases

Check if Alias Exists: `Test-Path alias:ls`

Set-Alias example:

```powershell
function Get-PS-Module {
  # Function code here
}
Set-Alias getmodule Get-PS-Module
```

<a id="run-multiple-commands"></a>
## Run Multiple Commands

Running multiple commands in terminal:

```powershell
# Note: see https://superuser.com/questions/612409/how-do-i-run-multiple-commands-on-one-line-in-powershell for more discussion
# around powershell's idiosyncratic behavior
command1; command2; command 3;
```

<a id="chords"></a>
## Chords

```powershell
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

> The following section starts the PowerShell command-line process with Start-Process prompting for user credentials. You may not need this dependent on UAC settings, as you might already get an over-the-shoulder prompt for creds during elevation.
>
> Start-Process powershell.exe -Credential "TestDomain\Me"
>
> The -NoNewWindow parameter re-uses the same PowerShell command window.
>
> Here I’m using -ArgumentList parameter to pass in the second Start-Process leveraging –Verb runAs to force the elevation prompt.
>
> I just saved this PowerShell script to a scratch share on the lab machines, and when I need to elevate and run PowerShell as a different user. I’d just double click on the script. It’s not the most elegant code, but it gets the job done and ideally shows some fairly cool optional parameters of Start-Process.  >

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

# Parameters
[[-ForegroundColor] <ConsoleColor>]
Set-PSReadlineOption -TokenKind Command -ForegroundColor White
Set-PSReadlineOption -TokenKind Command -ForegroundColor White

#Command Line Usage Examples
$Host.PrivateData.ErrorForegroundColor = "White"
$host.ui.rawui.ForegroundColor = <ConsoleColor>
$Host.PrivateData.ErrorForegroundColor = <ConsoleColor>
$Host.PrivateData.WarningForegroundColor = <ConsoleColor>
$Host.PrivateData.DebugForegroundColor = <ConsoleColor>
$Host.PrivateData.VerboseForegroundColor = <ConsoleColor>
$Host.PrivateData.ProgressForegroundColor = <ConsoleColor>
```

<a id="miscellaneous"></a>
## Miscellaneous

```powershell
# Turn off bell for hitting backspace at beginning of prompt
Set-PSReadlineOption -BellStyle None
```
