#!/bin/bash
set -ex

# =============================================================================
# TrendAI PM Environment Setup Script
# Installs: Ubuntu Desktop, Amazon DCV, Kiro IDE, Node.js, Git, Starter Kit
# =============================================================================

PM_NAME="${pm_name}"
PM_PASSWORD="${pm_password}"
STARTER_KIT_REPO="${starter_kit_repo}"
HOME_DIR="/home/$PM_NAME"

export DEBIAN_FRONTEND=noninteractive

# =============================================================================
# 1. System Update
# =============================================================================
apt-get update -y
apt-get upgrade -y

# =============================================================================
# 2. Create PM User
# =============================================================================
useradd -m -s /bin/bash "$PM_NAME"
echo "$PM_NAME:$PM_PASSWORD" | chpasswd
usermod -aG sudo "$PM_NAME"

# =============================================================================
# 3. Install Desktop Environment (GNOME minimal)
# =============================================================================
apt-get install -y ubuntu-desktop-minimal gdm3 dbus-x11

# Disable Wayland (DCV requires X11)
sed -i 's/#WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/custom.conf

# =============================================================================
# 4. Install XDummy driver (for non-GPU instances)
# =============================================================================
apt-get install -y xserver-xorg-video-dummy mesa-utils

# =============================================================================
# 5. Install Amazon DCV Server
# =============================================================================
# Import GPG key
wget -q https://d1uj6qtbmh3dt5.cloudfront.net/NICE-GPG-KEY -O /tmp/NICE-GPG-KEY
gpg --import /tmp/NICE-GPG-KEY

# Download DCV packages for Ubuntu
wget -q https://d1uj6qtbmh3dt5.cloudfront.net/nice-dcv-ubuntu2404-x86_64.tgz -O /tmp/nice-dcv.tgz
cd /tmp
tar -xzf nice-dcv.tgz
cd nice-dcv-*-ubuntu2404-x86_64

# Install DCV server and web viewer
apt-get install -y ./nice-dcv-server_*.deb
apt-get install -y ./nice-dcv-web-viewer_*.deb
apt-get install -y ./nice-xdcv_*.deb

# =============================================================================
# 6. Configure DCV
# =============================================================================
# Enable DCV to start on boot
systemctl enable dcvserver

# Configure DCV for virtual sessions with web client
cat > /etc/dcv/dcv.conf << 'DCVCONF'
[license]
[log]
[session-management]
virtual-session-xdcv-args="-listen tcp"
[session-management/defaults]
[session-management/automatic-console-session]
owner="OWNER_PLACEHOLDER"
[display]
[display/linux]
[connectivity]
web-port=8443
web-url-path="/"
enable-quic-frontend=true
[security]
auth-token-verifier=""
no-tls-strict=true
os-auto-lock=false
[clipboard]
primary-selection-paste=true
DCVCONF

# Replace placeholder with actual PM name
sed -i "s/OWNER_PLACEHOLDER/$PM_NAME/" /etc/dcv/dcv.conf

# Create a systemd service for auto-creating DCV session
cat > /etc/systemd/system/dcv-virtual-session.service << EOF
[Unit]
Description=Create DCV Virtual Session
After=dcvserver.service
Requires=dcvserver.service

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStartPre=/bin/sleep 5
ExecStart=/usr/bin/dcv create-session --type=virtual --owner $PM_NAME --name main main
ExecStop=/usr/bin/dcv close-session main

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable dcv-virtual-session

# =============================================================================
# 7. Install Node.js 20 LTS
# =============================================================================
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

# =============================================================================
# 8. Install Git (should already be present, ensure latest)
# =============================================================================
apt-get install -y git

# =============================================================================
# 9. Install Kiro IDE
# =============================================================================
KIRO_DEB_URL="https://prod.download.desktop.kiro.dev/releases/stable/linux-x64/signed/0.12.224/deb/kiro-ide-0.12.224-stable-linux-x64.deb"
wget -q "$KIRO_DEB_URL" -O /tmp/kiro-ide.deb
apt-get install -y /tmp/kiro-ide.deb

# Create desktop shortcut for the PM user (copy official .desktop file)
mkdir -p "$HOME_DIR/Desktop"
cp /usr/share/applications/kiro.desktop "$HOME_DIR/Desktop/kiro.desktop"
chmod +x "$HOME_DIR/Desktop/kiro.desktop"

# Also place in local applications
sudo -u "$PM_NAME" bash -c "mkdir -p $HOME_DIR/.local/share/applications && cp /usr/share/applications/kiro.desktop $HOME_DIR/.local/share/applications/"

# =============================================================================
# 10. Install Kiro CLI
# =============================================================================
sudo -u "$PM_NAME" bash -c 'curl -fsSL https://cli.kiro.dev/install | bash'

# =============================================================================
# 11. Clone Starter Kit
# =============================================================================
sudo -u "$PM_NAME" git clone "$STARTER_KIT_REPO" "$HOME_DIR/kiro-pm-starter"

# Install starter kit dependencies if package.json exists
if [ -f "$HOME_DIR/kiro-pm-starter/package.json" ]; then
  cd "$HOME_DIR/kiro-pm-starter"
  sudo -u "$PM_NAME" npm install
fi

# =============================================================================
# 12. Set ownership and permissions
# =============================================================================
chown -R "$PM_NAME:$PM_NAME" "$HOME_DIR"

# =============================================================================
# 13. Configure auto-login for GNOME (optional, for smoother DCV experience)
# =============================================================================
mkdir -p /etc/gdm3/custom.conf.d
cat > /etc/gdm3/custom.conf.d/autologin.conf << EOF
[daemon]
AutomaticLoginEnable=false
EOF

# =============================================================================
# 14. Final cleanup and reboot
# =============================================================================
apt-get autoremove -y
apt-get clean

# Reboot to apply desktop environment and start DCV
reboot
