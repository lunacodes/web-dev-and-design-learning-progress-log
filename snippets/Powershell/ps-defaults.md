# Powershell 6 Defaults

## Environment Variables

```powershell
Name                           Value
----                           -----
ALLUSERSPROFILE                C:\ProgramData
APPDATA                        C:\Users\lunac\AppData\Roaming
ChocolateyInstall              C:\ProgramData\chocolatey
ChocolateyLastPathUpdate       132035309434772920
ChocolateyToolsLocation        C:\tools
COLUMNS                        120
CommonProgramFiles             C:\Program Files\Common Files
CommonProgramFiles(x86)        C:\Program Files (x86)\Common Files
CommonProgramW6432             C:\Program Files\Common Files
COMPUTERNAME                   DESKTOP-6JK90R2
ComSpec                        C:\WINDOWS\system32\cmd.exe
DOCUMENTS                      C:\Users\lunac\OneDrive\Documents
DriverData                     C:\Windows\System32\Drivers\DriverData
EDITOR                         code --wait
HOME                           C:\Users\lunac
HOMEDRIVE                      C:
HOMEPATH                       \Users\lunac
LOCALAPPDATA                   C:\Users\lunac\AppData\Local
LOGONSERVER                    \\DESKTOP-6JK90R2
NUMBER_OF_PROCESSORS           4
OneDrive                       C:\Users\lunac\OneDrive
OneDriveConsumer               C:\Users\lunac\OneDrive
OS                             Windows_NT
Path                           C:\Program Files (x86)\Intel\iCLS Client\;C:\Program Files\Intel\iCLS Client\;C:\WINDOW…
PATHEXT                        .COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW
PROCESSOR_ARCHITECTURE         AMD64
PROCESSOR_IDENTIFIER           Intel64 Family 6 Model 78 Stepping 3, GenuineIntel
PROCESSOR_LEVEL                6
PROCESSOR_REVISION             4e03
ProgramData                    C:\ProgramData
ProgramFiles                   C:\Program Files
ProgramFiles(x86)              C:\Program Files (x86)
ProgramW6432                   C:\Program Files
PSModulePath                   C:\Users\lunac\OneDrive\Documents\PowerShell\Modules;C:\Program Files\PowerShell\Module…
PUBLIC                         C:\Users\Public
SystemDrive                    C:
SystemRoot                     C:\WINDOWS
TEMP                           C:\Users\lunac\AppData\Local\Temp
TMP                            C:\Users\lunac\AppData\Local\Temp
USERDOMAIN                     DESKTOP-6JK90R2
USERDOMAIN_ROAMINGPROFILE      DESKTOP-6JK90R2
USERNAME                       lunac
USERPROFILE                    C:\Users\lunac
VBOX_MSI_INSTALL_PATH          C:\Program Files\Oracle\VirtualBox\
windir                         C:\WINDOWS
```

## Aliases

### Native
```powershell
Name                                               Version    Source
----                                               -------    ------
% -> ForEach-Object
? -> Where-Object
ac -> Add-Content
cat -> Get-Content
cd -> Set-Location
chdir -> Set-Location
clc -> Clear-Content
clear -> Clear-Host
clhy -> Clear-History
cli -> Clear-Item
clp -> Clear-ItemProperty
cls -> Clear-Host
clv -> Clear-Variable
cnsn -> Connect-PSSession
compare -> Compare-Object
copy -> Copy-Item
cp -> Copy-Item
cpi -> Copy-Item
cpp -> Copy-ItemProperty
cvpa -> Convert-Path
dbp -> Disable-PSBreakpoint
del -> Remove-Item
diff -> Compare-Object
dir -> Get-ChildItem
dnsn -> Disconnect-PSSession
ebp -> Enable-PSBreakpoint
echo -> Write-Output
epal -> Export-Alias
epcsv -> Export-Csv
erase -> Remove-Item
etsn -> Enter-PSSession
exsn -> Exit-PSSession
fc -> Format-Custom
fhx -> Format-Hex                                  6.1.0.0    Microsoft.PowerShell.Utility
fl -> Format-List
foreach -> ForEach-Object
ft -> Format-Table
fw -> Format-Wide
gal -> Get-Alias
gbp -> Get-PSBreakpoint
gc -> Get-Content
gci -> Get-ChildItem
gcm -> Get-Command
gcs -> Get-PSCallStack
gdr -> Get-PSDrive
ghy -> Get-History
gi -> Get-Item
gin -> Get-ComputerInfo                            6.1.0.0    Microsoft.PowerShell.Management
gjb -> Get-Job
gl -> Get-Location
gm -> Get-Member
gmo -> Get-Module
gp -> Get-ItemProperty
gps -> Get-Process
gpv -> Get-ItemPropertyValue
group -> Group-Object
gsn -> Get-PSSession
gsv -> Get-Service
gtz -> Get-TimeZone                                6.1.0.0    Microsoft.PowerShell.Management
gu -> Get-Unique
gv -> Get-Variable
h -> Get-History
history -> Get-History
icm -> Invoke-Command
iex -> Invoke-Expression
ihy -> Invoke-History
ii -> Invoke-Item
ipal -> Import-Alias
ipcsv -> Import-Csv
ipmo -> Import-Module
irm -> Invoke-RestMethod
iwr -> Invoke-WebRequest
kill -> Stop-Process
ls -> Get-ChildItem
man -> help
md -> mkdir
measure -> Measure-Object
mi -> Move-Item
mount -> New-PSDrive
move -> Move-Item
mp -> Move-ItemProperty
mv -> Move-Item
nal -> New-Alias
ndr -> New-PSDrive
ni -> New-Item
nmo -> New-Module
nsn -> New-PSSession
nv -> New-Variable
oh -> Out-Host
popd -> Pop-Location
ps -> Get-Process
pushd -> Push-Location
pwd -> Get-Location
r -> Invoke-History
rbp -> Remove-PSBreakpoint
rcjb -> Receive-Job
rcsn -> Receive-PSSession
rd -> Remove-Item
rdr -> Remove-PSDrive
ren -> Rename-Item
ri -> Remove-Item
rjb -> Remove-Job
rm -> Remove-Item
rmdir -> Remove-Item
rmo -> Remove-Module
rni -> Rename-Item
rnp -> Rename-ItemProperty
rp -> Remove-ItemProperty
rsn -> Remove-PSSession
rv -> Remove-Variable
rvpa -> Resolve-Path
sajb -> Start-Job
sal -> Set-Alias
saps -> Start-Process
sasv -> Start-Service
sbp -> Set-PSBreakpoint
select -> Select-Object
set -> Set-Variable
si -> Set-Item
sl -> Set-Location
sleep -> Start-Sleep
sls -> Select-String
sort -> Sort-Object
sp -> Set-ItemProperty
spjb -> Stop-Job
spps -> Stop-Process
spsv -> Stop-Service
start -> Start-Process
stz -> Set-TimeZone                                6.1.0.0    Microsoft.PowerShell.Management
sv -> Set-Variable
tee -> Tee-Object
type -> Get-Content
where -> Where-Object
wjb -> Wait-Job
write -> Write-Output
```

## My Additions (Incomplete)

```powershell
glennys -> cd-glennys
haseph -> cd-haseph
home -> cd-home
hspub -> cd-haseph-public-html
hswpc -> cd-haseph-wp-content
lunacodes -> cd-lunacodes
phs -> cd-post-hacker-school
rakov -> cd-rakov
vvv -> cd-vvv
vvw -> cd-vvw
webdv -> cd-webdv
webdvs -> cd-webdvs
zmn -> cd-zmn
7zc -> 7Zip-Compress
7ze -> 7Zip-Expand
```

### PSCX

```powershell
?: -> Invoke-Ternary                               3.3.2      Pscx
?? -> Invoke-NullCoalescing                        3.3.2      Pscx
call -> Invoke-Method                              3.3.2      Pscx
cd -> Set-LocationEx                               0.0        Pscx.CD
cvxml -> Convert-Xml                               3.3.2      Pscx
e -> Edit-File                                     3.3.2      Pscx
ehp -> Edit-HostProfile                            3.3.2      Pscx
ep -> Edit-Profile                                 3.3.2      Pscx
fhex -> Format-Hex                                 3.3.2      Pscx
fxml -> Format-Xml                                 3.3.2      Pscx
gcb -> Get-Clipboard                               3.3.2      Pscx
gpar -> Get-Parameter                              3.3.2      Pscx
gtn -> Get-TypeName                                3.3.2      Pscx
igc -> Invoke-GC                                   3.3.2      Pscx
ln -> New-Hardlink                                 3.3.2      Pscx
lorem -> Get-LoremIpsum                            3.3.2      Pscx
nho -> New-HashObject                              3.3.2      Pscx
ocb -> Out-Clipboard                               3.3.2      Pscx
ql -> QuoteList                                    3.3.2      Pscx
qs -> QuoteString                                  3.3.2      Pscx
Resize-Bitmap                                      3.3.2      Pscx
rver -> Resolve-ErrorRecord                        3.3.2      Pscx
rvhr -> Resolve-HResult                            3.3.2      Pscx
rvwer -> Resolve-WindowsError                      3.3.2      Pscx
skip -> Skip-Object                                3.3.2      Pscx
sro -> Set-ReadOnly                                3.3.2      Pscx
su -> Invoke-Elevated                              3.3.2      Pscx
swr -> Set-Writable                                3.3.2      Pscx
tail -> Get-FileTail                               3.3.2      Pscx
```
