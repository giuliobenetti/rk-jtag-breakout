rk-jtag-breakout

This package allows you to build and flash to eMMC a jtag breakout program
to rk3288 with or without rootfs.

To build:
# make

To flash an entire image:
# make flash_emmc ROOTFS_IMG=example.img
To flash jtag breakout only:
# make flash_emmc_jtag_only
