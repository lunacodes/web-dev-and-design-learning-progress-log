# Python Snippets

<!-- MarkdownTOC -->

* [Shell](#shell)
* [String Manipulation](#string-manipulation)
* [Infinity](#infinity)

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

<a id="infinity"></a>
## Infinity

```python
# positive infinity
p_inf = float("inf")
# negative infinity
n_inf = float("-inf")
```

```python
# Check if a variable or value is infinity

# by using the math library (preferred way)
import math
math.isinf(float("-inf"))  # OUTPUT:True
math.isinf(float("inf"))   # OUTPUT:True

# by comparing to infinity
float("inf") == float("inf")  # OUTPUT:True
float("-inf") == float("-inf")  # OUTPUT:True
```
