# Bash Learning

<!-- MarkdownTOC -->

* [Vocabulary](#vocabulary)
* [Shell](#shell)
	* [Path](#path)
* [File Descriptors - StdIn, StdOut, StdError](#file-descriptors---stdin-stdout-stderror)
* [Functions](#functions)
	* [Syntax](#syntax)
	* [Operators and Conditionals](#operators-and-conditionals)
	* [Pipelines](#pipelines)
	* [Lists](#lists)
	* [Coprocessors](#coprocessors)

<!-- /MarkdownTOC -->


Bash learning from [Bash Academy - The Bash Guide - A quality-driven guide through the shell's many features](https://guide.bash.academy/inception/)

<a id="vocabulary"></a>
## Vocabulary

* `Program` - external command
* `Stream` - information (bytes) flowing through the links between two files.
	* Can transport any kind of bytes, and receiving program can only process in the order sent. Streams are one-directional and one-time use only (i.e. you can't reread the same info).
* `Terminal Multiplexer` - text-based terminal emulator
	* Uses a single terminal to run multiple bash instances, which are switched between via Hotkeys or multiple screen view


<a id="shell"></a>
## Shell

Using `#!/usr/bin/env bash` is a way to rely on the system `path` to find bash.

<a id="path"></a>
### Path

Standard locations checked on a UNIX system: `/bin`, `/usr/bin`, `/sbin`, etc. Evaluated sequentially, so if `PATH` `/bin:/sbin:/usr/bin:/usr/sbin ` goes through `/bin` then `/sbin` then `/usr/bin`, etc. Runs the first instance it finds (i.e. if you have `ping` in `/bin` and `/sbin`, it's only going to run the one in `/bin`)

To find the location of any specific command, use `type cmd` to show the first result, and `type -a cmd` to find all the locations

<a id="file-descriptors---stdin-stdout-stderror"></a>
## File Descriptors - StdIn, StdOut, StdError

**Note: File Descriptors are process specific.**
* To speak of "standard output" only makes sense when referring to a specific process.
* File descriptors describe the process' plugs for receiving streams - not the streams themselves.

Standard Process Descriptors:

* `File Descriptor 0 - StdIn` - Where most processes receive their input from. Most processes will be connected to the user's keyboard by default.
* `File Descriptor 1 - StdOut` - Where most processes send their output. Most processes will be connected to your display by default
* `File Descripor 2 - StdError` - Where most processes send their error and informational messages to. Most processes connected to your display by default.
	- Used for Informational processes as much as errors

Processes can also create their own File Descriptors. If a program needs to output to another program's input, it will instruct the kernel to connects its output to the program's input

<a id="functions"></a>
## Functions

* Can be written either `name() {}` or `function name() {}`
	* The former is preferred, but the latter is useful so that aliases don't overwrite your functions

```sh
# Bash doesn't define parameters in the ()
exists() { [[ -x $(type -P "$1" 2>/dev/null) ]];}
exists gpg || echo "Please install GPG." <&2
```

<a id="syntax"></a>
### Syntax

* `[ ]` = optional part of the syntax
* `...` = repeatable
* `arg` = arguments
* `redirection` operations
* `()` - denotes that you're declaring a function. **Bash does not define parameters in function parens**

<a id="operators-and-conditionals"></a>
### Operators and Conditionals

See Excellent writeup here: [Stack Exchange - Unix - What are the shell's control and redirection operators?](https://unix.stackexchange.com/a/159514)

* `||` - OR
	* `||` run cmd1 normally, but only move onto cmd2 if cmd1 fails
* `[ ]` - alias for the builtin `test` command - performs a conditional
	* `[[ ]]` - keyword (reserved word with special meaning to the shell)
	* See here [Unix Stack Exchange - What do square brackets mean without the “if” on the left? [duplicate]](https://unix.stackexchange.com/a/99186) and [Unix Stack Exchange - Why Does Parameter Expansion With Spaces Without Quotes Work Inside Double Brack](https://unix.stackexchange.com/questions/32210/why-does-parameter-expansion-with-spaces-without-quotes-work-inside-double-brack)

<a id="pipelines"></a>
### Pipelines

`[time [-p]] [ ! ] command [ [|||&] command2 ... ]`

* `|` tells bash to connect the `StdOut` of cmd1 to the `StdIn` of cmd2
* `|&` tells bash to connect the `StdOut` and `StdError` of cmd1 to `StdIn` of cmd2
	* We don't usually want to do this, since `StdError` normally conveys messages to the user.
	* If we send messages to cmd2 instead of the terminal display, we need to be sure it can handle receiving messages
* `&>word` - semantically equivalent to `>word 2>&1` - send `stdout` and `stderror`  of `word` to a file named `2`
	* **Note:** read this very excellent answer later, when brain is function: [Stack Exchange - Unix & Linux - what is the difference between >&2 and &>2](https://unix.stackexchange.com/a/443826)

<a id="lists"></a>
### Lists

The commands in lists are separated by a control operator, which tells bash what to do when executing the commands before it.

```sh
# Simple piping
cd music; mplayer *.mp3
rm hell.txt || echo "Couldn't delete hell.txt" >&2

# Compound Command
if ! rm hell.txt; then echo "Couldn't delete hell.txt" >&2; exit 1; fi
# Compound Command in a Command List
rm hell.txt || { echo "Couldn't delete hell.txt" >&2; exit 1; }

```

<a id="coprocessors"></a>
### Coprocessors

Allows you to easily run `async` commands and also set up some new `file descriptor` plugs that connect directly to the command's input and output.

```sh
# coproc [ name ] command [ redirection ... ]
# tail: -n: number of lines  -f: follow - output appended data, as the file grows
coproc auth { tail -n1 -f /var/log/auth.log; } # tail is an async cmd
read latestAuth <&"$auth[0]"
echo "Latest authentication attempt: $latestAuth"

# 1. Read the 1st line  reads a line of output from the coprocess called auth (which is the first line in the tail cmd output)
# 2. Write a message showing the latest authentication attempt we read from the coprocess
# 3. The script can continue and each time it reads from the coprocess pipe, it will get the next line from the tail command
```
