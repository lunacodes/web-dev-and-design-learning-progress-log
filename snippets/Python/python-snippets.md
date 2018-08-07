# Python Snippets

<!-- MarkdownTOC -->

* [Shell](#shell)
* [String Manipulation](#string-manipulation)

<!-- /MarkdownTOC -->


<a id="shell"></a>
## Shell

1. Require a specific version of Python

```python
import sys

if sys.version_info[0] < 3:
    raise Exception("Python 3 or a more recent version is required.")
```

Note: You can also specify this to the user via `#!/usr/bin/env python3`

<a id="string-manipulation"></a>
## String Manipulation

1. Reverse Word Order

```python
def reverseWord(w):
  return ' '.join(w.split()[::-1])
```

