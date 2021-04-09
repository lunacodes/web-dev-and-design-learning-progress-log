## Vimscripting

<!-- MarkdownTOC -->

* [Mapping](#mapping)

<!-- /MarkdownTOC -->


<a id="mapping"></a>
### Mapping

```bash
# " :map - dd
# " move line down 1
:map - ddp
# " move line up 1
:map - ddkP

# highlight word
:map <space> viw

# delete line
# <c-d> is ctrl-d
:map <c-d> dd
:imap <c-d> <esc>ddi
:nmap \ dd

# convert to uppercase
:vmap \ U
```

### Modal Mapping

* `nmap` - apply map to `normal` mode
* `vmap` - apply map to `visual` mode
* `imap` - apply map to `insert` mode

