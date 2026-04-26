# 📡 Ceds APRS iGate (Dual Node System)

> Dual-node APRS iGate system with network failover, GPS integration, and HomeLab infrastructure connectivity

![Status](https://img.shields.io/badge/status-in%20progress-blue)
![Platform](https://img.shields.io/badge/platform-Raspberry%20Pi-red)
![OS](https://img.shields.io/badge/os-Linux-black)
![Network](https://img.shields.io/badge/network-APRS--IS-green)

---

## 🚀 Overview

This project builds a **dual-node APRS iGate system** designed for:

* 📡 Reliable APRS packet decoding and forwarding
* 🌐 Continuous internet connectivity (failover enabled)
* 🚗 Mobile + 🏠 Home deployment
* 🧠 Integration into Ced’s HomeLab infrastructure

The system bridges:

**Radio → Raspberry Pi → Direwolf → Internet → APRS-IS → aprs.fi**

---

## 🎯 Purpose

This project was built to:

* Learn and implement real-world APRS infrastructure
* Design a resilient system with network failover
* Integrate RF systems into a modern IP-based environment
* Build a documented, reproducible system inside a HomeLab

It focuses on **practical engineering**, not just theory.

---

## 🏗️ Architecture

### 🔹 Home iGate

* Runs on Raspberry Pi (HomeLab VLAN)
* Always-on station
* Stable APRS-IS uplink
* Connected to fixed antenna + audio interface

### 🔹 Mobile iGate

* Raspberry Pi Zero 2 W
* Connects to:

  * 🏠 HomeLab WiFi (primary)
  * 📱 iPhone hotspot (fallback)
* GPS-enabled for live tracking
* Designed for portability and redundancy
* Uses **ETH-USB-HUB-BOX for power, USB expansion, and wired networking capability**

---

## 📊 System Diagram

Below is a high-level view of how the system components interact:

```mermaid
flowchart LR

    subgraph RF Layer
        HT[Radio Signal]
        ANT[Antenna]
    end

    subgraph Interface
        AUDIO[Audio Cable]
        USB[USB Sound Card]
    end

    subgraph Processing
        PI[Raspberry Pi]
        DW[Direwolf Decoder]
        GPS[GPS Module]
    end

    subgraph Network
        WIFI[HomeLab WiFi]
        HOTSPOT[iPhone Hotspot]
        NET[Internet]
    end

    subgraph APRS
        IS[APRS-IS Network]
        MAP[aprs.fi]
    end

    HT --> ANT --> AUDIO --> USB --> PI
    PI --> DW
    GPS --> PI

    DW --> WIFI
    DW --> HOTSPOT

    WIFI --> NET
    HOTSPOT --> NET

    NET --> IS --> MAP
```

---

## 🔁 System Flow

1. Radio receives APRS packet
2. Audio is passed into Raspberry Pi via USB sound card
3. Direwolf decodes packet
4. Packet is forwarded to APRS-IS via internet
5. Data appears on aprs.fi

---

## 🌐 Network Failover Logic

This system automatically prioritizes connections:

1. **Primary:** HomeLab WiFi
2. **Fallback:** Mobile hotspot

Configured using:

```bash
nmcli connection modify <wifi> connection.autoconnect-priority 10
nmcli connection modify <hotspot> connection.autoconnect-priority 5
```

This ensures:

* Continuous APRS-IS connectivity
* Automatic recovery during network loss

---

## ⚙️ Features

* Direwolf APRS decoding
* APRS-IS upload
* Network failover (WiFi ↔ hotspot)
* Systemd auto-start on boot
* GPS integration for mobile tracking
* GitHub-documented configs and setup

---

## 🧠 Ced’s HomeLab Integration

This iGate is part of a larger system: **Ced’s HomeLab**

### 🔗 Role in the Lab

* Acts as an **edge data ingestion node**
* Bridges RF (radio) into IP-based systems
* Runs on isolated HomeLab VLAN

### 🌐 Network Placement

* Connected to HomeLab WiFi (primary)
* Uses hotspot fallback for redundancy
* Designed for continuous uptime

### 🧩 Why This Matters

This project demonstrates:

* Real-world **edge computing**
* Hardware + software integration
* Network failover design
* Linux service management

This is not just a radio project — it is a **distributed system integrating RF, Linux, and network infrastructure**

---

## 🧰 Hardware

### 🏠 Home Setup

* Raspberry Pi 3B+ (Home iGate)
* QRZ-1 Explorer radio
* USB sound card
* Audio interface cables
* Inline volume control (for proper audio attenuation)

### 🔊 Audio Chain (Critical)

Radio → Inline Volume Controller → USB Sound Card → Raspberry Pi

#### 🎯 Key Tuning Insight

- Target audio level: **~50–60**
- Too high → clipping / decode errors  
- Too low → missed packets  
- Tuned using real beacon testing + Direwolf output

This was the most important step for achieving reliable packet decoding.

### 🚗 Mobile Setup

* Raspberry Pi Zero 2 W
* ETH-USB-HUB-BOX (power + USB + Ethernet expansion)
* USB sound card
* Audio interface cables
* Portable radio
* USB GPS receiver

---

## 🆔 APRS Identities

* `KJ5JCO-7` → handheld radio
* `KJ5JCO-10` → home iGate
* `KJ5JCO-15` → mobile iGate

---

## ⚙️ Software Stack

* Direwolf APRS TNC
* APRS-IS internet backbone
* Raspberry Pi OS / Linux
* systemd service management
* nmcli for WiFi priority and failover

---

## 📄 Direwolf Configuration

> Passcode is intentionally replaced with `<PASSCODE>` for security.

```conf
ADEVICE plughw:1,0
ACHANNELS 1
ARATE 44100

CHANNEL 0
MYCALL KJ5JCO-10

MODEM 1200

AGWPORT 8000
KISSPORT 8001

IGSERVER noam.aprs2.net
IGLOGIN KJ5JCO-10 <PASSCODE>

PBEACON sendto=IG delay=1 every=30 lat=34.3310 long=-89.5227 symbol=igate comment="Ced's Home iGate"
```

## 📁 Repository Layout

```text
ceds-aprs-igate/
├── README.md
├── diagrams/
├── docs/
├── configs/
├── scripts/
├── parts/
├── screenshots/
└── notes/
```

---

## ⚠️ Security Notes

* APRS passcode is NOT stored in this repo
* Credentials are handled locally only
* Prevents accidental exposure

---

## 🧭 Roadmap

* [x] Finish home audio wiring
* [ ] Finish mobile audio wiring
* [x] Add GPS module to mobile build
* [ ] Capture aprs.fi screenshots
* [ ] Add wiring diagrams
* [x] Field testing and validation for home iGate
* [ ] Add NOC dashboard integration

---

## 🚀 Quick Start

Install dependencies:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install direwolf gpsd gpsd-clients netcat-openbsd -y
```

Test connectivity:

```bash
ping -c 3 google.com
getent hosts noam.aprs2.net
nc -vz noam.aprs2.net 14580
```

Enable service:

```bash
sudo cp ./configs/home/direwolf.service /etc/systemd/system/direwolf.service
sudo systemctl daemon-reload
sudo systemctl enable direwolf
sudo systemctl start direwolf
```

---

## 📚 What I Learned

* How to deploy and manage Linux services using systemd
* Network prioritization and failover using nmcli
* Integrating hardware (radio/audio/GPS) with software systems
* Designing systems for reliability and uptime
* Documenting technical builds for reproducibility

---

## 🧪 Troubleshooting Notes

### Audio Level Too High

Problem:

```text
Audio input level is too high
```

Fix:

* Added inline volume control
* Tuned Direwolf audio levels to roughly **50–60**
* Verified using repeated FT5D beacon tests

### Audio Device Busy

Problem:

```text
Could not open audio device plughw:1,0
Device or resource busy
```

Fix:

```bash
sudo systemctl stop direwolf
sudo killall direwolf
fuser -v /dev/snd/*
```

### APRS-IS Not Updating

Problem:

* Direwolf decoded packets
* APRS.fi did not update consistently

Fix:

* Verified APRS-IS login
* Corrected IGLOGIN to match iGate SSID:

```conf
MYCALL KJ5JCO-10
IGLOGIN KJ5JCO-10 <PASSCODE>
```

### Missing Some Beacons

This is normal APRS behavior. Packet collisions, RF conditions, squelch behavior, and local APRS traffic levels can affect whether every beacon is decoded.