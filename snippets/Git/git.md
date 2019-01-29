# Git Snippets

<!-- MarkdownTOC -->

* [File Tracking](#file-tracking)
    * [General](#general)
    * [Git Ignore](#git-ignore)
* [Branching](#branching)
* [Diff](#diff)
    * [Diff multiple commits ago](#diff-multiple-commits-ago)
    * [Diff with remote](#diff-with-remote)

<!-- /MarkdownTOC -->

<a id="file-tracking"></a>
## File Tracking

<a id="general"></a>
### General

* `git rm --cached`
* `git rm -r cached` - remove directory from git tracking, but keep on disk
* `git ls-tree -r master --name-only` -  see what files git is tracking
* `git log --pretty=format: --name-only --diff-filter=A | sort - | sed '/^$/d'` - list all files that ever existed

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

<a id="branching"></a>
## Branching
* `git branch -a` list all branches (remote and local)

Note: git pull will pull into whatever branch you're currently in. git push will push the current branch into whatever branch you specify

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
<a id="diff-with-remote"></a>
### Diff with remote
```git
# Note: you can compare any branch to any other (ex master -> remote/dev)
git diff branch remote/name/branch
```
