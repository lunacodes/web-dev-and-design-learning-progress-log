## FTP Tutorial
Next Previous Contents
## 3. Beginner's guide to using ftp
A quick guide to using ftp.

The standard ftp program is the original ftp client. It comes standard with most Linux distributions. It first appeared in 4.2BSD, which was developed by the University of California, Berkeley.

## 3.1 Running the ftp program
It's easy to use ftp. Let's say you want to connect to the anonymous ftp site metalab.unc.edu, to download the latest Linux kernel source.

At the command line, type:

 $ ftp metalab.unc.edu
The ftp program will attempt to connect to metalab.unc.edu. Another way to do this is to run ftp from the command line with no parameters, and use the open command, with the site name as an argument:

 $ ftp
ftp> open metalab.unc.edu
## 3.2 Logging into an FTP server
When you connect to an FTP site, it will ask you for a login (pressing enter will log in as your local user name, in this case, foo: We log in as anonymous or ftp, to get to the public archive.

 220 helios.oit.unc.edu FTP server (Version wu-2.6.0(2) Wed Nov 17 14:44:12
EST 1999) ready.
Name (metalab.unc.edu:foo):
Now, we enter a complete e-mail address as the password (this is what most public FTP sites request).

 331 Guest login ok, send your complete e-mail address as password.
Password:
After a successful login, the following information is given to us:

 Remote system type is UNIX.
Using binary mode to transfer files.
ftp>
## 3.3 File transfer types
After you log in to an ftp site, ftp will print out the file transfer type. In our case, it is binary. Binary mode transfers the files, bit by bit, as they are on the FTP server. Ascii mode, however, will download the text directly. You can type ascii or binary to switch between the types.

You want to download the kernel source, so you leave the file transfer type at binary. The binary type is also what you would use for any non-text files -- such as graphic images, zip/gzip archives, executable programs, etc. If in doubt, use binary mode.

## 3.4 Navigating and listing directories
You do an ls to see a list of the files. The ls command on ftp servers is executed on the remote server, so the command line options that you can use with it vary from server to server. The most common options are generally available, check the manpage for ls for details.

 ftp> ls
200 PORT command successful.
150 Opening ASCII mode data connection for /bin/ls.
total 33590
-r--r--r--   1 root     other    34348506 Dec 03 03:53 IAFA-LISTINGS
lrwxrwxrwx   1 root     other           7 Jul 15  1997 README -> WELCOME
-rw-r--r--   1 root     other         890 Nov 15 13:11 WELCOME
dr-xr-xr-x   2 root     other         512 Jul 15  1997 bin
dr-xr-xr-x   2 root     other         512 Jul 15  1997 dev
dr-xr-xr-x   2 root     other         512 Jul 18  1997 etc
drwxrwxrwx  11 ftp      20           4608 Nov 28 16:00 incoming
lrwxrwxrwx   1 root     other          13 Jun 04  1998 ls-lR -> IAFA-LISTINGS
dr-xr-xr-x  17 root     root          512 Jun 08 11:43 pub
dr-xr-xr-x   3 root     other         512 Jul 15  1997 unc
dr-xr-xr-x   5 root     other         512 Jul 15  1997 usr
226 Transfer complete.
If the ls command lists so many files that they scroll off the top of the screen, you can use Shift-PageUp to scroll up. This works in Linux console mode as well as in xterm or rxvt.

On public FTP archives, the downloadable resources are usually held in the /pub directory. In this example, you already know that the kernel sources are in the directory /pub/Linux/kernel, so you type the following to get into that directory:

 ftp> cd pub/Linux/kernel
250-README for kernel
250-
250-What you'll find here: kernel sources and patches
250-
250-
250 CWD command successful.
The messages you see, which begin with "250", are information messages sent by the server. In this case, the ftp server is configured to automatically send you the README file when you cd into the directory.

## 3.5 Downloading and uploading files
Now, after doing another ls, you see that you want to cd into the v2.2 directory. You do yet another ls, and find the file you want to download. It is linux-2.2.1## 3.tar.gz. So you type this:

 ftp> get linux-2.2.1## 3.tar.gz
local: linux-2.2.1## 3.tar.gz remote: linux-2.2.1## 3.tar.gz
200 PORT command successful.
150 Opening BINARY mode data connection for linux-2.2.1## 3.tar.gz (15079540
bytes).
The ftp program has started saving the remote file linux-2.2.1## 3.tar.gz as the local file linux-2.2.1## 3.tar.gz.

If you wanted to save it as the local file foo.tar.gz, you could have specified it like this:

 ftp> get linux-2.2.1## 3.tar.gz foo.tar.gz
local: foo.tar.gz remote: linux-2.2.1## 3.tar.gz
200 PORT command successful.
150 Opening BINARY mode data connection for linux-2.2.1## 3.tar.gz (15079540
bytes).
If you want to download more than one file at a time, you'll have to use the mget (multiple get) command. You can use mget together with a space-delimited list of filenames you want to download, or you can use wildcards with the mget command. For example:

 ftp> mget linux*
Would get all files starting with the string "linux". Normally, mget will prompt you for each file before it downloads it. You can toggle this by using the prompt command.

Now let's say you've written a piece of software, and you want to upload it to MetaLab to be included in their Linux software archive. First, you'd change to the /incoming directory (most public FTP servers have a directory, usually called incoming or uploads, where files can be uploaded), then you'd use the put command:

 ftp> cd /incoming
ftp> put foo.tar.gz
local: foo.tar.gz remote: foo.tar.gz
200 PORT command successful.
150 Opening BINARY mode data connection for foo.tar.gz.
226 Transfer complete.
10257 bytes sent in 0.00316 secs (## 3.2e+03 Kbytes/sec)
The put command works the same way as the get command, so you can use mput to upload multiple files at the same time. You can also upload a local file with a different filename on the server by specifying the remote filename and/or pathname as an argument.

What if the file foo.tar.gz is not in your current local directory when you try to upload it? You can switch local directories by using the lcd (local change directory) command:

 ftp> lcd /home/foo/
Local directory now /home/foo
## 3.6 Running shell commands
The ftp client supports using the bang (!) to run local commands. For example, to get a listing of files in your current local directory, do this:

 ftp> !ls
The way this works is that ftp calls the shell (specified in the $SHELL environment variable), and it is the shell which runs ls. Thus, you can run any command-line which works with your shell simply by prepending "!" to it (the default shell in most Linux distributions is bash, the Bourne Again SHell). Please note that !cd does not work as you would expect, this is why the lcd command exists.

## 3.7 Hash marks and tick
Wouldn't it be nice if you could watch the progress while you're downloading a file with ftp? You can use the hash command to print out hash marks as you download a file:

 ftp> hash
Hash mark printing on (1024 bytes/hash mark).
As you can tell, ftp will print a hash mark for every 1024 bytes of data you download.

There is also a tick option.

 ftp> tick
Tick counter printing on (10240 bytes/tick increment).

This will print something to this effect as you download a file:

Bytes transferred: 11680
## 3.8 Other ftp commands
There are many other ftp commands. If you have the permissions to do so (which you should, if you are connected to your own private shell account), you can make a directory on the remote server using the mkdir command. You can remove a file on the remote server using the delete command, or rmdir to remove a directory. You can also change file permissions using the chmod command.

For more elaborate information on using ftp, please see the online help in the ftp program (accessible by typing help with no arguments for a list of commands, or help <commandname> for specific help on a command). You can also read the Unix man page for ftp by typing man ftp at your command prompt.

Next Previous Contents
