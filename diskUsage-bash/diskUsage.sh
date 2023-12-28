#!/bin/bash

display_disk_usage() {
    directory="$1"

    if [ -d "$directory" ]; then
        du -h -d 1 "$directory"
    else
        echo "Error: Directory not found."
        exit 1
    fi
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

display_disk_usage "$1"


# ./diskUsage.sh /path