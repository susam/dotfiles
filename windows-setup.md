Create Custom Bin Directory
---------------------------
Create a custom *bin* directory to keep additional software in one
location.

 1. Create a bin directory at the root of a drive, e.g. *X:\opt\bin*.
 2. Run `sysdm.cpl`.
 3. Go to *Advanced* > *Environment Variables* > *System variables*.
 4. Click *New* and create a new variable named `mypath` with
    `X:\opt\bin` as its value. Press *OK*.
 5. Select *Path* and append `%mypath%;`. Press *OK*. Press *OK*.
    Press *OK*.


Map Caps Lock to Escape
-----------------------
Map Caps Lock key to Escape key to make it more convenient to use Vim
editor.

 1. Download *uncap.exe* from <https://github.com/susam/uncap>.
 2. Move the file to *X:\opt\bin*.
 3. Right click on the file, select *Properties* > *Unblock*, and click *OK*.
 4. Go to *Start* > *All Programs* > *Startup*, right click on it and
    select *Open*.
 5. Right click on the folder's content pane and select *New* > *Shortcut*.
 6. Browse to the location of *uncap.exe*.
 7. Click *Next*. Click *Finish*.


Set up GVim
-----------
Set up and configure GVim.

 1. Download *vim##rt.zip* and *gvim##.zip* from
    <http://www.vim.org/download.php#pc>.
 2. Unzip both files.
 3. Move and merge *vim* directory from both extracted directories to
    *X:\opt*.
 4. Append *X:\opt\vim\vim##* to the system variable named *mypath*.
 5. Go to *X:\opt\vim\vim##* using Windows Explorer.
 6. Right click *gvim.exe*, select *Pin to Start Menu*.
 7. Right click *gvim.exe*, select *Pin to Taskbar*.


Set up Scripts
--------------
 1. Enter the following commands to set up the scripts.

        cd X:\opt\bin
        curl https://raw.githubusercontent.com/susam/timeboxing/master/timebox.cmd > timebox.cmd

        curl https://raw.githubusercontent.com/susam/vimer/master/vimer.cmd > vi.cmd
        vi --enable
        vi -t --enable

 2. Create a user variable named *vim_cmd* with
    *X:\opt\vim\vim##\gvim.exe* as its value.


Set up Git
----------
Set up Git to work with my repositories.

 1. Download *64-bit Git for Windows Portable* from
    <https://git-scm.com/download/win>.
 2. Run it.
 3. Set *X:opt\git* as the location to install portable Git. Click *OK*.
 4. Append *X:\opt\git\bin* to the system variable named *mypath*.
 5. Configure Git.

        git config --global user.name "Susam Pal"
        git config --global user.email susam@susam.in
        git config --global push.default simple
        git config --global credential.helper wincred
        git config --global core.autocrlf false
        git config --global alias.alog "log --all --decorate"
        git config --global alias.glog "log --graph --decorate"
        git config --global alias.xlog "log --all --decorate --graph"


Set up dotfiles
---------------
Set up Vim configuration.

 1. Open Command Prompt and change current directory to X:\.

        cd /d X:\

 2. Enter the following commands.

        mkdir git
        cd git
        git clone https://github.com/susam/dotfiles.git
        cd dotfiles
        setup.cmd

At this point, GVim is ready to be used.


Set up 'my' Directory
---------------------
Clone 'my' and make my personal scripts in it available as commands.

 1. Execute this command.

        git clone https://susam@bitbucket.org/susam/my.git

 2. Make frequently used directories available under home directory.

        mklink /j %homedrive%%homepath%\my X:\my
        mklink /j %homedrive%%homepath%\git X:\git

 3. Append *X:\my\bin* and *X:\my\ws\bin* to the system variable named
     *mypath*.


Set up Junctions to Home Directory
----------------------------------
Create a directory called *susam* directly under the root directory of
every drive to make it convenient to reach the home directory from any
location.

 1. For every drive *X* in the system, execute the following command.

        mklink /j X:\susam %homedrive%%homepath%


Set up Cygwin
-------------
Install Cygwin to get a Unix like environment for command prompt.

 1. Download *setup-x86_64.exe* from <https://www.cygwin.com/>.

 2. Run it. Click *Next*. Click *Next*.

 3. Set *Root Directory* to *X:\opt\cygwin64*.

 4. Set *Install For* to *Just Me*. Click *Next*.

 5. Set *Package Directory* to *X:\opt\cygwin64-packages*.
    Click *Next*. Click *Yes*

 6. Select appropriate proxy settings if necessary. Click *Next*.

 7. Select a download site. Click *Next*.

 8. Select packages.

      - diffutils
      - dos2unix
      - openssh
      - curl
      - wget
      - nc

    Click *Next*. Click *Next*.

 9. Deselect *Create icon on Desktop* and *Add icon to Start Menu*.
    Click *Finish*.

10. Move *setup-x86_64.exe* to *X:\opt\cygwin64-packages*.

11. Append *X:\opt\cygwin64\bin* to the system variable named *mypath*.

12. Edit *X:\opt\cygwin64\etc\nsswitch.conf* and add the following.

        db_home: windows

     This step ensures that Cygwin commands would use the Windows home
     directory for $HOME environment and tilde expansion.

     Note: I have found that the above configuration slows down
     sh/bash. I tested this with the following command.

        powershell -Command "Measure-Command {sh -c 'echo hi'}"

     While without the `db_home` configuration, it took about 0.2 to
     0.3 seconds for `sh` to start, with this configuration, it took
     about 2 to 4 seconds to start. As a result, I hard-coded the
     `db_home` path as follows.

        db_home: /cygdrive/c/Users/susam

     This improved the start time of `sh` to about 0.2 seconds again.


Set up Console
--------------
Set up and configure Console.

### Install Console ###

 1. Download Console 2 64 bit zip from
    <http://sourceforge.net/projects/console/files/>.
 2. Unzip the file.
 3. Move *Console2* directory from the extract to *X:\opt*.
 4. Append *X:\opt\Console2* to the system variable named *mypath*.
 5. Go to *X:\opt\Console2* using Windows Explorer.
 6. Right click *Console.exe*, select *Pin to Start Menu*.
 7. Right click *Console.exe*, select *Pin to Taskbar*.

### Configure Console ###
Perform the following steps in the *Console Settings* window. Press
*Ctrl + S* to access it.

 1. Set *Console* > *Buffer size* > *Rows* to *9999*.
 2. Set *Appearance* > *Font* > *Name* to *Consolas*.
 3. Set *Appearance* > *Font* > *Size* to *12*.
 4. Deselect *Appearance* > *More* > *Show menu*.
 5. Deselect *Appearance* > *More* > *Show toolbar*.
 6. Deselect *Appearance* > *More* > *Show status bar*.
 7. Deselect *Appearance* > *More* > *Show scrollbars*.
 8. Set *Appearance* > *More* > *Window transparency* > *Alpha* >
    *Active Window* to *30*.
 9. Set *Appearance* > *More* > *Window transparency* > *Alpha* >
    *Inactive Window* to *60*.
10. Select *Behaviour* > *Copy & Paste* > *Copy on select*.
11. Set *Hotkeys* > *New Tab 1* to *Alt+D*.
12. Set *Hotkeys* > *New Tab 2* to *Alt+H*.
13. Set *Hotkeys* > *Next tab* to *Ctrl+N*.
14. Set *Hotkeys* > *Previous tab* to *Ctrl+P*.
15. Set *Hotkeys* > *Close tab* to *Ctrl+D*.
15. Set *Hotkeys* > *Scroll buffer row up* to *Ctrl+K*.
16. Set *Hotkeys* > *Scroll buffer row down* to *Ctrl+J*.
17. Set *Hotkeys* > *Scroll buffer page up* to *Page Up*.
18. Set *Hotkeys* > *Scroll buffer page down* to *Page Down*.
19. Set *Hotkeys* > *Scroll buffer column left* to *Ctrl+H*.
20. Set *Hotkeys* > *Scroll buffer column right* to *Ctrl+L*.
21. Set *Hotkeys* > *Mouse* > *Select text* to *Left*.
22. Set *Tabs* > first console > *Startup dir* to *X:\*.
23. Set *Tabs* > second console > *Startup dir* to *X:\susam*.


Set up Python
-------------
Set up Python 3 because it serves as a nifty calculator, web server, and
runs the Python scripts that make my life easier.

 1. Download Windows x86-64 executable installer of the most recent
    version of Python from <https://www.python.org/downloads/>.
 2. Run the installer.
 3. Deselect *Install launcher for all users*.
 4. Click *Customize installation*.
 5. Deselect *Documentation*. Deselect *py launcher*. Click *Next*.
 6. Deselect all *Advanced Options*.
 7. Set *Customize install location* to *X:\opt\PythonXY* where *XY*
    stands are the digits from the version number. Click *Install*.
 8. Append *X:\opt\PythonXY* to the system variable named *mypath*.

Python 3.5.1 installer installs KB2999226 update.

With Python 3.5.1 installer, selecting *py launcher* installs py.exe and
pyw.exe at
%LOCALAPPDATA%\Programs\Python\Launcher and adds this path to the PATH
system variable.


Set up PuTTY
------------
### Install PuTTY ###
 1. Download *putty.exe* and *puttygen.exe* from
    <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>.
 2. Move the files to *X:\opt\bin*.
 3. Right click on each file, select *Properties* > *Unblock*, and click *OK*.

### Generate Private Key ###
 1. Run puttygen.exe.
 2. Click *Generate*.
 3. Move the mouse randomly within the *Putty Key Generator* window.
 4. Once the key is generated, click *Save private key*, click *Yes*
    and save the private key at *X:\opt* as *rsa.ppk*.
 5. Go to *Session*. Select *Default Settings* under *Saved Sessions*.
     Click *Save*.

### Configure PuTTY ###
 1. Run putty.exe.
 2. Go to *Session*.
      - Set *Close window on exit* to *Always*.
 2. Go to *Windows* > *Appearance*.
      - Click *Change* under *Font settings*.
      - Set *Font* to *Consolas*.
      - Set *Size* to *12*.
 3. Go to *Windows* > *Behaviour*.
      - Select *System menu appears on ALT alone*.
      - Select *Full screen on Alt-Enter*.
 3. Go to *Connection* > *Data*.
      - Set *Auto-login username* to the username that is most frequently
        used while connecting to remote systems.
      - Set *Terminal-type string* to `xterm-256color`.
 4. Go to *Connection* > *SSH* > *Auth*.
      - Set *Private key file for authentication* to *X:\opt\rsa.ppk*.
 5. Go to *Session*. Select *Default Settings* under *Saved Sessions*.
    Click *Save*.


Set up Ncat
-----------
Set up NCat to experiment with network connections.

 1. Download zip file for statically compiled portable Ncat from
    <https://nmap.org/ncat/>.
 2. Unzip the file.
 3. Move *ncat.exe* to *X:\opt\bin*.


Set up Process Explorer
-----------------------
Set up Process Explorer because it can be useful to find the process that
has kept a file open.

 1. Download Process Explorer zip file from
    <https://technet.microsoft.com/en-us/sysinternals/processexplorer.aspx>.
 2. Unzip the file.
 3. Move *procexp.exe* to *X:\opt\bin*.


Set up Glass2k
--------------
Set up Glass2k to make PuTTY, GVim, etc. windows transparent.

 1. Download Glass2k from <http://chime.tv/products/glass2k.shtml>.
 2. Move the file to *X:\opt\bin*.
 3. Right click on the file, select *Properties* > *Unblock*, and click *OK*.
 4. Run it.
 5. Select *Auto-Remember every window's Transparency Settings*.
 6. Set *Transparency Popup: Right Click* to `+ Ctrl + Shift`.
 7. Set *Taskbar Transparency* to about 80%.

Now launch GVim or PuTTY, and press *Ctrl + Shift + 8* to make the
window transparent. In fact, any digit key may be pressed along with
*Ctrl + Shift* to alter the amount of transparency. *Ctrl + Shift + 1*
makes the window the most transparent and *Ctrl + Shift + 9* makes it
the least transparent.  *Ctrl + Shift + 0* makes the window solid.


Set up VNC Viewer
-----------------
 1. Download VNC Viewer for Windows EXE 64-bit from
    <https://www.realvnc.com/download/viewer/>.
 2. Rename it to *vnc.exe* and move it to *X:\opt\bin*.


Set up VLC
----------
 1. Download Zip package for VLC from
    <http://www.videolan.org/vlc/download-windows.html>.
 2. Unzip the file.
 3. Move the VLC directory in the extract to *X:\opt*.
 4. Append *X:\opt\vlc-2.#.#* to the system variable named *mypath*.


Set up GIMP
-----------
 1. Download GIMP installer from <https://www.gimp.org/downloads/>.
 2. Run the installer.
 3. Click *OK*. Click *Customize*. Click *Next*.
 4. Set destination location to *X:\opt\gimp2*. Click *Next*.
 5. Select *Compact installation*. Click *Next*.
 6. Click *Next*. Click *Next*. Click *Install*.


Set up FFmpeg
-------------
 1. Download FFmpeg 64-bit static build from
    <https://www.ffmpeg.org/download.html>. Look for *Windows Packages* >
    *Windows Builds* to get the link to binaries.
 2. Unzip the file.
 3. Go to *bin* directory in the extract.
 4. Move *ffmpeg.exe*, *ffplay.exe* and *ffprobe.exe* to *X:\opt\bin*.


Configure Taskbar
-----------------
Configure start menu and taskbar to remove unnecessary items and better
present the necessary items.

 1. Right click on the taskbar and uncheck *Lock the taskbar*.
 2. Drag the top of the taskbar to make it two rows high.
 3. Right click on the taskbar and select *Properties*.
 4. Set *Taskbar buttons* to *Never combine*.
 5. Go to *Start Menu* > *Customize*.
 6. Set *Computer* to *Display as a menu*.
 8. Deselect *Connect To*.
 9. Set *Control Panel* to *Display as a menu*.
10. Deselect *Default Programs*.
11. Set *Documents* to *Don't display this item*.
12. Set *Downloads* to *Display as a link*.
12. Deselect *Help*.
13. Set *Music* to *Don't display this item*.
14. Select *Network*.
14. Set *Personal folder* to *Display as menu".
15. Set *Pictures* to *Don't display this item".
16. Select *Run*.
17. Set *System administrative tools* to *Display on the All Programs
    menu and the Start Menu*.
18. Press *OK*.
19. Set *Power button action* to *Hibernate*.


Configure cmd.exe
-----------------
Configure *cmd.exe* so that it looks similar to Console.

 1. Run *cmd.exe*.
 2. Right click on the title bar and select *Properties*.
 3. Set *Font* > *Font* to *Consolas*.
 4. Set *Font* > *Size* to *24*.
 5. Set *Layout* > *Screen Buffer Size* > *Height* to *9999*.


Configure Internet Explorer
---------------------------
 1. Go to *Settings* > *Internet Options* > *General* > *Home page*.
 2. Click *Use new tab*.
 3. Press *OK*.


Configure Adobe Acrobat Reader DC
---------------------------------
Hide the Tools Pane in Adobe Acrobat Reader DC in order to provide more
screen real estate to the document being viewed.

 1. Go to *Edit* > *Preferences* > *Documents*.
 2. Deselect *Open tools pane for each document*.
 3. After opening a PDF document, if the Tools Pane is visible, go to
    *View* > *Show/Hide* and uncheck *Tools Pane*. The Tools Pane won't
    be visible the next time the document is opened.

Enable buttons to jump forward and back in a document.

 1. Right click on Toolbar, go to Page Navigation Tools and check
    *Previous View*.
 2. Right click on Toolbar, go to Page Navigation Tools and check
    *Next View*.


Configure Power Options
-----------------------
 1. Go to *Start* > *Control Panel* > *Power Options*.
 2. Click *Choose what closing the lid does*.
 3. Set the following options for both *On Battery* and *Plugged in*.
      - When I press the power button: Sleep
      - When I press the sleep button: Sleep
      - When I close the lid: Do nothing
 4. Click *Save changes*.


Next Steps
----------
Perform any applicable setups mentioned in
[common-setup.md](common-setup.md).
