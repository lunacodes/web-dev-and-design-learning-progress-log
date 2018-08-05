# Python Snippets

<!-- MarkdownTOC -->

* [String Manipulation](#string-manipulation)

<!-- /MarkdownTOC -->


<a id="string-manipulation"></a>
## String Manipulation

1. Reverse Word Order

```python
def reverseWord(w):
  return ' '.join(w.split()[::-1])
```