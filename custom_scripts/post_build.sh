#!/bin/sh

TOPDIR=$PWD
TARGET_DIR=$1

firmware1="$TOPDIR/custom_scripts/rtl8192cufw_TMSC.bin"
firmware2="$TOPDIR/custom_scripts/rtl8192cufw.bin"

install -T -m 0755 $TOPDIR/custom_scripts/profile $TARGET_DIR/etc/profile
install -T -m 0755 $TOPDIR/custom_scripts/S39wifi $TARGET_DIR/etc/init.d/S39wifi
install -T -m 0755 $TOPDIR/custom_scripts/S59zigpy $TARGET_DIR/etc/init.d/S59zigpy
install -T -m 0755 $TOPDIR/custom_scripts/interfaces $TARGET_DIR/etc/network/interfaces

echo "Download and install rtl8192 alternative firmware..."
mkdir -p $TARGET_DIR/lib/firmware/rtlwifi/
if [ -e $firmware1 ]
then
	install -T -m 0755 $TOPDIR/custom_scripts/rtl8192cufw_TMSC.bin $TARGET_DIR/lib/firmware/rtlwifi/rtl8192cufw_TMSC.bin
else
	wget -P $TOPDIR/custom_scripts/ https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/rtlwifi/rtl8192cufw_TMSC.bin
	install -T -m 0755 $TOPDIR/custom_scripts/rtl8192cufw_TMSC.bin $TARGET_DIR/lib/firmware/rtlwifi/rtl8192cufw_TMSC.bin
fi

if [ -e $firmware2 ]
then
	install -T -m 0755 $TOPDIR/custom_scripts/rtl8192cufw.bin $TARGET_DIR/lib/firmware/rtlwifi/rtl8192cufw.bin
else
	wget -P $TOPDIR/custom_scripts/ https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/rtlwifi/rtl8192cufw.bin
	install -T -m 0755 $TOPDIR/custom_scripts/rtl8192cufw.bin $TARGET_DIR/lib/firmware/rtlwifi/rtl8192cufw.bin
fi
echo "Install firmware rtl8192cufw.bin and rtl8192cufw_TMSC.bin, done."


