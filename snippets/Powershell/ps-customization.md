# Powershell Customization

<!-- MarkdownTOC -->

* [Setup](#setup)
  * [Profiles](#profiles)
* [Shell Customization](#shell-customization)
  * [Colors](#colors)
  * [Customize the Prompt](#customize-the-prompt)
* [Aliases](#aliases)
  * [Overriding PowerShell Default Aliases](#overriding-powershell-default-aliases)

<!-- /MarkdownTOC -->


<a id="setup"></a>
## Setup

[Mike MacCana - PowerShell Profile - How To Set Up Windows Console If You've Been Using \*nix For 20 Years](https://github.com/mikemaccana/powershell-profile)

<a id="profiles"></a>
### Profiles

```ps
# Check if your profile exists
Test-Path $profile
# List all PS Profiles
$profile | Get-Member -type NoteProperty
```
List all PS Profiles:
Find PowerShell version `$PSVersionTable.PSVersion`

Edit Profile in Vim:
```ps
function Edit-Profile {
  [CmdletBinding()]
  [Alias("ep")]
  PARAM()

  vim $profile
}
```

<a id="shell-customization"></a>
## Shell Customization

```ps
# You can customize the window itself by accessing $Host.UI.RawUI
$window = $Host.UI.RawUI
$window.WindowTitle = "Pa-pa-pa-pa-pa-pa-POWERSHELL"
$window.BackgroundColor = "Black"
$window.ForegroundColor = "Gray"
```

<a id="colors"></a>
### Colors

Just Use [Concfg - Presets](https://github.com/lukesampson/concfg/blob/master/preset_examples/README.md) instead

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

<a id="customize-the-prompt"></a>
### Customize the Prompt

Example:
```ps
function prompt {
  # Sample Output:
  # ~/Documents/blog
  # PS [102] master ->
  $loc = (Get-Location).Path.Replace("$HOME", "~")
  $gitBranch = git branch | Select-String "\*"
  if (!$gitBranch) {
    $gitBranch = ""
  } else {
    $gitBranch = $gitBranch.ToString().Replace("`* ", "")
  }
  $histCount = (Get-History | Measure-Object).count
  Write-Host -ForegroundColor yellow "`n $loc"
  Write-Host -NoNewLine "PS [$histCount] $gitBranch ->"
  return " "
}
```

<a id="aliases"></a>
## Aliases

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

<a id="overriding-powershell-default-aliases"></a>
### Overriding PowerShell Default Aliases

If `rename-item : The AllScope option cannot be removed from the alias 'cdo'`, the specify `-Option AllScope`

Example:

```ps
Set-Alias -Name dir -Value Set-ChildItemColor -Option AllScope

# Remove PowerShell defaults via `foreach`:

powershell
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
