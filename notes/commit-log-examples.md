# Commit Log Examples

A list of commit log examples, intended to serve as a sort of style guide

1. NPM Repo 

```
Example from: https://medium.com/@watilde/cheers-to-a-node-js-conference-in-japan-b9e6e90acd46

$ git clone https://github.com/nodejs/node.git
$ cd node
$ git log --oneline --grep 'https://github.com/nodejs/code-and-learn/issues/58'
9927795 test: use setImmediate() in test of stream2
30bf123 doc: fix typo in doc/repl.md line: 6
63e889a test: add test case of PassThrough
195989d doc: fix typo e.g., => e.g.
8a78fcb test: change from setTimeout to setImmediate
a3dd943 doc: fix typo about cluster doc, (eg. -> e.g.)
9428854 doc: fix typo in doc/tls.md
8ca322d test: improve test-stream2-objects.js
7030f09 doc: fix e.g., to e.g. in doc/http.md
```