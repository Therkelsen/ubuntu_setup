#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <path_to_look_in> <character_to_look_for>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: Path '$1' not found."
    exit 1
fi

if [ ${#2} -ne 1 ]; then
    echo "Error: Please provide a single character to look for."
    exit 1
fi

file_count=$(find "$1" -name "*$2*" | wc -l)

find "$1" -name "*$2*" | while read -r filename; do
    newname=$(echo "$filename" | sed "s/$2//g")
    old_basename=$(basename "$filename")
    new_basename=$(basename "$newname")

    printf "\e[31m%s\e[0m" "$old_basename"
    printf " -> "
    printf "\e[32m%s\e[0m\n" "$new_basename"
done

if [ $file_count -eq 0 ]; then
    echo "Found no files in \"$1\" containing \"$2\"."
    exit;
fi

echo "Found $file_count files in \"$1\" containing \"$2\"."
printf "\e[31m%s\e[0m" "Warning: "
printf "This script does"
printf "\e[31m%s\e[0m" " not "
printf "provide backups of the files.\n"
echo "Do you want to proceed with renaming? (y/n):"

read -p "" answer </dev/tty
    case $answer in
        [Yy]* | "" )
        find "$1" -name "*$2*" | while read -r filename; do
            newname=$(echo "$filename" | sed "s/$2//g")
            old_basename=$(basename "$filename")
            new_basename=$(basename "$newname")
            mv -v "$filename" "$newname";
        done
        echo "Renamed $file_count files in \"$1\" containing \"$2\"."; ;;
        [Nn]* ) echo "Skipped renaming."; ;;
        * ) echo "Invalid input. Skipped renaming."; ;;
esac