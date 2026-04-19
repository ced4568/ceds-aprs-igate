# Lessons Learned

- APRS-IS connectivity can fail on boot if Wi-Fi is not fully ready; adding a short systemd delay helps
- iPhone hotspot visibility can be inconsistent during setup
- NetworkManager priorities are the cleanest way to handle HomeLab ↔ hotspot failover
- Audio port size mismatch on the radio required updating the wiring plan
