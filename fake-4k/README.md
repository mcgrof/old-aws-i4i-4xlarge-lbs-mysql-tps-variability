this used btrfs as the main filesystem with a 4k filesystem, and then used
LBS with XFS on top of it with 64k block size to see the impact of using
fio with a force alignment of below 64k, in fact bs=512 bytes is used.
