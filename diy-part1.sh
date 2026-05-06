#!/bin/bash
# ==========================================
# feeds 配置：官方默认源 + kenzok8 + helloworld
# ==========================================

# 追加 kenzok8 的 openwrt-packages 源（luci-app-autoreboot、vlmcsd 等）
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages.git" >> feeds.conf.default

# 追加 kenzok8 的 small 源（依赖包）
echo "src-git small https://github.com/kenzok8/small.git" >> feeds.conf.default

# 追加 helloworld 源（SSR-Plus）
echo "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default

echo "✅ 已添加 kenzo、small、helloworld 源"
