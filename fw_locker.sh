#!/usr/bin/env bash

function show_help {
    echo "Usage: $0 <camera_serial_number> <firmware_file_1> <firmware_file_2>"
    echo "Updates the firmware of a RealSense camera with the specified serial number."
    echo ""
    echo "Positional arguments:"
    echo "  camera_serial_number  The serial number of the camera to update."
    echo "  firmware_file_1      The path to the first firmware file to use."
    echo "  firmware_file_2      The path to the second firmware file to use."
    echo ""
    echo "Optional arguments:"
    echo "  -h, --help           Show this help message and exit."
}

if [[ "$#" -eq 0 ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

if [ "$#" -ne 3 ]; then
    echo "Error: Invalid number of arguments."
    echo ""
    show_help
    exit 1
fi

echo Update 1
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo 
echo Update 2
timeout 2m rs-fw-update -f "$3" -s "$1"
echo
echo ========================
echo 
echo Update 3
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo 
echo Update 4
timeout 2m rs-fw-update -f "$3" -s "$1"
echo
echo ========================
echo 
echo Update 5
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo 
echo Update 6
timeout 2m rs-fw-update -f "$3" -s "$1"
echo
echo ========================
echo 
echo Update 7
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo 
echo Update 8
timeout 2m rs-fw-update -f "$3" -s "$1"
echo
echo ========================
echo 
echo Update 9
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo 
echo Update 10
timeout 2m rs-fw-update -f "$3" -s "$1"
echo
echo ========================
echo 
echo Update 11
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo 
echo Update 12
timeout 2m rs-fw-update -f "$3" -s "$1"
echo
echo ========================
echo 
echo Update 13
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo 
echo Update 14
timeout 2m rs-fw-update -f "$3" -s "$1"
echo
echo ========================
echo 
echo Update 15
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo 
echo Update 16
timeout 2m rs-fw-update -f "$3" -s "$1"
echo
echo ========================
echo 
echo Update 17
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo 
echo Update 18
timeout 2m rs-fw-update -f "$3" -s "$1"
echo
echo ========================
echo 
echo Update 19
timeout 2m rs-fw-update -f "$2" -s "$1"
echo
echo ========================
echo
echo Camera should be locked by now.
echo Following command should show a D4XX device in recovery mode.
echo If it just shows two normal cameras, simply run this script again and Ctrl + C after the first update.
rs-enumerate-devices -s

