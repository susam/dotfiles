Customize Trackpad
------------------
 1. Go to the Apple menu > *System Preferences* > *Trackpad*.
 2. Select *Tap to click*.
 3. Go to the Apple menu > *System Preferences* > *More Gestures*.
 4. Select *App Expose*.


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
 1. Go to *Finder* > *Preferences* > *Sidebar*.
 2. Under *Favorites*, select only the following items:
      - Desktop
      - Documents
      - Downloads
      - Pictures
      - Home directory
 3. Under *Shared* and *Devices*, select all items.
 4. Under *Tags*, deselect *Recent Tags*.
 5. Go to *Finder* > *Preferences* > *Advanced*.
 6. Select *Show all filename extensions*.
 7. From the menu, select *View* > *Show Path Bar*.
 8. From the menu, select *View* > *Show Status Bar*.
 9. From the menu, select *View* > *Customize Toolbar* and drag the
    *Path* item into the toolbar next to the *Back/Forward* buttons.


Configure Terminal
------------------
 1. Go to *Terminal* > *Preferences* > *Profiles*.
 2. Select *Pro*, click the Action drop-down menu (gear icon), then
    select *Duplicate Profile*.
 3. Name the new profile `Pro++`.
 4. Select the new profile.
 5. Click *Default*.
 6. Go to *Text* tab.
 7. In *Background* > *Color & Effects* section, click on the color
    selection box.
      - Set *Opacity* to `90%`.
      - Select *Inactive Window*. Set *Opacity* under it to `70%`.
 8. In *Font* section, click *Change*.
      - Set *Family* to *Menlo*.
      - Set *Size* to *12*.
      - Set *Character Spacing* to *1.004*.
 9. In the *Text* section, click *Text* colour and select *Magnesium* pencil.
10. Go to *Shell* tab.
11. Set *When the shell exits* to *Close if the shell exited cleanly*.
12. Go to *Keyboard* tab and select *Use Option as Meta key*.
13. Close *Profiles* dialog box.
14. From the menu, click *View* > *Hide Tab Bar*.
15. From the menu, click *View* > *Hide Marks*.

Note: If we do not select *Use Option as Meta key*, then many Bash or
tmux key-bindings using the meta-key do not work. For example, this
setting is necessary to ensure that `M-f` and `M-b` move the cursor back
to the previous word and end of the next word, respectively, in Bash.
Similarly, this setting ensures that `C-b M-1` arranges tmux pane in
even horizontal manner.


Configure Dock
--------------
 1. Go to the Apple menu > *System Preferences* > *Dock*.
 2. Drag *Size* slider closer to *Small* such that its distance from
    *Small* is about 1/4th the distance between *Small* and *Large*.
 3. Select *Minimize windows into application icon*.
 4. Keep only necessary applications in *Dock* and remove others:
    Finder, Launchpad, System Preferences, and Terminal.
 5. Launch Finder, and drag and drop home directory to Dock.
 6. In the Dock, double tap home directory, select *Folder*.
 7. In the Dock, double tap home directory, select *Fan*.


Enable Sound Icon
-----------------
 1. Go to the Apple menu > *System Preferences* > *Sound*.
 2. Select *Show volume in menu bar*.


Disable Scroll Bar When Not Scrolling
-------------------------------------
 1. Go to the Apple menu > *System Preferences* > *General*.
 2. Set *Show scroll bars* to *When scrolling*.

### Notes
By default, the *Show scroll bars* option is set to *Automatically based
on mouse or trackpad*. This causes a scroll bar to appear in windows
whenever the mouse is connected. For example, if *Terminal* is resized
to the full width of the desktop and then the mouse is connected, the
scroll bar appearing on the right side causes the width of the
*Terminal* window to reduce a little. Now if the mouse is disconnected,
the *Terminal* window no longer spans the whole width of the desktop.
These problems are avoided by changing this setting such that scroll
bars appear only when scrolling.


Configure Computer Name
-----------------------
 1. Go to the Apple menu > *System Preferences* > *Sharing*.
 2. Set *Computer Name* to a desired value, say, `mac`. The *Local
    Hostname* is then automatically derived from the computer name by
    adding *.local* and replacing spaces with hyphens.

### Notes
By default, the system names were set as follows:

      - Computer Name: Susam’s MacBook Pro
      - Local Hostname: Susams-MacBook-Pro.local

These system settings could be confirmed with the following commands:

    $ scutil --get ComputerName
    Susam’s MacBook Pro
    $ scutil --get LocalHostName
    Susams-MacBook-Pro
    $ scutil --get HostName
    HostName: not set
    $ hostname
    Susams-MacBook-Pro.local

On setting the computer name to `mac`, the local hostname was
automatically set to `mac.local`. These system settings could be
confirmed with the following commands:

    $ scutil --get ComputerName
    mac
    $ scutil --get LocalHostName
    mac
    $ scutil --get HostName
    HostName: not set
    $ hostname
    mac.local

The Bash prompt displays the hostname upto the first dot by default.


Install Packages
----------------
 1. Go to https://brew.sh/ and follow the instructions there to install
    Homebrew.

 2. Install useful packages.

        brew install macvim git python3 tmux tree rclone ffmpeg weechat wget
        brew cask install flash-npapi

 3. Install LaTeX and BibLaTeX.

        brew cask install basictex
        sudo tlmgr update --self
        sudo tlmgr install biber biblatex logreq

 4. Install web browsers, graphics software, virtualization software, etc.

        brew cask install firefox google-chrome qutebrowser
        brew cask install virtualbox docker
        brew cask install darktable android-file-transfer vlc

 5. Install development tools.

        brew install sbcl clisp
        brew cask install jxplorer postman wireshark

Note: We could have installed `biblatex` and `logreq` packages in a
usertree as follows:

    TEXMFHOME=texmf tlmgr init-usertree
    TEXMFHOME=texmf tlmgr --usermode install biblatex logreq

But we cannot do so for the `biber` executable. Attempting to do so
fails with this error:

    $ TEXMFHOME=texmf tlmgr --usermode install biber
    Package biber is not relocatable, cannot install it in user mode!

Since it is necessary to install `biber` to the system level
directories, we don't bother with installing `biblatex` and `logreq` to
a usertree and install them to the system level directories as well.


Set Up Home Directory
---------------------
 1. Enter the following commands.

        mkdir -p ~/git
        cd ~/git

        git clone https://github.com/susam/dotfiles.git
        cd dotfiles
        ./setup

 2. Edit *~/.bash_profile* and add the following line to it.

        [ -f ~/git/dotfiles/bashrc ] && . ~/git/dotfiles/bashrc

 3. Set up useful scripts.

        mkdir -p ~/git ~/bin
        cd ~/git

        git clone https://github.com/susam/vimer.git
        ln -sf ~/git/vimer/vimer ~/bin/vi
        ln -sf ~/git/vimer/vimer ~/bin/vi.sh

        git clone https://github.com/susam/timebox.git
        ln -sf ~/git/timebox/timebox ~/bin/timebox

 4. Set up my directory.

        cd
        git clone https://susam@bitbucket.org/susam/my.git


Next Steps
----------
Perform any applicable setups mentioned in
[common-setup.md](common-setup.md).
