#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root.!"
  exit 1
fi

echo "==> Disabling unnecessary services (smbd, nmbd, winbind) <=="
sudo systemctl disable --now smbd nmbd winbind

echo "==> Preparing samba-ad-dc service <=="
sudo systemctl unmask samba-ad-dc
sudo systemctl enable samba-ad-dc

# Backup the smb.conf file
echo "==> Backing up /etc/samba/smb.conf <=="
if [ -f /etc/samba/smb.conf ]; then
  sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.backup
  echo "*** Backup created: /etc/samba/smb.conf.backup ***"
else
  echo "smb.conf file not found, no backup needed.!"
fi

echo "*** Service configuration completed. ***"

