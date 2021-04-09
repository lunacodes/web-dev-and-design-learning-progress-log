# Powershell 6 Aliases

## Built-In

```ps
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

```ps
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

## PSCX

```ps
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
