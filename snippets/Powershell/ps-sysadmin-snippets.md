# Powershell - Sys Admin Snippets

<!-- MarkdownTOC -->

* [Processes](#processes)
* [Firewall](#firewall)

<!-- /MarkdownTOC -->

<a id="processes"></a>
## Processes

```ps
# Find Process - you can use RegEx with this
function pgrep($name) {
	get-process $name
}

# Kill Process
function pkill($name) {
	get-process $name -ErrorAction SilentlyContinue | stop-process
}

# List of running Processes
Get-Process
# prints the Process values in vertical list
(Get-Process)[0] | Format-List
# Get the Id & Process Name of the last 20 processes
Get-Process | Select-Object Id, ProcessName -last 20
# Get processes whose working set (memory usage) > 150 MB
Get-Process | Where-Object WS -gt 150MB

```

<a id="firewall"></a>
## Firewall

```ps
# Turning Off Firewall Using PowerShell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Turning Off Firewall Using Windows Command Prompt
netsh advfirewall set allprofiles state off
```
