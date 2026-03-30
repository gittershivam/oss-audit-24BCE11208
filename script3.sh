#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Shivam Verma | Course: Open Source Software

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "================================="
echo "     Directory Audit Report"
echo "================================="

# Loop through directories
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        
        # Get permissions, owner, group
        PERMS=$(ls -ld "$DIR" | awk '{print "Perms: "$1" | Owner: "$3":"$4}')
        
        # Get directory size
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "$DIR => $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo "---------------------------------"
echo "Python Configuration Directory Check"

# Checking Python directory
PYTHON_DIR="/usr/lib/python3"

if [ -d "$PYTHON_DIR" ]; then
    PY_PERMS=$(ls -ld "$PYTHON_DIR" | awk '{print "Perms: "$1" | Owner: "$3":"$4}')
    echo "$PYTHON_DIR => $PY_PERMS"
else
    echo "Python directory not found."
fi