# Clarusway of Development Environment

Whichever language or technology you are using it doesn't matter, somehow you will eventually meet with the black screen of terminal window. But this time, you are luckier than before, since there are many tools those will make your journey on that terminals. In this article we'll cover all major operating systems, including Windows 10, 8 and 7 from Microsoft, macOS from Apple, and Ubuntu 20.04 flavor of Linux.

Users need to install, remove, upgrade, configure and manage software packages. This is a time consuming job. Linux distributions have package managers long time ago. Package managers help the user to install correct compatible version of desired software with its dependencies as well. You don't have to consider about downloading and installing of third party software, to run the application flawlessly.

Linux distributions usually have their own custom package manager, such as apt and apt-get for ubuntu/debian, yum and dnf  for fedora/redhat and zypper for openSUSE etc. On the macOS side there is a third party community tool called homebrew in short brew. For Windows family, there is also community/proprietary tool named chocolatey.

First of all we will define our roadmap of our development environment for those operating systems. After installing package managers on each OS, we will continue to enhance terminal experience with terminal applications, fonts and shells. Some part of this roadmap shares common steps, so please follow the common steps for your setup.

## Roadmap

1. Windows Users
   1. Windows 10
   2. Windows 8.1
   3. Windows 7
2. Linux (Ubuntu/Kubuntu) Users
3. MacOS (Mojave and beyond) Users
4. Common Steps

## Windows Users

### Windows 10

choco install

windows terminal

wsl ubuntu

zsh on wsl ubuntu

[Follow Windows Common](#Windows Common)

### Windows 8.1

choco install

cmdermini

openssh

[Follow Windows Common](#Windows Common)

### Windows 7

~~7zip install~~
~~https://www.7-zip.org/download.html~~

chocolatey offline install
https://chocolatey.org/api/v2/package/chocolatey

extract chocolatey.nupkg file with 7zip 

run powershell with elevated administrator account
change directory to "tools" folder in the directory where you extracted above file

run `.\chocolateyInstall.ps1` to allow Chocolatey to install.
NOTE This will not set Chocolatey as an installed package, so it may be a good idea to also 
run`choco upgrade chocolatey -y` and let it reinstall the same version, but at least it will be available for upgrades then.

restart computer

let's install git for windows 
open powershell or command prompt with elevated administrator account

type `choco install git -y`

we will download pacman and some stuff to enhance terminal experience
from the url: https://packages.msys2.org/search

for 64bit system

1. pacman, https://repo.msys2.org/msys/x86_64/pacman-5.2.2-4-x86_64.pkg.tar.xz

2. extract this zip into git folder

open these file with 7zip, there is one archieve file within, open inner ones and extract all folders
into git for windows directory (default folder is c:\Program Files\Git\

3. open git bash terminal and run following commands:




for 32bit system:

1. pacman, https://repo.msys2.org/msys/i686/pacman-5.2.2-4-i686.pkg.tar.xz

2. extract this [pacman mirror list files](./assets/mirrorlists.zip) zip into git folder: 

open these file with 7zip, there is one archieve file within, open inner ones and extract all folders into git for windows directory (default folder is c:\Program Files\Git\

3. keyring,https://repo.msys2.org/msys/x86_64/msys2-keyring-1~20201002-1-any.pkg.tar.xz
4. start git bash terminal as elevated and run following commands:
   source: https://github.com/Alexpux/MSYS2-pacman/issues/50#issuecomment-602141995

```sh
set "PATH=%programfiles%\Git\usr\bin"
bash pacman-key --init
bash pacman-key --populate msys2
bash pacman-key --refresh-keys
pacman -Tv
pacman -Syuv --overwrite='*'
```

  close git bash window and reopen it as elevated

```sh
pacman --version
pacman -Sv --noconfirm --overwrite='*' bash 
#  close git bash window and reopen it as elevated
pacman -Sv --noconfirm --overwrite='*' bash 
pacman -Sv --noconfirm --overwrite='*' rsync
pacman -Sv --noconfirm --overwrite='*' util-linux 
```

to test pacman works

```sh
# tree command is not installed, run tree to check
tree 
#so let's install
pacman -S tree
pacman -S zsh --overwrite='*' --noconfirm
```

now we are more close to the end

lets configure git bash directory mounts

```shell
$ nano /etc/fstab
# modify the lines below "DO NOT REMOVE NEXT LINE"

# DO NOT REMOVE NEXT LINE. It remove cygdrive prefix from path
none /mnt cygdrive binary,posix=0,noacl,user 0 0
# All drives will be mounted under /mnt eg /mnt/c /mnt/d as in WSL
none /tmp usertemp binary,posix=0,noacl 0 0
# temp settings as the name suggests
/mnt/c/Users /home auto bind,binary,posix=0,noacl,user 0 0
# binding c:\Users to /home so user homedir will be /home/<user>
```

safe and close file
restart windows later on to see mounts are updated accordingly
`pwd`  your home should be `/home/<username>`

download these MesloLGS NF font files and install them 
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

next install cmdermini
type `choco install cmdermini -y`

next openssh ofcourse with choco
`choco install openssh -y`

we will configure  openssh later on.

lets shine our terminal
goto folder c:\tools\cmdermini
and by right clicking pin cmder.exe to taskbar and/or start menu

run cmder

it looks better than regular command prompt, but it is not ready yet.
As we finish initial setup for terminal our new multi tab terminal app will be cmder
later on we will configure it.

you can use this font "MesloLGS NF" on all of your terminal applications command prompt powershell, git bash, git cmd and cmder. [note] cmder features enables MesloLGS NF on console applications



[Follow Windows Common](#Windows Common)

### Windows Common

git bash

setup zsh on git bash

[Follow Common Steps](#Common Steps)

## Linux (Ubuntu/Kubuntu) Users

zsh

[Follow Common Steps](#Common Steps)

## MacOS (Mojave and beyond) Users

homebrew

iterm2

[Follow Common Steps](#Common Steps)

## Common Steps

meslolgs nf

oh-my zsh

powerlevel10k



## Credits

articles link