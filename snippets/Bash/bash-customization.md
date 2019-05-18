# Bash Customization

## Shell Prompt

* `PS1` – The value of this parameter is expanded (see PROMPTING below) and used as the primary prompt string. The default value is \s-\v\$ .
* `PS2` – The value of this parameter is expanded as with `PS1` and used as the secondary prompt string (i.e. for newlines). The default is `>`
* `PS3` – The value of this parameter is used as the prompt for the select command
* `PS4` – The value of this parameter is expanded as with PS1 and the value is printed before each command bash displays during an execution trace. The first character of `PS4` is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is +

```sh
\a : an ASCII bell character (07)
\d : the date in “Weekday Month Date” format (e.g., “Tue May 26”)
\D{format} :	the format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required
\e : an ASCII escape character (033)
\h : the hostname up to the first ‘.’
\H : the hostname
\j : the number of jobs currently managed by the shell
\l : the basename of the shellâ€™s terminal device name
\n : newline
\r : carriage return
\s : the name of the shell, the basename of $0 (the portion following the final slash)
\t : the current time in 24-hour HH:MM:SS format
\T : the current time in 12-hour HH:MM:SS format
\@ : the current time in 12-hour am/pm format
\A : the current time in 24-hour HH:MM format
\u : the username of the current user
\v : the version of bash (e.g., 2.00)
\V : the release of bash, version + patch level (e.g., 2.00.0)
\w : the current working directory, with $HOME abbreviated with a tilde
\W : the basename of the current working directory, with $HOME abbreviated with a tilde
\! : the history number of this command
\# : the command number of this command
\$ : if the effective UID is 0, a #, otherwise a $
\nnn : the character corresponding to the octal number nnn
\\ : a backslash
\[ : begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
\] : end a sequence of non-printing characters

```
