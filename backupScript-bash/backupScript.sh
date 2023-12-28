#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

while true; do
    source_directory="$1"
    destination_directory="$2"

    if [ ! -d "$source_directory" ]; then
        echo "Source directory not found: $source_directory"
        exit 1
    fi

    if [ ! -d "$destination_directory" ]; then
        mkdir -p "$destination_directory"
    fi

    rsync -av --progress "$source_directory/" "$destination_directory/"

    if [ $? -eq 0 ]; then
        echo "Backup completed successfully!"
    else
        echo "Backup failed. Please check the error messages above."
    fi

    sleep 3600
done


# ./backupScript.sh /pathtosource_directory /pathtodestination_directory
