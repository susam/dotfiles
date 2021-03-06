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

On Mac, enter the following command

    brew cask install virtualbox


Configure VirtualBox
--------------------
 1. Run Oracle VM VirtualBox Manager.
 2. Go to *File* > *Preferences* > *General*.
 3. Set *Default Machine Folder* to *\vbox* or *~/vbox*. Click *OK*.


Create CentOS VM
----------------
 1. Download CentOS 7 DVD1 ISO from
    <https://www.centos.org/download/> and save it to *\pkg* or *~/pkg*.
 2. Run Oracle VM VirtualBox. Click *New*.
 3. Set *Name and operating system* to CentOS.
      - Name: CentOS
      - Type: Linux
      - Version: Red Hat (64-bit)
    Click *Next*.
 4. Set *Memory size* to *1024* MB. Click *Next*. Click *Create*.
    Click *Next*.
 5. Select *Fixed size*. Click *Next*.
 6. Set the size of the virtual hard disk if required. Click *Create*.
 7. Click *Start*.
 8. A dialog box appears to select a disk to start the new virtual
    machine. Click the browse icon (a tiny yellow folder with green
    arrow icon) and select the ISO file downloaded in step 1.


Installation Notes
------------------
The following notes describe only those dialog boxes or entries that
require non-default inputs.

 1. CentOS 7: Install CentOS 7
 2. Select *Date and Time*. Select *India*. Click *Done*.
 3. Select *Installation Destination*. Click *Done*.
 4. Select *Kdump*. Deselect *Enable kdump*. Click *Done*.
 5. Select *Network & Hostname*. Set *Host name* to `centos`. Click *Apply*.
 6. Then toggle the *Off* button to *On*. Click *Done*.
 7. Click *Begin Installation*.
 8. Click *Root Password*. Enter root password. Click *Done*. If there
    is a warning about password complexity, click *Done* again.
 9. Click *User Creation*. Enter new user details.
10. Select *Make this user administrator. Then click *Done*. If
    there is a warning about password complexity, click *Done* again.
11. After the installation is complete, click *Reboot*.


Configure User 
--------------
This is an optional section. This steps in this section may be performed
in case the non-root user was not made an administrator during
installation.

  1. Log into CentOS as root and enter the following command.

        usermod -aG wheel susam

  2. Now exit the shell, and log in again as the non-root user and enter
     the following command to ensure that user belongs to the `wheel`
     group.

        groups


Activate Networking
-------------------
This is an optional section. The steps in this section may be performed
in case networking was not activated during installation.

 1. Log into CentOS as a regular user and enter the following command.

        sudo vi /etc/sysconfig/network-scripts/ifcfg-enp0s3.

 2. Then set the `ONBOOT` parameter to `YES`.
 3. Save the file and quit vi.

The network should be active as soon as the file is saved.


Set up Guest Additions
----------------------
### Install Guest Additions ###
 1. Open *Terminal* and log in as root with `su` command.
 2. Install packages required to build VirtualBox Guest Additions
    kernel modules.

        yum install kernel kernel-devel gcc

 3. If the above command leads to a kernel update, then reboot the
    CentOS system to boot with the new kernel.
 4. In the virtual machine window, go to *Devices* > *Insert Guest
    Additions CD Image*.
 5. In the CentOS desktop, click *OK* to *Open Autorun Prompt*.
    Click *Run*. Enter *Password for root* and click *Authenticate*.
 6. After the installation is complete, on the CentOS desktop, right
    click on the VBOXADDITIONS CD, and select *Eject*.
 7. The installation creates a group named *vboxsf* that becomes the
    group owner of any shared folder. Add the desktop user to the
    *vboxsf* group.

        usermod -a -G vboxsf susam

### Enable Bidirectional Clipboard and Drag-n-Drop ###
 1. Go to *Machine* > *Settings* > *General* > *Advanced*.
 2. Set *Shared Clipboard* to *Bidirectional*.
 3. Set *Drag'n'Drop* to *Bidirectional*.

### Enable shared folders ###
 1. Go to *Machine* > *Settings* > *Shared Folders*.
 2. Click the plus icon.
 3. Set *Folder Path* to the path of the *pkg* directory.
 4. Select *Auto-mount*. Select *Make Permanent*. Click *OK*.

### Notes ###
 1. Guest Additions installation can proceed without kernel-devel and
    gcc packages but such an installation would only install the Window
    System drivers and X.Org Server modules. The main guest additions
    module would fail to build which means mouse integration, shared
    clipboard, drag'n'drop and shared folders won't work.
 2. VirtualBox mounts shared folders with *root* as the owner, *vboxsf*
    as the group owner and no permissions to others. Therefore, it is
    necessary to add the desktop user to this group, so that it can
    access the shared folders.
 3. The *vboxsf* group should be created and mouse pointer integration
    should be active as soon as the installation of guest additions
    complete.
 4. Higher screen resolution that adapts to the VM Window size,
    bidirectional clipboard and bidirectional drag-n-drop becomes active
    after logging out of the desktop and logging in again.
 5. Shared folder is mounted automatically after rebooting the CentOS
    system.


Simplify VM Window
------------------
 1. Go to *View* > *Status Bar*. Deselect *Show Status Bar*.
 2. Go to *View* > *Menu Bar*. Deselect *Show Menu Bar*.
 3. Reboot the CentOS system to enable the Guest Additions features
     set up in the previous section and to confirm that the VM window
     remains minimal after a reboot.


Configure Terminal
------------------
 1. Go to *Applications* > *System Tools*. Click *Terminal* and drag it
    to the top panel to create an application launcher.

 2. Click on the *Terminal* application launcher in the top panel.

 3. Go to *Edit* > *Profile Preferences*.

 4. Go to *General* tab.
      - Deselect *Use the system fixed width font*.
      - Set *Font* to *Monospace 14*.
      - Deselect *Show menubar by default in new terminals*.

 5. Go to *Title and Command* tab.
      - Select *Run a custom command instead of my shell*.
      - Set *Custom command* to the following.

            env TERM=xterm-256color /bin/bash

 6. Go to *Colors* tab.
      - Deselect *Use colors from system theme*.
      - Set *Built-in schemes* to *White on black*.
      - Set *Palette* > *Built-in schemes* to *XTerm*.

 7. Go to *Background* tab.
      - Select *Transparent background*.
      - Drag the slider to the middle.

 8. Go to *Scrolling* tab.
      - Set *Scrollbar is* to *disabled*.
      - Set *Scrollback* to *Unlimited*.

 9. Click *Close*.


Set up tmux
-----------
Open a shell as root and enter the following commands.

    mkdir -p ~/pkg
    cd ~/pkg

    yum -y install ncurses-devel

    wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
    tar -xvzf libevent-2.0.22-stable.tar.gz
    cd libevent-2.0.22-stable
    ./configure
    make -j 4
    make install
    cd ..

    wget https://github.com/tmux/tmux/releases/download/2.1/tmux-2.1.tar.gz
    tar -xvzf tmux-2.1.tar.gz
    cd tmux-2.1
    ./configure LDFLAGS="-Wl,-rpath,/usr/local/lib"
    make -j 4
    make install


Set up rlwrap
-------------
Open a shell as root and enter the following commands.

    yum -y install readline-devel

    mkdir -p ~/pkg
    cd ~/pkg

    wget http://utopia.knoware.nl/~hlub/uck/rlwrap/rlwrap-0.42.tar.gz
    tar -xvzf rlwrap-0.42.tar.gz
    cd rlwrap-0.42
    ./configure
    make
    make install


Configure Nautilus
------------------
 1. Go to *Places* > *Home Folder* to launch Nautilus.
 2. In Nautilus, go to *Edit* > *Preferences* > *Behaviour*.
 3. Select *Always open in browser windows*.
 4. Click *Close*.


Set up Packages
---------------
Open a shell as root and enter the following commands.

    yum install git vim-X11


Set up home directory
---------------------
 1. On the CentOS VM, enter the following commands.

        mkdir -p ~/git
        cd ~/git

        git clone https://github.com/susam/dotfiles
        cd dotfiles
        ./setup

 2. Add desired aliases to *~/.bashrc*. Here is an example.

        alias vi=gvim
        echo Shell environment is set. >&2


Configure Remote Connections
----------------------------
### Set up Internal Network Adapter ###
Enable connectivity among VMs.

 1. Shut down the CentOS operating system in the virtual machine.

 2. In Oracle VM VirtualBox Manager, go to *Machine* > *Settings* >
    *Network* > *Adapter 2*.
      - Select *Enable Network Adapter*.
      - Set *Attached to*: *Internal Network*.
      - Click *OK*.

 3. Start the CentOS virtual machine.

 4. In the CentOS VM, edit /etc/sysconfig/network-scripts/ifcfg-eth1.

        DEVICE=eth1
        TYPE=Ethernet
        ONBOOT=yes
        BOOTPROTO=none
        NM_CONTROLLED=no
        IPADDR=192.168.0.2
        NETMASK=255.255.255.0

    Use a unique IP address for the IPADDR parameter.

### Set up Host-Only Adapter ###
Enable connectivity from the host system to the CentOS VM.

 1. Shut down the CentOS operating system in the virtual machine.
 2. In Oracle VM VirtualBox Manager, go to *Machine* > *Settings* >
    *Network* > *Adapter 2*.
      - Select *Enable Network Adapter*.
      - Set *Attached to*: *Host-only Adapter*.
      - Click *OK*.
 3. Start the CentOS virtual machine.

The Host-Only Adapter has never worked for me within VPN.

### Set up Remote Desktop ###
Enable remote desktop connectivity.

 1. Log into the CentOS desktop.
 2. Go to *System* > *Preferences* > *Remote Desktop*.
 3. Select *Sharing* > *Allow other users to view your desktop*.
 4. Deselect *Security* > *You must confirm each access to this machine*.
 5. Select *Require the user to enter this password*.
 6. Set a password.
 7. Click *Close*.


Increase Screen Lock Timeout
----------------------------
GNOME Desktop locks the desktop after it is idle for 5 minutes. The
idle duration before which the desktoip is locked can be increased.

 1. Go to *System* > *Preferences* > *Screensaver*.
 2. Set *Regard the computer as idle after* to a desired time by
    dragging the slider.


Install Adobe Flash Player for Firefox
---------------------------------------
Enter the following commands to install Adobe Flash Player for Firefox.

    mkdir -p ~/pkg
    cd ~/pkg
    wget https://fpdownload.adobe.com/get/flashplayer/pdc/11.2.202.632/install_flash_player_11_linux.x86_64.tar.gz
    mkdir flash
    tar -xvzf install_flash_player_11_linux.x86_64.tar.gz -C flash
    mv flash/libflashplayer.so ~/.mozilla/plugins

After the installation is complete, restart Firefox and go to
<https://www.adobe.com/software/flash/about/> to check if Flash Player
detects version information successfully.


Next Steps
----------
Perform any applicable setups mentioned in
[common-setup.md](common-setup.md).
