#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# ============================================
# OpenWrt 24.10 Official Stable Build
# diy-part2.sh - 更新feeds后的配置和自定义
# ============================================

echo "=========================================="
echo "OpenWrt 24.10 Official Stable Build"
echo "diy-part2.sh - 更新feeds后的配置"
echo "=========================================="

# ============================================
# 1. 设置默认主机名
# ============================================
echo "[1/4] 设置默认主机名..."
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate 2>/dev/null || true
sed -i 's/OpenWrt/OpenWrt-24.10/g' package/base-files/files/bin/config_generate 2>/dev/null || true

# ============================================
# 2. 设置默认时区为上海
# ============================================
echo "[2/4] 设置默认时区..."
sed -i "s/'UTC'/'CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/'CST-8'/a \\t\tset system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate

# ============================================
# 3. 设置默认主题
# ============================================
echo "[3/4] 设置默认主题为Material..."
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile 2>/dev/null || true
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' package/feeds/luci/luci/Makefile 2>/dev/null || true

# ============================================
# 4. 添加自定义banner
# ============================================
echo "[4/4] 添加自定义banner..."
cat > package/base-files/files/etc/banner << 'EOF'
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 OpenWrt 24.10 Official Stable Build
 -----------------------------------------------------
EOF

# ============================================
# 5. 修复ksmbd配置
# ============================================
echo "[额外] 检查ksmbd配置..."
if [ -f package/network/services/ksmbd/files/ksmbd.config.example ]; then
    cp package/network/services/ksmbd/files/ksmbd.config.example package/network/services/ksmbd/files/ksmbd.config 2>/dev/null || true
fi

# ============================================
# 6. 版本信息显示
# ============================================
echo ""
echo "=========================================="
echo "构建信息:"
echo "  - OpenWrt版本: 24.10 Official Stable"
echo "  - 目标平台: x86_64 (通用)"
echo "  - 默认主题: Material"
echo "  - 默认时区: Asia/Shanghai (CST-8)"
echo "  - 中文支持: 已启用"
echo "  - GRUB等待: 0秒"
echo "  - Rootfs大小: 256MB"
echo "=========================================="
echo ""
echo "包含的功能包:"
echo "  [✓] cron                    - 定时任务"
echo "  [✓] luci-app-adblock        - 广告屏蔽"
echo "  [✓] luci-app-wol            - 网络唤醒"
echo "  [✓] luci-app-nlbwmon        - 流量统计"
echo "  [✓] luci-app-commands       - Web命令执行"
echo "  [✓] luci-app-watchcat       - 断网自动重启"
echo "  [✓] luci-app-ksmbd          - SMB文件共享"
echo "  [✓] luci-app-ddns           - 动态域名"
echo "  [✓] luci-app-upnp           - UPnP"
echo "  [✓] luci-app-statistics     - 性能监控"
echo "  [✓] cups                    - CUPS打印服务"
echo "  [✓] ghostscript             - Ghostscript"
echo "  [✓] gutenprint              - Gutenprint驱动"
echo "  [✓] brlaser                 - Brother打印机驱动"
echo "  [✓] splix                   - Samsung打印机驱动"
echo "  [✓] iperf3                  - 网络测速"
echo ""
echo "注意: 定时重启功能通过【系统 -> 计划任务】配置"
echo "      格式: 0 3 * * * /sbin/reboot  (每天凌晨3点重启)"
echo "=========================================="
echo ""
echo "diy-part2.sh 执行完成"
echo "=========================================="
