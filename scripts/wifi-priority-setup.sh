#!/usr/bin/env bash
set -e
sudo nmcli connection modify netplan-wlan0-HomeLab connection.autoconnect yes
sudo nmcli connection modify netplan-wlan0-HomeLab connection.autoconnect-priority 10
sudo nmcli connection modify Ced connection.autoconnect yes
sudo nmcli connection modify Ced connection.autoconnect-priority 5
sudo nmcli connection modify Ced connection.autoconnect-retries 0
