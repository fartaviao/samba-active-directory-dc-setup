<img src="https://raw.githubusercontent.com/fartaviao/fartaviao/refs/heads/main/Banner%20Fausto.jpg" alt="Banner Fausto Artavia Ocampo">

# Samba Active Directory Domain Controller Setup

Easily deploy a Samba Active Directory Domain Controller with interactive scripts and best practices designed for centralized authentication and domain management.

---

## About This Project

This project simplifies the process of deploying a Samba Active Directory Domain Controller setup by providing:
- Modular scripts for each step of the configuration process.
- Detailed explanations and best practices.
- Validation and testing guidelines.

### Features:
- Fully automated network configuration using Netplan.
- Samba Active Directory Domain Controller setup with Kerberos, DNS, and NTP integration.
- Modular design for ease of replication and debugging.

---

## Project Structure

```
samba-active-directory-dc-setup/
├── README.md                         # Welcome page
├── samba-ad-dc-setup.txt             # Main documentation
├── scripts/
│   ├── 0-netplan-configurator.sh     # Network setup interactive script
│   ├── 1-samba-initial-setup.sh      # Samba initial setup script
│   ├── 2-samba-ad-services.sh        # Samba services configuration script
│   └── 3-samba-ad-kerberos-ntp.sh    # Kerberos and NTP configuration script
├── configs/
│   ├── smb.conf                      # Example of smb.conf file
│   └── resolv.conf                   # Example of resolv.conf file
└── Screenshots/                      # For better clarity
    ├── screenshot-01.png
    ├── screenshot-02.png
    ├── screenshot-03.png
    ├── screenshot-04.png
    ├── screenshot-05.png
    ├── screenshot-06.png
    ├── screenshot-07.png
    └── screenshot-08.png
```
---

## Quick Start

To get started, follow these steps:
1. Clone the repository:
   ```bash
   git clone https://github.com/fartaviao/samba-active-directory-dc-setup.git
   cd samba-active-directory-dc-setup
   ```

2. Run the scripts in order:

   ### Step 1: Network Configuration:
   ```bash
   sudo chmod +x scripts/0-netplan-configurator.sh
   sudo ./scripts/0-netplan-configurator.sh
   ```
   Follow the interactive prompts to set up your network.

   ### Step 2: Samba Initial Setup:
   ```bash
   sudo chmod +x scripts/1-samba-initial-setup.sh
   sudo ./scripts/1-samba-initial-setup.sh
   ```

   ### Step 3: Samba Service Configuration:
   ```bash
   sudo chmod +x scripts/2-samba-ad-services.sh
   sudo ./scripts/2-samba-ad-services.sh
   ```
   ### Step 4: Begin the domain provisioning:
   ```bash
   sudo samba-tool domain provision
   ```

   ### Step 5: Kerberos and NTP Configuration:
   ```bash
   sudo chmod +x scripts/3-samba-ad-kerberos-ntp.sh
   sudo ./scripts/3-samba-ad-kerberos-ntp.sh
   ```

For detailed documentation and step-by-step guide, refer to the [main documentation](https://github.com/fartaviao/samba-active-directory-dc-setup/blob/main/samba-ad-dc-setup.txt).

---

## Contributions Are Welcome!

This project, like many others, is constantly evolving. To contribute:
1. Fork the repository.
2. Make your changes.
3. Submit a pull request with a description of your modifications.

Feel free to report any issues, suggest improvements, or share ideas to enhance the project. Your feedback is invaluable!

---

## Acknowledgments

Special thanks to the Ubuntu and Samba community for their comprehensive documentation and support.

### Useful Links:
- [Samba Official Documentation](https://www.samba.org/samba/docs/)
- [Netplan Official Documentation](https://netplan.io/)

---

© 2024 Fausto Artavia Ocampo
