# Sublime Text Settings and Snippets

## Editor Settings - Global

### Convert File Line Endings on Save

Note: I have included this b/c it's interesting... it seems unnecessary, and potentially dangerous otherwise

Save this as change_line_endings.py in your User package folder. I generally wouldn't recommend this, but I hope you know what you're doing with this.

```py
import sublime_plugin

# Options are: "Windows", "Unix", "CR" (don't use CR)
PREFERRED_LINEENDINGS = "Unix"


class SilentlyChangeLineEndingsListener(sublime_plugin.EventListener):
    def on_pre_save(self, view):
        if view.line_endings() != PREFERRED_LINEENDINGS:
            view.set_line_endings(PREFERRED_LINEENDINGS)
```

### Increase the Number of Recent Files, Folders, and Projects

https://stackoverflow.com/questions/15769156/increase-number-of-recent-projects-in-sublime-text-2

## Build Systems

```json
// https://pawelgrzybek.com/javascript-console-in-sublime-text/
// Tools > Build System > New Build System
// Save this file as a JavaScript.sublime-build in “User” directory inside Sublime Text settings folder.
{
  "cmd": ["C:/Program Files/nodejs/node.exe", "$file"],
  "selector": "source.js"
}
```

## Regular Expressions (RegEx)

### Line Endings

1. Replace `\n` with actual new lines:

Turn on Regex Search and Replace (icon most to the left in search and replace bar or shortcut `Alt + R`)

Find What: `\\n`
Replace with: `\n`
