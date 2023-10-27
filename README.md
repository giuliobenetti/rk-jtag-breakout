## rk-jtag-breakout ##

This package allows you to build and flash to eMMC a jtag breakout program
to Rockchip SoCs with or without rootfs. It is based on:
https://czak.pl/2020/05/10/bare-tinker-jtag.html

Basically all Rockchip SoCs have JTAG or SWD lines multiplexed with
sd-card0 and the default alternate function is not JTAG but sd-card, so
we need to change that alternate function pins to JTAG or SWD to access
On-Chip debugging.

Refer to the folder named after SoC to build and flash correctly.
