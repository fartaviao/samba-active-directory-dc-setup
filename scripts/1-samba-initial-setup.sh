#!/bin/bash

# Ask data to the user
read -p "Please enter the server IP address (e.g., 192.168.0.1): " SERVER_IP
read -p "Please enter the domain name (e.g., example.com): " DOMAIN
read -p "Please enter the hostname (e.g., dc1server): " HOSTNAME
read -p "Please enter the DNS forwarder (e.g., 8.8.8.8): " DNS_FORWARDER

# Check if the script is run as root
check_root() {
  if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root.!"
    exit 1
  fi
}

# Initial server configuration
configure_server() {
  echo "==> Initial server configuration <=="
  hostnamectl set-hostname "$HOSTNAME"
  echo "$SERVER_IP $HOSTNAME.$DOMAIN $HOSTNAME" >> /etc/hosts
  echo "$SERVER_IP $DOMAIN" >> /etc/hosts
  echo "*** Hostname and hosts file configuration completed. ***"
}

# Configure resolv.conf
configure_resolv() {
  echo "==> Configuring resolv.conf <=="
  systemctl disable --now systemd-resolved
  unlink /etc/resolv.conf
  cat > /etc/resolv.conf <<EOF
nameserver $SERVER_IP
nameserver $DNS_FORWARDER
search $DOMAIN
EOF
  chattr +i /etc/resolv.conf
  echo "*** resolv.conf configuration completed. ***"
}

# Install Samba and dependencies
install_samba() {
  echo "==> Installing Samba and dependencies <=="
  apt install acl attr samba samba-dsdb-modules samba-vfs-modules smbclient winbind libpam-winbind libnss-winbind libpam-krb5 krb5-config krb5-user dnsutils chrony net-tools -y
  echo "*** Samba installation completed. ***"
}

# Run the script
check_root
configure_server
configure_resolv
install_samba

