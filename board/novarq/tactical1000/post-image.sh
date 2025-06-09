#!/bin/sh

# This script creates u-boot FIT image containing the kernel and the DT.

MKIMAGE=$HOST_DIR/bin/mkimage
GENIMAGE=$HOST_DIR/bin/genimage
BOARD_DIR="$(dirname $0)"

# Copy ITS to binaries dir
cp $BOARD_DIR/kernel_fdt.its $BINARIES_DIR

# Generate the FIT image
$MKIMAGE -f $BINARIES_DIR/kernel_fdt.its $BINARIES_DIR/uImage-lan969x.itb

GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

$GENIMAGE \
  --rootpath "${TARGET_DIR}" \
  --tmppath "${GENIMAGE_TMP}" \
  --inputpath "${BINARIES_DIR}" \
  --outputpath "${BINARIES_DIR}" \
  --config "${GENIMAGE_CFG}"

gzip -9 -k -f $BINARIES_DIR/nor-atf.gpt
gzip -9 -k -f $BINARIES_DIR/nor-atf.img
gzip -9 -k -f $BINARIES_DIR/mmc-full.gpt
gzip -9 -k -f $BINARIES_DIR/mmc-atf.gpt

tar -C ${TARGET_DIR}/lib -czf $BINARIES_DIR/kernel-modules.tar.gz modules
