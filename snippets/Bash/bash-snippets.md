# Bash Snippets

<!-- MarkdownTOC -->

* [Shell Basics](#shell-basics)
  * [Customizing The Command Prompt](#customizing-the-command-prompt)
* [Aliasing](#aliasing)
  * [Navigation](#navigation)
    * [Easier CD Navigation](#easier-cd-navigation)
* [Admin](#admin)
  * [User Privileges](#user-privileges)
* [Searching](#searching)
* [Packages](#packages)
* [File Commands](#file-commands)
  * [File Command Examples](#file-command-examples)
* [User Prompts](#user-prompts)
* [Piping Tricks](#piping-tricks)
* [Networking & Sys Admin](#networking--sys-admin)
* [Needs Sorting](#needs-sorting)

<!-- /MarkdownTOC -->

[BASH and PowerShell Quick Reference](https://cecs.wright.edu/~pmateti/Courses/233/Labs/Scripting/bashVsPowerShellTable.html) - Table of equivalient commands in Bash and PS

<a id="shell-basics"></a>
## Shell Basics

```sh
#!/bin/bash
env                             # displays all environment variables
echo $SHELL                     # displays the shell you're using
echo $BASH_VERSION              # displays bash version
where bash                      # find where bash is on    your system
which bash                      # finds out which program is executed as 'bash' (default: /bin/bash, can change across environments)
clear                           # clears content, no scrollback
ctrl+l                          # clears window content, but allows for scrollback

```

<a id="customizing-the-command-prompt"></a>
### Customizing The Command Prompt

* See [bash-customization.md](bash-customization.md) for more.
* See [ArchWiki - Bash/Prompt customization](https://wiki.archlinux.org/index.php/Bash/Prompt_customization) for much more

Normal Prompt:
`Luna@DESKTOP-AC4AJ8A MINGW64 ~/Documents/vagrant-sites/vvv/www (develop)`

Prompt From `.bashrc`:
```sh
`PS1='\[\033]0;]\n\[\033[32m\]\u \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
PROMPT_DIRTRIM=3
```

```sh
# Normal - User + MINGW 64 + long pwd
PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$'
# Preferred - User + long pwd + git
PS1='\[\033]0;]\n\[\033[32m\]\u \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '

# PWD Depth
PROMPT_DIRTRIM=1

# Without Colors
# User + MINGW 64 + long pwd
PS1='\u MINGW64 \w\$ '
# User + host + long pwd
PS1='\u@\H MINGW64 \w\$ '
# User + long pwd
PS1='\u \w\$ '
# User + short pwd
PS1='\u \W\$ '

# With Colors
# User + host + long pwd + git
PS1='\[\033]0;$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\] \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
# User + long pwd + git
PS1='\[\033]0;]\n\[\033[32m\]\u \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
# User + short pwd + git
PS1='\[\033]0;]\n\[\033[32m\]\u \[\033[33m\]\W\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '

```

**ANSI Escape Sequences Used Above**

```sh
33 = Yellow
```

Explanation:

```
non-printing escape sequences have to be enclosed in \[\033[ and \]

Black       0;30     Dark Gray     1;30
Blue        0;34     Light Blue    1;34
Green       0;32     Light Green   1;32
Cyan        0;36     Light Cyan    1;36
Red         0;31     Light Red     1;31
Purple      0;35     Light Purple  1;35
Brown       0;33     Yellow        1;33
Light Gray  0;37     White         1;37

So, if you want your console prompt to be blue, you would use the following escape sequence (in the filename I'm forgetting):

\[\033[34m\]

more: https://askubuntu.com/questions/831971/what-type-of-sequences-are-escape-sequences-starting-with-033
```

**Default Code in `/etc/bash.bashrc` file**

```sh
# If MSYS2_PS1 is set, use that as default PS1;
# if a PS1 is already set and exported, use that;
# otherwise set a default prompt
# of user@host, MSYSTEM variable, and current_directory
[[ -n "${MSYS2_PS1}" ]] && export PS1="${MSYS2_PS1}"
# if we have the "High Mandatory Level" group, it means we're elevated
#if [[ -n "$(command -v getent)" ]] && id -G | grep -q "$(getent -w group 'S-1-16-12288' | cut -d: -f2)"
#  then _ps1_symbol='\[\e[1m\]#\[\e[0m\]'
#  else _ps1_symbol='\$'
#fi
[[ $(declare -p PS1 2>/dev/null | cut -c 1-11) = 'declare -x ' ]] || \
  export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]$MSYSTEM\[\e[0m\] \[\e[33m\]\w\[\e[0m\]\n'"${_ps1_symbol}"' '
unset _ps1_symbol

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

```
<a id="aliasing"></a>
## Aliasing

```sh
alias # get a list of aliases
'\alias_name' # Temporarily override alias, and use the system default
unalias nameHer # Add to .bashrc to permanently unalias
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

Alias
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

See also, this bit about the $CDPATH setting

<a id="admin"></a>
## Admin

<a id="user-privileges"></a>
### User Privileges
```sh
# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt-get upgrade'
fi
```

<a id="searching"></a>
## Searching

```sh
# recursive insensitive number
grep -rin str . # grep through all files in pwd for str
```

<a id="packages"></a>
## Packages

Install packages in `/usr/bin/`

Apt-Get:
asdsdshjsdhjs

sdkksjdks


asdkjkdsj`sudo apt-get update && sudo apt-get upgrade`

<a id="file-commands"></a>
## File Commands

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
tree -d                         # list only directories
$ tree -d /etc/ | less          # list directories line by line
tree -a dir/                    # include hidden files and folders
tree -C dir/                    # color your tree

zip -r filename.zip folder      # zip file
zip -r filename.zip folder1 folder2 # add multiple folders to new zip
zip -r filename.zip /path/to/folder1 /path/to/file2
zip -r -e data.zip data/        # encrypt zip file

```

<a id="file-command-examples"></a>
### File Command Examples

```sh
## Disk Usage
# human readable, total at end, max-depth 1, multiple excluded patterns
du -ch --max-depth=1 --exclude='haseph*' --exclude='glennys*' --exclude='lgluna*' --exclude='lunacodes*'

# List the top 10 largest directories in your current directory
du -sk * | sort -n | tail

## Find
find . -name "*.7z" -type f     # recursively list all files ending with .7z
find . -name "*.7z*" -type f    # recursively list all files containing .7z
find . -maxdepth 1 -name "*.7z" -type f # list all files in present directory ending in .7z

```

<a id="user-prompts"></a>
## User Prompts

```sh
select                          # select words from a list and execute commands
select_example() {
select FILENAME in *;
do
    echo "$FILENAME";
done;
}

```

<a id="piping-tricks"></a>
## Piping Tricks

```sh
# Delete files ending in extension type. Always check file list first!!
find . -iname '*.psd' -print0 | du -ch --files0-from=-
find . -name "*.psd" -type f -delete
find . -iname '*.psd' -print0 | du -ch --files0-from=- -delete

```

<a id="networking--sys-admin"></a>
## Networking & Sys Admin

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

<a id="needs-sorting"></a>
## Needs Sorting

```sh
# Reloads the bashrc file
alias bashreload="source ~/.bashrc && echo Bash config reloaded"

# Open nano and make backup of original file. Useful for config files and things you don't want to edit the original
function nanobk() {
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read nul
    cp $1 $1.bak
    nano $1
}

# Clear DNS Cache

# Still need testing on this one

alias flushdns="sudo /etc/init.d/dns-clean restart && echo DNS cache flushed"


# Get IPs associated with this site

# Work to dynamically list all interfaces. Will add later.
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


# Syntax: "repeat [X] [command]"
function repeat()
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}


# Make some of the file manipulation programs verbose
alias mv="mv -v"
alias rm="rm -vi"
alias cp="cp -v"

# Prints disk usage in human readable form
alias d="du -sh"

# Clear the screen of your clutter
alias c="clear"
alias cl="clear;ls;pwd"

# GREP Motifications
alias grep="grep --color"
alias grepp="grep -P --color"


# Json tools (pipe unformatted to these to nicely format the JSON)
alias json="python -m json.tool"
alias jsonf="python -m json.tool"

# Edit shortcuts for config files
alias sshconfig="${EDITOR:-nano} ~/.ssh/config"
alias bashrc="${EDITOR:-nano} +120 ~/.bashrc && source ~/.bashrc && echo Bash config edited and reloaded."

# SSH helper
alias sshclear="rm ~/.ssh/multiplex/* -f && echo SSH connection cache cleared;"
alias sshlist="echo Currently open ssh connections && echo && l ~/.ssh/multiplex/"
```


```sh
#4: Generate sha1 digest
alias sha1='openssl sha1'

#5: Create parent directories on demand
alias mkpdir='mkdir -pv'

#7: Make mount command output pretty and human readable format
alias mount='mount |column -t'

#8: Command short cuts to save time
# handy short cuts #
alias h='history'
# alias j='jobs -l'

#9: Create a new set of commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

#10: Set vim as default
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'

#11: Control output of networking tool called ping
# Stop after sending count ECHO_REQUEST packets #
# alias ping='ping -c 5'
alias ping='ping -n 5'
# Do not wait interval 1 second, go fast #
# alias fastping='ping -c 100 -s.2' # wrong flags

#12: Show open ports
# Use netstat command to quickly list all TCP/UDP port on the server:
alias ports='netstat -tulanp' # flag wrong

#15: Debug web server / cdn problems with curl
# get web server headers #
alias header='curl -I'

# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compressed'

#16: Add safety nets
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

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

#21: Control web servers
# also pass it via sudo so whoever is admin can reload it without calling you #
alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
alias lightyload='sudo /etc/init.d/lighttpd reload'
alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

#22: Alias into our backup stuff
# if cron fails or if you want backup on demand just run these commands #
# again pass it via sudo so whoever is in admin group can start the job #
# Backup scripts #
alias backup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type local --taget /raid1/backups'
alias nasbackup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01'
alias s3backup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01 --auth /home/scripts/admin/.authdata/amazon.keys'
alias rsnapshothourly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias rsnapshotdaily='sudo  /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias rsnapshotweekly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias rsnapshotmonthly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias amazonbackup=s3backup

#23: Desktop specific – play avi/mp3 files on demand
## play video files in a current directory ##
# cd ~/Download/movie-name
# playavi or vlc
alias playavi='mplayer *.avi'
alias vlc='vlc *.avi'

# play all music files from the current directory #
alias playwave='for i in *.wav; do mplayer "$i"; done'
alias playogg='for i in *.ogg; do mplayer "$i"; done'
alias playmp3='for i in *.mp3; do mplayer "$i"; done'

# play files from nas devices #
alias nplaywave='for i in /nas/multimedia/wave/*.wav; do mplayer "$i"; done'
alias nplayogg='for i in /nas/multimedia/ogg/*.ogg; do mplayer "$i"; done'
alias nplaymp3='for i in /nas/multimedia/mp3/*.mp3; do mplayer "$i"; done'

# shuffle mp3/ogg etc by default #
alias music='mplayer --shuffle *'

#24: Set default interfaces for sys admin related commands
vnstat is console-based network traffic monitor. dnstop is console tool to analyze DNS traffic. tcptrack and iftop commands displays information about TCP/UDP connections it sees on a network interface and display bandwidth usage on an interface by host respectively.

## All of our servers eth1 is connected to the Internets via vlan / router etc  ##
alias dnstop='dnstop -l 5  eth1'
alias vnstat='vnstat -i eth1'
alias iftop='iftop -i eth1'
alias tcpdump='tcpdump -i eth1'
alias ethtool='ethtool eth1'

# work on wlan0 by default #
# Only useful for laptop as all servers are without wireless interface
alias iwconfig='iwconfig wlan0'

#25: Get system memory, cpu usage, and gpu memory info quickly
## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##

## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
#26: Control Home Router
The curl command can be used to reboot Linksys routers.

# Reboot my home Linksys WAG160N / WAG54 / WAG320 / WAG120N Router / Gateway from *nix.
alias rebootlinksys="curl -u 'admin:my-super-password' 'http://192.168.1.2/setup.cgi?todo=reboot'"

# Reboot tomato based Asus NT16 wireless bridge
alias reboottomato="ssh admin@192.168.1.1 /sbin/reboot"
#27 Resume wget by default
The GNU Wget is a free utility for non-interactive download of files from the Web. It supports HTTP, HTTPS, and FTP protocols, and it can resume downloads too:

## this one saved by butt so many times ##
alias wget='wget -c'
#28 Use different browser for testing website
## this one saved by butt so many times ##
alias ff4='/opt/firefox4/firefox'
alias ff13='/opt/firefox13/firefox'
alias chrome='/opt/google/chrome/chrome'
alias opera='/opt/opera/opera'

#default ff
alias ff=ff13

#my default browser
alias browser=chrome

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

#30: It’s your turn to share…
## set some other defaults ##
alias df='df -H'
alias du='du -ch'

# top is atop, just like vi is vim
alias top='atop'

## nfsrestart  - must be root  ##
## refresh nfs mount / cache etc for Apache ##
alias nfsrestart='sync && sleep 2 && /etc/init.d/httpd stop && umount netapp2:/exports/http && sleep 2 && mount -o rw,sync,rsize=32768,wsize=32768,intr,hard,proto=tcp,fsc natapp2:/exports /http/var/www/html &&  /etc/init.d/httpd start'

## Memcached server status  ##
alias mcdstats='/usr/bin/memcached-tool 10.10.27.11:11211 stats'
alias mcdshow='/usr/bin/memcached-tool 10.10.27.11:11211 display'

## quickly flush out memcached server ##
alias flushmcd='echo "flush_all" | nc 10.10.27.11 11211'

## Remove assets quickly from Akamai / Amazon cdn ##
alias cdndel='/home/scripts/admin/cdn/purge_cdn_cache --profile akamai'
alias amzcdndel='/home/scripts/admin/cdn/purge_cdn_cache --profile amazon'

## supply list of urls via file or stdin
alias cdnmdel='/home/scripts/admin/cdn/purge_cdn_cache --profile akamai --stdin'
alias amzcdnmdel='/home/scripts/admin/cdn/purge_cdn_cache --profile amazon --stdin'


# Capture the output lines to get a list of file names:
Run git clean -nxd (dry run),

Would remove abc.txt
Would remove def.txt

Then delete the list of files to recycle bin.
```
