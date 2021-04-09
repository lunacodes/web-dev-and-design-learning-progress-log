# Bash Scripting

<!-- MarkdownTOC -->

* [Functions](#functions)
* [Loops](#loops)
* [User Input via While True & Case Statement](#user-input-via-while-true--case-statement)
* [Check If File/Directory Exists](#check-if-filedirectory-exists)

<!-- /MarkdownTOC -->

<a id="functions"></a>
## Functions

```bash
function install_hstr() {
  if [ ! -f /usr/bin/hstr ]; then
    sudo add-apt-repository ppa:ultradvorka/ppa
    sudo apt-get update
    sudo apt-get install hstr
  fi
}
```

<a id="loops"></a>
## Loops

```sh

# Example 1:
for f in file1 file2 file3 file5
do
 echo "Processing $f"
 # do something on $f
done
You can also use shell variables:

# Example 2:
FILES="file1
/path/to/file2
/etc/resolv.conf"
for f in $FILES
do
  echo "Processing $f"
done
You can loop through all files such as *.c, enter:

# Example 3:
$ for f in *.c; do echo "Processing $f file.."; done
```

<a id="user-input-via-while-true--case-statement"></a>
## User Input via While True & Case Statement

```bash
# prompt the user to update
while true; do
  read -rp "Do you wish to sync and update apt-get? " yn
  case $yn in
    [Yy]* )
      echo "Updating package information "
      sudo apt-get update

      echo "upgrading packages "
      sudo apt-get upgrade
      break;;
    [Nn]* ) break;;
    * ) echo "I'll take that as a no. "
    break;;
  esac
done
```

<a id="check-if-filedirectory-exists"></a>
## Check If File/Directory Exists

```bash
# For files use -f instead of -d
if [[ ! -d ~/.config/nvim ]]; then
  mkdir ~/.config/nvim
  touch ~/.config/nvim/init.vim
fi
```

