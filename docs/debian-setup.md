Install VirtualBox
------------------

On Windows, perform the following steps.

 1. Download VirtualBox for Windows hosts amd64 from
    <https://www.virtualbox.org/wiki/Downloads>.
 2. Run the installer.
 3. Click *Next*.
 4. Set *Location* to *X:\opt\VirtualBox*. Click *Next*.
 5. Deselect all options to create shortcut or register file
    associations. Click *Next*. Click *Yes*. Click *Install*.

On Debian, enter the following command.

    sudo apt-get update
    sudo apt-get install virtualbox

On Mac, enter the following command

    brew cask install virtualbox


Configure VirtualBox
--------------------

 1. Run Oracle VM VirtualBox Manager.
 2. Go to *File* > *Preferences* > *General*.
 3. Set *Default Machine Folder* to `\vbox` or `~/vbox`. Click *OK*.


Create Debian VM
----------------

 1. Download Debian amd64-xfce-CD-1 from
    <https://www.debian.org/CD/http-ftp/#stable>.
 2. Run Oracle VM VirtualBox. Click *New*.
 3. Set *Name and operating system* to Debian.
      - Name: Debian
      - Type: Linux
      - Version: Debian (64-bit)
    Click *Next*.
 4. Set *Memory size* to *512* MB. Click *Next*. Click *Create*. Click
    *Next*.
 5. Select *Fixed size*. Click *Next*.
 6. Set the size of the virtual hard disk if required. Click *Create*.
 7. After the machine is created, go to *Machine* > *Settings* >
    *Storage* > *Controller: IDE* > *Empty* > *Optical Drive* > *Disc*
    icon > *Choose Virtual Optical Disk File* and select the ISO file.
    Click *OK*.
 8. Click *Start*.


Installation Notes
------------------

The following notes describe only those dialog boxes or entries that
require non-default inputs.

 1. Select your location: Country, territory or area: India
 2. Partition disks: Write changes to disk?: Yes
 3. Configure the package manager: Use a network mirror?: No
 4. Install the GRUB boot loader on a hard disk: Device for boot loader
    installation: /dev/sda


Configure Desktop
-----------------

After the installation completes and Debian reboots, log into the
desktop and configure it.

 1. After logging in, a welcome dialog box appears.
    Click *Use default config*.

 2. Go to *Applications Menu* > *Settings* > *Panel*. Select *Panel 2*
    from drop-down menu. Click the minus button. Click *Remove*.

 3. In the *Panel* dialog box, select *Panel 1* again in the drop-down
    menu. Then go to *Items* tab.
      - Select *Clock* and click the remove button.
      - Click the add button.
      - Select *Battery Monitor* and click *Add*.
      - Select *DateTime* and click *Add*.
      - Click *Close*.
      - Select *Battery Monitor* and place it right under the *Workspace
        Switcher* by moving it using the arrow buttons.
      - Repeat the above step for *DateTime*.
      - Select *Workspace Switcher* and click the edit button.
        Set *Number of rows* to `2`. Click *Close*.
      - Select *Datetime* and click the edit button. Under *Date*,
        set *Format* to *Custom* with the format field as `%b %d`.

 4. Go to *Applications Menu* > *Terminal*. Click *Terminal* and drag
    it to the top panel and drop it right between the
    *Applications Menu* button and the separator (a bunch of five short
    horizontal gray lines) to create a launcher for Terminal.

 5. Go to *Applications Menu* > *Internet* > *Firefox ESR*,
    and drag it to the top panel and drop it next to the *Terminal*
    launcher.


Map Caps Lock to Escape
-----------------------

Note: This section is not applicable if Debian is running in a virtual
machine and Caps Lock is mapped to Escape already in the host system.

Make the Caps Lock key behave as Escape key. This makes using Vi editor
more convenient because one does not have to reach the corner of the
keyboard while returning to normal mode.

 1. Go to *Applications Menu* > *Settings* > *Session and Startup* >
    *Application Autostart*.
 2. Click *Add*.
 3. Enter the following fields.
      - Name: Uncap
      - Description: Map Caps Lock to Escape
      - Command: `setxkbmap -option caps:escape`
 4. Click *OK*. Click *Close*.

Log out and log into the desktop again to confirm that Caps Lock key
behaves as Escape key.

Reference: https://github.com/susam/uncap#linux-setxkbmap


Configure APT
-------------

Edit /etc/apt/sources.list, remove all lines from it and add the
following lines.

    deb http://deb.debian.org/debian buster main contrib non-free
    deb http://deb.debian.org/debian buster-updates main contrib non-free
    deb http://security.debian.org/ buster/updates main contrib non-free

References:

  - https://wiki.debian.org/DebianGeoMirror
  - https://deb.debian.org/


Configure sudo
--------------

 1. Open *Terminal* and log in as root with `su` command.

 2. Install sudo

        apt-get update
        apt-get install sudo

    Note: This step does not seem to be required since Debian 10
    (buster). The `sudo` command is installed by default since this
    version.

 3. Add desktop user to the sudo group.

        adduser susam sudo

 4. Log out, log in again and enter the following command to confirm
    that the desktop user belongs to the sudo group.

        groups


Set up Guest Additions
----------------------

### Install Guest Additions ###

 1. Open *Terminal* and log in as root with `su` command.
 2. Install packages required to build VirtualBox Guest Additions
    kernel modules.

        sudo apt-get update
        sudo apt-get install make gcc linux-headers-$(uname -r)

 3. In the virtual machine window, go to *Devices* > *Insert Guest
    Additions CD Image*.
 4. In the Debian desktop, double click VBOXADDITIONS CD icon in order
    to mount the CD image.
 5. Run the following command.

        sudo sh /media/cdrom/autorun.sh

 6. After the installation is complete, on the Debian desktoop, right
    click on VBOXADDITIONS CD, and select *Eject Volume*.
 7. The installation creates a group named *vboxsf* that becomes the
    group owner of any shared folder. Open *Terminal* and log in as
    root with `su` command to add the desktop user to this group.

        sudo adduser susam vboxsf


### Enable Bidirectional Clipboard and Drag-n-Drop ###

 1. Go to *Machine* > *Settings* > *General* > *Advanced*.
 2. Set *Shared Clipboard* to *Bidirectional*.
 3. Set *Drag'n'Drop* to *Bidirectional*.


### Enable shared folders ###

 1. Go to *Machine* > *Settings* > *Shared Folders*.
 2. Click the plus icon.
 3. Set *Folder Path* to the path of the *pkg* directory.
 4. Select *Auto-mount*. Select *Make Permanent*. Click *OK*.


### Reboot ###

Reboot the Debian VM, so that the system to ensure that all Guest
Additions features set up in the previous section are enabled.


Minimalize VM Window
--------------------

 1. Go to *View* > *Status Bar*. Deselect *Show Status Bar*.
 2. Go to *View* > *Menu Bar*. Deselect *Show Menu Bar*.
 3. Press Right Ctrl + Home to access the VM menu when required.


Configure Terminal
------------------

 1. Click on the *Terminal* launcher in the top panel.

 2. Go to *Edit* > *Preferences*.

 3. Go to *General* tab.
      - Set *Scrollbar is* to *disabled*.
      - Set *Scrollback* to *10000*.

 4. Go to *Appearance* tab.
      - Set *Font* to *Monospace 10*.
      - Set *Background* to *Transparent background*.
      - Set *Transparency* to *0.70*.
      - Deselect *Display menubar in new windows*.

 5. Close and launch *Terminal* again to ensure that menubar is not
    displayed anymore.


Install Packages
----------------

 1. Install essential packages.

        sudo apt-get update
        sudo apt-get -y install tmux vim-gtk git

 2. Install development packages.

        sudo apt-get -y install make gcc gcc-doc doxygen
        sudo apt-get -y install g++
        sudo apt-get -y install python3-pip python3-venv

 3. Install useful packages.

        sudo apt-get -y install tree unrar unzip
        sudo apt-get -y install texlive texlive-latex-extra
        sudo apt-get -y install rtorrent gimp libav-tools
        sudo apt-get -y install fonts-symbola

Note: Installation of `fonts-symbola` is necessary to display emoji
characters in the terminal correctly. For example, without this package,
the command

    printf '\xf0\x9f\x8d\xba\n'

outputs a square box with `01F37A` written in it, the Unicode code point
of BEER MUG (`:beer:`). With this package, the character is rendered in
the terminal as a beer mug, although the quality and details of the font
leave a lot to be desired.


Enable Hinting
--------------

The following steps enable font hinting in XFCE 4.10 on Debian 8.0.

 1. Go to Settings > Appearance > Fonts.
 2. Set *Hinting* to *Slight*.
 3. Set *Sub-pixel order* to *RGB*.

I found that Hinting = Medium and Hinting = Full behaved identically.


Configure File Manager
----------------------

 1. Run *Thunar*, i.e. *Applications Menu* > *File Manager*. From the
    menu, go to *Edit* > *Configure custom actions*.

 2. Click the plus icon to add a new custom action.

 3. Enter the following details.
      - Name: Edit with GVim
      - Command: `gvim --remote-silent %F`
      - Icon: vim

 4. Go to *Apperance Conditions* tab and select *Directories*, *Text
    Files* and *Other Files*.

 5. Click *OK*. Click *Close*.


Set up home directory
---------------------

 1. On the Debian VM, enter the following commands.

        mkdir -p ~/git
        cd ~/git

        git clone https://github.com/susam/dotfiles.git
        cd dotfiles
        ./setup

 2. Set up useful scripts.

        mkdir -p ~/git ~/bin
        cd ~/git

        git clone https://github.com/susam/vimer.git
        ln -sf ~/git/vimer/vimer ~/bin/vi
        ln -sf ~/git/vimer/vimer ~/bin/vi.sh

        git clone https://github.com/susam/timebox.git
        ln -sf ~/git/timebox/timebox ~/bin/timebox

 3. Set up my directory.

        cd
        git clone https://susam@bitbucket.org/susam/my.git

 4. Edit *~/.bashrc* and add the following code to it.

        export PATH=~/bin:~/opt/bin:~/my/bin:~/my/ws/bin:$PATH
        export TERM=xterm-256color
        echo Shell environment is set. >&2

 5. Log out and log into the desktop again to ensure that ~/bin and
    ~/my/bin are added to the PATH environment variable.


Configure Screensaver and Power Settings
----------------------------------------

Disable screensaver.

 1. Go to *Applications Menu* > *Settings* > *Screensaver*.
 2. Set *Mode* to *Disable Screen Saver*.

Configure power settings.

 1. Go to *Applications Menu* > *Settings* > *Power Manager* > *System*.
 2. Set *System sleep mode* to *Suspend* for *On battery* and *Plugged in*.
 3. Set *Put system to sleep when inactive for* - *15 minutes* - *On battery*.
 4. Set *Put system to sleep when inactive for* - *30 minutes* - *Plugged in*.
 5. Click *Close*.


Set up Internal Network Adapter
-------------------------------

This section is applicable only if networking between VMs
within VirtualBox is required. If the VM is going to function in
isolation without the need to communicate with other VMs on the same
VirtualBox, then this section is not applicable.

 1. In the Debian VM, go to *Applications Menu* > *Log Out* > *Shut Down*
    to shutdown the VM.

 2. In Oracle VM VirtualBox Manager, go to *Machine* > *Settings* >
     *Network* > *Adapter 2*.
      - Select *Enable Network Adapter*.
      - Set *Attached to*: *Internal Network*.
      - Click *OK*.

 3. Start the Debian VM.

 4. In the Debian VM, edit /etc/network/interfaces and add the
     following lines to it.

        auto eth1
        iface eth1 inet static
            address 10.0.0.1
            netmask 255.255.255.0

    Change the `address` value to the desired IPv4 address before
    saving the file.

 5. Enter the following command to reconfigure network interfaces.

        service networking restart

 6. Enter the following command to confirm that the network interface
    has been configured successfully.

        ifconfig eth1

    If the interface has been configured successfully, the second line
    of the output would contain "inet addr:" followed by the configured
    IPv4 address.

    To double-check that the interface is functioning correctly, ping
    another VM that also has an internal network adapter setup from
    this VM, and vice versa.


Configure Keyboard for VirtualBox on Mac
----------------------------------------

If the VM is running on Mac, then it can become annoying to having to
switch between <kbd>command</kbd>, <kbd>control</kbd> and
<kbd>option</kbd> keys between the Mac host and the VM for similar
activities.

Perform the following steps to make the VM key bindings for various
activities same as that of the Mac host key bindings.


### Configure Host Key

Set *right command* key as the host key.

 1. On Mac, from the menu, select *VirtualBox* > *Preferences*.
 2. Go to *General* > *Input* > *Virtual Machine*.
 3. Select *Host Key Combination* and set it to `Right ⌘` by
    pressing the *right command* key.

This ensures that pressing *left command + c* inside the virtual
machine does not switch the virtual machine view to scaled mode.

With this configuration, here are a few ways to conveniently return to
the Mac desktop from the VM running in full-screen mode.

  - Press *right command* followed by *left command + tab* to select an
    application running on the Mac host.
  - Press *right command + f* to exit full-screen mode.
  - Swipe up with three fingers on the trackpad to return to *Mission
    Control* and select an application running on the Mac host.


### Map Command to Control

Set the *command* key to behave like *control* key inside the VM. This
ensures that *command + c* and *command + v* can be used to copy and
paste, respectively, on both the Mac host and the VM.

 1. Inside the VM, go to *Applications Menu* > *Settings* >
    *Session and Startup* > *Application Autostart*.
 2. Click *Add*.
 3. Enter the following fields.
      - Name: Command to Control
      - Description: Map Command to Control
      - Command: `setxkbmap -option altwin:ctrl_win`
 4. Click *OK*. Click *Close*.
 5. Log out and log into the desktop again and test that the mapping is
    succssful. To test, launch Firefox and press *control + t* followed
    by *command + t*. Two new tabs should be created.


### Configure Command + Tab to Cycle Windows

Configure the Debian VM so that *Command + Tab* can be used to cycle
through windows just like it is used on the Mac host.

 1. Inside the VM, go to *Applications Menu* > *Settings* >
    *Window Manager*.
 2. Go to *Keyboard* tab.
 3. Set the following keyboard shortcuts. To set each shortcut,
    double-click on it and press the following keyboard shortcut.

      - Cycle windows: Command + Tab
      - Cycle windows (reverse): Command + Shift + Tab

    Note that the second entry would appear as *Shift + Control + ISO
    Left Tab* in the *Window Manager*.

 4. To test the new keyboard shortcuts, launch at least three
    applications and press *Command + Tab* twice to ensure that the
    selection moves from left to right. Similarly, press *Command +
    Shift + Tab* to ensure that the selection moves from right to left.


Next Steps
----------

Perform any applicable setups mentioned in
[common-setup.md](common-setup.md).
