CROSS_COMPILE = arm-none-eabi-

ROOTFS_IMG?=/home/giuliobenetti/sdcard.img

boot.img: boot.bin
	mkimage -n rk3288 -T rksd -d $< $@

boot.bin: boot.elf
	$(CROSS_COMPILE)objcopy -O binary $< $@

boot.elf: main.S
	$(CROSS_COMPILE)gcc -g -Wl,--build-id=none -Ttext=0xff704000 -nostdlib $^ -o $@

.PHONY: clean

flash_emmc: boot.img
	sudo rkdeveloptool db rk3288_ubootloader_v1.01.06.bin
	sleep 1
	sudo rkdeveloptool wl 0 $(ROOTFS_IMG)
	sudo rkdeveloptool rd

flash_emmc_jtag_only: boot.img
	sudo rkdeveloptool db rk3288_ubootloader_v1.01.06.bin
	sleep 1
	sudo rkdeveloptool wl 64 boot.img
	sudo rkdeveloptool rd

clean:
	rm -f *.img *.bin *.elf
