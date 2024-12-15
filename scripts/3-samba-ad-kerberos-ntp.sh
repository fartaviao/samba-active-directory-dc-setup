#!/bin/bash

# Solicitar datos al usuario
read -p "Please enter the NTP server address for NTP chrony configuration (e.g., 192.168.0.1): " BIND_ADDRESS
read -p "Please enter the allowed NTP network (e.g., 192.168.0.0/24): " ALLOWED_NTP_NETWORK

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root.!"
  exit 1
fi

echo "==> Configuring Kerberos <=="
if [ -f /etc/krb5.conf ]; then
  sudo mv /etc/krb5.conf /etc/krb5.conf.orig
  echo "*** Backup created: /etc/krb5.conf.orig ***"
fi
sudo cp /var/lib/samba/private/krb5.conf /etc/krb5.conf
echo "*** Kerberos file replaced. ***"

echo "==> Starting Samba AD service (samba-ad-dc) <=="
sudo systemctl start samba-ad-dc

echo "==> Configuring time synchronization (NTP) <=="
sudo chown root:_chrony /var/lib/samba/ntp_signd/
sudo chmod 750 /var/lib/samba/ntp_signd/

# Add configuration to chrony.conf
echo "==> Modifying /etc/chrony/chrony.conf <=="
sudo bash -c "cat >> /etc/chrony/chrony.conf <<EOF
bindcmdaddress $BIND_ADDRESS
allow $ALLOWED_NTP_NETWORK
ntpsigndsocket /var/lib/samba/ntp_signd
EOF"

systemctl restart chronyd

echo "** Kerberos and time synchronization configuration completed. **"
