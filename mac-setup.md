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


Configure Finder
----------------
 1. Launch *Finder*.
 2. Go to *Finder* > *Preferences*.
 3. Under *Favorites*, select only the following items.
      - All My Files
      - Applications
      - Desktop
      - Home directory
 4. Under *Shared* and *Devices*, select all items.
 5. Under *Tags*, deselect *Recent Tags*.
 6. Go to *View* and select *Show Status Bar*.


Configure Terminal
------------------
 1. Launch *Terminal*.
 2. Go to *Terminal* > *Preferences*.
 3. Go to *Profiles* tab.
 4. Select *Pro*, click the Action pop-menu, then select *Duplicate Profile*.
 5. Name the new profile `Pro++`.
 6. Select the new profile.
 7. Click *Default*.
 8. Go to *Text* tab.
 9. In *Background* > *Color & Effects* section, click on the color
    selection box.
      - Set *Opacity* to `90%`.
      - Select *Inactive Window*. Set *Opacity* under it to `70%`.
10. In *Font* section, click *Change*.
      - Set *Family* to *SF Mono*.
      - Set *Size* to *12*.
      - Set *Character Spacing* to *1.004*.
11. In the *Text* section, click *Text* colour and select *Magnesium* pencil.
12. Go to *Shell* tab.
13. Set *When the shell exits* to *Close if the shell exited cleanly*.
14. Go to *Keyboard* tab and select *Use Option as Meta key*.
15. Close *Profiles* dialog box.
16. From the menu, click *View* > *Hide Tab Bar*.
17. From the menu, click *View* > *Hide Marks*.


Configure Dock
--------------
 1. Go to the Apple menu > *System Preferences* > *Dock*.
 2. Select *Minimize windows into application icon*.
 3. Keep only necessary applications in *Dock* and remove others:
    Finder, Launchpad, System Preferences, AnyConnect, Siri, Safari,
    Firefox, Chrome, Outlook, Jabber, Slack, Stickies, Terminal, MacVim,
    STS, and VirtualBox.
 4. Launch Finder, and drag and drop home directory to Dock.
 5. In the Dock, double tap home directory, select *Folder*.
 6. In the Dock, double tap home directory, select *Fan*.


Install Packages
----------------
 1. Go to https://brew.sh/ and follow the instructions there to install
    Homebrew.

 2. Install useful packages.

        brew install macvim git python3 tmux tree rclone
        brew cask install flash-npapi

 3. Install LaTeX.

        brew cask install basictex
        sudo tlmgr update --self
        sudo tlmgr install titlesec marvosym helvetic

 4. Configure git.

        git config --global user.name "Susam Pal"
        git config --global user.email susam@susam.in
        git config --global push.default simple
        git config --global core.editor "mvim -f"
        git config --global alias.alog "log --all --decorate"
        git config --global alias.glog "log --graph --decorate"
        git config --global alias.xlog "log --all --decorate --graph"

    It is necessary to run MacVim with `-f` option to ensure that it
    runs in foreground which forces `git commit` to wait for it to exit
    before it reads the commit message. Without this option, MacVim
    forks and runs in GUI while an exit status 0 is returned
    immediately which causes `git commit` to fail with
    `Aborting commit due to empty commit message.`

Note: If the `helvetic` package for LaTeX is missing, errors about
missing `phvr7t.tfm` appear when a TeX file contains the following code.

    \renewcommand{\familydefault}{\sfdefault}

The fact that the `helvetic` package provided this font is determined
using this command.

    tlmgr search --file phvr7t.tfm --global


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


Disable Scroll Bar When Not Scrolling
-------------------------------------
 1. Go to the Apple menu > *System Preferences* > *General*.
 2. Set *Show scroll bars* to *When scrolling*.
