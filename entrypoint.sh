#!/bin/sh
# Validate that a file argument was provided and is readable
if [ -z "$1" ]; then
    echo "Usage: clean-file <file>" >&2
    exit 1
fi
if [ ! -f "$1" ] || [ ! -r "$1" ]; then
    echo "Error: '$1' is not a readable file" >&2
    exit 1
fi
# Use a temp file to simulate in-place editing
awk '{
    if (NR == 1) { l1 = $0; next }
    if (NR == 2) {
        if (l1 ~ /^[[:space:]]*$/ && $0 ~ /^Meeting created at:/) next;
        else { print l1; print $0; next }
    }
    print $0
} END { if (NR == 1) print l1 }' "$1" > "$1.tmp" && mv "$1.tmp" "$1"
