# Vi Snippets

## Copy, Cut, Paste
* Selectors:
    * `v` selects characters.
    * `V` select line
        * `V` `up` selects multiple lines.
        * `V` `Shift+up` functions as `select + PgUp`
    * `Ctrl+v` selects rectangular blocks
        * If `Ctrl+v` is mapped to paste, use `Ctrl+q`
* Functions:
    * `d` cut (delete)
    * `y ` copy (yank)
    * `P` paste before cursor

## Indent

```sh
# doesn't seem to work
# * block select with ctrl+v
# * Insert comment sign (//) with I
# * escape with ESC

# ctrl+v → jjjj → I → // → ESC
```
