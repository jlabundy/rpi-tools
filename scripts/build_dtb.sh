#!/bin/bash

if [ -z "$(sudo ls /mnt/raspberrypi/boot)" ]
then
  sudo sshfs root@raspberrypi:/ /mnt/raspberrypi
fi

KERNEL=kernel7

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- dtbs

sudo cp arch/arm/boot/dts/*.dtb /mnt/raspberrypi/boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /mnt/raspberrypi/boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /mnt/raspberrypi/boot/overlays/
