# USB GPS Setup

## Purpose
The mobile iGate uses a USB GPS so Direwolf can beacon a live position instead of a fixed location.

## Install packages
```bash
sudo apt update
sudo apt install gpsd gpsd-clients -y
```

## Detect device
```bash
ls /dev/ttyUSB*
ls /dev/ttyACM*
```

## Configure gpsd
Edit `/etc/default/gpsd`:

```ini
START_DAEMON="true"
USBAUTO="false"
DEVICES="/dev/ttyUSB0"
GPSD_OPTIONS="-n"
```

## Restart gpsd
```bash
sudo systemctl restart gpsd
sudo systemctl enable gpsd
```

## Verify GPS
```bash
cgps
```

## Direwolf integration
Add to Direwolf config:

```ini
GPSD
PBEACON sendto=IG delay=0:30 every=5:00 symbol=">" comment="Ced Mobile iGate"
```

## Notes
- Replace `/dev/ttyUSB0` with the actual GPS device path
- Wait for a real GPS lock before validating APRS position behavior
- Keep the mobile Pi where the GPS receiver has sky visibility
