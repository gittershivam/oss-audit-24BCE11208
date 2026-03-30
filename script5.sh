#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Shivam Verma | Course: Open Source Software

echo "======================================"
echo "   Open Source Manifesto Generator"
echo "======================================"
echo ""

# Asking user questions
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

# Alias concept demonstration (example)
# alias view_manifest="cat $OUTPUT"

# Creating manifesto text file
cat << EOF > "$OUTPUT"
========== Open Source Manifesto ==========
Date: $DATE
Author: $USER_NAME

Every day I rely on open-source tools such as $TOOL to learn, create, and innovate.
Open source represents collaboration beyond boundaries.

To me, freedom means $FREEDOM — the ability to explore technology,
understand systems, and improve them for everyone.

If given the opportunity, I would freely build and share $BUILD
so others can learn, modify, and grow together through open knowledge.

===========================================
EOF

echo ""
echo "Manifesto saved to $OUTPUT"
echo ""
cat "$OUTPUT"