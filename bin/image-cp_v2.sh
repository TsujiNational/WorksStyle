#!/bin/bash

echo "Please Input build model number."
read str

sudo cp -afp ./.build-ssb-"$str"/deploy/images-opt/u-boot.img /tftpboot/
sudo cp -afp ./.build-ssb-"$str"/deploy/images-opt/u-boot-env.img /tftpboot/
sudo cp -afp ./.build-ssb-"$str"/deploy/images-opt/u-boot-spl.bin /tftpboot/
sudo cp -afp ./.build-ssb-"$str"/deploy/images-opt/uImage /tftpboot/
sudo cp -afp ./.build-ssb-"$str"/deploy/images-opt/dts-cramfs.img /tftpboot/
sudo cp -afp ./.build-ssb-"$str"/deploy/images-opt/MLO /tftpboot/
sudo cp -afp ./.build-ssb-"$str"/deploy/images-opt/rootfs.ubi /tftpboot/

