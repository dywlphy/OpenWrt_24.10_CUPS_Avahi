#!/bin/bash
# ==========================================
# diy-part1.sh - 配置 Feed 源（基础版）
# ==========================================

echo "===== 配置 feeds ====="

# 追加第三方源（保留官方默认的 packages 和 luci）
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages.git" >> feeds.conf.default
echo "src-git small https://github.com/kenzok8/small.git" >> feeds.conf.default
echo "src-git smpackage https://github.com/kenzok8/small-package" >> feeds.conf.default
echo "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default
echo "src-git immortalwrt https://github.com/immortalwrt/packages.git;openwrt-24.10" >> feeds.conf.default

echo "  已追加第三方源到 feeds.conf.default"
