Detect Network Hardware During Installation
-------------------------------------------
During the installation of Debian 8.7 on Acer Extensa 4620 (laptop), the
following warning appears.

    [!] Detect network hardware

    Some of your hardware needs non-free firmware files to operate. The
    firmware can be loaded from removable media, such as a USB stick or
    floppy.

    The missing firmware files are: iwlwifi-3945-2.ucode

    If you have such media available now, insert it, and continue.

    Load missing firmware from removable media?

    <Yes> <No>

To resolve this, download the firmware tarball and extract it to a USB
drive. It is better to prepare this before performing the installation.

    wget http://cdimage.debian.org/cdimage/unofficial/non-free/firmware/jessie/current/firmware.tar.gz
    mkdir firmware
    cd firmware
    tar -xvzf ../firmware.tar.gz
    cp -r firmware /media/susam/usb/

Then connect this USB drive to the laptop and try to continue the
installation. If the installer fails to detect the firmware, remove any
other USB drives (such as the USB drive with the installer) that are
connected and try again.

Once the firmware is detected and loaded, the installer would proceed.
Then disconnect the USB drive with the firmware and reconnect the USB
drive with the installer.

If the installer fails to load installation files from the USB drive, go
to another terminal (press Ctrl + Alt + F2 and press Enter), and run the
`mount` command to check if the USB drive is mounted. It is probably not
mounted. If so, mount it.

    mkdir -p /media/usb
    mount /dev/sdb1 /media/usb

Reference: https://wiki.debian.org/Firmware


Enable Touchpad Tap in Xfce
---------------------------
The following steps enable touchpad tap in Xfce 4.10 on Debian 8.0.

 1. Go to *Settings* > *Mouse and Touchpad* > *Devices*.
 2. From the *Device* menu, select the touchpad.
 2. In the *Touchpad* tab, select *Tap touchpad to click*.
 3. Ensure *Edge scrolling* is selected (this is the default).
 4. Select *Enable horizontal scrolling*.


Use Google Public DNS
---------------------
The following steps configures DHCP client on Debian 8.0 to use Google
Public DNS.

 1. Append the following line to /etc/dhcp/dhclient.conf.

        supersede domain-name-servers 8.8.8.8;

 2. Then restart network-manager.

        service network-manager restart


Disable Extra Checks on Password Strength
-----------------------------------------
The extra checks on password strength offered by `pam_unix` is
cumbersome for private systems that do not contain critical or sensitive
data. Follow the steps below to disable these extra checks.

 1. Edit /etc/pam.d/common-password.

 2. Remove the `obsecure` option for `pam_unix.so` module, i.e. modify

        password    [success=1 default=ignore]  pam_unix.so obscure sha512

    to

        password    [success=1 default=ignore]  pam_unix.so sha512

 3. Save the file.

See `man pam_unix` for more details.


Mount Phone via MTP
-------------------
The following steps work fine with my Moto X Play with Android 6.0.1 on
Debian 8.7 (Jessie) with Xfce 4.10.

    sudo apt-get install jmtpfs
    mkdir ~/phone
    jmtpfs ~/phone

To unmount the phone, enter the following.

    fusermount -u ~/phone


Install Rclone
--------------
Enter the following commands to install Rclone.

    sudo apt-get install unzip

    mkdir -p ~/pkg
    cd ~/pkg

    url=http://downloads.rclone.org/rclone-v1.36-linux-amd64.zip
    zip="${url##*/}"
    dir="${zip%.*}"

    wget "$url"
    unzip "$zip"

    mkdir -p ~/opt/bin ~/opt/man/man1
    mv "$dir/rclone" ~/opt/bin
    mv "$dir/rclone.1" ~/opt/man/man1

After Rclone is installed, enter the following command to configure it.

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


Write to NTFS filesystem
------------------------
An NTFS filesystem gets mounted automatically on Debian 8.0 with Xfce
4.10. However, attempting to write to the filesystem fails.

    # cd /media/susam/Purple32GB
    # mkdir test
    mkdir: cannot create directory ‘test’: Operation not permitted
    # echo hi > test
    -su: test: Permission denied

The mount command shows that the drive has been mounted as ntfs
filesystem.

    # mount | tail -n 1
    /dev/sdb1 on /media/susam/Purple32GB type ntfs (rw,nosuid,nodev,relatime,uid=1000,gid=1000,fmask=0177,dmask=077,nls=utf8,errors=continue,mft_zone_multiplier=1,uhelper=udisks2)

The solution involves installing the 3rd generation read/write NTFS
driver for FUSE.

    apt-get install ntfs-3g

After it is installed, the filesystem gets mounted as a FUSE filesystem.

    $ mount | tail -n 1
    /dev/sdd1 on /media/susam/Purple32GB type fuseblk (rw,nosuid,nodev,relatime,user_id=0,group_id=0,default_permissions,allow_other,blksize=4096,uhelper=udisks2)


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
