#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >> feeds.conf.default

# ============================================
# 官方OpenWrt 24.10稳定版 - 不需要额外添加第三方feed
# 所有需要的功能都在官方源中
# ============================================

echo "=========================================="
echo "OpenWrt 24.10 Official Stable Build"
echo "diy-part1.sh - 更新feeds前的配置"
echo "=========================================="

# 显示当前OpenWrt版本信息
echo "Current OpenWrt Version:"
cat ./openwrt_release 2>/dev/null || echo "openwrt-24.10"

# 确保使用官方稳定源的feed
echo ""
echo "Current feeds.conf.default:"
cat feeds.conf.default

echo ""
echo "=========================================="
echo "diy-part1.sh 执行完成"
echo "=========================================="
