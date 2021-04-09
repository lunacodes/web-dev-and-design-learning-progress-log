# Bash Snippets

<!-- MarkdownTOC -->

* [Shell Basics](#shell-basics)
  * [Builtins, Functions, and PATH](#builtins-functions-and-path)
  * [Check if Root or Sudo](#check-if-root-or-sudo)
    * [Default File Locations](#default-file-locations)
  * [Change the Window Title](#change-the-window-title)
  * [Directory Commands](#directory-commands)
    * [List All Directories](#list-all-directories)
  * [History](#history)
  * [Keybindings](#keybindings)
    * [Fix Line Editing Not Enabled](#fix-line-editing-not-enabled)
  * [Navigation](#navigation)
    * [Easier CD Navigation](#easier-cd-navigation)
  * [Text Editing](#text-editing)
  * [User Input](#user-input)
    * [Customization - Command Prompt](#customization---command-prompt)
* [Admin](#admin)
  * [Box Control](#box-control)
  * [Networking & Server Admin](#networking--server-admin)
  * [Package Management](#package-management)
  * [User Info and Privileges](#user-info-and-privileges)
* [Aliases and Overrides](#aliases-and-overrides)
  * [Symlinks](#symlinks)
* [Compression](#compression)
* [Piping Tricks](#piping-tricks)
* [Searching](#searching)
* [Scripts and Man Pages](#scripts-and-man-pages)
  * [Adding Scripts](#adding-scripts)
  * [Adding Man Pages](#adding-man-pages)
* [Needs Sorting](#needs-sorting)
  * [Line Endings Conversions](#line-endings-conversions)

<!-- /MarkdownTOC -->

[BASH and PowerShell Quick Reference](https://cecs.wright.edu/~pmateti/Courses/233/Labs/Scripting/bashVsPowerShellTable.html) - Table of equivalient commands in Bash and PS

See also [bash-scripting.md](bash-scripting.md)

<a id="shell-basics"></a>
## Shell Basics

```sh
#!/bin/bash
#!/usr/bin/env bash             # shebang that looks up bash from the env variables.
bash -v                         # starts bash in verbose mode
bash --help                     # displays the cool things bash can do
bash -c "help"                  # displays all builtins and params
bash -c "help set"              # displays all shell options and parms
env                             # displays all environment variables
echo $SHELL                     # displays the shell you're using
bash -c 'echo $TERM'            # displays the terminal you're using
echo $BASH_VERSION              # displays bash version
bash --version                  # display verbose version info
where bash                      # find where bash is on    your system
which bash                      # finds out which program is executed as 'bash' (default: /bin/bash, can change across environments)
clear                           # clears content, no scrollback
ctrl+l                          # clears window content, but allows for scrollback
shopt                           # list shell options stored in shopt
```

<a id="builtins-functions-and-path"></a>
### Builtins, Functions, and PATH

```sh
type cmd                        # show the first PATH instance of a command.
type -a cmd                     # show type and locations of a command
type -t cmd                     # show the type (alias, keyword, function, builtin, file, or '')
type -a func                    # show type and the function's code
/path/script                    # run script
```

You can update path with `PATH=~/bin:/usr/local/bin:/bin:/usr/bin`

* non-persistent - PATH resets once you close the shell
* destructive - Use `export` to append

See [Unix Stack Exchange - How To Correctly Add A Path To Path](https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path)

<a id="check-if-root-or-sudo"></a>
### Check if Root or Sudo

```bash

is_user_root()
# function verified to work on Bash version 4.4.18
# both as root and with sudo; and as a normal user
{
    ! (( ${EUID:-0} || $(id -u) ))
}

if is_user_root; then
    echo 'You are the almighty root!'
else
    echo 'You are just an ordinary user.'
fi

# Check if sudo is a command
sudo -k # make sure to ask for password on next sudo
if sudo true; then
    echo "(2) correct password"
else
    echo "(3) wrong password"
    exit 1
fi
```

<a id="default-file-locations"></a>
#### Default File Locations

Windows: all the standard default config files are found in either `/c/Program\ Files/Git/etc` or `/c/git-sdk-64/etc` (depending on which `Git Bash` version you're using). Includes the following and more:
  * .bash.bashrc
  * .profile.d
  * .pacmand.d (64-bit only)
  * bash.bash_logout
  * DIR_COLORS
  * inputrc
  * install-options.txt (32-bit only. Really useful info)
  * skel.d (64-bit only)
  * ssh
  * tigrc - terminal settings
  * vimrc

<a id="change-the-window-title"></a>
### Change the Window Title

```bash
# Figure out how to write a function version of this
PROMPT_COMMAND='echo -ne "\033]0;Git Bash 64\007"'

function title {
   PROMPT_COMMAND="echo -ne \"\033]0;$1\007\""
}


```

<a id="directory-commands"></a>
### Directory Commands

```sh
du                              # disk usage for all dirs
du -a                           # disk usage for all dirs and files
du -c                           # print total disk space usage at the end
du --exclude='pattern'          # exclude files and folders with pattern
du -h                           # human readable format
du -m                           # disk usage in megabytes
du --max-depth                  # maximum number of directories to recurse
du -s                           # single summary for the entire query
du -t                           # disk usage based on time
find dir -name "php"            # list all files, dirs named "php"
find . -iname "php"             # case-insensitive list all items named "php"
find . -maxdepth 1
find . -print0                  # prints filenames followed by a null char instead of a newline
find . -type                    # list items of type f (files) or d (dirs)
gzip -d file.gz                 # gzip file
gunzip file.gz                  # un-gzip file
ls -a                           # list all files including hidden file starting with '.'
ls --color                      # colored list [=always/never/auto]
ls -d                           # list directories # with ' */'
ls -F                           # add one char of */=>@| to enteries
ls -i                           # list file's inode index number
ls -l                           # list with long format # show permissions
ls -la                          # list long format including hidden files
ls -lh                          # list long format with readable file size
ls -ls                          # list with long format with file size
ls -r                           # list in reverse order
ls -R                           # list recursively directory tree
ls -s                           # list file size
ls -S                           # sort by file size
ls -t                           # sort by time & date
ls -X                           # sort by extension name
mv dir1 dir2                    # no need for recursive
mv dir1 ..                      # mv dir up one dir
mv dir1/* ..                    # mv all files in dir up one dir
$ rm file.txt 2> /dev/null      # redirect error messages to /dev/null??
rm *.xvg                        # delete all .zvg files in current dir
tree                            # list files and folders under current dir
tree dir/                       # list files and folders under specific dir
tree -L 2 dir/                  # limit recursion depth of tree
tree -f                         # print absolute file paths
tree -d                         # list only directories
$ tree -d /etc/ | less          # list directories line by line
tree -a dir/                    # include hidden files and folders
tree -C dir/                    # color your tree
tree -s                         # list file sizes
```

Examples:

```sh
## Disk Usage
# human readable, total at end, max-depth 1, multiple excluded patterns
du -ch --max-depth=1 --exclude='haseph*' --exclude='glennys*' --exclude='lgluna*' --exclude='lunacodes*'

# List the top 10 largest directories in your current directory
du -sk * | sort -n | tail
```

<a id="list-all-directories"></a>
#### List All Directories

```bash
function lsdirs() {
  local target_dir="$1"
  pdir=$PWD

  # If no dir passed, set target to pwd
  if [[ "" == "$target_dir" ]]; then
    target_dir="."
  fi

  # If dir does not exist, return
  if [ ! -d "$target_dir" ]; then
    echo "ls: cannot access '$target_dir': No such file or directory"
    return
  # otherwise, cd, list contents, and return to original dir
  else
    cd $target_dir
    # Set to blue dir color, Trim the beginning ./ using sed, Reset color
    echo -e "\e[1;34m$(find ./ -maxdepth 1 -mindepth 1 -type d)" | sed 's/.\///' | column && echo -e "\e[0m"
    cd $pdir
  fi
}
```

<a id="history"></a>
### History

```bash
## History
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Immediately add commands to our history instead of waiting for the end of each session
# This enables commands to be available across terminals
# -a append -c clear -r read
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
```


<a id="keybindings"></a>
### Keybindings

```bash
# Set Up key to history search (rather than scroll)
bind '"\e[A": history-search-backward' # Up
bind '"\e[B": history-search-forward'  # Down

# Skip words
bind '"\e[1;5D": backward-word'        # Ctrl-Left
bind '"\e[1;5C": forward-word'         # Ctrl-Right

# Fix a binding issue with the 'b' key
bind '"b": self-insert'

# Remove keybinding
bind -r '"\e[A"'
bind -r '"\eOA"'
```

<a id="fix-line-editing-not-enabled"></a>
#### Fix Line Editing Not Enabled

```bash
if [[ "$(set -o | grep 'emacs\|\bvi\b' | cut -f2 | tr '\n' ':')" != 'off:off:' ]]; then
  echo "line editing is on"
fi
```


<a id="navigation"></a>
### Navigation

```sh
#!/bin/bash
ctrl-a                          # move to beginning of line
ctrl-d                          # same as delete key
ctrl-e                          # move to end of line
ctrl-k                          # deletes (kill) forward to end of line
ctrl-n                          # next line in command history
ctrl-o                          # same as Return key, then displays next line in command history
ctrl-p                          # previous line in command history
ctrl-r                          # search through command history
ctrl-t                          # transposes two chars
ctrl-u                          # same as ctrl-backspace, kills backward from point to beggining of line
ctrl-w                          # same as ctrl-shift-backspace, kills the word behind the cursor
ctrl-y                          # retrieves (yank) last item killed
ctrl-z                          # stops current command, resume with fg in the foreground or bg in the background
alt-d                           # deletes next word
!!                              # repeats the last command

```

<a id="easier-cd-navigation"></a>
#### Easier CD Navigation

```sh
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias ...........='cd ../../../../../../../../../..'
alias ............='cd ../../../../../../../../../../..'
alias .............='cd ../../../../../../../../../../../..'
```


<a id="text-editing"></a>
### Text Editing

```sh
cat filename # Displays the contents of a file.
```


<a id="user-input"></a>
### User Input

```sh
select                          # select words from a list and execute commands
select_example() {
select FILENAME in *;
do
    echo "$FILENAME";
done;
}

```

<a id="customization---command-prompt"></a>
#### Customization - Command Prompt

* See [bash-customization.md](bash-customization.md) for more.
* See [ArchWiki - Bash/Prompt customization](https://wiki.archlinux.org/index.php/Bash/Prompt_customization) for much more

Note: Default Code is in `/etc/bash.bashrc` file

```sh
# Color and string variables
green='\[\033]0;]\n\[\033[32m\]'
user='\u'
host='@\h '
pink='\[\033[35m\]'
yellow='\[\033[33m\]'
pwd_abbr='\w'
gitps1='\[\033[36m\]`__git_ps1`'
grey='\[\033[0m'
new_line='\]\n'
prompt='$ '
# PWD Depth (defalt): ~/.../../../pwd
# 1=Shorter, 5=Longer
PROMPT_DIRTRIM=3

# Default: user@Host + MINGW64 + ~/../../pwd + (git)
PS1="$green$user$host$pink$MSYSTEM $yellow$pwd_abbr$gitps1$grey$new_line$prompt"

# No Host: user + MINGFW64 + ~/../../pwd + (git)
PS1="$green$user$pink $MSYSTEM $yellow$pwd_abbr$gitps1$grey$new_line$prompt"

# Minimal: user ~/../../../pwd (master)
PS1="$green$user $yellow$pwd_abbr$gitps1$grey$new_line$prompt"

# Default - no variables:
# user@Host + MINGW64 + ~/../../pwd + (git)
PS1='\[\033]0;]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM  \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
```


<a id="admin"></a>
## Admin

<a id="box-control"></a>
### Box Control

```sh
#19: Tune sudo and su
# become root #
alias root='sudo -i'
alias su='sudo -i'

#20: Pass halt/reboot via sudo
shutdown command bring the Linux / Unix system down:

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
# Alternately
alias restart='sudo shutdown -r now'
alias status='service --status-all'
alias statuses='service --status-all'
```

<a id="networking--server-admin"></a>
### Networking & Server Admin

```sh
ifconfig -a = shows all network info
ifconfig eth0 = public IP address

sudo nano /etc/apache2/apache2.conf
sudo nano /etc/apache2/ports.conf
sudo apache2ctl configtest

ifconfig -a = shows all network info
ifconfig eth0 = public IP address

ip route get 8.8.8.8 | awk '{print $NF; exit}'

# NPM #
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

Alternatively, for Node.js 10:

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

ptional: install build tools

To compile and install native addons from npm you may also need to install build tools:

sudo apt-get install -y build-essential
```

<a id="package-management"></a>
### Package Management

Install packages in `/usr/bin/` or `~/bin/`

```sh
alias install='sudo apt-get install'
alias instally='sudo apt-get install -y'
alias i='sudo apt-get install'
alias installed='apt list --installed'
alias packs='apt list --installed'
alias packup='sudo apt-get update'
alias packautorm='sudo apt autoremove'
alias packautormy='sudo apt autoremove -y'
alias packrm='sudo apt-get remove'
alias packrmy='sudo apt-get remove -y'
# fully remove package and associated files
alias packpurge='sudo apt-get purge -y'

sudo apt-get update && sudo apt-get upgrade
```


<a id="user-info-and-privileges"></a>
### User Info and Privileges
```sh
# Get username
whoami
echo $USER

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt-get upgrade'
fi
```


<a id="aliases-and-overrides"></a>
## Aliases and Overrides

```sh
alias # get a list of aliases
'\alias_name' # Temporarily override alias, and use the system default
unalias nameHere # Add to .bashrc to permanently unalias
unset function # Unset a function
unset -f function # Unset a shell function
```
OS-Specific Aliases:

```sh
### Get os name via uname ###
_myos="$(uname)"

### add alias as per os using $_myos ###
case $_myos in
   Linux) alias foo='/path/to/linux/bin/foo';;
   FreeBSD|OpenBSD) alias foo='/path/to/bsd/bin/foo' ;;
   SunOS) alias foo='/path/to/sunos/bin/foo' ;;
   *) ;;
esac
```

<a id="symlinks"></a>
### Symlinks

`ln -s /path/to/file /path/to/symlink`


<a id="compression"></a>
## Compression

```sh
tar -cf myfile.tar /etc/dir1 /var/www/html /home/somedir. also, you could use tar -czf myfile.tar.gz /etc/dir1 /var/www/html /home/somedir.
# create tar.gz archive
tar -zcvf tar-archive-name.tar.gz source-folder-name
# extract tar.gz archive
tar -zxvf tar-archive-name.tar.gz
# create and preserve permissions
tar -pcvzf tar-archive-name.tar.gz source-folder-name
# extract with permissions.
tar -pxvzf tar-archive-name.tar.gz
zip -r filename.zip folder      # zip file
zip -r filename.zip folder1 folder2 # add multiple folders to new zip
zip -r filename.zip /path/to/folder1 /path/to/file2
zip -r -e data.zip data/        # encrypt zip file```
```


<a id="piping-tricks"></a>
## Piping Tricks

```sh
# Delete files ending in extension type. Always check file list first!!
find . -iname '*.psd' -print0 | du -ch --files0-from=-
find . -name "*.psd" -type f -delete
find . -iname '*.psd' -print0 | du -ch --files0-from=- -delete

# Execute pipeline and print a summary of the realtime, user CPU time, and system CPU time spent executing the pipeline when it terminates
[time [-p]] [ ! ] command [ [/|/&] command2 ... ]
time [-p] # the -p stands for posix (5.30) instead of 5m30.111s
```


<a id="searching"></a>
## Searching

```sh
## Find
find . -name "*.7z" -type f     # recursively list all files ending with .7z
find . -name "*.7z*" -type f    # recursively list all files containing .7z
find . -maxdepth 1 -name "*.7z" -type f # list all files in present directory ending in .7z

# recursive insensitive number
grep -rin str . # grep through all files in pwd for str
grep --color -E 'pattern|$' file
grep --color 'pattern\|$' file
egrep --color 'pattern|$' file
grep --color -E 'pattern' | less # same idea, but pipe to less buffer
grep --color -E 'pattern' | more
grep --color -E 'pattern' | most
```

<a id="scripts-and-man-pages"></a>
## Scripts and Man Pages

<a id="adding-scripts"></a>
### Adding Scripts

For a single user:

1. `mkdir $HOME/bin` or `mkdir ~/.bin`
2. Move script to `~/bin`
3. Add `export PATH=~/bin:$PATH` to `~/.bashrc`

For all users:

Move to `/usr/local/bin` - has the advantage of already being in your path.

<a id="adding-man-pages"></a>
### Adding Man Pages

1. Find out which section your man page belongs to.
  1. If its a command, it probably belongs to section 1.
  2. You can read the [manpage for the man command](http://manpages.ubuntu.com/manpages/disco/en/man7/man.7.html) to see a description of the different sections and their corresponding numbers.
2. Copy your man file to `/usr/local/share/man/man1` or `/usr/share/man/man1`
  1. It's best to copy to `/usr/local/share/man/man1` for commands installed without using `APT` (apt-get)
3. Run `sudo mandb` to update `man`'s internal database
4. You should be able to view the file using either `man 1 command_name` or `man command_name`

<a id="needs-sorting"></a>
## Needs Sorting

```sh
<a id="reloads-the-bashrc-file"></a>
# Reloads the bashrc file
alias bashreload="source ~/.bashrc && echo Bash config reloaded"

<a id="open-nano-and-make-backup-of-original-file-useful-for-config-files-and-things-you-dont-want-to-edit-the-original"></a>
# Open nano and make backup of original file. Useful for config files and things you don't want to edit the original
function nanobk() {
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read nul
    cp $1 $1.bak
    nano $1
}

<a id="clear-dns-cache"></a>
# Clear DNS Cache

<a id="still-need-testing-on-this-one"></a>
# Still need testing on this one

alias flushdns="sudo /etc/init.d/dns-clean restart && echo DNS cache flushed"


<a id="get-ips-associated-with-this-site"></a>
# Get IPs associated with this site

<a id="work-to-dynamically-list-all-interfaces-will-add-later"></a>
# Work to dynamically list all interfaces. Will add later.
<a id="currently-only-uses-the-hardcoded-interface-names"></a>
# Currently only uses the hardcoded interface names

function myip()
{
    extIp=$(dig +short myip.opendns.com @resolver1.opendns.com)

    printf "Wireless IP: "
    MY_IP=$(/sbin/ifconfig wlp4s0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}


    printf "Wired IP: "
    MY_IP=$(/sbin/ifconfig enp0s25 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}

    echo ""
    echo "WAN IP: $extIp"

}


<a id="syntax-repeat-x-command"></a>
# Syntax: "repeat [X] [command]"
function repeat()
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}


<a id="make-some-of-the-file-manipulation-programs-verbose"></a>
# Make some of the file manipulation programs verbose
alias mv="mv -v"
alias rm="rm -vi"
alias cp="cp -v"

<a id="prints-disk-usage-in-human-readable-form"></a>
# Prints disk usage in human readable form
alias d="du -sh"

<a id="clear-the-screen-of-your-clutter"></a>
# Clear the screen of your clutter
alias c="clear"
alias cl="clear;ls;pwd"

<a id="grep-motifications"></a>
# GREP Motifications
alias grep="grep --color"
alias grepp="grep -P --color"


<a id="json-tools-pipe-unformatted-to-these-to-nicely-format-the-json"></a>
# Json tools (pipe unformatted to these to nicely format the JSON)
alias json="python -m json.tool"
alias jsonf="python -m json.tool"

<a id="edit-shortcuts-for-config-files"></a>
# Edit shortcuts for config files
alias sshconfig="${EDITOR:-nano} ~/.ssh/config"
alias bashrc="${EDITOR:-nano} +120 ~/.bashrc && source ~/.bashrc && echo Bash config edited and reloaded."

<a id="ssh-helper"></a>
# SSH helper
alias sshclear="rm ~/.ssh/multiplex/* -f && echo SSH connection cache cleared;"
alias sshlist="echo Currently open ssh connections && echo && l ~/.ssh/multiplex/"
```


```sh
<a id="4-generate-sha1-digest"></a>
#4: Generate sha1 digest
alias sha1='openssl sha1'

<a id="5-create-parent-directories-on-demand"></a>
#5: Create parent directories on demand
alias mkpdir='mkdir -pv'

<a id="7-make-mount-command-output-pretty-and-human-readable-format"></a>
#7: Make mount command output pretty and human readable format
alias mount='mount |column -t'

<a id="8-command-short-cuts-to-save-time"></a>
#8: Command short cuts to save time
<a id="handy-short-cuts"></a>
# handy short cuts #
alias h='history'
<a id="alias-jjobs--l"></a>
# alias j='jobs -l'

<a id="9-create-a-new-set-of-commands"></a>
#9: Create a new set of commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

<a id="10-set-vim-as-default"></a>
#10: Set vim as default
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'

<a id="11-control-output-of-networking-tool-called-ping"></a>
#11: Control output of networking tool called ping
<a id="stop-after-sending-count-echo_request-packets"></a>
# Stop after sending count ECHO_REQUEST packets #
<a id="alias-pingping--c-5"></a>
# alias ping='ping -c 5'
alias ping='ping -n 5'
<a id="do-not-wait-interval-1-second-go-fast"></a>
# Do not wait interval 1 second, go fast #
<a id="alias-fastpingping--c-100--s2--wrong-flags"></a>
# alias fastping='ping -c 100 -s.2' # wrong flags

<a id="12-show-open-ports"></a>
#12: Show open ports
<a id="use-netstat-command-to-quickly-list-all-tcpudp-port-on-the-server"></a>
# Use netstat command to quickly list all TCP/UDP port on the server:
alias ports='netstat -tulanp' # flag wrong

<a id="15-debug-web-server--cdn-problems-with-curl"></a>
#15: Debug web server / cdn problems with curl
<a id="get-web-server-headers"></a>
# get web server headers #
alias header='curl -I'

<a id="find-out-if-remote-server-supports-gzip--mod_deflate-or-not"></a>
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compressed'

<a id="16-add-safety-nets"></a>
#16: Add safety nets
<a id="do-not-delete--or-prompt-if-deleting-more-than-3-files-at-a-time"></a>
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

<a id="confirmation"></a>
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

<a id="parenting-changing-perms-on-"></a>
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

<a id="21-control-web-servers"></a>
#21: Control web servers
<a id="also-pass-it-via-sudo-so-whoever-is-admin-can-reload-it-without-calling-you"></a>
# also pass it via sudo so whoever is admin can reload it without calling you #
alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
alias lightyload='sudo /etc/init.d/lighttpd reload'
alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

<a id="22-alias-into-our-backup-stuff"></a>
#22: Alias into our backup stuff
<a id="if-cron-fails-or-if-you-want-backup-on-demand-just-run-these-commands"></a>
# if cron fails or if you want backup on demand just run these commands #
<a id="again-pass-it-via-sudo-so-whoever-is-in-admin-group-can-start-the-job"></a>
# again pass it via sudo so whoever is in admin group can start the job #
<a id="backup-scripts"></a>
# Backup scripts #
alias backup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type local --taget /raid1/backups'
alias nasbackup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01'
alias s3backup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01 --auth /home/scripts/admin/.authdata/amazon.keys'
alias rsnapshothourly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias rsnapshotdaily='sudo  /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias rsnapshotweekly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias rsnapshotmonthly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias amazonbackup=s3backup

<a id="23-desktop-specific-%E2%80%93-play-avimp3-files-on-demand"></a>
#23: Desktop specific – play avi/mp3 files on demand
<a id="play-video-files-in-a-current-directory"></a>
## play video files in a current directory ##
<a id="cd-%7Edownloadmovie-name"></a>
# cd ~/Download/movie-name
<a id="playavi-or-vlc"></a>
# playavi or vlc
alias playavi='mplayer *.avi'
alias vlc='vlc *.avi'

<a id="play-all-music-files-from-the-current-directory"></a>
# play all music files from the current directory #
alias playwave='for i in *.wav; do mplayer "$i"; done'
alias playogg='for i in *.ogg; do mplayer "$i"; done'
alias playmp3='for i in *.mp3; do mplayer "$i"; done'

<a id="play-files-from-nas-devices"></a>
# play files from nas devices #
alias nplaywave='for i in /nas/multimedia/wave/*.wav; do mplayer "$i"; done'
alias nplayogg='for i in /nas/multimedia/ogg/*.ogg; do mplayer "$i"; done'
alias nplaymp3='for i in /nas/multimedia/mp3/*.mp3; do mplayer "$i"; done'

<a id="shuffle-mp3ogg-etc-by-default"></a>
# shuffle mp3/ogg etc by default #
alias music='mplayer --shuffle *'


#27 Resume wget by default
The GNU Wget is a free utility for non-interactive download of files from the Web. It supports HTTP, HTTPS, and FTP protocols, and it can resume downloads too:

<a id="this-one-saved-by-butt-so-many-times"></a>
## this one saved by butt so many times ##
alias wget='wget -c'
<a id="28-use-different-browser-for-testing-website"></a>
#28 Use different browser for testing website
<a id="this-one-saved-by-butt-so-many-times-1"></a>
## this one saved by butt so many times ##
alias ff4='/opt/firefox4/firefox'
alias ff13='/opt/firefox13/firefox'
alias chrome='/opt/google/chrome/chrome'
alias opera='/opt/opera/opera'

<a id="default-ff"></a>
#default ff
alias ff=ff13

<a id="my-default-browser"></a>
#my default browser
alias browser=chrome

<a id="29-a-note-about-ssh-alias"></a>
#29: A note about ssh alias
Do not create ssh alias, instead use ~/.ssh/config OpenSSH SSH client configuration files. It offers more option. An example:

Host server10
  Hostname 1.2.3.4
  IdentityFile ~/backups/.ssh/id_dsa
  user foobar
  Port 30000
  ForwardX11Trusted yes
  TCPKeepAlive yes
You can now connect to peer1 using the following syntax:
$ ssh server10

<a id="30-it%E2%80%99s-your-turn-to-share%E2%80%A6"></a>
#30: It’s your turn to share…
<a id="set-some-other-defaults"></a>
## set some other defaults ##
alias df='df -H'
alias du='du -ch'

<a id="top-is-atop-just-like-vi-is-vim"></a>
# top is atop, just like vi is vim
alias top='atop'

<a id="nfsrestart---must-be-root"></a>
## nfsrestart  - must be root  ##
<a id="refresh-nfs-mount--cache-etc-for-apache"></a>
## refresh nfs mount / cache etc for Apache ##
alias nfsrestart='sync && sleep 2 && /etc/init.d/httpd stop && umount netapp2:/exports/http && sleep 2 && mount -o rw,sync,rsize=32768,wsize=32768,intr,hard,proto=tcp,fsc natapp2:/exports /http/var/www/html &&  /etc/init.d/httpd start'

<a id="memcached-server-status"></a>
## Memcached server status  ##
alias mcdstats='/usr/bin/memcached-tool 10.10.27.11:11211 stats'
alias mcdshow='/usr/bin/memcached-tool 10.10.27.11:11211 display'

<a id="quickly-flush-out-memcached-server"></a>
## quickly flush out memcached server ##
alias flushmcd='echo "flush_all" | nc 10.10.27.11 11211'

<a id="remove-assets-quickly-from-akamai--amazon-cdn"></a>
## Remove assets quickly from Akamai / Amazon cdn ##
alias cdndel='/home/scripts/admin/cdn/purge_cdn_cache --profile akamai'
alias amzcdndel='/home/scripts/admin/cdn/purge_cdn_cache --profile amazon'

<a id="supply-list-of-urls-via-file-or-stdin"></a>
## supply list of urls via file or stdin
alias cdnmdel='/home/scripts/admin/cdn/purge_cdn_cache --profile akamai --stdin'
alias amzcdnmdel='/home/scripts/admin/cdn/purge_cdn_cache --profile amazon --stdin'


<a id="capture-the-output-lines-to-get-a-list-of-file-names"></a>
# Capture the output lines to get a list of file names:
Run git clean -nxd (dry run),

Would remove abc.txt
Would remove def.txt

Then delete the list of files to recycle bin.
```

<a id="line-endings-conversions"></a>
### Line Endings Conversions

Note: Use `dos2unix` or `unix2dos` instead
