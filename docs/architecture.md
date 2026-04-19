# Architecture

## Home iGate
RF packets → QRZ-1 radio → USB sound card → Raspberry Pi → Direwolf → APRS-IS → aprs.fi

## Mobile iGate
RF packets → QRZ-1 radio → USB sound card → Pi Zero 2 W → Direwolf → hotspot/HomeLab failover → APRS-IS → aprs.fi

## GPS path
USB GPS → gpsd → Direwolf → APRS beacon/location updates
