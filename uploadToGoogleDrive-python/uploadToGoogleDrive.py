#!/usr/bin/env python3

## Before using:
##     1. curl https://rclone.org/install.sh | sudo bash
##     2. rclone config    #follow the prompts to setep drive

import subprocess
import os

def upload_to_google_drive(source_directory, remote_name):
    try:
        subprocess.run(["rclone", "sync", source_directory, f"{remote_name}:", "--progress"])
        print("Backup completed successfully.")
    except Exception as e:
        print(f"Error during backup: {e}")

if __name__ == "__main__":
    source_directory = "/pathToTourSourceDirectory"

    remote_name = "remoteNameInGoogleDrive"

    if os.path.exists(source_directory):
        upload_to_google_drive(source_directory, remote_name)
    else:
        print("Source directory not found. Please update the script with the correct path.")


# python3 ./uploadToGoogleDrive