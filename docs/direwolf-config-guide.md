# Direwolf Production Config Guide

## Home iGate 
```bash
configs/home/direwolf.conf.example
ADEVICE plughw:1,0
CHANNEL 0
MYCALL KJ5JCO-10
MODEM 1200
IGSERVER noam.aprs2.net
IGLOGIN KJ5JCO YOURPASSCODE
PBEACON sendto=IG delay=1 every=30 lat=34.3310 long=-89.5227 symbol=igate comment="Ced's Home iGate"
AGWPORT 8000
KISSPORT 8001
```

## Mobile iGate example (pre-GPS)
```ini
ADEVICE plughw:1,0
CHANNEL 0
MYCALL KJ5JCO-15
MODEM 1200
IGSERVER noam.aprs2.net
IGLOGIN KJ5JCO YOURPASSCODE
PBEACON lat=34.3110 long=-89.9443 symbol="I&" comment="Ceds Mobile iGate"
AGWPORT 8000
KISSPORT 8001
```

## Mobile iGate example (with GPS)
```ini
ADEVICE plughw:1,0
CHANNEL 0
MYCALL KJ5JCO-15
MODEM 1200
IGSERVER noam.aprs2.net
IGLOGIN KJ5JCO YOURPASSCODE
GPSD
PBEACON sendto=IG delay=1 every=5 symbol=igate comment="Ced's Mobile iGate"
AGWPORT 8000
KISSPORT 8001
```


