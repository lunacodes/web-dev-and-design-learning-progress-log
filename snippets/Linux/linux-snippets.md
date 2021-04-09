# Linux - Ubuntu Snippets

<!-- MarkdownTOC -->

* [Get OS Version](#get-os-version)
* [Start in Console Mode](#start-in-console-mode)
* [Package Management](#package-management)
  * [Packages Have Been Kept Back](#packages-have-been-kept-back)
  * [Neovim](#neovim)
* [Troubleshooting](#troubleshooting)
  * [Line Editing Issues](#line-editing-issues)

<!-- /MarkdownTOC -->

<a id="get-os-version"></a>
## Get OS Version

Get Ubuntu Version:

```bash
lsb_release -a
```
<a id="start-in-console-mode"></a>
## Start in Console Mode
Yes you can. As described here (ubuntuhandbook.org - Boot into text console ubuntu) you need to edit /etc/default/grub to have the next boot end up in text mode. In summary you will set these parameters:

```sh
GRUB_CMDLINE_LINUX_DEFAULT="text"
GRUB_TERMINAL=console

# After saving changes you need to run:
sudo update-grub
sudo systemctl set-default multi-user.target

# Undoing text-mode
# To undo sudo systemctl set-default multi-user.target simply type
sudo systemctl set-default graphical.target
```

<a id="package-management"></a>
## Package Management

<a id="packages-have-been-kept-back"></a>
### Packages Have Been Kept Back

From: [StackExchange: askUbuntu - The following packages have been kept back:” Why and how do I solve it?](https://askubuntu.com/a/602)

If the dependencies have changed on one of the packages you have installed so that a new package must be installed to perform the upgrade then that will be listed as "kept-back".

**Cautious solution 1:**

* Run `sudo apt-get --with-new-pkgs upgrade`, and it will install the kept-back packages.
* This has the benefit of not marking the kept-back packages as "manually installed," which could force more user intervention down the line (see comments).

**Cautious solution 2:**

* Run `sudo apt-get install <list of packages kept back>`.
  * In most cases this will give the kept-back packages what they need to successfully upgrade.

**Aggressive solution:**

* Run `sudo apt-get dist-upgrade`, which will force the installation of those new dependencies.
  * But dist-upgrade can be quite dangerous. Unlike upgrade it may remove packages to resolve complex dependency situations.
  * Unlike you, APT isn't always smart enough to know whether these additions and removals could wreak havoc.
  * You're probably better off learning a bit more about APT and resolving the dependency issues "by hand" by installing and removing packages on a case-by-case basis.

<a id="neovim"></a>
### Neovim

From: [GitHub - Neovim Wiki: Installing Neovim - Ubuntu](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)

Neovim has been added to a `"Personal Package Archive" (PPA)`. This allows you to install it with `apt-get`. Follow the links to the PPAs to see which versions of Ubuntu are currently available via the PPA. Choose stable or unstable:

[https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable](https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable) (Xenial 16.04 or newer only).
[https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable](https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable)


```bash
# To be able to use add-apt-repository you may need to install software-properties-common:

# sudo apt-get install software-properties-common

# If you're using an older version Ubuntu you must use:

sudo apt-get install python-software-properties

# Run the following commands:

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Prerequisites for the Python modules:

sudo apt-get install python-dev python-pip python3-dev python3-pip

# If you're using an older version Ubuntu you must use:

sudo apt-get install python-dev python-pip python3-dev
sudo apt-get install python3-setuptools
sudo easy_install3 pip


# For instructions to install the Python modules, see :help provider-python.

# If you want to use Neovim for some (or all) of the editor alternatives, use the following commands:

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# Note, however, that special interfaces, like view for nvim -R, are not supported. (See #1646 and #2008.)
```

<a id="troubleshooting"></a>
## Troubleshooting

<a id="line-editing-issues"></a>
### Line Editing Issues

```bash
if [[ "$(set -o | grep 'emacs\|\bvi\b' | cut -f2 | tr '\n' ':')" != 'off:off:' ]]; then
  echo "line editing is on"
fi
```
