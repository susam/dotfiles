Karabiner Configuration Setup
=============================

Setup
-----

The Karabiner configuration that comes in this directory can be set up
easily using the `Makefile` provided in this directory.  Run the
following command to see how this `Makefile` may be used:

```sh
make
```


Find Keyboard Vendor ID and Product ID for Karabiner
----------------------------------------------------

Perform the following steps:

 1. Click the Apple icon in the menu, press and hold
    <kbd>option</kbd>, and click *System Information*.

 2. Click *SPI*.  Read the fields "Vendor ID" and "Product ID" to get
    these IDs for the internal keyboard.

 4. For external keyboards, click *USB*.  Then find an entry that is
    labelled as keyboard.  Then read the fields "Vendor ID" and
    "Product ID" as earlier.

Some common values observed are noted in the table below:

| Hardware                        | Vendor ID     | Product ID     |
|---------------------------------|---------------|----------------|
| Apple M1 Pro, 16-inch, 2021     | 0x05ac (1452) | 0x0343 (835)   |
| Apple M1 Pro, 14-inch, 2021     | 0x05ac (1452) | 0x0342 (834)   |
| Apple M2 Pro, 16-inch, 2023     | 0             | 0x0353 (851)   |
| Apple M3 Pro, 16-inch, Nov 2023 | 0             | 0x0353 (851)   |
| Bloomberg Keyboard              | 0x1188 (4488) | 0x9545 (38213) |

See also <https://usb.org/sites/default/files/vendor_ids051920_0.pdf>.
