# Git Snippets

<!-- MarkdownTOC -->

* [File Tracking](#file-tracking)
    * [General](#general)
    * [Git Ignore](#git-ignore)
* [Diff](#diff)
    * [Diff multiple commits ago](#diff-multiple-commits-ago)

<!-- /MarkdownTOC -->

<a id="file-tracking"></a>
## File Tracking

<a id="general"></a>
### General

* `git rm --cached`
* `git rm -r cached` - remove directory from git tracking, but keep on disk

<a id="git-ignore"></a>
### Git Ignore
```php
# Ignore everything
*

# But not these files...
!.gitignore
!script.pl
!template.latex
# etc...

# ...even if they are in subdirectories
!*/

# if the files to be tracked are in subdirectories
!*/a/b/file1.txt
!*/a/b/c/*
```

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
