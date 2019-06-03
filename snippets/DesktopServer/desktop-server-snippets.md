# Manual Installation of DesktopServer on Windows

<!-- https://docs.serverpress.com/article/47-manually-installing-desktopserver-on-windows -->

## Installation

1. First, download the installation package for your platform from your account.

2. Unzip the .zip file and locate the `libs` sub-folder containing the xampplite folder.

3. Drag the xampplite folder to your c:\ hard drive.
Open the Windows command prompt by pressing the Windows button on your keyboard or clicking the `Start` button and typing `Command Prompt`, followed by pressing the enter key.

4. Type the following (on one line) in the Command Prompt window, followed by pressing the enter key:
`cd /D c:\xampplite\ds-plugins&..\all\bin\unzip ds-cli-win.zip`

Type the next command, follwed by pressing the enter key:
`cd /D c:\xampplite\mysql&..\all\bin\unzip backup.zip`

You may now close the Windows Command Prompt window or type `exit`.

5. Double-click the DesktopServer program icon from within your `c:\xampplite`

If everything went well, DesktopServer will launch, and you can create your first local development site!
