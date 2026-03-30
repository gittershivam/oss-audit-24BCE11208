#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Shivam Verma | Course: Open Source Software

PACKAGE="python3"

echo "================================="
echo "   FOSS Package Inspector"
echo "================================="

# Check installation using dpkg (Ubuntu/Debian)
if dpkg -l | grep -qw $PACKAGE; then
    echo "$PACKAGE is installed."

    echo "Package Information:"
    dpkg -s $PACKAGE | grep -E 'Version|Maintainer|Description' | head -n 3

else
    echo "$PACKAGE is NOT installed."
fi

echo "---------------------------------"
echo "Open Source Philosophy Note:"

# Case statement
case $PACKAGE in
    python|python3)
        echo "Python: A community-driven language focused on readability and freedom to innovate."
        ;;
    firefox)
        echo "Firefox: A nonprofit browser protecting openness on the web."
        ;;
    vlc)
        echo "VLC: Media freedom — play anything without restrictions."
        ;;
    mysql)
        echo "MySQL: Open databases powering millions of applications."
        ;;
    *)
        echo "$PACKAGE: An important tool in the FOSS ecosystem."
        ;;
esac