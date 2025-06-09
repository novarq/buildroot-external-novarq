Buildroot for Novarq Tactical 1000
==================================

This repo provides buildroot external tree for Novarq Tactical 1000 switches.

It currently requires our own fork of Buildroot due to yet missing Buildroot
features, these are planned for upstreaming.

Basic usage:
------------

First, obtain an modified Buildroot tree:

	git clone https://github.com/novarq/buildroot.git -b novarq-tactical-1000

Configure using **BR2_EXTERNAL**:

Assuming that both buildroot and this repo are
cloned in the same base directory, the following will suffice:

	make BR2_EXTERNAL=../buildroot-external-novarq/ novarq_tactical_1000_defconfig

The default configuration can now be customized with:

	make menuconfig

Start a build with:

	make

Generated artifacts:
--------------------

All artifacts can be found in:

	output/images/

Some interesting ones are:
* `fip.bin` - TF-A FIP binary
* `fwu.html` - TF-A FWU webpage (To be used with TF-A monitor mode)
* `nor-atf.gpt(.gz)` - Images for flashing on 2MB NOR (With GPT table)
* `nor-atf.img(.gz)` - Images for flashing on 2MB NOR (Without GPT table)
* `Image.gz` - gziped Linux kernel Image
* `uImage-lan969x.itb` - U-Boot compatible uImage with kernel and DTB
* `rootfs.ext4` - Generated rootfs in EXT4 FS (Expanded to 2GB)
* `kernel-modules.tar.gz` - gziped tarball of built kernel modules (For Ubuntu/Debian/etc)
* `mmc-atf.gpt(.gz)` - Images for flashing on eMMC (With GPT table), only TF-a inside
* `mmc-full.gpt(.gz)` - Images for flashing on eMMC (With GPT table), contains TF-a + kernel + rootfs
* `u-boot.bin` - U-Boot binary
