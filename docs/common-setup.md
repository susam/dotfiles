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

Configure Firefox to always start with a blank page.

 1. Go to *Preferences* > *Home*.
 2. Set *Homepage and new windows* to `Blank Page`.
 3. Set *New tabs* to `Blank Page`.

Configure Firefox to automatically save files without asking where to
save files.

 1. Go to *Preferences* > *General* > *Downloads*.
 2. Ensure *Save files to* is selected.

Disable tracking.

 1. Go to *Preferences* > *Privacy & Security*.
 2. Set *Do Not Track* option to *Always*.

Configure Firefox to never save logins.

 1. Go to *Preferences* > *Privacy & Security*.
 2. Deselect *Ask to save logins and passwords for websites*.

Add the following useful extensions to Firefox.

 1. Vimium-FF: https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
 2. YouTube Video and Audio Downloader (WebEx):
    https://addons.mozilla.org/en-US/firefox/addon/youtube_downloader_webx/
 3. uBlock Origin: https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/


Configure Chrome
----------------

 1. Go to Chrome menu and deselect *Warn Before Quitting*.
 2. Go to new tab > *Customize Chrome* (bottom of page) > *Shortcuts*
    and enable *Hide shortcuts*. Click *Done*.
 3. Right click on address bar and select *Always Show Full URLs*.

Install *TheOne* extension to ensure that popups open in new tabs
instead of new windows.

Go to <https://chrome.google.com/webstore/category/extensions>, search
for the following extensions and add them one by one.

 1. One Window: https://chrome.google.com/webstore/detail/one-window/papnlnnbddhckngcblfljaelgceffobn
 2. Vimium: https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb
 3. uBlock Origin: https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
 4. Blank New Tab Page: https://chrome.google.com/webstore/detail/blank-new-tab-page/jonikckfpolfcdcgdficelkfffkloemh


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
