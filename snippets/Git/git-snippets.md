# Git Snippets

<!-- MarkdownTOC -->

* [File Tracking](#file-tracking)
	* [General](#general)
	* [Git Ignore](#git-ignore)
* [Branch](#branch)
* [Diff](#diff)
	* [Diff multiple commits ago](#diff-multiple-commits-ago)
	* [Diff with remote](#diff-with-remote)
* [Merge](#merge)
	* [Merge Conflicts](#merge-conflicts)
		* [Fixing Merge Conflicts](#fixing-merge-conflicts)
* [Pull](#pull)
* [Stash](#stash)

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

<a id="branch"></a>
## Branch
* `git branch` list of local branches
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

<a id="merge"></a>
## Merge
To merge changes from branch `dev` into `master`:
* on `master`: `git merge branch`
* on branch-B -> A: switch to branch-A
* on branch-A: `git merge dev`

<a id="merge-conflicts"></a>
### Merge Conflicts

List Merge conflicts:
`git diff --name-only --diff-filter=U`

<a id="fixing-merge-conflicts"></a>
#### Fixing Merge Conflicts

From: https://stackoverflow.com/a/163659/4528637

`git mergetool`

**Step 1:** Run following commands in your terminal

```git
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false
```

This will set vimdiff as the default merge tool.

**Step 2:** Run following command in terminal

`git mergetool`

**Step 3:** You will see a vimdiff display in following format

```
  +----------------------+
  |       |      |       |
  |LOCAL  |BASE  |REMOTE |
  |       |      |       |
  +----------------------+
  |      MERGED          |
  |                      |
  +----------------------+
```

These 4 views are:

```
LOCAL – this is file from the current branch

BASE – common ancestor, how file looked before both changes

REMOTE – file you are merging into your branch

MERGED – merge result, this is what gets saved in the repo
```

You can navigate among these views using `ctrl+w`. You can directly reach MERGED view using `ctrl+w` followed by `j`.

More info about `vimdiff` navigation [here](https://stackoverflow.com/questions/4556184/vim-move-window-left-right) and [here](https://stackoverflow.com/questions/27151456/how-do-i-jump-to-the-next-prev-diff-in-git-difftool)

**Step 4:** You could edit the MERGED view the following way

If you want to get changes from REMOTE

`:diffg RE`
If you want to get changes from BASE

`:diffg BA`
If you want to get changes from LOCAL

`:diffg LO`
**Step 5:** Save, Exit, Commit and Clean up

`:wqa save and exit from vi`

`git commit -m "message"`

`git clean` Remove extra files (e.g. \*.orig) created by diff tool.

<a id="pull"></a>
## Pull
* `git pull origin branchname --allow-unrelated-histories`


<a id="stash"></a>
## Stash
* `git stash list` to list your stashed changes.
* `git stash show` to see what n is in the below commands.
* `git stash apply` to apply the most recent stash.
* `git stash apply stash@{n}` to apply an older stash.



