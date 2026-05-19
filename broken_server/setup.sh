#!/bin/bash

# ─────────────────────────────────────────────
#  CM-204 — Broken Server Demo
#  Run this ONCE in a fresh terminal before
#  the presentation starts.
# ─────────────────────────────────────────────

DEMO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "  ██████╗ ██████╗  ██████╗ ██╗  ██╗███████╗███╗   ██╗"
echo "  ██╔══██╗██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝████╗  ██║"
echo "  ██████╔╝██████╔╝██║   ██║█████╔╝ █████╗  ██╔██╗ ██║"
echo "  ██╔══██╗██╔══██╗██║   ██║██╔═██╗ ██╔══╝  ██║╚██╗██║"
echo "  ██████╔╝██║  ██║╚██████╔╝██║  ██╗███████╗██║ ╚████║"
echo "  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝"
echo "         S E R V E R   D I A G N O S T I C S"
echo ""
echo "  Setting up broken environment..."
echo ""

# ── Clean up any previous run ──────────────────
rm -f ~/report.sh
rm -f ~/cpu_hog.sh
rm -rf ~/mytools
pkill -f cpu_hog.sh 2>/dev/null

# ── Room 1: Break file permissions ─────────────
echo "  [1/4] Corrupting file permissions..."
echo '#!/bin/bash' > ~/report.sh
echo "echo 'SYSTEM REPORT: All services nominal.'" >> ~/report.sh
chmod 000 ~/report.sh

# ── Room 2: Break PATH ─────────────────────────
echo "  [2/4] Misconfiguring PATH..."
mkdir -p ~/mytools
echo '#!/bin/bash' > ~/mytools/fix_report.sh
echo "echo 'Report pipeline restored successfully.'" >> ~/mytools/fix_report.sh
chmod +x ~/mytools/fix_report.sh

# ── Room 3: Launch runaway process ─────────────
echo "  [3/4] Launching rogue process..."
echo '#!/bin/bash' > ~/cpu_hog.sh
echo 'while true; do :; done' >> ~/cpu_hog.sh
chmod +x ~/cpu_hog.sh
~/cpu_hog.sh &

# ── Room 4: Plant suspicious log files ─────────
echo "  [4/4] Planting log files..."
mkdir -p /tmp/serverlogs
echo "2026-05-20 08:01:03 INFO  Backup completed successfully." > /tmp/serverlogs/backup.log
echo "2026-05-20 08:03:11 INFO  Scheduled maintenance finished." > /tmp/serverlogs/maintenance.log
echo "2026-05-20 08:05:44 INFO  Disk usage within normal limits." > /tmp/serverlogs/disk.log
echo "2026-05-20 08:07:22 INFO  Network throughput nominal." > /tmp/serverlogs/network.log
echo "2026-05-20 08:09:01 INFO  User authentication service running." > /tmp/serverlogs/auth.log
# The suspicious one
for i in $(seq 1 47); do
  echo "2026-05-20 08:10:$i INFO  Routine health check passed." >> /tmp/serverlogs/intern_patch.log
done
echo "2026-05-20 08:11:00 ERROR password=Intern1234 stored in plaintext" >> /tmp/serverlogs/intern_patch.log
echo "2026-05-20 08:11:01 ERROR unauthorized process spawned by uid 1001" >> /tmp/serverlogs/intern_patch.log

echo ""
echo "  ┌─────────────────────────────────────────┐"
echo "  │  The broken enviroment is now ready.    │"
echo "  │                                         │"
echo "  │  Start here:                            │"
echo "  │    cd room1_permissions && cat scroll   │"
echo "  └─────────────────────────────────────────┘"
echo ""
