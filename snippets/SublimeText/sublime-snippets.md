# Sublime Text Settings and Snippets

<!-- MarkdownTOC -->

* [Git Integration](#git-integration)
    * [Navigation](#navigation)
* [Editor Settings - Global](#editor-settings---global)
    * [Convert File Line Endings on Save](#convert-file-line-endings-on-save)
    * [Increase the Number of Recent Files, Folders, and Projects](#increase-the-number-of-recent-files-folders-and-projects)
* [Build Systems](#build-systems)
* [Regular Expressions \(RegEx\)](#regular-expressions-regex)
    * [Line Endings](#line-endings)
* [Creating Snippets](#creating-snippets)
* [Syntax Settings](#syntax-settings)
    * [Add PowerShell Syntax Highlighting to Markdown and Markdown-Extended](#add-powershell-syntax-highlighting-to-markdown-and-markdown-extended)

<!-- /MarkdownTOC -->

<a id="git-integration"></a>
## Git Integration

<a id="navigation"></a>
### Navigation

* `Ctrl+.` - Next modification
* `Ctrl+,` - Previous moditfication
* `Goto ▶ Next Modification`
* `Goto ▶ Previous Modification`

More here[Sublime Text - Incremental Diff](https://www.sublimetext.com/docs/3/incremental_diff.html)

<a id="editor-settings---global"></a>
## Editor Settings - Global

<a id="convert-file-line-endings-on-save"></a>
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

<a id="increase-the-number-of-recent-files-folders-and-projects"></a>
### Increase the Number of Recent Files, Folders, and Projects

https://stackoverflow.com/questions/15769156/increase-number-of-recent-projects-in-sublime-text-2

<a id="build-systems"></a>
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

<a id="regular-expressions-regex"></a>
## Regular Expressions (RegEx)

<a id="line-endings"></a>
### Line Endings

1. Replace `\n` with actual new lines:

Turn on Regex Search and Replace (icon most to the left in search and replace bar or shortcut `Alt + R`)

Find What: `\\n`
Replace with: `\n`

<a id="creating-snippets"></a>
## Creating Snippets

Example:
```xml
<snippet>
    <content><![CDATA[
    	function ${1:Function-Name} { ${2:Command} }
    	Set-Alias -Name ${3:alias} -Value ${1:Function-Name}
    	]]></content>
    <!-- Optional: Tab trigger to activate the snippet -->
    <tabTrigger>Set-Alias</tabTrigger>
    <!-- Optional: Scope the tab trigger will be active in -->
    <scope>source.powershell</scope>
    <!-- Optional: Description to show in the menu -->
    <description>Set-Alias</description>
</snippet>
```

<a id="syntax-settings"></a>
## Syntax Settings

<a id="add-powershell-syntax-highlighting-to-markdown-and-markdown-extended"></a>
### Add PowerShell Syntax Highlighting to Markdown and Markdown-Extended

Markdown:
```yaml
- match: |-
     (?x)
      {{fenced_code_block_start}}
      ((?i:powershell|ps))
      {{fenced_code_block_trailing_infostring_characters}}
  captures:
    0: meta.code-fence.definition.begin.powershell.markdown-gfm
    2: punctuation.definition.raw.code-fence.begin.markdown
    5: constant.other.language-name.markdown
  embed: scope:source.powershell
  embed_scope: markup.raw.code-fence.powershell.markdown-gfm
  escape: '{{code_fence_escape}}'
  escape_captures:
    0: meta.code-fence.definition.end.powershell.markdown-gfm
    1: punctuation.definition.raw.code-fence.end.markdown
```

Markdown Extended:
```yaml
- match: '(```|~~~|{%\s*highlight)\s*(powershell|ps)\s*((?:linenos\s*)?%})?$'
  captures:
    1: punctuation.definition.fenced.markdown
    2: variable.language.fenced.markdown
    3: punctuation.definition.fenced.markdown
  push:
    - meta_scope: markup.raw.block.markdown markup.raw.block.fenced.markdown
    - meta_content_scope: source.powershell
    - match: '(```|~~~|{%\s*endhighlight\s*%})\n'
      captures:
        1: punctuation.definition.fenced.markdown
        2: variable.language.fenced.markdown
        3: punctuation.definition.fenced.markdown
      pop: true
    - include: scope:source.powershell
```
