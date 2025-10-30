#!/bin/bash
set -euo pipefail
apt update && apt full-upgrade -y
apt install -y ufw fail2ban openssh-server auditd apparmor
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable
systemctl enable --now fail2ban auditd
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
systemctl restart ssh
echo "=== DONE ==="
