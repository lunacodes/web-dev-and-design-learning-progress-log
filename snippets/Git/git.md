# Git Snippets

<!-- MarkdownTOC -->

* [File Tracking](#file-tracking)
* [Diff](#diff)
    * [Diff multiple commits ago](#diff-multiple-commits-ago)

<!-- /MarkdownTOC -->

<a id="file-tracking"></a>
## File Tracking
* `git rm --cached`
* `git rm -r cached` - remove directory from git tracking, but keep on disk 

<a id="diff"></a>
## Diff

<a id="diff-multiple-commits-ago"></a>
### Diff multiple commits ago

Example - diffs two commits ago:
```git
$ git diff HEAD^^ HEAD main.c
$ git diff HEAD^^..HEAD -- main.c
$ git diff HEAD~2 HEAD -- main.c
```
