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
