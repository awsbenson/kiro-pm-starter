#!/bin/bash
# Minimal setup for AMI-based launch — only creates the student user
# Everything else (Kiro, Node, DCV, etc.) is pre-baked in the AMI
set -ex

PM_NAME="${pm_name}"
PM_PASSWORD="${pm_password}"

# If user doesn't exist, create from pm-1 template
if ! id "$PM_NAME" &>/dev/null; then
  useradd -m -s /bin/bash -G sudo "$PM_NAME"
  cp -r /home/pm-1/Desktop /home/$PM_NAME/Desktop
  cp -r /home/pm-1/kiro-pm-starter /home/$PM_NAME/kiro-pm-starter
  cp -r /home/pm-1/.config /home/$PM_NAME/.config 2>/dev/null || true
  chown -R $PM_NAME:$PM_NAME /home/$PM_NAME
fi

# Set password (works for both new and existing users)
echo "$PM_NAME:$PM_PASSWORD" | chpasswd

# Update DCV session owner
sed -i "s/owner=.*/owner=\"$PM_NAME\"/" /etc/dcv/dcv.conf
systemctl restart dcvserver

echo "Setup complete for $PM_NAME"

# Remove DCV idle timeout (keep session active all day for class)
sed -i '/idle-timeout/d' /etc/dcv/dcv.conf
