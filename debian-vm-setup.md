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

On Debian, run the following command.

    apt-get update
    apt-get install virtualbox


Configure VirtualBox
--------------------
  1. Run Oracle VM VirtualBox Manager.
  2. Go to *File* > *Preferences* > *General*.
  3. Set *Default Machine Folder* to *\vbox* or *~/vbox*. Click *OK*.


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

After the installation completes and Debian reboots, log into the
desktop and configure it.

  1. After logging in, a welcome dialog box appears. Click *Use default
     config*.
  2. Right click on the top panel and go to *Panel* > *Panel
     Preferences*. Select *Panel 2* from drop-down menu. Click the minus
     button. Click *Remove*. Click *Close*.


Map Caps Lock to Escape
-----------------------
Make the Caps Lock key behave as Escape key. This makes using Vi editor
more convenient because one does not have to reach the corner of the
keyboard while returning to normal mode.

  1. Go to *Applications Menu* > *Settings* > *Session and Startup* >
     *Application Autostart*.
  2. Click *Add*.
  3. Enter the following fields.
    - Name: Uncap
    - Description: Map Caps Lock key to Escape key
    - Command: `setxkbmap -option caps:escape`
  4. Click *OK*. Click *Close*.

Log out and log into the desktop again to confirm that Caps Lock key
behaves as Escape key.

Reference: https://github.com/susam/uncap#linux-setxkbmap


Configure APT
-------------
Edit /etc/apt/sources.list, remove all lines from it and add the
following lines.

    deb http://httpredir.debian.org/debian jessie main contrib non-free
    deb http://httpredir.debian.org/debian jessie-updates main contrib non-free
    deb http://security.debian.org/ jessie/updates main contrib non-free

References:

  - https://wiki.debian.org/DebianGeoMirror
  - http://httpredir.debian.org/


Setup Guest Additions
---------------------
### Install Guest Additions ###
  1. Open *Terminal* and log in as root with `su` command.
  2. Install packages required to build VirtualBox Guest Additions
     kernel modules.

        apt-get update
        apt-get install make gcc linux-headers-$(uname -r)

  3. In the virtual machine window, go to *Devices* > *Insert Guest
     Additions CD Image*.
  4. In the Debian desktop, double click VBOXADDITIONS CD icon in order
     to mount the CD image.
  5. Run the following command.

        sh /media/cdrom/autorun.sh

  6. After the installation is complete, on the Debian desktoop, right
     click on VBOXADDITIONS CD, and select *Eject Volume*.
  7. The installation creates a group named *vboxsf* that becomes the
     group owner of any shared folder. Open *Terminal* and log in as
     root with `su` command to add the desktop user to this group.

        adduser susam vboxsf

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
Additions features setup in the previous section are enabled.


Minimalize VM Window
--------------------
  1. Go to *View* > *Status Bar*. Deselect *Show Status Bar*.
  2. Go to *View* > *Menu Bar*. Deselect *Show Menu Bar*.
  3. Press Right Ctrl + Home to access the VM menu when required.


Configure Terminal
------------------
  1. Go to *Applications Menu* > *Terminal*. Click *Terminal* and drag
     it to the top panel and drop it right between the *Applications
     Menu* button and the separator (a bunch of five short horizontal
     gray lines) to create a launcher for Terminal.

  2. Click on the *Terminal* launcher in the top panel.

  3. Go to *Edit* > *Preferences*.

  4. Go to *General* tab.
    - Set *Scrollbar is* to *disabled*.
    - Set *Scrollback* to *10000*.

  5. Go to *Appearance* tab.
    - Set *Font* to *Monospace 12*.
    - Set *Background* to *Transparent background*.
    - Set *Transparency* to *0.70*.
    - Deselect *Display menubar in new windows*.


Install Packages
----------------
  1. Open *Terminal* and log in as root with `su` command.

  2. Install packages that may be used.

        apt-get update
        apt-get install tmux vim-gtk git tree gcc-doc sudo

  3. Configure packages.

        git config --global user.name "Susam Pal"
        git config --global user.email susam@susam.in
        git config --global push.default simple
        git config --global credential.helper 'cache --timeout=86400'

  4. Add desktop user to the sudo group.

        adduser susam sudo

  5. Log out, log in again and enter the following command to confirm
     that the desktop user belongs to the sudo group.

        groups


Enable Hinting
--------------
The following steps enable font hinting in XFCE 4.10 on Debian 8.0.

  1. Go to Settings > Appearance > Fonts.
  2. Set *Hinting* to *Slight*.
  3. Set *Sub-pixel order* to *RGB*.

I found that Hinting = Medium and Hinting = Full behaved identically.


Setup Vimer
-----------
  1. On the Debian VM, enter the following commands.

        mkdir -p ~/git ~/bin
        cd ~/git
        git clone https://github.com/susam/vimer
        ln -sf ~/git/vimer/vimer ~/bin/vi

  2. Run *Thunar*, i.e. *Applications Menu* > *File Manager*. From the
     menu, go to *Edit* > *Configure custom actions*.

  3. Click the plus icon to add a new custom action..

  4. Enter the following details.
     - Name: Edit with GVim
     - Command: `gvim --remote-silent %F`
     - Icon: vim 

  5. Go to *Apperance Conditions* tab and select *Directories*, *Text
     Files* and *Other Files*.

  6. Click *OK*. Click *Close*.


Setup home directory
--------------------
  1. On the Debian VM, enter the following commands.

        mkdir -p ~/git
        cd ~/git

        git clone https://github.com/susam/dotfiles
        cd dotfiles
        ./setup

  2. Edit *~/.bashrc* and add the following code to it.

        export PATH=~/bin:$PATH
        export TERM=xterm-256color
        echo Shell environment is set. >&2


Setup Internal Network Adapter
------------------------------
  1. In the Debian VM, go to *Applications Menu* > *Log Out* > *Shut
     Down* to shutdown the VM.
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
