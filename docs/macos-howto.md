Use Transmission CLI
--------------------

 1. Install Transmission CLI with this command:

        brew install transmission-cli

 2. To see the download directory, enter this command:

        transmission-daemon -d 2>&1 | grep dir

 3. To add a magnet link, enter this command:

        transmission-remote -a '<Magnet URL>'

 4. To see the progress of all downloads, enter this command:

        transmission-remote -l

 5. To remove a torrent, enter this command:

        transmission-remote -t <ID> -r

 6. To remove all torrents, enter this command:

        transmission-remote -t all -r


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
