rk-jtag-breakout

This package allows you to build and flash to eMMC a jtag breakout program
to rk3288 with or without rootfs. It is based on:
https://czak.pl/2020/05/10/bare-tinker-jtag.html

The program set sd-card iomux to become a jtag port and then it loops forever
while toggling GPIO6C5 that corresponds to sd-card CMD signal that is free for
jtag. This way we can know if program is alive.

To build:
```
# make
```

To flash jtag breakout only:
```
# make flash_emmc_jtag_only
```
To flash an entire image(that must contain boot.img at sector 64):
```
# make flash_emmc ROOTFS_IMG=example.img
```
