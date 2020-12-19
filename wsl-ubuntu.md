# WSL Ubuntu Setup

Before installing any Linux distributions on Windows, you must enable the "Windows Subsystem for Linux" optional feature.

- [ ] Install the Windows Subsystem for Linux

  - [ ] Open `powershell.exe` with **[elevated rights](https://www.howtogeek.com/194041/how-to-open-the-command-prompt-as-administrator-in-windows-8.1/)** (click start and type `powershell.exe` then click the application with `ctrl+shift` pressed) and run following commands:

    ```powershell
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    Restart-Computer
    ```

  - [ ] Set WSL 2 as your default version

    ```powershell
    wsl --set-default-version 2
    ```

  - [ ] Install WSL Ubuntu from the Windows Store. ([Ubuntu-20.04](https://aka.ms/wslubuntu2004))

  - [ ] or download via powershell or curl:

    ```powershell
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu2004.appx -UseBasicParsing
    ```

    ```bash
    curl -L -o Ubuntu-2004.appx https://aka.ms/wslubuntu2004
    ```

    to install manually downloaded appx package:

    ```
    Add-AppxPackage .\Ubuntu2004.appx
    ```

  - [ ] Launch Ubuntu2004.exe and do initial user name, and password stuff: (you will need this password when you need root access on wsl ubuntu)

    ![Initial Setup](https://docs.microsoft.com/en-us/windows/wsl/media/ubuntuinstall.png)

    Right click on the title bar, select Defaults:
    Under the Options tab, select `Use Ctrl+Shift+C/V as Copy/Paste`

  - [ ] Update ubuntu wsl repository database and pre-installed applications by typing following command on ubuntu console:

    ```bash
    sudo apt update && sudo apt upgrade && sudo apt autoremove -y
    ```

- [ ] Changing directory colors:

  *Please check ls output colors in ntfs partitions, e.g. your user profile directory on windows, you may see some file's colors as inverted when you run* `ls` *command. The default colors used in* `ls`, *we have some bad background highlighting issues, let's fix that. Open Ubuntu-20.04 app* 

  - [ ] Create a `.dircolors` file as follows: `dircolors -p > ~/.dircolors`

    You now have a .dircolors file containing the color configuration for `ls`, which is stored in the env variable LS_COLORS. What we need to do next is make a change to the colors, and save it back to LS_COLORS.

  - [ ] Run`nano ~/.dircolors` , and modify with the settins below. We're removing the background from OTHER_WRITABLE, and fixing the font color for the rest:

    Change `SETUID` to: `SETUID 00;30;41`

    Change `SETGID` to: `SETUID 00;30;43`

    Change `CAPABILITY` to: `CAPABILITY 00;30;41`

    Change `STICKY_OTHER_WRITABLE` to: `STICKY_OTHER_WRITABLE 00;30;42`

    Change `OTHER_WRITABLE` to: `OTHER_WRITABLE 01;32`

    Change `STICKY` to: `STICKY 00;30;44`

    Save and exit `CTRL+X`and confirm changes.       

    - [ ] Edit `nano ~/.zshrc` and add the following line:  *please note to the back ticks* (`) *not single quote*(')

    ```bash
    eval `dircolors ~/.dircolors`
    ```

    - [ ] Save file and close nano and restart Ubuntu-20.04

  - [ ] Follow [Shell Setup](./README.md#Shell Setup)