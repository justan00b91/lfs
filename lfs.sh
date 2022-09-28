#!/bin/bash

export LFS=/mnt/lfs
export LFS_TGT=x86_64-lfs-linux-gnu
export LFS_DISK=/dev/sdb

if ! grep -q "$LFS" /proc/mounts; then
	source setupdisk.sh "$LFS_DISK"
	sudo mount "/dev/sdb2" "$LFS"
fi

mkdir $LFS/sources
mkdir $LFS/tools

mkdir $LFS/boot
mkdir $LFS/etc
mkdir $LFS/bin
mkdir $LFS/lib
mkdir $LFS/sbin
mkdir $LFS/usr
mkdir $LFS/var
