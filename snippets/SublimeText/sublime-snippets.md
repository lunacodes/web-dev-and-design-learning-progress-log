# Sublime Text Settings and Snippets

<!-- MarkdownTOC -->

* [Git Integration](#git-integration)
  * [Navigation](#navigation)
* [Editor Settings - Global](#editor-settings---global)
  * [Convert File Line Endings on Save](#convert-file-line-endings-on-save)
  * [Increase the Number of Recent Files, Folders, and Projects](#increase-the-number-of-recent-files-folders-and-projects)
* [Project Files and Settings](#project-files-and-settings)
* [Build Systems](#build-systems)
* [Regular Expressions \(RegEx\)](#regular-expressions-regex)
  * [Line Endings](#line-endings)
* [Creating Snippets](#creating-snippets)
* [Syntax Settings](#syntax-settings)
  * [Add PowerShell Syntax Highlighting to Markdown and Markdown-Extended](#add-powershell-syntax-highlighting-to-markdown-and-markdown-extended)
* [Sublime Linter Config](#sublime-linter-config)

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

```python
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

<a id="project-files-and-settings"></a>
## Project Files and Settings

From: [Sublime Text 3 - Documentation: Projects](https://www.sublimetext.com/docs/3/projects.html)
```json
{
    "folders":
    [
        {
            "path": "src",
            "folder_exclude_patterns": ["backup"],
            "follow_symlinks": true
        },
        {
            "path": "docs",
            "name": "Documentation",
            "file_exclude_patterns": ["*.css"]
        }
    ],
    "settings":
    {
        "tab_size": 8
    },
    "build_systems":
    [
        {
            "name": "List",
            "shell_cmd": "ls -l"
        }
    ]
}
```

* `name` - A string used in place of the folder name in the side bar.
* `file_include_patterns` - A list of strings for filenames to include from the folder. Anything not matching these patterns will be excluded. This is checked before `file_exclude_patterns`.
* `file_exclude_patterns` - A list of strings for filenames to exclude from the folder. This is added to the global setting of the same name. This is checked after `file_include_patterns`.
* `folder_include_patterns` - A list of strings for subfolder paths to include from the folder. Anything not matching these patterns will be excluded. This is checked before `folder_exclude_patterns`.
* `folder_exclude_patterns` - A list of strings for subfolder paths to exclude from the folder. This is added to the global setting of the same name. This is checked after `folder_include_patterns`.
* `binary_file_patterns` - A list of strings for filenames to treat as binary files, and thus ignored in `Goto Anything` or `Find in Files`.
* `index_include_patterns` - A list of strings for full file paths to index in the folder. This is added to the `global setting` of the same name. Anything not matching these patterns will be excluded from the index. This is checked before `index_exclude_patterns`.
* `index_exclude_patterns` - A list of strings for file full paths to index in the folder. This is added to the `global setting` of the same name. This is checked after `index_include_patterns`.
* `follow_symlinks` - If symlinks should be followed when building the folder tree.


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

<a id="sublime-linter-config"></a>
## Sublime Linter Config

How you deal w/ providing linter paths on Windows:

```json
// SublimeLinter Settings - User
{
    "debug": true,
    "linters": {
        "phpcs": {
            "cmd": "/Users/javorszky/.composer/vendor/bin/phpcs",
            "args": [
                "--standard=WordPress-Extra"
            ]
        }
    }
}
```
