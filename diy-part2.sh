#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# BCM57810s kernel patch
wget -O target/linux/x86/patches-5.10/600-bnx2x-warpcore-8727-2g5.patch https://raw.githubusercontent.com/JAMESMTL/snippets/master/bnx2x/patches/bnx2x_warpcore_8727_2_5g_sgmii_txfault.patch
# wget -O target/linux/x86/patches-5.10.91/600-bnx2x-warpcore-8727-2g5.patch https://raw.githubusercontent.com/JAMESMTL/snippets/master/bnx2x/patches/bnx2x_warpcore_8727_2_5g_sgmii_txfault.patch

# Modify default IP
sed -i 's/192.168.1.1/172.16.0.1/g' package/base-files/files/bin/config_generate

# Modify CIDR
sed -i 's/255.255.255.0/255.255.240.0/g' package/base-files/files/bin/config_generate

# Disable ULA Prefix
sed -i 's/set network.globals.ula_prefix='auto'/delete network.globals.ula_prefix/g' package/base-files/files/bin/config_generate


# emmmmmm
sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' target/linux/x86/Makefile
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt Compiled by Kirin'/g" ./package/lean/default-settings/files/zzz-default-settings
