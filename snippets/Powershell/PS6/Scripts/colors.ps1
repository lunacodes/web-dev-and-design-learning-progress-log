# Requires TMOutput Module https://www.powershellgallery.com/packages?q=Functions%3A%22Show-TMOutputColor%22
function prompt {
  # Write-Host $(limit-HomeDirectory("$pwd")) -ForegroundColor Yellow -NoNewline
  $ESC = [char]27
  $time = Get-Date -UFormat %I:%M%p
  $tmp = $(get-Location).Path.Split("\")
  $myPrompt ="$ESC[1;36m" + $time + " " + "$ESC[1;34m" + "~\" + $tmp[($tmp.count-3)] + "\" + $tmp[($tmp.count-2)] + "\" + $tmp[($tmp.count-1)]

  # $tmp = $(get-Location).Path.Split("\")
  # $tmpStr = $tmp[($tmp.count-3)] + "\" + $tmp[($tmp.count-2)] + "\" + $tmp[($tmp.count-1)]
  $GitPromptSettings.DefaultPromptSuffix = '`n$'
  # $GitPromptSettings.DefaultPromptSuffix = ' $((Get-History -Count 1).id + 1)$(">" * ($nestedPromptLevel + 1)) '
  $GitPromptSettings.DefaultPromptPath = $myPrompt
  $prompt += & $GitPromptScriptBlock

  if ($prompt) { "$prompt " } else { " " }
}

function show-colors { Show-TMOutputColor }
Set-Alias colors show-colors
