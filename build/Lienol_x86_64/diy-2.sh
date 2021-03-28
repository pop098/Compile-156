#!/bin/bash
ZZZ="package/default-settings/files/zzz-default-settings"
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

sed -i "/uci commit fstab/a\uci commit network" $ZZZ
sed -i "/uci commit network/i\uci set network.lan.ipaddr='192.168.31.156'" $ZZZ              # IPv4 地址(openwrt后台地址)
sed -i "/uci commit network/i\uci set network.lan.netmask='255.255.255.0'" $ZZZ           # IPv4 子网掩码
sed -i "/uci commit network/i\uci set network.lan.gateway='192.168.31.1'" $ZZZ             # IPv4 网关
sed -i "/uci commit network/i\uci set network.lan.broadcast='192.168.2.255'" $ZZZ         # IPv4 广播
sed -i "/uci commit network/i\uci set network.lan.dns='223.5.5.5 114.114.114.114'" $ZZZ   # DNS(多个DNS要用空格分开)
sed -i "/uci commit network/i\uci set network.lan.delegate='0'" $ZZZ                      # 去掉LAN口使用内置的 IPv6 管理

sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile   # 强制选择argon为默认主题选项
sed -i "/uci commit luci/i\uci set luci.main.mediaurlbase=/luci-static/argon" $ZZZ        # 选择argon为默认主题

sed -i "/uci commit system/i\uci set system.@system[0].hostname='Sunny-156'" $ZZZ       # 修改主机名称为OpenWrt-123

sed -i "s/OpenWrt /Sunny $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ        # 增加自己个性名称281677160

#sed -i 's/PATCHVER:=4.14/PATCHVER:=4.19/g' target/linux/x86/Makefile                     # 修改内核版本为4.19

