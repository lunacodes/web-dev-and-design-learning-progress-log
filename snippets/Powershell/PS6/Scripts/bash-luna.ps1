## BASH ALIASES AND UNIX ##

# LS Colors
Import-Module Get-ChildItemColor

Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

function list-all {
  $ls_hidden_dir = Get-ChildItemColor -Force -Hidden -Directory $args
  $ls_all_files = Get-ChildItemColorFormatWide $args
  $ls_types = $ls_hidden_dir, $ls_all_files

  foreach($i in $ls_types) {
    echo $i
  }
}
Set-Alias lsa list-all

function list-dirs {
  # (gci -Path .\ *.*|Resolve-Path -Relative) -replace "\.",""
  (Get-ChildItemColorFormatWide -Directory | Resolve-Path -Relative) -replace "\.", ""
}
Set-Alias lsd list-dirs

function list-dirs-pipe-output-to-file {
  (Get-ChildItemColorFormatWide -Path .\ *.*|Resolve-Path -Relative) -replace "\.","" | Out-File -FilePath output.txt -Encoding ascii}
Set-Alias lsdp list-dirs-pipe-output-to-file

function list-dirs-recurse-depth-2 {
  (Get-ChildItemColorFormatWide -Path .\ -Recurse -Depth 2 *.*|Resolve-Path -Relative) -replace "\.",""
}
Set-Alias lsdr list-dirs-recurse-depth-2

function list-dirs-pipe-depth-2 {
  (Get-ChildItemColorFormatWide -Path .\ -Recurse -Depth 2 *.*|Resolve-Path -Relative) -replace "\.","" | Out-File -FilePath output.txt -Encoding ascii
}
Set-Alias lsdrp list-dirs-pipe-depth-2

function remove-recurse-force { rm -R -Force $args }
Set-Alias rmrf remove-recurse-force

function open-git-bash {
  start 'C:\Program Files\Git\bin\sh.exe' $args
}
Set-Alias gbash open-git-bash

function vi ($File){
    bash -c "vi $File"
}

function nano ($File){
    bash -c "nano $File"
}

function pswget($url, $output) {
  Invoke-WebRequest -Uri $url -OutFile $output
  Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
}
