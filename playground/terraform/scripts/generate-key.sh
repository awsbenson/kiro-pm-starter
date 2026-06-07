#!/bin/bash
# Generate SSH key pair for EC2 access (troubleshooting only)

KEY_DIR="$(dirname "$0")/../keys"
mkdir -p "$KEY_DIR"

if [ ! -f "$KEY_DIR/id_rsa" ]; then
  ssh-keygen -t rsa -b 4096 -f "$KEY_DIR/id_rsa" -N "" -C "trendai-pm-environments"
  echo "SSH key pair generated at $KEY_DIR/"
else
  echo "SSH key pair already exists at $KEY_DIR/"
fi
