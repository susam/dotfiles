macOS Setup
===========

Customize Trackpad
------------------

 1. Go to *System Settings* > *Trackpad*.
 2. Select *Tap to click*.
 3. Go to *System Settings* > *Trackpad* > *More Gestures*.
 4. Set *App Expose* to *Swipe Down with Three Fingers*.


Speed Up Key Repeat
-------------------

 1. Go to *System Settings* > *Keyboard*.
 2. Drag *Key Repeat* slider to *Fast*.
 3. Drag *Delay Until Repeat* slider to one mark before *Short*.


Disable Full Stop With Double Space
-----------------------------------

 1. Go to *System Settings* > *Keyboard* > *Text*.
 2. Deseelct *Add full stop with double-space*.


Reduce Motion
-------------

Perform the following steps to reduce motion while switching between
full screen applications:

 1. Go to *System Settings* > *Accessibility* >
    *Display*.
 2. Select *Reduce motion*.
 3. Select *Show toolbar button shapes*.


Configure Finder
----------------

 1. Go to *Finder* > *Settings* > *Sidebar*.
 2. Under *Favorites*, select only the following items:
      - Desktop
      - Documents
      - Downloads
      - Pictures
      - Home directory
 3. Under *iCloud*, deselect everything.
 4. Under *Locations*, select everything.
 4. Under *Tags*, deselect *Recent Tags*.
 5. Go to *Finder* > *Preferences* > *Advanced*.
 6. Select *Show all filename extensions*.
 7. From the menu, select *View* > *Show Path Bar*.
 8. From the menu, select *View* > *Show Status Bar*.
 9. From the menu, select *View* > *Customize Toolbar* and drag the
    *Path* item into the toolbar at a free spot.


Configure Terminal
------------------

 1. Go to *Terminal* > *Settings* > *Profiles*.
 2. Select *Pro*, click the Action drop-down menu (circle icon), then
    select *Duplicate Profile*.
 3. Name the new profile `Pro++`.
 4. Select the new profile.
 5. Click *Default*.
 6. Go to *Text* tab.
 7. In *Background* > *Color & Effects* section, click on the color
    selection box.
      - Set *Opacity* to `100%`.
      - Select *Inactive Window*. Set *Opacity* under it to `90%`.
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


Configure Safari
----------------

 1. Go to *Safari* > *Settings* > *Advanced*.
 2. Select *Show full website address*.
 3. Select *Show features for web developers*.


Configure Display
-----------------

 1. Go to *System Settings* > *Displays*.
 2. Change Resolution to *Scaled*.
 3. Choose the option on the left side of *Default*. Check if it is
    comfortable.
 4. Open *Terminal* in full screen mode, then run `tput lines` and
    `tput cols` and ensure that the output is at least 50 x 160.
    Expected output:
    - MacBook Pro (Retina, 15-inch, Mid 2015): 59 x 204.
    - On MacBook Pro (16-inch, 2021): 61 x 212.


Enable Night Shift
------------------

 1. Go to *System Settings* > *Displays*.
 2. Click *Night Shift*.
 6. In *Night Shift*, set *Schedule* to *Custom* and time range to
    7:00 AM to 6:59 AM.
 7. In *Night Shift*, select *Manual*.


Configure Dock
--------------

 1. Go to *System Settings* > *Dock & Menu Bar*.
 2. Drag *Size* slider closer to *Small* such that its distance from
    *Small* is about 1/4th the distance between *Small* and *Large*.
 3. Select *Minimize windows into application icon*.
 4. Keep only the following items on the dock:
      - Finder
      - Chrome
      - Firefox
      - Terminal
      - Emacs


Enable Sound Icon
-----------------

 1. Go to *System Settings* > *Sound*.
 2. Select *Show volume in menu bar* and set it to *always*.


Configure Scroll Bar
--------------------

 1. Go to *System Settings* > *Appearance*.
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


Configure Regional Settings
---------------------------

 1. Go to *System Settings* > *General* > *Language & Region*.
 2. Set *First day of week* to `Sunday`.

This affects what day is used as the first column for the *Calendar*
app.


Save Screenshots Immediately
----------------------------

 1. Start *Screenshot.app*.
 2. Go to *Options* and deselect "Show Floating Thumbnail*.


Configure Computer Name
-----------------------

 1. Go to *System Settings* > *Sharing*.
 2. Set *Computer Name* to a desired value, say, `mac`. The *Local
    Hostname* is then automatically derived from the computer name by
    adding *.local* and replacing spaces with hyphens.

### Notes

By default, the system names were set as follows:

  - Computer Name: Susam’s MacBook Pro
  - Local Hostname: Susams-MacBook-Pro.local

These system settings could be confirmed with the following commands:

```
$ scutil --get ComputerName
Susam’s MacBook Pro
$ scutil --get LocalHostName
Susams-MacBook-Pro
$ scutil --get HostName
HostName: not set
$ hostname
Susams-MacBook-Pro.local
```

On setting the computer name to `mac`, the local hostname was
automatically set to `mac.local`. These system settings could be
confirmed with the following commands:

```
$ scutil --get ComputerName
mac
$ scutil --get LocalHostName
mac
$ scutil --get HostName
HostName: not set
$ hostname
mac.local
```

The Bash prompt displays the hostname upto the first dot by default.


Install Packages
----------------

 1. Go to https://brew.sh/ and follow the instructions there to install
    Homebrew.

 2. After installation, enter any commands suggested by the installer.
    Then close and start Terminal again.

 3. Install useful packages.

    ```
    brew install macvim tmux tree rclone ffmpeg irssi wget bash-completion ocrmypdf sbcl clisp
    ```

 4. Install Emacs, LaTeX, and BibLaTeX.

    ```
    brew install --cask emacs basictex
    sudo tlmgr update --self
    sudo tlmgr install biber biblatex logreq
    ```

 5. Install web browsers, graphics software, virtualization software, etc.

    ```
    brew install --cask firefox google-chrome darktable android-file-transfer vlc
    brew install --cask virtualbox docker
    ```

Note: We could have installed `biblatex` and `logreq` packages in a
usertree as follows:

```
TEXMFHOME=texmf tlmgr init-usertree
TEXMFHOME=texmf tlmgr --usermode install biblatex logreq
```

But we cannot do so for the `biber` executable. Attempting to do so
fails with this error:

```
$ TEXMFHOME=texmf tlmgr --usermode install biber
Package biber is not relocatable, cannot install it in user mode!
```

Since it is necessary to install `biber` to the system level
directories, we don't bother with installing `biblatex` and `logreq` to
a usertree and install them to the system level directories as well.


Set Up Home Directory
---------------------

 1. Enter the following commands.

    ```
    mkdir -p ~/git
    cd ~/git

    git clone https://github.com/susam/dotfiles.git
    cd dotfiles
    touch ~/.zshrc
    ./setup
    ```

 2. Set up useful scripts.

    ```
    mkdir -p ~/git ~/bin
    cd ~/git

    git clone https://github.com/susam/vimer.git
    ln -sf ~/git/vimer/vimer ~/bin/vi
    ln -sf ~/git/vimer/vimer ~/bin/vi.sh

    git clone https://github.com/susam/timebox.git
    ln -sf ~/git/timebox/timebox ~/bin/timebox
    ```

 3. Set up my directory.

    ```
    cd
    git clone https://susam@bitbucket.org/susam/my.git
    ln -sf ~/my/bin/local.el ~/local.el
    ```

 4. Set up optional Emacs configuration.

    ```
    ln -sf ~/git/dotfiles/extra.el ~/extra.el
    ```


Configure Touch Bar
-------------------

 1. Go to *System Settings* > *Keyboard*.
 2. Set *Touch Bar shows* to `Expanded Control Strip`.
 3. Click *Customize Touch Bar*. Select the Siri icon from Touch Bar,
    drag it and drop it off near the other icons on the customization
    pane.


Configure User Picture
----------------------

 1. Go to *System Settings* > *Users & Groups*.
 2. Click on the "i" icon.
 3. Click on the user picture.
 4. Go to *Suggestions*, select a new picture, and click *Save*.


Configure Notification Centre
-----------------------------

 1. Click on date at the top-right corner.
 2. Scroll down and click *Edit Widgets*.
 3. Then make the following arrangement of widgets:
      - Clock > Clock1; Calendar > Month
      - Clock > World Clock
      - Weather > Forecast
      - Stocks > Symbol; Stocks > Symbol
      - Stocks > Symbol; Stocks > Symbol
 4. Now edit the Clock widget to configure the following cities:
      - San Francisco
      - New York
      - Mumbai
      - Tokyo
 5. Edit each stock and set the following tickers:
      - GBPUSD
      - GBPEUR
      - GBPINR
      - GBPJPY


Next Steps
----------

Perform any applicable setups mentioned in
[common-setup.md](common-setup.md).
