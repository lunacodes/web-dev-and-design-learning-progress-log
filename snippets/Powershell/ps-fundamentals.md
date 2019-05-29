# PowerShell Tutorial (Especially for People Who Hate PowerShell)
https://simpleprogrammer.com/powershell-tutorial/

An edited and condensed version of the above article.

## Everything Is an Object

This is probably the biggest difference that you have to get through your head. In Unix shells, everything is plain text. This makes things nice because you can expect text input into all of your scripts, and you can know that if you output text, everything will probably be OK.

However, the downside is that this makes inspecting specific data a nightmare of text parsing, and it makes working with anything other than text (floating point numbers, anyone?) a real pain.

In PowerShell, which is actually built on top of .NET, **everything is an object**. This will feel very comforting if you’re coming from Python, Ruby, JavaScript, or a similar language background. Let’s see some examples and get our hands dirty. Open up your PowerShell interpreter.

### Get-Process Example

```ps
Get-Process
# You should see a pretty long string of text. We don’t have to stand for that! We’re terminal folk! Try this:


Get-Process | Sort-Object CPU -descending | Select-Object -first 10
# Now you should see a shorter list, reverse sorted by CPU time.
# The important thing to pay attention to here is the headers at the top of each column.
# EACH ROW OF THIS TABLE IS ACTUALLY A System.Diagnostics.Process object, not just a row of a table. Don’t believe me? Just check!

(Get-Process)[0] | Get-TypeData

# See there? The Get-Process command returned a list of Process objects, and we were able to select the first one through indexing (without splitting the output by \n!) and shuffle that through the Get-TypeData command. These items being objects gives us some power. What if we only wanted their ProcessName?

Get-Process | Sort-Object CPU -descending | Select-Object ProcessName -first 10

# The point here is that you can get access any of these row headings (properties) for each item (or all of them)
```


### Objects Have Types
Another side effect of being on top of .NET and having everything be an object is that everything must have a type.

PowerShell usually does a pretty good job of trying to figure out the types that you mean so you can feel as dynamic as with other shells and scripting languages and not have to strictly have types on everything. But, if you really want to enforce a type, you can do so by prepending the object with its type in square brackets.

```ps
"2" + 2
22  # A string
[Int] "2" + 2
4   # An integer.  The conversion only applies to the "2"
```

## Predictable Command Structure

PowerShell commands were designed after a simple pattern: “Verb-Noun.” The creators of PowerShell tried to keep the number of verbs to a minimum. Common ones you’ll see are `Get, New, Add, Clear, Export, Remove, Set, Update, and Write`. The nouns are also usually pretty intuitive: `Process, Item, Object, Date, Job, and Command` are a few.

The other benefit of keeping a consistent pattern is that PowerShell can detect the “verb” and “noun” sections of commands. For example, do you want to see all of the commands with the verb “New”?

`Get-Command -verb new`

In fact, if you know what you want to do, but you can’t remember the command for it, Get-Command is one of a few commands that will be your friend. What if you wanted to see what kinds of things you could do to “Job” objects?

`Get-Command -noun Job`

Get-ChildItem

Get-Alias

## Best Practice for Scripting
Just a word on best practice: When you’re doing command-line work by yourself, feel free to use as many aliases as you want. Alias it up. Get your productivity on.

However, if you’re writing a script or sharing code with someone, it’'s probably best to type the whole command and whole flag-names out. Trust me, your future self and coworkers will thank you.

## Some Useful Commands to Get Started

```ps
When You`'re Not Sure Which Command to Use
Get-Command

# This command will provide you with more information about available commands. You can zero in on what you want by specifying -verb or -noun parameters. In order to get more information about one or two particular commands, pipe the output into Format-List. This will give you the options, location, and some other useful features.

Get-Command Get-Alias | Format-List

# When You’re Not Sure What a Command Does
Get-Help command
# You can also get help by adding the ? parameter
command -?

# Get-Help is roughly the man of the PowerShell world. Are you starting to see the benefits of intuitive commands yet? Actually, Get-Help has quite a few useful flags, as well. It’s probably a good idea to take a look at them using the method we discussed above.

Get-Command Get-Help | Format-List

# Or, if you're feeling cheeky:

Get-Help Get-Help

# When You’re Not Sure What Properties Your Object Has
Get-Process | Get-Member

# Another similar command that also prints out the values is:

(Get-Process)[0] | Format-List

# If you know what data you want, but you just don’t know what it’s called, or if you aren’t even sure what data is available to you, these commands will help you “see” your objects a little better.

# When You Want to Get a Portion of the Data
Get-Process | Select-Object Id, ProcessName -last 20

# Select-Object is your general purpose stuff-whittler. You can specify particular attributes you want, how many you want to see, and which ones.

When You Want to Filter Your Data
Get-Process | Where-Object WS -gt 150MB

There are a few ways to use the Where-Object command, but this is the simplest one. In the example above, I selected only the processes whose working set (memory usage) was greater than 150MB. (Also, can we gush a little about how PowerShell can do KB/MB/GB math?)
```

## Just Tell Me How to Do the Thing!

Basic Unix Commands Translated
```ps
# pwd
Get-Location # or gl or pwd

# ls
Get-ChildItem # or gci or dir or ls

# cd
Set-Location # or sl or chdir or cd

# cp
Copy-Item # or copy or cpi or cp

# mv
Move-Item # or move or mi or mv

# cat
Get-Content # or gc or type

# mkdir
New-Item -ItemType Directory  # use ni for short

# touch
New-Item -ItemType File  # use ni for short

# rm
Remove-Item # or del or erase or ri

# rm -rf
Remove-Item -Recurse -Force

# head or tail
Select-Object -first  # or -last
# usage: Get-Process | Select-Object -first 10

# find
Get-ChildItem -filter *.rb -recurse .
# but for a slightly easier to read version:
Get-ChildItem -filter *.rb -recurse . | Select-Object FullName

Access the Path (and Other Environment Variables)
# In PowerShell, a lot of things get treated like file locations—and the environment variables are no exception. These special groups of file-like variables are called PSDrives. In the same way you can ask the C: drive what file is at “\Users\ryan\Desktop” with a Get-ChildItem C:\Users\ryan\Desktop, you can do the same thing with env:, the environment PSDrive.

Get-ChildItem env:

# And to get to a specific one:
Get-Content env:PATH

# One super neat thing about these PSDrives is that you can actually read a file location like it’s a variable. So you can also get to an environment variable this way:

$env:PATH

This second way is probably the most popular way to get the PATH variable.
```

### Customize My Profile
However, there are additional options. If you want to create a profile that will work for the ISE or the regular command line, you’ll want `$profile.CurrentUserAllHosts`. Or, if you want to configure a profile for all users on your computer, you’ll want $profile.AllUsersCurrentHost. There are a few options, and you can see them all with:

`$profile | Get-Member -type NoteProperty`

Creating Customizations
Your profile works just like .bash_profile does in Bash. It’s just a script that gets run before you start working in PowerShell. You can add aliases (although see the note below), functions, and variables, and set custom settings. The simplest way to check if you already have a profile is

Test-Path $profile

Here are a couple of useful settings you might like.

```ps
# Microsoft.PowerShell_profile.ps1

# You can customize the window itself by accessing $Host.UI.RawUI
$window = $Host.UI.RawUI
$window.WindowTitle = "Pa-pa-pa-pa-pa-pa-POWERSHELL"
$window.BackgroundColor = "Black"
$window.ForegroundColor = "Gray"

# You can define functions (remember to follow the Verb-Noun convention!)
function Count-History {
  (Get-History | Measure-Object).count
}

function beep {
  echo `a
}

function Edit-Profile {
  [CmdletBinding()]
  [Alias("ep")]
  PARAM()

  vim $profile
}
```

### Customize the Powershell Prompt
```powershell
# The Simple Prompt
# The simplest way to customize your prompt is by defining the prompt function, either manually or in your profile. For example:

function prompt {
 $histCount = (Get-History | Measure-Object).count
 return "POWERSHELL LEVEL OVER $histCount THOUSAND!!! >"
}

# This is an amusing way to return the number of inputs that you’ve already typed inside your prompt. Whatever string you return is what gets set as the prompt.

# The Complicated Prompt
# Basically, you can do whatever you want in your prompt, as long as it returns a string at the end. For example, here’s a more complicated prompt:

function prompt {
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

# You can see that I achieve a multi-line prompt by using Write-Host a number of times. Lastly, I simply return a space. My prompt ends up coming out like this:

# ~/Documents/blog
# PS [102] master ->
```

Get It to Not Look Ugly

Cmder: This one is built on top of ConEmu, which is a pretty popular terminal emulator for Windows. If you like Notepad++, I think you’ll really like this, because it feels similar.
Hyper: This one’s nice for those of you that don’t have a vendetta against Electron applications and are more front-end-edly minded. The customization and settings are all done in JavaScript and CSS, which makes searching for help really nice. As might be expected from the JavaScript crowd, there are about a gazillion plug-ins, some of which are stable and quite good. There’s a lot of work being done on Hyper right now, so you may have some stability issues, but over the last few months, it’s really gotten quite a bit faster and hiccup-less.

## Find More Resources
* [Windows PowerShell Cookbook](http://rsmt.it.fmi.uni-sofia.bg/books/windows_powershell_cookbook_3rd_edition.pdf), by Lee Holmes
* [Windows PowerShell in Action](http://sd.blackball.lv/library/Windows_PowerShell_in_Action_2nd_Edition.pdf), by Bruce Payette and Richard Siddaway

ABOUT THE AUTHOR
Ryan is a mechanical engineer in the East SF Bay Area. He is a hobbyist programmer, with a focus on dynamic languages like Ruby and Python. His goal is to learn as much as possible and become a physics, math, and programming teacher. He writes about scripting, physics, simulation, data science, the web, and more on his blog at assertnotmagic.com. You can also see his articles and find links to his GitHub, LinkedIn, and Twitter accounts at dev.to/rpalo.
