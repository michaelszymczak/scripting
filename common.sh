#!/bin/bash

if [ "${BASH_SOURCE[0]}" = "$0" ]; then exit 0; fi

readonly LOG_FILE="/tmp/$(basename "$0").log"
curr_date() { date -u +"%Y-%m-%dT%H:%M:%SZ"; }
info()    { echo "[INFO] $(curr_date) - $*" | tee -a "$LOG_FILE" >&2 ; }
warn() { echo "[WARN] $(curr_date) - $*" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo "[ERROR] $(curr_date) - $*" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo "[FATAL] $(curr_date) - $*" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }
