#!/bin/sh

TOPDIR=$PWD
TARGET_DIR=$1

install -T -m 0755 $TOPDIR/custom_scripts/profile $TARGET_DIR/etc/profile
install -T -m 0755 $TOPDIR/custom_scripts/S41wifi $TARGET_DIR/etc/init.d/S41wifi
