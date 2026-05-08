#!/bin/bash
# ==========================================
# feeds 配置：官方默认源 + kenzok8 全家桶 + helloworld + immortalwrt
# ==========================================

echo "===== 配置 feeds 源 ====="

# 备份原有配置
cp feeds.conf.default feeds.conf.default.bak

# 追加 immortalwrt 源（提供中文语言包）
echo "src-git immortalwrt https://github.com/immortalwrt/packages.git;openwrt-24.10" >> feeds.conf.default

# 追加 kenzok8 的源
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages.git" >> feeds.conf.default
echo "src-git small https://github.com/kenzok8/small.git" >> feeds.conf.default
echo "src-git smpackage https://github.com/kenzok8/small-package" >> feeds.conf.default

# 追加 helloworld 源
echo "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default

# 追加 openwrt-cups 源
echo "src-git cups https://github.com/op4packages/openwrt-cups.git" >> feeds.conf.default

echo "✅ feeds 源配置完成"
echo "已添加：immortalwrt(中文), kenzo, small, smpackage, helloworld, cups"
