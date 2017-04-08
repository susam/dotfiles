Change Password
---------------
 1. Go to the Apple Menu > *System Preferences* > *Security & Privacy*.
 2. Click *Change Password*.


Fix Clipboard Usage in tmux
---------------------------
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
