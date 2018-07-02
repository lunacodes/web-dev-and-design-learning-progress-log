# Sublime Text 3 Custom Keybindings

##Wrap Code in Backticks

From: https://gist.github.com/beechnut/69a3ab6fd66f03e8e5ea

```js
// Copy the following into Preferences > Key Bindings -- User
// Thanks to:
// http://sublimetext.userecho.com/topic/86166-backtick-quoting-selected-text-does-not-work-like-single-quotes-and-double-quotes/

[
    // Auto-pair backticks
  { "keys": ["`"], "command": "insert_snippet", "args": {"contents": "`$0`"}, "context":
    [
      { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
      { "key": "selection_empty", "operator": "equal", "operand": true, "match_all": true },
      { "key": "following_text", "operator": "regex_contains", "operand": "^(?:\t| |\\)|]|\\}|>|$)", "match_all": true },
      { "key": "preceding_text", "operator": "not_regex_contains", "operand": "[`a-zA-Z0-9_]$", "match_all": true },
      { "key": "eol_selector", "operator": "not_equal", "operand": "string.quoted.single", "match_all": true }
    ]
  },
  { "keys": ["`"], "command": "insert_snippet", "args": {"contents": "`${0:$SELECTION}`"}, "context":
    [
      { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
      { "key": "selection_empty", "operator": "equal", "operand": false, "match_all": true }
    ]
  },
  { "keys": ["`"], "command": "move", "args": {"by": "characters", "forward": true}, "context":
    [
      { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
      { "key": "selection_empty", "operator": "equal", "operand": true, "match_all": true },
      { "key": "following_text", "operator": "regex_contains", "operand": "^`", "match_all": true }
    ]
  },
  { "keys": ["backspace"], "command": "run_macro_file", "args": {"file": "res://Packages/Default/Delete Left Right.sublime-macro"}, "context":
    [
      { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
      { "key": "selection_empty", "operator": "equal", "operand": true, "match_all": true },
      { "key": "preceding_text", "operator": "regex_contains", "operand": "`$", "match_all": true },
      { "key": "following_text", "operator": "regex_contains", "operand": "^`", "match_all": true }
    ]
  },
]
```