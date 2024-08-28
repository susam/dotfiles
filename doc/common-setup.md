Configure Vim Plugins
---------------------

Enter the following commands to set up Vim plugins:

    mkdir -p ~/pkg
    cd ~/pkg

    wget http://cscope.sourceforge.net/cscope_maps.vim
    mkdir -p ~/.vim/bundle/cscope_maps/plugin
    mv cscope_maps.vim ~/.vim/bundle/cscope_maps/plugin

    wget -O tagbar.vmb https://www.vim.org/scripts/download_script.php?src_id=24887
    vim +"e tagbar.vmb | silent UseVimball ~/.vim/bundle/tagbar" +q

    git clone --depth 1 https://github.com/kovisoft/slimv.git ~/.vim/bundle/slimv

    vim +"helptags ALL" +q

On Mac, enter the following command to install `ctags` and `gotags` for
the Tagbar plugin to work:

    brew install ctags gotags

It is necessary to specify the `q` command as a separate argument in
order to avoid the following error from the `UseVimball` command:

    E172: Only one file name allowed


Configure Firefox
-----------------

 1. Go to *Settings* > *General*. Click *Make Default*.

 2. Go to *Settings* > *General* > Tabs*.  Deselect *Confirm before
    quitting*.

 3. Goto *Settings* > *Home*.  Then
      - Set *Homepage and new windows* to `Blank Page`.
      - Set *New tabs* to `Blank Page`.

 4. Go to *Settings* > *General* > *Downloads*.  Ensure *Save files
    to* is selected.

 5. Go to *Settings* > *Privacy & Security*.  Under *Web Site Privacy
    Prefernces*, select both options:
      - *Tell web sites not to sell or share my data*
      - *Send websites a "Do Not Track" request*.

 6. Go to *Preferences* > *Privacy & Security*.  Then
      - Deselect *Ask to save passwords*.
      - Deselect *Save and fill payment methods*.

 7. Install add-ons:
      - Multi-Account Containers
      - Greasemonkey
      - uBlock Origin
      - Vimium
      - YouTube Video and Audio Downloader (WebEx):

 8. Go to Toolbar > Extensions > *Manage extensions.*  Decide which
    extensions should be allowed to run in private mode and allow
    them.

 9. Go to Toolbar > Extensions > Multi-Account Containers > Settings
    icon > *Pin to Toolbar*.

10. From the menu, select Bookmarks and then click on the button with
    up/down arrow button.  Then select "Import Bookmarks from HTML"
    and import any bookmarks that need to be imported.

11. Go to *View* > *Toolbar* > *Bookmarks Toolbar*.  Select *Never
    Show*.

12. Go to <https://github.com/susam/userscripts> and install the
    userscripts.


Configure Chrome
----------------

 1. Go to Chrome menu and deselect *Warn Before Quitting*.

 2. Go to new tab > *Customize Chrome* (bottom of page) > *Shortcuts*
    and deselect *Show shortcuts*.

 3. Go to *Settings* > *Autofill and passwords* > *Google Password
    Manager* > *Settings*.  Disable *Offer to save passwords*.

 4. Right click on address bar and select *Always Show Full URLs*.

 5. Install extensions:
      - uBlock Origin
      - Violentmonkey

 6. Go to <https://github.com/susam/userscripts> and install the
    userscripts.


Configure Thunderbird
---------------------

Perform the following steps to sort emails in reverse chronological
order.

 1. Go to *Tools* > *Options* > *Advanced* > *Config Editor*.
 2. Search: `sort`.
 3. Set *mailnews.default_sort_order* to `2`.
 4. Click the close button. Click *OK*.
 5. Go to *Tools* > *Account Settings* > *Server Settings*.
 6. Copy the path displayed under *Local Directory*.
 7. Go to the local directory path. Press *Cancel*.
 8. Exit Thunderbird.
 9. Remove all files from the local directory path and start
    Thunderbird.

Perform the following steps to minimize Thunderbird to notification
area.

 1. Go to *Tools* > *Get Extensions*.
 2. Enter `MinimizeToTray` in the search box.
 3. Find *MinimizeToTray revived* and click "Install" next to it.
 4. Click *Restart Now*.


Configure Pidgin
----------------

 1. Go to *Tools* > *Preferences* > *Logging*.
 2. Set *Log format* to *HTML*.
 3. Check all logging options.


Configure rclone
----------------

Enter the following command to configure rclone.

    rclone config

During the configuration, enter the following when prompted. A brief
description about each item to be entered is provided below.

 1. `n` - Create new remote
 2. `gdrive` - Name of new remote
 3. `drive` - Type of storage: Google Drive
 4. `<Enter>` - Google Application Client ID is left blank
 5. `<Enter>` - Google Application Client Secret is left blank
 6. `<Enter>` - Option scope is left blank
 7. `<Enter>` - Option root_folder_id
 8. `<Enter>` - service_account_file
 9. `n` - Edit advanced config?
 6. `y` - Use auto config
 7. `n` - Use this as a shared drive (team drive)?
 7. `y` - Confirm token
 8. `q` - Quit config

Copy data from Google Drive to local filesystem.

    mkdir -p ~/cld
    cd ~/cld
    rclone -v copy gdrive:bin bin
    chmod +x bin/*
    mkdir docs dump pubs
    bin/gsyncdown
