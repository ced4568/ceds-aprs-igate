# ⚙️ Setup Guide

## 📦 Install Dependencies

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install direwolf gpsd gpsd-clients netcat-openbsd -y

🌐 Test APRS-IS Reachability
ping -c 3 google.com
getent hosts noam.aprs2.net
nc -vz noam.aprs2.net 14580

🚀 Enable Direwolf Service
sudo cp ./configs/home/direwolf.service /etc/systemd/system/direwolf.service
sudo systemctl daemon-reload
sudo systemctl enable direwolf
sudo systemctl restart direwolf
sudo systemctl status direwolf

🧠 Notes
APRS-IS login should use the base callsign in IGLOGIN, not the SSID

Example:

IGLOGIN KJ5JCO YOURPASSCODE

Home and mobile stations must use different MYCALL SSIDs


🛣️ Roadmap
 Finish home audio wiring
 Finish mobile audio wiring
 Add USB GPS to mobile build
 Capture aprs.fi screenshots
 Add final wiring diagrams and field validation
