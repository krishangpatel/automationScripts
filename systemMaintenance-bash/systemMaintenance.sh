#!/bin/bash

log_file="/var/log/system_maintenance.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}

handle_error() {
    log "Error: $1"
    exit 1
}

clear_caches() {
    rm -rf ~/Library/Caches/*
    sudo rm -rf /Library/Caches/*
}

remove_temp_files() {
    sudo find /tmp -mindepth 1 -delete
}

monitor_home_directory() {
    fswatch -r "$HOME" | while read -r event; do
        log "Change detected in $event"
    done
}

display_disk_usage() {
    du -h -d 2 /
}

main() {
    log "Starting system maintenance..."

    clear_caches
    remove_temp_files
    monitor_home_directory
    display_disk_usage

    log "System maintenance completed."
}

trap 'handle_error $?' ERR

main


# ./systemMaintenance.sh