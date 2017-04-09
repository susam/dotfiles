Enable Touchpad Tap
-------------------
 1. Go to the Apple menu > *System Preferences* > *Trackpad*.
 2. Select *Tap to click*.


Map Caps Lock to Escape
-----------------------
 1. Go to the Apple menu > *System Preferences* > *Keyboard*.
 2. Click *Modifier Keys*.
 3. Set *Caps Lock Key* to *Escape*.
 4. Click *OK*.


Speed Up Key Repeat
-------------------
 1. Go to the Apple menu > *System Preferences* > *Keyboard*.
 2. Drag *Key Repeat* slider to *Fast*.
 3. Drag *Delay Until Repeat* slider to one mark before *Short*.


Configure Desktop
-----------------
 1. In the status menu, click the battery icon.
 2. Select *Show Percentage*.


Configure Terminal
------------------
 1. Start *Terminal*.
 2. Go to *Terminal* > *Preferences*.
 3. Go to *Profiles* tab.
 4. Select *Pro*, click the Action pop-menu, then select *Duplicate Profile*.
 5. Name the new profile `Pro++`.
 6. Select the new profile.
 7. Click *Default*.
 8. Go to *Text* tab, then in *Font* section, click *Change*.
      - Set *Family* to *SF Mono*.
      - Set *Size* to *12*.
      - Set *Character Spacing* to *1.004*.
 9. In the *Text* section, click *Text* colour and select *Magnesium* pencil.
10. Go to *Shell* tab.
11. Set *When the shell exits* to *Close if the shell exited cleanly*.
12. Go to *Keyboard* tab and select *Use Option as Meta key*.
13. Close *Profiles* dialog box.
14. From the menu, click *View* > *Hide Tab Bar*.
15. From the menu, click *View* > *Hide Marks*.


Install Packages
----------------
 1. Go to https://brew.sh/ and follow the instructions there to install
    Homebrew.

 2. Install essential packages.

        brew install macvim git python3 tmux

 3. Configure git.

        git config --global user.name "Susam Pal"
        git config --global user.email susam@susam.in
        git config --global push.default simple
        git config --global core.editor "mvim -f"
        git config --global alias.xlog "log --all --graph --decorate"

    It is necessary to run MacVim with `-f` option to ensure that it
    runs in foreground which forces `git commit` to wait for it to exit
    before it reads the commit message. Without this option, MacVim
    forks and runs in GUI while an exit status 0 is returned
    immediately which causes `git commit` to fail with
    `Aborting commit due to empty commit message.`

 4. Install useful packages.

        brew cask install flash-npapi


Set Up Home Directory
---------------------
 1. Enter the following commands.

        mkdir -p ~/git
        cd ~/git

        git clone https://github.com/susam/dotfiles.git
        cd dotfiles
        ./setup

 2. Set up useful scripts.

        mkdir -p ~/git ~/bin
        cd ~/git

        git clone https://github.com/susam/vimer.git
        ln -sf ~/git/vimer/vimer ~/bin/vi
        ln -sf ~/git/vimer/vimer ~/bin/vi.sh

        git clone https://github.com/susam/timebox.git
        ln -sf ~/git/timebox/timebox ~/bin/timebox

 3. Set up my directory.

        cd
        git clone https://susam@bitbucket.org/susam/my.git

 4. Edit *~/.bashrc* and add the following code to it.

        export PS1="\w$ "
        export PATH=~/bin:~/opt/bin:~/my/bin:~/my/ws/bin:$PATH
        echo Login environment is set. >&2

 5. Open a new terminal and ensure ~/my/bin is added to the PATH
    environment variable.


Enable Sound Icon
-----------------
 1. Go to the Apple menu > *System Preferences* > *Sound*.
 2. Select *Show volume in menu bar*.
