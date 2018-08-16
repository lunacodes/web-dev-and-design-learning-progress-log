# Powershell Snippets

<!-- MarkdownTOC -->

* [Basic Commands](#basic-commands)
    * [Powershell Profile](#powershell-profile)
* [Run Multiple Commands](#run-multiple-commands)
* [Restart Powershell as Admin](#restart-powershell-as-admin)
    * [Explanation:](#explanation)
* [Diff Files](#diff-files)
* [Copying](#copying)
    * [Copy Directories](#copy-directories)

<!-- /MarkdownTOC -->

<a id="basic-commands"></a>
## Basic Commands

<a id="powershell-profile"></a>
### Powershell Profile

* Find Profile path by typing `$PROFILE`
* Edit with `subl $PROFILE`

<a id="run-multiple-commands"></a>
## Run Multiple Commands

```powershell
# Note: see https://superuser.com/questions/612409/how-do-i-run-multiple-commands-on-one-line-in-powershell for more discussion
# around powershell's idiosyncratic behavior
command1; command2; command 3;
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

