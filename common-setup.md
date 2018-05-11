Configure Git
-------------
Enter the following commands to configure Git on any system.

    git config --global user.name "Susam Pal"
    git config --global user.email susam@susam.in
    git config --global push.default simple
    git config --global credential.helper cache

    FORMAT="%C(auto)%h %C(magenta)%ad %C(cyan)%an%C(auto)%d %s"
    PRETTY="--pretty=format:'$FORMAT' --date=short"
    git config --global alias.lga "log --graph --all $PRETTY"
    git config --global alias.lg "log --graph $PRETTY"
    git config --global alias.la "log --all $PRETTY"
    git config --global alias.ll "log $PRETTY"
    git config --global alias.lf "log --pretty=fuller --stat"
    git config --global alias.ls "log --graph --all $PRETTY --simplify-by-decoration"

    git config --global alias.diffc "diff --cached"
    git config --global alias.dc "diff --cached"

    git config --global alias.br "branch -vv"
    git config --global alias.brr "branch -vva"

    git config --global alias.co "checkout"
    git config --global alias.cob "checkout -b"

    git config --global alias.ca "commit --amend"


Enter the following commands on Windows only.

    git config --global credential.helper wincred
    git config --global core.autocrlf false

Enter the following commands on Mac only.

    git config --global core.editor "mvim -f"

It is necessary to run MacVim with `-f` option to ensure that it runs in
foreground which forces `git commit` to wait for it to exit before it
reads the commit message. Without this option, MacVim forks and runs in
GUI while an exit status 0 is returned immediately which causes `git
commit` to fail with `Aborting commit due to empty commit message.`


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

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    git clone --depth 1 https://github.com/junegunn/fzf.vim.git ~/.vim/bundle/fzf.vim
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

 1. Go to *Preferences* > *General*.
 2. Set *When Firefox starts* to *Show a blank page*.

Configure Firefox to automatically save files without asking where to
save files.

 1. Go to *Preferences* > *General* > *Downloads*.
 2. Ensure *Save files to* is selected.

Configure Firefox to never save logins.

 1. Go to *Preferences* > *Privacy & Security*.
 2. Deselect *Remember logins and passwords for websites*.

Configure Firefox to always open a blank page in new tabs.

 1. Create a new tab by clicking the plus sign in the tab bar.
 2. Click the gear icon in the top-right corner of the new tab.
 3. Deselect all options.

Add the following useful extensions to Firefox.

 1. Vimium-FF: https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
 2. YouTube Video and Audio Downloader (WebEx):
    https://addons.mozilla.org/en-US/firefox/addon/youtube_downloader_webx/
 3. uBlock Origin: https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/


Configure Chrome
----------------
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
 6. `y` - Use auto config
 7. `y` - Confirm token
 8. `q` - Quit config

Copy data from Google Drive to local filesystem.

    mkdir -p ~/cld
    cd ~/cld
    for dir in docs meta pubs tmp
    do
        rclone -v copy gdrive:"$dir" "$dir"
    done
