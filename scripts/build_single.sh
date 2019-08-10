#!/bin/bash

if [ -z "$(sudo ls /mnt/raspberrypi/boot)" ]
then
  sudo sshfs root@raspberrypi:/ /mnt/raspberrypi
fi

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- M="$(dirname $1)"

mod_path=$(grep -o '".*"' include/generated/utsrelease.h | sed 's/"//g')

sudo cp $1 /mnt/raspberrypi/lib/modules/$mod_path/kernel/$1
