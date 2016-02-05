Map Caps Lock key to Escape key
-------------------------------
The following steps map Caps Lock key to Escape key.

  1. Go to Applications Menu > Settings > Session and Startup > Application Autostart.
  2. Click 'Add' button.
  3. Enter the following fields.
     - Name: Uncap
     - Description: Map Caps Lock key to Escape key
     - Command: `setxkbmap -option caps:escape`
  4. Press 'OK' button.

Reference: https://github.com/susam/uncap#linux-setxkbmap


APT data sources
----------------
Configure APT data sources for Debian 8.0 in /etc/apt/sources.list.

    deb http://httpredir.debian.org/debian jessie main conrib non-free
    deb http://httpredir.debian.org/debian jessie-updates main contrib non-free
    deb http://security.debian.org/ jessie/updates main contrib non-free

References:

  - https://wiki.debian.org/DebianGeoMirror
  - http://httpredir.debian.org/


Enable touchpad tap in XFCE 4
-----------------------------
The following steps enable touchpad tap in XFCE 4.10 on Debian 8.0.

  1. Go to Settings > Mouse and Touchpad > Devices > Touchpad.
  2. Check 'Tap touchpad to click'.
  3. Select 'Edge scrolling'.
  4. Check 'Enable horizontal scrolling'.


Enable hinting
--------------
The following steps enable font hinting in XFCE 4.10 on Debian 8.0.

  1. Go to Settings > Appearance > Fonts.
  2. Set 'Hinting' to 'Slight'.
  3. Set 'Sub-pixel order' to 'RGB'.

I found that Hinting = Medium and Hinting = Full behaved identically.


Setup editor
------------
Ensure that Vim is set as the editor.

  1. Execute the following command.

        update-alternatives --config editor

  2. Select `/usr/bin/vim.gtk` as the editor.


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
