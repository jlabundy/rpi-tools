#!/bin/bash

if [ -z "$(sudo ls /mnt/raspberrypi/boot)" ]
then
  sudo sshfs root@raspberrypi:/ /mnt/raspberrypi
fi

KERNEL=kernel7

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- modules -j12

sudo env "PATH=$PATH" make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=/mnt/raspberrypi modules_install
