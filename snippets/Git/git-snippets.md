# Git Snippets

<!-- MarkdownTOC -->

* [File Tracking](#file-tracking)
  * [General](#general)
  * [Git Ignore](#git-ignore)
* [Branch](#branch)
* [Diff](#diff)
  * [Diff multiple commits ago](#diff-multiple-commits-ago)
  * [Diff with remote](#diff-with-remote)
* [Logging](#logging)
  * [Graphing](#graphing)
* [Merge](#merge)
  * [Merge Conflicts](#merge-conflicts)
    * [Fixing Merge Conflicts](#fixing-merge-conflicts)
* [Pull](#pull)
* [Stash](#stash)
* [Colors](#colors)

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

<a id="pull"></a>
## Pull
* `git pull origin branchname --allow-unrelated-histories`


<a id="stash"></a>
## Stash
* `git stash list` to list your stashed changes.
* `git stash show` to see what n is in the below commands.
* `git stash apply` to apply the most recent stash.
* `git stash apply stash@{n}` to apply an older stash.

<a id="colors"></a>
## Colors

```sh
# Git Pretty Colors
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

