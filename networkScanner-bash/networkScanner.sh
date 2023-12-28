#!/bin/bash

output_dir="networkScanResults"

## Before using:
##     1. brew install nmap
##     2. brew install arp-scan

mkdir -p "$output_dir"

perform_arp_scan() {
    local output_file="$output_dir/arpScanResults.txt"
    echo "Performing ARP scan..."
    arp-scan --localnet | grep -E '([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})' > "$output_file"
    echo "ARP scan completed. Results saved to $output_file"
}

perform_nmap_scan() {
    local output_file="$output_dir/nmapScanResults.txt"
    
    local network=$(route -n get default | awk '/gateway/ {print $2}')
    
    echo "Performing Nmap scan on network $network..."
    sudo nmap -sP -n "$network" -oN "$output_file"
    echo "Nmap scan completed. Results saved to $output_file"
}


main() {
    echo "Starting network scan..."

    perform_arp_scan
    perform_nmap_scan

    echo "Network scan completed."
}

main
