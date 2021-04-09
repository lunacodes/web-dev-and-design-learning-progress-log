## Powershell Scripting Snippets

<!-- MarkdownTOC -->

* [Functions](#functions)
	* [Data Types](#data-types)
	* [Parameters](#parameters)
* [Linting and Testing](#linting-and-testing)
	* [PSScriptAnalyzer:](#psscriptanalyzer)
* [Diagnostics](#diagnostics)
	* [Timing Scripts and Modules](#timing-scripts-and-modules)

<!-- /MarkdownTOC -->

<a id="functions"></a>
## Functions

<a id="data-types"></a>
### Data Types

```powershell
The most common DataTypes used in PowerShell are listed below.

 [string]    Fixed-length string of Unicode characters
 [char]      A Unicode 16-bit character
 [byte]      An 8-bit unsigned character

 [int]       32-bit signed integer
 [long]      64-bit signed integer
 [bool]      Boolean True/False value

 [decimal]   A 128-bit decimal value
 [single]    Single-precision 32-bit floating point number
 [double]    Double-precision 64-bit floating point number
 [DateTime]  Date and Time

 [xml]       Xml object
 [array]     An array of values
 [hashtable] Hashtable object
```

<a id="parameters"></a>
### Parameters

```powershell
# Simple Params:
param($paramName)

# Setting Parameter Default Values:
function Start-WinVi {
  param(
    [string]
    $file = ''
  )

  Start-Process 'C:\Program Files (x86)\Vim\vim81\vim.exe' -ArgumentList "$file", '-c ":colo sublimemonokai"'
}
```

<a id="linting-and-testing"></a>
## Linting and Testing

<a id="psscriptanalyzer"></a>
### PSScriptAnalyzer:

```powershell
Invoke-ScriptAnalyzer -Path ./archiveScript.ps1 -Settings ./PSScriptAnalyzerSettings.psd1
```

<a id="diagnostics"></a>
## Diagnostics

<a id="timing-scripts-and-modules"></a>
### Timing Scripts and Modules

```powershell
# Create timer
$timer = New-Object -TypeName System.Diagnostics.Stopwatch
# Create and immediately start timer
$timer =  [system.diagnostics.stopwatch]::StartNew()
$timer.Start()
$timer.Stop() # Can't be called directly on [system.diagnostics.stopwatch]::
# Needs an actual object to refer to

# Total seconds - with trailing decimal places
$secs = $timer.Elapsed.TotalSeconds
# Total seconds - no trailing decimal places
$prettySecs =  [math]::Round($timer.Elapsed.TotalSeconds,0)

## Example 1: Getting Script And Module Load Times:
foreach ( $includeFile in $imports_list ) {
    $timer =  [system.diagnostics.stopwatch]::StartNew()
    Unblock-File $scripts\$includeFile.ps1
    . "$scripts\$includeFile.ps1"
    $time_str = "$includeFile.ps1: " + $timer.Elapsed.TotalSeconds
    echo $time_str
    $timer.Stop()
}

```
