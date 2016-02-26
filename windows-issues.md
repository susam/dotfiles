Clear Run History
-----------------
With time, the Run history becomes cluttered with too many commands
that are not useful anymore. This makes finding the useful commands
inconvenient. The following steps resolve the issue.

  1. Run *regedit.exe*.
  2. Go to
     *HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU*.
  3. Optional: Select this key and select *Favorites* > *Add to Favorites*.
  4. Delete all values, except *(Default)*, under this key.
     Alternatively, delete only those keys that are not useful anymore
     and set the *MRUList* key to a sequence of only those letters that
     represent keys that are useful.


Fix Window Maximization
-----------------------
On my Dell Latitude E7440 laptop, sometimes the windows on the desktop
won't occupy the entire available desktop on clicking the maximize
button. The following steps resolve the issue.

  1. Quit Pidgin.

As soon as Pidgin quits, the maximized windows should occupy the entire
available desktop. Now Pidgin can be started again.


Fix Brightness Adjustment
-------------------------
On my Dell Latitude E7440 laptop, sometimes the brightness function keys
won't work, i.e. when I press `Fn` + `Up`/`Down`, nothing happens. The
following steps resolve this issue.

  1. Run `devicemgmt.msc`.
  2. Go to *Display adapters*.
  3. Right click on *Intel(R) HD Graphics Family* and click *Disable*.
  4. Once it is disabled, the screen resolution changes.
  5. Right click on it again and click *Enable*.
  6. Once it is enabled, the original screen resolution appears.

Now, the brightness function keys works again.
