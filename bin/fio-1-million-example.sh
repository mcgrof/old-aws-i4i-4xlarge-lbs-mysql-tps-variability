#!/bin/bash

# Buffered IO, use 2 GiB shared memory for 1000 threads to write each 1000 files of 4 KiB size.
fio -name=1k-4k-files-per-thread --nrfiles=1000 -direct=0 -bs=512 \
-ioengine=io_uring --group_reporting=1 --alloc-size=2097152 \
--filesize=4KiB --readwrite=randwrite --fallocate=none --numjobs=1000 \
--create_on_open=1 --directory=/xfs-64k/
