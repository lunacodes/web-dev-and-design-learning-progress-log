# Bash SysAdmin Snippets

<!-- MarkdownTOC -->

* [User Prompts](#user-prompts)
  * [Line Editing Issues](#line-editing-issues)
* [Navigation](#navigation)
  * [Easier CD Navigation](#easier-cd-navigation)
* [Networking](#networking)
  * [Set default interfaces for sys admin related commands](#set-default-interfaces-for-sys-admin-related-commands)
  * [Control Home Router](#control-home-router)
* [Performance](#performance)
  * [Memory, CPU Usage, and GPU Memory Info](#memory-cpu-usage-and-gpu-memory-info)
* [Troubleshooting](#troubleshooting)
  * [Stopped Jobs](#stopped-jobs)
* [Other](#other)

<!-- /MarkdownTOC -->

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


<a id="line-editing-issues"></a>
### Line Editing Issues

```bash
if [[ "$(set -o | grep 'emacs\|\bvi\b' | cut -f2 | tr '\n' ':')" != 'off:off:' ]]; then
  echo "line editing is on"
fi
```


<a id="navigation"></a>
## Navigation

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
### Easier CD Navigation

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

<a id="networking"></a>
## Networking

<a id="set-default-interfaces-for-sys-admin-related-commands"></a>
### Set default interfaces for sys admin related commands

vnstat is console-based network traffic monitor. dnstop is console tool to analyze DNS traffic. tcptrack and iftop commands displays information about TCP/UDP connections it sees on a network interface and display bandwidth usage on an interface by host respectively.

All of our servers eth1 is connected to the Internets via vlan / router etc
* alias dnstop='dnstop -l 5  eth1'
* alias vnstat='vnstat -i eth1'
* alias iftop='iftop -i eth1'
* alias tcpdump='tcpdump -i eth1'
* alias ethtool='ethtool eth1'

work on wlan0 by default
* Only useful for laptop as all servers are without wireless interface
* alias iwconfig='iwconfig wlan0'

<a id="control-home-router"></a>
### Control Home Router
The curl command can be used to reboot Linksys routers.

Reboot my home Linksys WAG160N / WAG54 / WAG320 / WAG120N Router / Gateway from *nix.
alias rebootlinksys="curl -u 'admin:my-super-password' 'http://192.168.1.2/setup.cgi?todo=reboot'"

Reboot tomato based Asus NT16 wireless bridge

alias reboottomato="ssh admin@192.168.1.1 /sbin/reboot"

<a id="performance"></a>
## Performance

<a id="memory-cpu-usage-and-gpu-memory-info"></a>
### Memory, CPU Usage, and GPU Memory Info

Get system memory, cpu usage, and gpu memory info quickly
pass options to free:

alias meminfo='free -m -l -t'

get top process eating memory:

* alias psmem='ps auxf | sort -nr -k 4'
* alias psmem10='ps auxf | sort -nr -k 4 | head -10'

get top process eating cpu:

* alias pscpu='ps auxf | sort -nr -k 3'
* alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

Get server cpu info:

* alias cpuinfo='lscpu'
  * older system use /proc/cpuinfo
  * alias cpuinfo='less /proc/cpuinfo'

get GPU ram on desktop / laptop

alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

<a id="troubleshooting"></a>
## Troubleshooting

<a id="stopped-jobs"></a>
### Stopped Jobs

* Jobs become stopped by typing `&` at the end of the command, or using `ctrl-z`

* Use `jobs` command to tell you what job(s) you have suspended
  * `fg` - add job(s) to the foreground
  * if you don't care if the job(s) will terminate, you can just type exit again;
  * typing exit a second time with or without an intervening jobs command will result in the termination of all suspended jobs.

<a id="other"></a>
## Other

Nothing to see here.
