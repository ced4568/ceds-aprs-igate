# Network Failover

The mobile Pi is configured with two Wi-Fi networks:

- `netplan-wlan0-HomeLab` → priority 10
- `Ced` → priority 5

## Behavior
- At home, the Pi uses HomeLab
- When HomeLab is unavailable, the Pi automatically connects to the Ced hotspot
- When HomeLab returns, the Pi reconnects automatically

## Example commands
```bash
sudo nmcli connection modify netplan-wlan0-HomeLab connection.autoconnect yes
sudo nmcli connection modify netplan-wlan0-HomeLab connection.autoconnect-priority 10
sudo nmcli connection modify Ced connection.autoconnect yes
sudo nmcli connection modify Ced connection.autoconnect-priority 5
sudo nmcli connection modify Ced connection.autoconnect-retries 0
```
