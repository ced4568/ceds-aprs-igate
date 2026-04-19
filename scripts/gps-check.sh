#!/usr/bin/env bash
set -e
ls /dev/ttyUSB* /dev/ttyACM* 2>/dev/null || true
gpspipe -r -n 10 || true
cgps || true
