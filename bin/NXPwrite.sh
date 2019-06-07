#!/bin/bash

if [ "$1" = "n" ]; then
	sudo mkdir -p /opt/nfs/tuttyNXP
	sudo su -c "echo '/opt/nfs 172.18.1.0/24(rw,sync,no_subtree_check,no_root_squash)' >> /etc/exports"
	sudo exportfs -ra
elif [ "$1" = "s" ]; then
	sudo systemctl enable nfs-kernel-server.service
	sudo systemctl start nfs-kernel-server.service
else
	sudo rsync -auv .build-ssb-1179/sd_rootfs_minimal/* /opt/nfs/tuttyNXP
	sudo chmod 777 -R /opt/nfs/tuttyNXP
	sudo cp .build-ssb-1179/deploy/images-opt/signed_Image_pad.bin /tftpboot
	sudo cp .build-ssb-1179/deploy/images-opt/onk-imx8mm.dtb /tftpboot
fi
