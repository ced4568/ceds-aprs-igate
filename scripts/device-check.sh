#!/usr/bin/env bash
set -e
echo "== Audio devices =="
arecord -l || true

echo "== Wi-Fi connections =="
nmcli connection show || true

echo "== Active connections =="
nmcli connection show --active || true

echo "== Direwolf service =="
sudo systemctl status direwolf --no-pager || true
