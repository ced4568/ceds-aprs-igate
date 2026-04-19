# Troubleshooting

## Direwolf starts but cannot connect to APRS-IS
- Test internet with `ping -c 3 8.8.8.8`
- Test DNS with `ping -c 3 google.com`
- Test APRS-IS with `nc -vz noam.aprs2.net 14580`
- Add a short systemd start delay if Direwolf starts before Wi-Fi is fully ready

## Audio device not found
- Run `arecord -l`
- Update `ADEVICE plughw:X,0` with the correct device number

## Mobile Pi does not switch to hotspot
- Confirm hotspot SSID is visible
- Confirm saved connection exists with `nmcli connection show`
- Check priorities and autoconnect settings

## GPS not detected
- Check `/dev/ttyUSB0` or `/dev/ttyACM0`
- Confirm gpsd is enabled and running
- Use `cgps` to verify lock

## APRS packets decode poorly
- Lower radio volume
- Verify correct cable routing
- Confirm radio SP goes to sound card MIC IN
- Confirm sound card OUT goes to radio MIC IN
