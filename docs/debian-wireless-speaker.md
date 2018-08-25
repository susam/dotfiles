Connect Debian to Wireless Speaker
==================================
I use the following steps to connect my Debian 8 system to LG Wireless
Speaker NP1540W via Bluetooth.

 1. Install packages necessary to establish Bluetooth connectivity to
    wireless speaker. This command needs to be run as the root user.

        apt-get install bluez pulseaudio pulseaudio-module-bluetooth pavucontrol

    The remaining steps below should be performed as non-root user.

 2. Ensure that Bluetooth daemon is running.

        /etc/init.d/bluetooth status
        ps -ef | grep bluetoothd

 3. Ensure that PulseAudio sound system is running.

        ps -ef | grep pulseaudio

    I have found that pulseaudio does not start automatically after it
    is installed. Running one of the commands in the next step starts
    pulseaudio automatically. Also, it starts automatically after the
    system is rebooted.

 4. Ensure that PulseAudio sound server has loaded the Bluetooth
    modules.

        pactl list short modules | grep bluetooth

 5. Ensure that PulseAudio volume controller is able to connect to
    PulseAudio sound server.

        pavucontrol

 6. Use Bluetooth control tool to connect to wireless speaker.

        bluetoothctl

 7. In the bluetoothctl prompt, enter the following commands one by one
    in order to connect to wireless speaker.

        power on
        scan on
        pair <dev>
        connect <dev>

    In the commands above, `<dev>` must be replaced with the actual
    device address (6 pairs of hexadecimal digits separated by colons)
    that appears in the output of `scan on`.

 8. Finally, launch PulseAudio volume controller (`pavucontrol`) again,
    go to 'Playback' tab, find the required application with audio
    stream and set the wireless speaker as its output device using the
    drop-down menu next to it. For LG Wireless Speaker NP1540W, the
    output device name was displayed as "LG BT Box( 2A:7C )"


Reference Outputs
-----------------
Here are some typical outputs that show what to expect when everything
is running fine.

<!-- -->

    $ /etc/init.d/bluetooth status
    ● bluetooth.service - Bluetooth service
       Loaded: loaded (/lib/systemd/system/bluetooth.service; enabled)
       Active: active (running) since Fri 2015-12-11 13:41:55 IST; 18s ago
         Docs: man:bluetoothd(8)
     Main PID: 2145 (bluetoothd)
       Status: "Running"
       CGroup: /system.slice/bluetooth.service
               └─2145 /usr/lib/bluetooth/bluetoothd

<!-- -->

    $ ps -ef | grep bluetoothd
    root      2145     1  0 13:41 ?        00:00:00 /usr/lib/bluetooth/bluetoothd
    susam     2315  1133  0 13:42 pts/1    00:00:00 grep bluetoothd

    $ ps -ef | grep pulseaudio
    susam     2338     1  0 13:43 ?        00:00:00 /usr/bin/pulseaudio --start --log-target=syslog
    susam     2351  1133  0 13:43 pts/1    00:00:00 grep pulseaudio

    $ pactl list short modules | grep bluetooth
    7       module-bluetooth-policy
    8       module-bluetooth-discover

<!-- -->

    $ pavucontrol

![pavucontrol](https://susam.github.io/blob/img/dotfiles/pavucontrol.png)

<!-- -->

    $ bluetoothctl
    [NEW] Controller 00:1F:E1:F8:86:D4 nifty [default]
    [bluetooth]# power on
    [CHG] Controller 00:1F:E1:F8:86:D4 Class: 0x0c010c
    Changing power on succeeded
    [CHG] Controller 00:1F:E1:F8:86:D4 Powered: yes
    [bluetooth]# scan on
    Discovery started
    [CHG] Controller 00:1F:E1:F8:86:D4 Discovering: yes
    [NEW] Device F0:13:C3:36:2A:7C LG BT Box( 2A:7C )
    [CHG] Device F0:13:C3:36:2A:7C RSSI: -53
    [bluetooth]# pair F0:13:C3:36:2A:7C
    Attempting to pair with F0:13:C3:36:2A:7C
    [CHG] Device F0:13:C3:36:2A:7C Connected: yes
    [CHG] Device F0:13:C3:36:2A:7C UUIDs:
            0000110b-0000-1000-8000-00805f9b34fb
            0000110c-0000-1000-8000-00805f9b34fb
            0000110e-0000-1000-8000-00805f9b34fb
    [CHG] Device F0:13:C3:36:2A:7C Paired: yes
    Pairing successful
    [bluetooth]# connect F0:13:C3:36:2A:7C
    Attempting to connect to F0:13:C3:36:2A:7C
    Connection successful
    [bluetooth]#

<!-- -->

    $ pavucontrol

![pavucontrol-playback](https://susam.github.io/blob/img/dotfiles/pavucontrol-playback.png)
