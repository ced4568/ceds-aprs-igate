# 📡 Ceds APRS iGate

A dual APRS iGate build using Raspberry Pi, Direwolf, APRS-IS, QRZ-1 radios, USB sound cards, and GPS.

## Builds

- 🏠 Home iGate: fixed station on HomeLab network
- 🚗 Mobile iGate: Pi Zero 2 W with hotspot failover
- 🛰️ GPS-enabled mobile station for live location updates

## Features

- Direwolf APRS decoding
- APRS-IS upload
- HomeLab ↔ hotspot automatic failover
- Systemd auto-start on boot
- USB GPS integration for mobile location
- GitHub-documented wiring, configs, and troubleshooting

## Hardware

- Raspberry Pi 3B+ or newer for home iGate
- Raspberry Pi Zero 2 W for mobile iGate
- QRZ-1 Explorer radios
- Sabrent USB sound cards
- 3.5 mm audio cables
- 3.5 mm to 2.5 mm adapter cables
- USB GPS receiver

## Network Behavior

- HomeLab Wi-Fi = primary
- iPhone hotspot (`Ced`) = fallback for mobile unit

## APRS Identities

- `KJ5JCO-7` → handheld APRS radio
- `KJ5JCO-10` → home iGate
- `KJ5JCO-15` → mobile iGate

## Repository Layout

```text
ceds-aprs-igate/
├── README.md
├── LICENSE
├── .gitignore
├── docs/
├── diagrams/
├── configs/
├── scripts/
├── parts/
├── screenshots/
└── notes/

## Quick Start

See full setup guide:
👉 docs/setup.md
