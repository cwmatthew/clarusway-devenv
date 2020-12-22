#  Clarusway of Development Environment

Whichever language or technology you are using it doesn't matter, somehow you will eventually meet with the black screen of terminal window. But this time, you are luckier than before, since there are many tools those will make your journey on that terminals. In this article we'll cover all major operating systems, including Windows 10, 8 and 7 from Microsoft, macOS from Apple, and Ubuntu variant of Linux.

Users need to install, remove, upgrade, configure and manage software packages. This is a time consuming job. Linux distributions have package managers long time ago. Package managers help the user to install correct compatible version of desired software with its dependencies as well. You don't have to consider about downloading and installing of third party software, to run the application flawlessly.

Linux distributions usually have their own custom package manager, such as apt and apt-get for ubuntu/debian, yum and dnf  for fedora/redhat and zypper for openSUSE etc. On the macOS side there is a third party community tool called homebrew in short brew. For Windows family, there is also community/proprietary tool named chocolatey.

Let's define our roadmap of our development environment for those operating systems. First of all we will install package managers on each OS, and then we will continue to enhance terminal experience with terminal applications, fonts and shells. Some part of this journey shares common steps, so please follow each step one by one.

PS: All the commands written in this article tested on relevant systems. 

## Package Manager

### - Windows 10 and 8.1

- Install Chocolatey
  - [ ] Open `powershell.exe` with **[elevated rights](https://www.howtogeek.com/194041/how-to-open-the-command-prompt-as-administrator-in-windows-8.1/)** (click start and type `powershell.exe` then click the application with `ctrl+shift` pressed)

  - [ ] Now run the following command:

    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    ```

  *source: [Chocolatey.org](https://chocolatey.org/install#individual)*

### - Windows 7

- Install Chocolatey manually

  *Chocolatey.org now requires TLS 1.2 at a minimum. In Windows 7, we need to turn around this issue, therefore we will install Chocolatey manually.*

  - [ ] The first step with offline is to obtain a copy of the Chocolatey Nupkg (nupkg files are just fancy zip files). Download [the latest version directly](https://chocolatey.org/api/v2/package/chocolatey).

  - [ ] Unzip it using any application that supports `zip` format. You can just rename downloaded file e.g: `chocolatey.0.10.15.nupkg` --> `chocolatey.0.10.15.zip` and extract the file using windows explorer context menu.

  - [ ] Open `powershell.exe` with **elevated rights** (click start and type `powershell.exe` then click the application with `ctrl+shift` pressed) and navigate into the unzipped package's tools folder.

    ```powershell
    PS C:\...\chocolatey.0.10.15\tools> .\chocolateyInstall.ps1
    ```

    > *Note*: This will not set Chocolatey as an installed package, so it may be a good idea to also call `choco upgrade chocolatey -y` and let it reinstall the same version, but at least it will be available for upgrades then.

  *source: [Chocolatey.org](https://docs.chocolatey.org/en-us/choco/setup#completely-offline-install)*

### - macOS

- Install homebrew

  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```


### - Linux

- Ubuntu users may continue with snap or apt. Snap repositories seem updated frequently than Ubuntu official repo. It is up to you.

  

## Git

### - Windows 10, 8.1 and Windows 7

- [ ] Open `powershell.exe` or `cmd.exe` with **elevated rights** (click start and type `powershell.exe` or `cmd.exe` then click the application with `ctrl+shift` pressed), and run

  ```powershell
  choco install git -y
  ```

- [ ]  [Configure git for windows](./setup-git-win.md)

### - macOS

- [ ] `brew install git`

### - Linux

- [ ]  `sudo apt install git -y`  

## Fonts

  - MesloLGS NF: download these four ttf files below and install your OS:
    - [ ] [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
    - [ ] [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
    - [ ] [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
    - [ ] [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)
    
      > Note: if you are macOS user and installed iterm2, powerlevel10k setup  `p10k configure` will automatically download MesloLGS NF fonts for you. Simply answer `Yes` when p10k asks you to install Meslo Nerd Font.
    
  - FiraCode NF: download these four ttf files below and install your OS:

    - [ ] [FiraCode NF Regular.ttf](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf?raw=true)
    
    - [ ] [FiraCode NF Bold.ttf](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf?raw=true)
    
    - [ ] [FiraCode NF Light.ttf](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf?raw=true)
    
    - [ ] [FiraCode NF Medium.ttf](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf)
    
      > Windows users can install via `choco install firacodenf -y` as well.

## Shell Setup

### - Install zsh

- **Windows 10**

  - [ ] Open `git-bash.exe` with **elevated rights** (click start and type `git bash` then click the application with `ctrl+shift` pressed) or open conemu and select `git bash (admin)` from shell list, and

    run`pacman -S zsh --noconfirm --overwrite='*'`.
    If you did not installed zsh yet, please follow [Configure git for windows](./setup-git-win.md).

    > Please note that, in order to run above command, you should have [configured git for windows](./setup-git-win.md). 
    > You should have also configured conemu app as mentioned above.

  - [ ] Open Windows Terminal from start menu, and select Ubuntu 20.04 from the list at the tab bar of the application, and run `sudo apt install zsh -y`

    > Please note that, in order to run above command, you should have configured Windows Terminal and WSL Ubuntu on [Terminal Emulator Windows 10 Section](#Terminal Emulator).

- **Windows 7,  8.1**

  - [ ] Open `git-bash.exe` with **elevated rights** (click start and type `git bash` then click the application with `ctrl+shift`conemu `git bash (admin)` from shell list, and run`pacman -S zsh --noconfirm --overwrite='*'`

    > Please note that, in order to run above command, you should have [configured git for windows](./setup-git-win.md).
    >
    > You should have also configured conemu app as mentioned above.

- **macOS**

  *macOS Catalina and beyond comes with zsh as default shell. However it is recommended to upgrade stock zsh via homebrew for your convenience. For macOS Mojave you need to install zsh.*

  - [ ] Open `terminal.app`or `iterm2.app`from launchpad or `in spotlight via Command + spacebar` and type iterm or terminal and in the terminal window run `brew install zsh`

- **Linux**

  - [ ] Open terminal app and run `sudo apt install zsh -y`

### - Install oh-my-zsh

- Run following command at bash/zsh shell terminal:

  ```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ```

*This will clone the repo and replace the existing* `~/.zshrc` *with a template from oh-my-zsh.*

*The install might have asked you to make* `zsh` *as your Login Shell. Due to implementation of shell on Git Bash, it is recommended to keep default shell as* `bash` *for git bash only. We will turn around this issue later on.*

*Except Git Bash, feel free to change your login shell for zsh when asked, or via running command:* `chsh -s $(which zsh)`  *This setting is user specific, no need to prefix* `sudo`

  - Install plugins:

    - [ ] Run following command to download zsh-autosuggestions:

      *This plugin will give instant suggestions in dimmed color while you type in zsh terminal*

      ```bash
      git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
      ```

    - [ ] Run following command to download zsh-syntax-highlighting:

      *This plugin will highlight correctly typed commands as green, wrong ones as red instantly while you type in zsh terminal*
      
      ```bash
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
      ```

  - Install powerlevel10k theme on oh-my-zsh and save into user profile:

    - [ ] Run following command on bash/zsh shell terminal windows on your computer:

    ```bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```

    - [ ] Run `nano ~/.zshrc` in the terminal, find the line below and replace it with the second line:

      ```bash
      ZSH_THEME="robbyrussell"
      ```

      ```bash
      ZSH_THEME="powerlevel10k/powerlevel10k"
      ```

      and change the line for plugins  as below:

      ```bash
      plugins=(git)
      ```

      ```bash
      plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
      ```

      Save and exit nano editor with `CTRL+X` and confirm changes.
      
    - [ ] Run `source ¨/.zshrc` command to update your terminal settings. Powerlevel10K initial setup p10k configure command will check some symbols visibility and configure look and feel as your preference. Recommended font for the terminal is MesloLGS NF, download links above.  For further details, please visit [Powerlevel10k repository](https://github.com/romkatv/powerlevel10k).

      ![image-20201222204802794](D:\projects\_cw\clarusway-devenv\assets\win7_cmder_zsh_bash.png)

      *Powerlevel10k zsh vs bare bash console in windows 7 on cmder at git for windows*

    - [ ] My preferred powerlevel10k setup is as follows: ( You can reconfigure any time by `p10k configure`)

      - Prompt Style :point_right: (1) Lean
      - Character Set :point_right: (1) Unicode
      - Prompt Colors :point_right: (1) 256 colors
      - Show current time? :point_right: (1) No.
      - Prompt Height :point_right: (2) Two lines.
      - Prompt Connection:point_right: (1) Disconnected1
      - Prompt Frame:point_right: (1) No frame.
      - Prompt Spacing:point_right: (1) Compact.
      - Icons :point_right: (2) Many icons.
      - Prompt Flow:point_right: (1) Concise.
      - Enable Transient Prompt :point_right: (n) No.
      - Instant Prompt Mode :point_right: (2) Quiet
      - Final confirmation :point_right: (y) Yes.

    > *Note: At the integrated terminal on visual studio code in windows 7, you may see redundant percent sign (%) prior to current prompt line.*
    >
    > ![image-20201222203024122](D:\projects\_cw\clarusway-devenv\assets\vscode-terminal.png)
    >
    > *To solve this redundancy enter following lines of commands in .zshrc file just after p10k-instant-prompt block below*
    >
    > ![image-20201222205445970](D:\projects\_cw\clarusway-devenv\assets\redundant_solution_w7.png)
    >
    > *source: https://superuser.com/a/645612*

## Terminal Emulator

### - Windows 10

  - Windows Terminal

    - [ ] Install Windows Terminal from the [Windows Store](https://aka.ms/terminal). 

    - [ ] or via powershell:

      ```powershell
      Invoke-WebRequest -Uri https://github.com/microsoft/terminal/releases/download/v1.4.3243.0/Microsoft.WindowsTerminal_1.4.3243.0_8wekyb3d8bbwe.msixbundle -OutFile wt.msixbundle -UseBasicParsing
      
      Add-AppxPackage .\wt.msixbundle
      ```

  - WSL Ubuntu 20.04 see [WSL Ubuntu Setup](./setup-wsl-ubuntu.md)

### Windows 8.1 and Windows 7

- Install Conemu
  - [ ] Open `powershell.exe` or `cmd.exe` with **elevated rights** (click start and type `powershell.exe` or `cmd.exe` then click the application with `ctrl+shift` pressed), and run

    ```powershell
    choco install conemu -y
    ```

### macOS

- Install iterm2
  - [ ] `brew install iterm2`

### Linux

- No need to install terminal emulator, you can use stock Gnome Terminal.

## Other tools

  - Install Openssh (Windows only, others have by default)

    - [ ] Open `powershell.exe` or `cmd.exe` with **elevated rights** (click start and type `powershell.exe` or `cmd.exe` then click the application with `ctrl+shift` pressed), and run

      ```powershell
      choco install openssh -y
      ```

  - Install Visual Studio Code (vscode)

      - Windows:

    - [ ] Open `powershell.exe` or `cmd.exe` with **elevated rights** (click start and type `powershell.exe` or `cmd.exe` then click the application with `ctrl+shift` pressed), and run

      ```powershell
      choco install vscode -y
      ```

    - Linux (Ubuntu):

      ```bash
      snap install vscode --classic
      ```

    - macOS:

      ```bash
      brew install visual-studio-code # to be checked
      ```

- Screen capture tools

  - Windows

    ```
    either lightshot or preferably flameshot binary
    ```

  - Linux(Ubuntu)

    ```bash
    snap install flameshot # or sudo apt install flameshot
    ```

  - macOS

    lightshot

Please feel free to ask, comment and contribute ❤