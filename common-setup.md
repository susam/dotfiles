Configure Firefox
-----------------
Configure Firefox to automatically save files without asking where to
save files.

 1. Go to *Options (about:preferences)* > *General* > *Downloads*.
 2. Ensure *Save files to* is selected.

Configure Firefox to always start with a blank page.

 1. Go to *Options (about:preferences)* > *General*.
 2. Set *When Firefox starts* to *Show a blank page*.

Configure Firefox to never save logins.

 1. Go to *Options (about:preferences)* > *Security*.
 2. Deselect *Remember logins for sites*.

Add the following useful extensions to Firefox.

 1. Add Vimperator from
    <https://addons.mozilla.org/en-US/firefox/addon/vimperator/>.
 2. Add YouTube Video and Audio Downloader from
    <https://addons.mozilla.org/En-us/firefox/addon/youtube-video-and-audio-dow/>
    with Firefox.

Configure the extensions.

 1. Create a file called *.vimperatorrc* at the home directory with the
    following content.

        set gui=nonavigation

 2. Go to *Add-ons (about:addons)* > *YouTube Video and Audio Downloader* >
    *Options*.

 3. Set *Select download folder* to *Downloads*.

 4. Set *FFmpeg(.exe) location* to the location of FFmpeg binary
    executable.


Configure Chrome
----------------
Install *TheOne* extension to ensure that popups open in new tabs
instead of new windows.

 1. Go to <https://chrome.google.com/webstore/category/extensions>.
 2. Search `TheOne`.
 3. Click *ADD TO CHROME*.


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
