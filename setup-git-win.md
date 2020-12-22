# Git for Windows Setup

> If it is not installed yet, you can install with `choco install 7zip -y` on an elevated command prompt/or powershell, or you can download from https://www.7-zip.org/ 

- For 64 bit Windows Systems (x86_64) **[How to check](https://www.howtogeek.com/howto/21726/how-do-i-know-if-im-running-32-bit-or-64-bit-windows-answers/)**

  - Download files below: 
    - [ ] pacman, https://repo.msys2.org/msys/x86_64/pacman-5.2.2-4-x86_64.pkg.tar.xz
    - [ ] keyring,https://repo.msys2.org/msys/x86_64/msys2-keyring-1~20201002-1-any.pkg.tar.xz
    - [ ] repository mirror list, [pacman mirror list files](./assets/mirrorlists.zip?raw=true)
  
- For 32 bit Windows Systems(x86):

  - Download files below:
    - [ ] pacman, https://repo.msys2.org/msys/i686/pacman-5.2.2-4-i686.pkg.tar.xz
    - [ ] keyring,https://repo.msys2.org/msys/x86_64/msys2-keyring-1~20201002-1-any.pkg.tar.xz
    - [ ] repository mirror list, [pacman mirror list files](./assets/mirrorlists.zip?raw=true)
  
- For the both architecture:

  - [ ] Open these file with 7zip. There are one more archieve files within pacman and keyring files. Open inner ones and extract all folders and as well as mirrorlists.zip contents into git for windows directory  (default folder is c:\Program Files\Git\)

  - [ ] Open `git-bash.exe` with **elevated rights** (click start and type `git bash` then click the application with `ctrl+shift` pressed):

    ```bash
    set "PATH=%programfiles%\Git\usr\bin"
    bash pacman-key --init
    bash pacman-key --populate msys2
    bash pacman-key --refresh-keys
    pacman -Tv
    pacman -Syuv --overwrite='*'
    pacman --version
    pacman -Sv --noconfirm --overwrite='*' bash 
    # this install might stuck at infinite loop, if so
    # close git bash window and reopen it as elevated
    # run the last command again
    pacman -Sv --noconfirm --overwrite='*' bash 
    pacman -Sv --noconfirm --overwrite='*' rsync
    pacman -Sv --noconfirm --overwrite='*' util-linux 
    ```

    *source: https://github.com/Alexpux/MSYS2-pacman/issues/50#issuecomment-602141995*

  - [ ] Test if pacman is working:

    ```bash
    # tree command is not installed, run tree to check
    tree 
    # so let's install
    pacman -S tree
    # test tree command as below
    tree -dL 2
    pacman -S zsh --overwrite='*' --noconfirm
    # we are also doing one of major installation at the line above 😉
    ```

  - [ ] To configure directory mount points, Open `git-bash.exe` with **elevated rights** (click start and type `git bash` then click the application with `ctrl+shift` pressed) and run `nano /etc/fstab`

    ```bash
    # modify the lines below "DO NOT REMOVE NEXT LINE"
    
    # DO NOT REMOVE NEXT LINE. It remove cygdrive prefix from path
    none /mnt cygdrive binary,posix=0,noacl,user 0 0
    # All drives will be mounted under /mnt eg /mnt/c /mnt/d just like in WSL
    none /tmp usertemp binary,posix=0,noacl 0 0
    /mnt/c/Users /home auto bind,binary,posix=0,noacl,user 0 0
    # binding c:\Users to /home so user homedir will be /home/<user>
    ```
    
Save and exit nano editor with `CTRL+X` and confirm changes.
    
After restart, open git bash and type `pwd`, your user profile directory should be `/home/<username>`

