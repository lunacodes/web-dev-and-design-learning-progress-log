# Vim Settings

<!-- MarkdownTOC -->

* [General](#general)
* [In general, softtabstop and shiftwidth should be equal. This results in consistent behavior.](#in-general-softtabstop-and-shiftwidth-should-be-equal-this-results-in-consistent-behavior)
* [If softtabstop < tabstop, vim inserts spaces until the amount of characters add up to the value in tabstop](#if-softtabstop--tabstop-vim-inserts-spaces-until-the-amount-of-characters-add-up-to-the-value-in-tabstop)
* [ts sts sw](#ts-sts-sw)
* [Get current filetype:](#get-current-filetype)
* [Only do this part when compiled with support for autocommands](#only-do-this-part-when-compiled-with-support-for-autocommands)
* [autocmd is essentially a callback](#autocmd-is-essentially-a-callback)
* [List of Defaults](#list-of-defaults)

<!-- /MarkdownTOC -->


See [Vim documentation: options](http://vimdoc.sourceforge.net/htmldoc/options.html) for full list of options

<a id="general"></a>
## General

```bash
# prints out the version plus a whole ton of settings,
# as well as the locations of the various .vimrc files,
# and other loaded scripts!!
:version

<a id="indentation"></a>
## Indentation

```bash
tabstop     # ts - Specifics the width of a tab character
expandtab   # Indent with spaces, instead of tabs
softtabstop # fine-tunes the amoutn of whitespace to be insterted. Takes precedence over tabstop.
shiftwidth  # number of spaces pressing shift key will insert

<a id="in-general-softtabstop-and-shiftwidth-should-be-equal-this-results-in-consistent-behavior"></a>
# In general, softtabstop and shiftwidth should be equal. This results in consistent behavior.
<a id="if-softtabstop--tabstop-vim-inserts-spaces-until-the-amount-of-characters-add-up-to-the-value-in-tabstop"></a>
# If softtabstop < tabstop, vim inserts spaces until the amount of characters add up to the value in tabstop
<a id="ts-sts-sw"></a>
# ts sts sw
```

<a id="indentation-by-filetype"></a>
### Indentation By Filetype

```bash
<a id="get-current-filetype"></a>
# Get current filetype:
:set filetype? # equiv to `:set ft?`
:setfiletype xml # set

<a id="only-do-this-part-when-compiled-with-support-for-autocommands"></a>
# Only do this part when compiled with support for autocommands
<a id="autocmd-is-essentially-a-callback"></a>
# autocmd is essentially a callback
if has("autocmd")
  # Enable file type detection
  filetype on

  # setlocal is essential unless you want it to be global for all fts
  # Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  # Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  # Set Default Syntax for FileType
  # Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  # Treat .rss and .atom as XML
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
endif
```

<a id="show-tab-chars"></a>
## Show Tab Chars

```bash
set list # show tabs
set listchars=tab:>- # Tabs will be displayed as > with -- between tab

<a id="list-of-defaults"></a>
## List of Defaults

```bash
tabstop = 8
softtabstop = 0
shiftwidth = 8
noexpandtab
