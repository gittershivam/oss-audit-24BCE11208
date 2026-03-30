#!/bin/bash
# Script 4: Log File Analyzer
# Author: Shivam Verma | Course: Open Source Software

# Usage: ./script4.sh logfile keyword

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

echo "================================="
echo "        Log File Analyzer"
echo "================================="

# Check if filename provided
if [ -z "$LOGFILE" ]; then
    echo "Usage: ./script4.sh <logfile> [keyword]"
    exit 1
fi

# Check file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

# Do-while style retry if empty
while [ ! -s "$LOGFILE" ]; do
    echo "File is empty."
    read -p "Enter another file name: " LOGFILE

    if [ ! -f "$LOGFILE" ]; then
        echo "File not found. Exiting."
        exit 1
    fi
done

# Read file line by line
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo ""
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"

echo ""
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5