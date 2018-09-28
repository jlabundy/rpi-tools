#!/bin/bash

if [ -z "$(sudo ls /mnt/raspberrypi/boot)" ]
then
  sudo sshfs root@raspberrypi:/ /mnt/raspberrypi
fi

KERNEL=kernel7

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2709_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage -j12

sudo cp arch/arm/boot/zImage /mnt/raspberrypi/boot/$KERNEL.img
