# Git Snippets

<!-- MarkdownTOC -->

* [Config File](#config-file)
  * [Locations and Priority](#locations-and-priority)
  * [Commands](#commands)
* [Repo Management](#repo-management)
* [Delete Sensitive Data](#delete-sensitive-data)
  * [BFG Repo Cleaner](#bfg-repo-cleaner)
* [File Tracking](#file-tracking)
  * [General](#general)
  * [Listing Files](#listing-files)
  * [Git Ignore](#git-ignore)
  * [Skip Worktree & Assume Unchanged](#skip-worktree--assume-unchanged)
* [Branch](#branch)
* [Diff](#diff)
  * [Diff multiple commits ago](#diff-multiple-commits-ago)
  * [Diff with remote](#diff-with-remote)
  * [Diff Filter](#diff-filter)
* [Logging](#logging)
  * [Graphing](#graphing)
* [Merge](#merge)
  * [Merge Conflicts](#merge-conflicts)
    * [Fixing Merge Conflicts](#fixing-merge-conflicts)
* [Patch](#patch)
* [Pull](#pull)
* [Stash](#stash)
* [Troubleshooting](#troubleshooting)
* [Editor Hangs During Commit](#editor-hangs-during-commit)
* [Colors](#colors)

<!-- /MarkdownTOC -->

<a id="config-file"></a>
## Config File

<a id="locations-and-priority"></a>
### Locations and Priority

The three options are `--local`, `--global`, `--system`. Git traverses and prioritizes them in that order (i.e. local always overrides global, which always overrides system)

* `--local`: found in your repo's`.git/.gitconfig`. Git config writes here by default, if no config option is passed
* `--global`: user-specific. Found in user's home directory.
  * Unix: `~/.gitconfig`
  * Windows: `C:\Users\<username>\.gitconfig`
* `--system`: System-level configuration is applied across an entire machine. This covers all users on an operating system and all repos.
  * Unix: `$(prefix)/etc/gitconfig`
  * Windows: `C:\ProgramData\Git\config`
    * XP & Older: `C:\Documents and Settings\All Users\Application Data\Git\config`

<a id="commands"></a>
### Commands

```bash
git config --global credential.helper 'cache --timeout=86400' (configure password cache for 1 day)
git config --global pull.rebase true (set pull rebase as default pull, otherwise it is pull merge and it creates merge commit)
git config --global diff.tool <scriptToCall>
git config --global merge.tool <scriptToCall>
git log origin/master..HEAD (find the logs between local master and remote head. It is equivalent to hg incoming in some ways)
git rebase HEAD~4 (Squashing a few commits)
git checkout <filePath> (git checkout .) (discard local changes)
git config --global core.eol lf # Ensure Unix-style line endings
git config --global core.autocrlf input # Windows: Use the file's line-endings
```

<a id="repo-management"></a>
## Repo Management

```bash
git remote -v (show remote repo config)
git remote set-url origin https://islandhill@bitbucket.org/islandhill/myob-coding-exercise.git (change remote url by adding username)
git remote add origin https://timsu@bitbucket.org/yarris/surveyservice-client.git
git remote rm origin

# stash: take away uncommitted changes, do whatever you want(git pull for example), then apply the change back
git stash save "description of the change"
git stash list
git stash apply

# Undo changes
git reset HEAD^ (reworking last commit; changes will stay)
git reset --hard HEAD^ (removing the last commit; changes will be gone)
git reset HEAD~2 (reworking last two commits)
git commit --amend (changing your last commit)
e.g. git commit -m 'initial commit'
     git add forgotten_file
     git commit --amend

.gitignore
The way to ignore all directories called bin anywhere below the current level in a directory tree is with a .gitignore file with the pattern:
bin/
```

<a id="delete-sensitive-data"></a>
## Delete Sensitive Data

<a id="bfg-repo-cleaner"></a>
### BFG Repo Cleaner

From: https://rtyley.github.io/bfg-repo-cleaner/

```bash
bfg --strip-blobs-bigger-than 100M --replace-text banned.txt repo.git

https://github.com/lunacodes/config_files_central.git

git clone --mirror https://github.com/lunacodes/config_files_central.git

# java -jar bfg.jar --strip-blobs-bigger-than 100M config_files_central.git
java -jar bgf.jar --delete-files id_{dsa,rsa}  my-repo.git

cd my-repo.git
# note: I probably need to unalias gc before I run this!
git reflog expire --expire=now --all && git gc --prune=now --aggressive

bfg --delete-files
# After deleting data from the main repo - you have to destroy it on any clones as well:

# Finally, once you're happy with the updated state of your repo, push it back up (note that because your clone command used the --mirror flag, this push will update all refs on your remote server):
$ git push
```


```bash
#Important: If you have any local changes, they will be lost. With or without --hard option, any local commits that haven't been pushed will be lost.[*]
# If you have any files that are not tracked by Git (e.g. uploaded user content), these files will not be affected.

git fetch --all

# Then, you have two options:
git reset --hard origin/master

# OR If you are on some other branch:
git reset --hard origin/<branch_name>

# Explanation:
# git fetch downloads the latest from remote without trying to merge or rebase anything.

# Then the git reset resets the master branch to what you just fetched. The --hard option changes all the files in your working tree to match the files in origin/master

# Maintain current local commits
# [*]: It's worth noting that it is possible to maintain current local commits by creating a branch from master before resetting:

git checkout master
git branch new-branch-to-save-current-commits
git fetch --all
git reset --hard origin/master
After this, all of the old commits will be kept in new-branch-to-save-current-commits.

# Uncommitted changes, however (even staged), will be lost. Make sure to stash and commit anything you need. For that you can run the following:
git stash
# And then to reapply these uncommitted changes:
git stash pop
```

<a id="file-tracking"></a>
## File Tracking

<a id="general"></a>
### General

* `git rm --cached`
* `git rm -r cached` - remove directory from git tracking, but keep on disk
* `git ls-tree -r master --name-only` -  see what files git is tracking
* `git log --pretty=format: --name-only --diff-filter=A | sort - | sed '/^$/d'` - list all files that ever existed

<a id="listing-files"></a>
### Listing Files

```bash
# H cached
# S skip-worktree
# M unmerged
# R removed/deleted
# C modified/changed
# K to be killed
# ? other

git ls-files -v # List files git is tracking + status
git ls-files -v | grep ^S # List skipped files
# Follow pattern above for any of the other letters/file statuses
```

<a id="git-ignore"></a>
### Git Ignore
```php
<a id="ignore-everything"></a>
# Ignore everything
*

<a id="but-not-these-files"></a>
# But not these files...
!.gitignore
!script.pl
!template.latex
<a id="etc"></a>
# etc...

<a id="even-if-they-are-in-subdirectories"></a>
# ...even if they are in subdirectories
!*/

<a id="if-the-files-to-be-tracked-are-in-subdirectories"></a>
# if the files to be tracked are in subdirectories
!*/a/b/file1.txt
<a id="abc"></a>
# !*/a/b/c/*
```

<a id="skip-worktree--assume-unchanged"></a>
### Skip Worktree & Assume Unchanged

```bash
git update-index --assume-unchanged # assume file unchanged
git update-index --no-assume-unchanged # stop assuming unchanged
git update-index --skip-worktree # skip the file
git update-index --no-skip-worktree # unskip the file
git ls-files -v . | grep ^S # List skipped files
```

<a id="branch"></a>
## Branch

* `git branch` list of local branches
* `git branch -a` list all branches (remote and local)

Note: git pull will pull into whatever branch you're currently in. git push will push the current branch into whatever branch you specify

Deleting Branches:

```bash
$ git branch -d branch_name
$ git branch -D branch_name
Note: The -d option is an alias for --delete, which only deletes the branch if it has already been fully merged in its upstream branch. You could also use -D, which is an alias for --delete --force, which deletes the branch "irrespective of its merged status." [Source: man git-branch]

Delete Remote Branch [Updated on 8-Sep-2017]
As of Git v1.7.0, you can delete a remote branch using

$ git push <remote_name> --delete <branch_name>
which might be easier to remember than

$ git push <remote_name> :<branch_name>
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

<a id="diff-with-remote"></a>
### Diff with remote
```git
<a id="note-you-can-compare-any-branch-to-any-other-ex-master---remotedev"></a>
# Note: you can compare any branch to any other (ex master -> remote/dev)
git diff branch remote/name/branch
```

<a id="diff-filter"></a>
### Diff Filter

Note: This applies to logging, diff, etc

```sh
<a id="git-diff-filter-example-usage"></a>
# Git Diff-Filter Example usage
git diff --diff-filter=ADM

<a id="include-files-that-are"></a>
# Include files that are:
<a id="a-added-a"></a>
# A  Added (A)
<a id="c-copied-c"></a>
# C  Copied (C)
<a id="d-deleted-d"></a>
# D  Deleted (D)
<a id="m-modified-m"></a>
# M  Modified (M)
<a id="r-renamed-r"></a>
# R  Renamed (R)
<a id="t-type-ie-regular-file-symlink-submodule-%E2%80%A6%E2%80%8B-changed-t"></a>
# T  Type (i.e. regular file, symlink, submodule, …​) changed (T)
<a id="u-unmerged-u"></a>
# U  Unmerged (U)
<a id="x-unknown-x"></a>
# X  Unknown (X)
<a id="b-pairing-broken-b"></a>
# B  Pairing Broken (B)
<a id="<a-id="exclude-via-lowercase"></a>"></a>
#
<a id="exclude-via-lowercase"></a>
# Exclude via lowercase
```

<a id="logging"></a>
## Logging

<a id="graphing"></a>
### Graphing

Pretty Graph:
```sh
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
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
Pretty version: https://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/

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

<a id="patch"></a>
## Patch

```bash
-p patch
This lets you choose one path out of a status like selection. After choosing the path, it presents the diff between the index and the working tree file and asks you if you want to stage the change of each hunk. You can select one of the following options and type return:

   y - stage this hunk
   n - do not stage this hunk
   q - quit; do not stage this hunk nor any of the remaining ones
   a - stage this hunk and all later hunks in the file
   d - do not stage this hunk nor any of the later hunks in the file
   g - select a hunk to go to
   / - search for a hunk matching the given regex
   j - leave this hunk undecided, see next undecided hunk
   J - leave this hunk undecided, see next hunk
   k - leave this hunk undecided, see previous undecided hunk
   K - leave this hunk undecided, see previous hunk
   s - split the current hunk into smaller hunks
   e - manually edit the current hunk
   ? - print help
```

<a id="pull"></a>
## Pull
* `git pull origin branchname --allow-unrelated-histories`


<a id="stash"></a>
## Stash
* `git stash list` to list your stashed changes.
* `git stash show` to see what n is in the below commands.
* `git stash apply` to apply the most recent stash.
* `git stash apply stash@{n}` to apply an older stash.

<a id="troubleshooting"></a>
## Troubleshooting

<a id="editor-hangs-during-commit"></a>
## Editor Hangs During Commit

1. Delete `.git/index.lock`.
2. If that doesn't work, then `pgrep` and `taskkill /F /IM git.exe`


<a id="colors"></a>
## Colors

```sh
<a id="git-pretty-colors"></a>
# Git Pretty Colors
<a id="the-placeholders-are"></a>
# The placeholders are:

'%H': commit hash
'%h': abbreviated commit hash
'%T': tree hash
'%t': abbreviated tree hash
'%P': parent hashes
'%p': abbreviated parent hashes
'%an': author name
'%aN': author name (respecting .mailmap, see git-shortlog[1] or git-blame[1])
'%ae': author email
'%aE': author email (respecting .mailmap, see git-shortlog[1] or git-blame[1])
'%ad': author date (format respects --date= option)
'%aD': author date, RFC2822 style
'%ar': author date, relative
'%at': author date, UNIX timestamp
'%ai': author date, ISO 8601-like format
'%aI': author date, strict ISO 8601 format
'%cn': committer name
'%cN': committer name (respecting .mailmap, see git-shortlog[1] or git-blame[1])
'%ce': committer email
'%cE': committer email (respecting .mailmap, see git-shortlog[1] or git-blame[1])
'%cd': committer date (format respects --date= option)
'%cD': committer date, RFC2822 style
'%cr': committer date, relative
'%ct': committer date, UNIX timestamp
'%ci': committer date, ISO 8601-like format
'%cI': committer date, strict ISO 8601 format
'%d': ref names, like the --decorate option of git-log[1]
'%D': ref names without the " (", ")" wrapping.
'%S': ref name given on the command line by which the commit was reached (like git log --source), only works with git log
'%e': encoding
'%s': subject
'%f': sanitized subject line, suitable for a filename
'%b': body
'%B': raw body (unwrapped subject and body)
'%N': commit notes
'%GG': raw verification message from GPG for a signed commit
'%G?': show "G" for a good (valid) signature, "B" for a bad signature, "U" for a good signature with unknown validity, "X" for a good signature that has expired, "Y" for a good signature made by an expired key, "R" for a good signature made by a revoked key, "E" if the signature cannot be checked (e.g. missing key) and "N" for no signature
'%GS': show the name of the signer for a signed commit
'%GK': show the key used to sign a signed commit
'%GF': show the fingerprint of the key used to sign a signed commit
'%GP': show the fingerprint of the primary key whose subkey was used to sign a signed commit
'%gD': reflog selector, e.g., refs/stash@{1} or refs/stash@{2 minutes ago}; the format follows the rules described for the -g option. The portion before the @ is the refname as given on the command line (so git log -g refs/heads/master would yield refs/heads/master@{0}).
'%gd': shortened reflog selector; same as %gD, but the refname portion is shortened for human readability (so refs/heads/master becomes just master).
'%gn': reflog identity name
'%gN': reflog identity name (respecting .mailmap, see git-shortlog[1] or git-blame[1])
'%ge': reflog identity email
'%gE': reflog identity email (respecting .mailmap, see git-shortlog[1] or git-blame[1])
'%gs': reflog subject
'%Cred': switch color to red
'%Cgreen': switch color to green
'%Cblue': switch color to blue
'%Creset': reset color
'%C(…​)': color specification, as described under Values in the "CONFIGURATION FILE" section of git-config[1]. By default, colors are shown only when enabled for log output (by color.diff, color.ui, or --color, and respecting the auto settings of the former if we are going to a terminal). %C(auto,…​) is accepted as a historical synonym for the default (e.g., %C(auto,red)). Specifying %C(always,…​) will show the colors even when color is not otherwise enabled (though consider just using --color=always to enable color for the whole output, including this format and anything else git might color). auto alone (i.e. %C(auto)) will turn on auto coloring on the next placeholders until the color is switched again.
'%m': left (<), right (>) or boundary (-) mark
'%n': newline
'%%': a raw '%'
'%x00': print a byte from a hex code
'%w([<w>[,<i1>[,<i2>]]])': switch line wrapping, like the -w option of git-shortlog[1].
'%<(<N>[,trunc|ltrunc|mtrunc])': make the next placeholder take at least N columns, padding spaces on the right if necessary. Optionally truncate at the beginning (ltrunc), the middle (mtrunc) or the end (trunc) if the output is longer than N columns. Note that truncating only works correctly with N >= 2.
'%<|(<N>)': make the next placeholder take at least until Nth columns, padding spaces on the right if necessary
'%>(<N>)', '%>|(<N>)': similar to '%<(<N>)', '%<|(<N>)' respectively, but padding spaces on the left
'%>>(<N>)', '%>>|(<N>)': similar to '%>(<N>)', '%>|(<N>)' respectively, except that if the next placeholder takes more spaces than given and there are spaces on its left, use those spaces
'%><(<N>)', '%><|(<N>)': similar to '%<(<N>)', '%<|(<N>)' respectively, but padding both sides (i.e. the text is centered)
%(trailers[:options]): display the trailers of the body as interpreted by git-interpret-trailers[1]. The trailers string may be followed by a colon and zero or more comma-separated options. If the only option is given, omit non-trailer lines from the trailer block. If the unfold option is given, behave as if interpret-trailer’s --unfold option was given. E.g., %(trailers:only,unfold) to do both.
```

