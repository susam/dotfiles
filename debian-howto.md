Enable touchpad tap in XFCE 4
-----------------------------
The following steps enable touchpad tap in XFCE 4.10 on Debian 8.0.

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


