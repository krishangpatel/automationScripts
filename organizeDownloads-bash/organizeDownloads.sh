#!/bin/bash

downloads_folder="$HOME/Downloads"

# directories 
mkdir -p "$downloads_folder/Documents"
mkdir -p "$downloads_folder/Images"
mkdir -p "$downloads_folder/Applications"
mkdir -p "$downloads_folder/Rest"

mv "$downloads_folder"/*.{pdf,doc,docx,xls,xlsx,ppt,pptx,txt,rtf} "$downloads_folder/Documents" 2>/dev/null
mv "$downloads_folder"/*.{jpg,jpeg,png,gif,bmp}" $downloads_folder/Images" 2>/dev/null
mv "$downloads_folder"/*.app "$downloads_folder/Applications" 2>/dev/null
mv "$downloads_folder"/* "$downloads_folder/Rest" 2>/dev/null

echo "Organizing completed."


# ./organizeDownloads