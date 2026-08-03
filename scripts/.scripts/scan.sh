#!/usr/bin/env bash
set -euo pipefail

# 1. Trigger Flameshot to capture a region and POST raw bytes to your FastAPI server
RESPONSE=$(flameshot gui -r | curl -s -X POST http://127.0.0.1:8008/ocr -F "file=@-;type=image/png")

# 2. Extract only the raw Japanese text string out of the server's response payload
RAW_TEXT=$(echo "$RESPONSE" | jq -r '.query')

# 3. URL-encode the string so special characters/spaces don't break the browser URL
ENCODED_TEXT=$(echo -n "$RAW_TEXT" | jq -sRr @uri)

if [ -n "$RAW_TEXT" ] && [ "$RAW_TEXT" != "null" ]; then
    echo "Opening Yomitan for: $RAW_TEXT"

    # Using your exact Firefox Extension ID and dropping the redundant 'ext/' folder path
    TARGET_URL="moz-extension://70503509-a161-498c-bca0-077a76fe344a/search.html?query=${ENCODED_TEXT}"

    # Launch directly as a clean new standalone window
    firefox -new-window "$TARGET_URL" &

    # Optional styling patch: Shrink it down to a floating application panel size
    sleep 0.3
    if command -v xdotool &> /dev/null; then
        xdotool search --onlyvisible --class "firefox" windowsize 750 850
    fi
else
    echo "No text detected."
fi
