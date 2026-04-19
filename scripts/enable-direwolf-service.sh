#!/usr/bin/env bash
set -e
sudo cp ./configs/mobile/direwolf.service /etc/systemd/system/direwolf.service
sudo systemctl daemon-reload
sudo systemctl enable direwolf
sudo systemctl restart direwolf
sudo systemctl status direwolf
