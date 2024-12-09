Transmission CLI
----------------

### Setup

 1. Install Transmission CLI with this command:

        brew install transmission-cli

 2. To see the download directory, enter this command:

        transmission-daemon -d 2>&1 | grep dir

 3. Here are some useful aliases to set up in the shell:

        alias txd='transmission-daemon -f'
        alias txr='transmission-remote'
        alias txa='transmission-remote -t all'


### Use

 1. Start Transmission daemon:

        transmission-daemon -f
        txd

 2. To add a magnet link:

        transmission-remote -a '<link>'
        txr -a '<link>'

 3. To see the progress of all downloads:

        transmission-remote -l
        txr -l

 4. Get file list for torrents:

        transmission-remote -t all -f
        txa

 5. Remove a torrent:

        transmission-remote -t <id> -r
        txr -t <id> -r

 6. Remove all torrents:

        transmission-remote -t all -r
        txa -r


Change Password
---------------

 1. Go to the Apple Menu > *System Preferences* > *Security & Privacy*.
 2. Click *Change Password*.


Fix Clipboard Usage in tmux
---------------------------

Note: This issue has been resolved since tmux 2.6.

In macOS Sierra Version 10.12.3, programs running within tmux are unable
to use the clipboard. Here is the expected behaviour that is seen on
bare Terminal (without tmux).

    $ echo foo | pbcopy
    $ pbpaste
    foo

But this is erroneous behaviour that is seem within tmux.

    $ echo foo | pbcopy
    $ pbpaste
    $

This issue also causes copy/pasting from/to the system clipboard to not
work in MacVim.

Perform the following steps to resolve this issue.

 1. Install reattach-to-user-namespace.

        brew install reattach-to-user-namespace

 2. Add the following tmux command to ~/.tmux.conf.

        set -g default-command "reattach-to-user-namespace -l ${SHELL}"

References:

  - http://stackoverflow.com/a/39741226/303363
  - https://github.com/tmux/tmux/issues/543


Find Keyboard Vendor ID and Product ID for Karabiner
----------------------------------------------------

Perform the following steps:

 1. Click the Apple icon in the menu, press and hold
    <kbd>option</kbd>, and click *System Information*.

 2. Click *SPI*.  Read the fields "Vendor ID" and "Product ID" to get
    these IDs for the internal keyboard.

 4. For external keyboards, click *USB*.  Then find an entry that is
    labelled as keyboard.  Then read the fields "Vendor ID" and
    "Product ID" as earlier.

Some common values observed are noted in the table below:

| Hardware           | OS            | Vendor ID     | Product ID     |
|--------------------|---------------|---------------|----------------|
| Apple M1 Pro       | Monterey 12.1 | 0x05ac (1452) | 0x0343 (835)   |
| Apple M1 Pro       | Sonoma 14.5   | 0x05ac (1452) | 0x0342 (834)   |
| Apple M2 Pro       | Sonoma 14.7   | 0             | 0x0353 (851)   |
| Apple M3 Pro       | Sonoma 14.7   | 0             | 0x0353 (851)   |
| Bloomberg Keyboard | Sonoma 14.7   | 0x1188 (4488) | 0x9545 (38213) |

See also <https://usb.org/sites/default/files/vendor_ids051920_0.pdf>.
