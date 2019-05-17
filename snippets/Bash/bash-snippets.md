# Bash Snippets

## File Commands

```sh
gzip -d file.gz                 # gzip file
gunzip file.gz                  # un-gzip file
ls -a                           # list all files including hidden file starting with '.'
ls --color                      # colored list [=always/never/auto]
ls -d                           # list directories # with ' */'
ls -F                           # add one char of */=>@| to enteries
ls -i                           # list file's inode index number
ls -l                           # list with long format # show permissions
ls -la                          # list long format including hidden files
ls -lh                          # list long format with readable file size
ls -ls                          # list with long format with file size
ls -r                           # list in reverse order
ls -R                           # list recursively directory tree
ls -s                           # list file size
ls -S                           # sort by file size
ls -t                           # sort by time & date
ls -X                           # sort by extension name
mv dir1 dir2                    # no need for recursive
mv dir1 ..                      # mv dir up one dir
mv dir1/* ..                    # mv all files in dir up one dir
$ rm file.txt 2> /dev/null      # redirect error messages to /dev/null??
tree                            # list files and folders under current dir
tree dir/                       # list files and folders under specific dir
tree -L 2 dir/                  # limit recursion depth of tree
tree -d                         # list only directories
$ tree -d /etc/ | less          # list directories line by line
tree -a dir/                    # include hidden files and folders
tree -C dir/                    # color your tree

zip -r filename.zip folder      # zip file
zip -r filename.zip folder1 folder2 # add multiple folders to new zip
zip -r filename.zip /path/to/folder1 /path/to/file2
zip -r -e data.zip data/        # encrypt zip file

```

