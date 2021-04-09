# PowerShell Snippets

<!-- MarkdownTOC -->

* [Environment Variables](#environment-variables)
  * [Path](#path)
* [Basic Commands and Modules](#basic-commands-and-modules)
  * [Parameters](#parameters)
    * [Common Parametrs](#common-parametrs)
    * [List Object's Parameters](#list-objects-parameters)
  * [WhatIf and Confirm](#whatif-and-confirm)
  * [Finding and Listing Commands and Modules](#finding-and-listing-commands-and-modules)
    * [Check if Module, Function, or Alias Exists](#check-if-module-function-or-alias-exists)
    * [Display the Function Source Code](#display-the-function-source-code)
    * [Finding the Function File](#finding-the-function-file)
  * [Properties](#properties)
  * [Command History](#command-history)
  * [Run Multiple Commands](#run-multiple-commands)
  * [Loops](#loops)
* [Searching](#searching)
* [Help](#help)
* [Chords \(Key Combinations\)](#chords-key-combinations)
* [Diff Files](#diff-files)
* [Copying](#copying)
  * [Copy Directories](#copy-directories)
* [Download Files](#download-files)
* [Restart PowerShell as Admin](#restart-powershell-as-admin)
  * [Explanation:](#explanation)
* [Miscellaneous](#miscellaneous)
* [Needs Sorting](#needs-sorting)

<!-- /MarkdownTOC -->

See the following files for anything that may not be included here:

**Powershell:**

* [ps-aliases-builtin.md](ps-aliases-builtin.md) -  Built-In Aliases
* [ps-automatic-variables.md](ps-automatic-variables.md) -  Shell and System Variables
* [ps-customization.md](ps-customization.md) - Shell setup and customization.
* [ps-defaults.md](ps-defaults.md) -  Default Variables and Settings
* [ps-fundamentals.md](ps-fundamentals.md) - Conceptual Introduction to How Powershell Works
* [ps-scripting-snippets.md](ps-scripting-snippets.md) - Scripting, Linting, Testing, Etc.

* [ps-sysadmin-snippets.md](ps-sysadmin-snippets.md) - Useful Sys Admin Functions

**BASH to Powershell:**

* [BASH and PowerShell Quick Reference](https://cecs.wright.edu/~pmateti/Courses/233/Labs/Scripting/bashVsPowerShellTable.html) - Table of equivalient commands in Bash and PS

<a id="environment-variables"></a>
## Environment Variables

`Get-Variable` - lists all variables

```powershell
# List Environment Variables
Get-ChildItem env:
# Get content of Specific Environment variable
# Note: These are tab-able
$env:DriverDate
```

<a id="path"></a>
### Path

```powershell
# List contents of Path file, line by line
$Env:Path.Split(';')
path # Apparently the same thing??
```

<a id="basic-commands-and-modules"></a>
## Basic Commands and Modules

<a id="parameters"></a>
### Parameters

<a id="common-parametrs"></a>
#### Common Parametrs

```ps
# The following list displays the common parameters. Their aliases are listed
# in parentheses:

-   Debug (db)
-   ErrorAction (ea)
-   ErrorVariable (ev)
-   InformationAction (infa)
-   InformationVariable (iv)
-   OutVariable (ov)
-   OutBuffer (ob)
-   PipelineVariable (pv)
-   Verbose (vb)
-   WarningAction (wa)
-   WarningVariable (wv)

The risk mitigation parameters are:

-   WhatIf (wi)
-   Confirm (cf)
```

<a id="list-objects-parameters"></a>
#### List Object's Parameters

```powershell
Get-Help $CommandName -Parameter *
```

<a id="whatif-and-confirm"></a>
### WhatIf and Confirm

`-WhatIf` - Don't forget: if you are not sure what a command does, add the `-WhatIf` parameter before executing it. Any command not supporting it will tell you with an error message, and commands that support it will print messages saying what the command would have done, without actually doing anything.

`-Confirm` - similar to `-WhatIf`, except it will ask a question for each sub-operation it is about to execute, only actually executing it when you answer Yes.

<a id="finding-and-listing-commands-and-modules"></a>
### Finding and Listing Commands and Modules

```powershell
Find-Module -Name moduleName | Format-List -Property * # Outputs a pretty-formatted list of the module's properties
Get-Command # lists all the cmdlets, functions, and aliases available
Get-Command * #  gets all types of commands, including all of the non-PowerShell files in the Path environment variable (`$env:Path`), which it lists in the Application command type.
Get-Command command # Imports the particular command for immediate use, unless the query has wildcards
Get-Command -verb new # lists every command whose 2nd half contains 'new'
Get-Command -noun Job # lists every command whose 1st half contains 'job'
Get-Command Get-Alias # Gives Summary of Get-Alias command
Get-Command Get-Alias | Format-List # Verbose output of Get-Command Get-Alias
Get-Help command # print man page for a command
command -? # same thing
```

<a id="check-if-module-function-or-alias-exists"></a>
#### Check if Module, Function, or Alias Exists

```powershell
# Basic:
# Check all the aliases for a given functionGet-Alias -Definition Select-ColorString

function CheckIf-ModuleNotLoaded {
  if (-Not (Get-Module -ListAvailable -Name $module_name)) {
    echo "Error: Module Not Available - $module_name"
  }
 }
Set-Alias modcheck CheckIf-ModuleNotLoaded
```

<a id="display-the-function-source-code"></a>
#### Display the Function Source Code

```powershell
# Can use this for multiple commands at once
Get-Command -ShowCommandInfo $args
```

<a id="finding-the-function-file"></a>
#### Finding the Function File

Get the file defining a function:

```powershell
${function:$name}.File
# Example: grep
# $ ${function:grep}.File
# C:\Users\lunac\OneDrive\Documents\PowerShell\Scripts\unix.ps1
```



<a id="properties"></a>
### Properties

```powershell
Get-Process | Get-Member # lists Object's Properties
(Get-Process)[0] | Format-List # prints the Properties' values.
Get-Process | Select-Object Id, ProcessName -last 20 # Get the Id & Process Name of the last 20 processes
Get-Process | Where-Object WS -gt 150MB # Get processes whose working set (memory usage) > 150 MB

```

<a id="command-history"></a>
### Command History

`Invoke-History` is really buggy - don't use!!

```powershell
# List number of items in history
(Get-History | Measure-Object).count
```

Searching History:
* `F8`: search the history for a particular command.
    * Usage: `p`, `F8` will let you cycle through all the previous `p` commands beginning with p.
    * Hold `Shift` + `F8` to cycle in reverse


<a id="run-multiple-commands"></a>
### Run Multiple Commands

Running multiple commands in terminal:

```powershell
# Note: see https://superuser.com/questions/612409/how-do-i-run-multiple-commands-on-one-line-in-powershell for more discussion around powershell`'s idiosyncratic behavior
command1; command2; command 3;
```

<a id="loops"></a>
### Loops

https://powertoe.wordpress.com/2009/12/14/powershell-part-4-arrays-and-for-loops/

```powershell
$array = @("test1", "test2", "test3")
for ($i=0; $i -lt $array.length; $i++) {
  $array[$i]
}

# Faster method
$array = @("test1", "test2", "test3")
foreach ($element in $array) {
  $element
}

# Pipeline - the foreach reach that is used in the pipeline is actually an alias to ForEach-Object.
# Faster way to write a foreach, but it can incur overhead with large data sets.
# When you use foreach through the pipeline, you're given a special variable to represent the element in your code bloc, $_:
$array = ("test1", "test2", "test3")
$array |foreach {
  $_
}
```

Example: convert dictionary entries to uppercase:

```powershell
Get-Content dictionary.txt | foreach {$_.toupper()}
```

<a id="searching"></a>
## Searching

```powershell
function grep($regex, $dir) {
  if ( $dir ) {
    get-childitem $dir | select-string $regex
    return
  }
  $input | select-string $regex
}

# find
Get-ChildItem -filter *.rb -recurse .
# but for a slightly easier to read version:
Get-ChildItem -filter *.rb -recurse . | Select-Object Name
```

<a id="help"></a>
## Help

* `Update-Help -force` - Update all the help files
* `Get-Help about*` - List all of the "About xyz" Help Pages in PS (excellent way to learn things)
* `help about*` - Same as `Get-Help about*`, except contained within a sub-instance (like `git diff` output)
* `Get-Command` - List currently available commands
* `Get-Help command` - exactly what it sounds like


<a id="chords-key-combinations"></a>
## Chords (Key Combinations)

```powershell
# PowerShell Key COmbinations - aka Chords!!
Set-PSReadlineKeyHandler -Chord Ctrl+F -ScriptBlock { google-chrome https://www.facebook.com }

Set-PSReadlineKeyHandler -Chord Ctrl+G -ScriptBlock {
        $message = Read-Host "Please enter a commit message"
        /usr/bin/git commit -m "$message" | Write-Host
        $branch = (/usr/bin/git rev-parse --abbrev-ref HEAD)
        Write-Host "Pushing ${branch} to remote"
        /usr/bin/git push origin $branch | Write-Host
}
```


<a id="diff-files"></a>
## Diff Files

```powershell
# This is pretty useless b/c of formatting
# If I can pretty format, then it's fine
# Most useful: compare $file1 $file2 -includeequal -excludedifferent
compare-object (get-content one.txt) (get-content two.txt)
```

Compare two versions of a .csv file:

```powershell
$old = Get-Content .\old-roles.csv
$new = Get-Content .\new-roles.csv

Get-Content $old | ForEach-Object {$_.split(":")[1] } > sorted-old-roles.txt
Get-Content $new | ForEach-Object {$_.split(":")[1] } > sorted-new-roles.txt

$newsort = ".\sorted-new-roles.txt"
$oldsort = ".\sorted-old-roles.txt"
Compare-Object $(Get-content $oldsort) $(Get-Content $newsort) -includeequal
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

<a id="restart-powershell-as-admin"></a>
## Restart PowerShell as Admin

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

<a id="miscellaneous"></a>
## Miscellaneous

```powershell
function beep {
  echo `a
}
# Turn off bell for hitting backspace at beginning of prompt
Set-PSReadlineOption -BellStyle None
```

<a id="needs-sorting"></a>
## Needs Sorting

```powershell
# Using Get-childitem to get a list of files modified in the last 3 days

(Get-ChildItem -Path c:\pstbak\*.* -Filter *.pst | ? {
  $_.LastWriteTime -gt (Get-Date).AddDays(-3)
}).Count
```

```powershell
<a id="how-to-get-n-files-in-a-directory-order-by-last-modified-date"></a>
# How to get N files in a directory order by last modified date?
Get-ChildItem -Path 'D:\Temp' |
    Where-Object { -not $_.PsIsContainer } |
    Sort-Object LastWriteTime -Descending |
    Select-Object -firs
```

```powershell
<a id="powershell-script-to-list-folders-that-have-files-with-date-modified-in-a-range"></a>
# PowerShell script to list folders that have files with date modified in a range
<a id="actually-this-may-be-iffy-check-further-answers-here"></a>
# Actually this may be iffy. Check further answers here:
<a id="httpscommunityspiceworkscomtopic2143488-powershell-script-to-list-folders-that-have-files-with-date-modified-in-a-range"></a>
# https://community.spiceworks.com/topic/2143488-powershell-script-to-list-folders-that-have-files-with-date-modified-in-a-range
Get-ChildItem 'C:\Filepath -File -Recurse' |
    Where-Object { $_.LastWriteTime -ge '01/01/2015' -and $_.LastWriteTime -le '12/31/2018' } |
    select-Object FullName, LastWriteTime
```

Add in something w/ pushd and popd
