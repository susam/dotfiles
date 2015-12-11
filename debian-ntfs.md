Write to NTFS filesystem
------------------------
An NTFS filesystem gets mounted automatically on Debian 8.0 with XFCE 4.10. However, attempting to write to the filesystem fails.

    # mkdir test
    mkdir: cannot create directory ‘test’: Operation not permitted
    root@nifty:/media/susam/Susam-Purple-32GB# echo hi > test
    -su: test: Permission denied

    # mount | tail -1
    /dev/sdb1 on /media/susam/Susam-Purple-32GB type ntfs (rw,nosuid,nodev,relatime,uid=1000,gid=1000,fmask=0177,dmask=077,nls=utf8,errors=continue,mft_zone_multiplier=1,uhelper=udisks2)

The solution involves installing the 3rd generation read/write NTFS driver for FUSE.

    apt-get install ntfs-3g

Once it is installed, the filesystem gets mounted as a FUSE filesystem.

    $ mount | tail -1
    /dev/sdd1 on /media/susam/Susam-Purple-32GB type fuseblk (rw,nosuid,nodev,relatime,user_id=0,group_id=0,default_permissions,allow_other,blksize=4096,uhelper=udisks2)
