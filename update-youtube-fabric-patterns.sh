#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Update Youtube Fabric Patterns
# @raycast.mode compact
# @raycast.packageName YouTube Tools
# @raycast.icon 🔄

# Documentation:
# @raycast.description Updates the available Fabric patterns list for YouTube Analysis
# @raycast.author Your Name
# @raycast.authorURL https://github.com/yourusername

# Add debug function
debug() {
    printf "Debug: %s\n" "$*" >&2
}

# Define paths
PATTERNS_DIR="$HOME/.config/fabric/patterns"
YOUTUBE_SCRIPT="$HOME/Documents/Raycast Scripts/summarize-youtube-video.sh"
TEMP_SCRIPT="${YOUTUBE_SCRIPT}.tmp"

debug "Scanning patterns directory: $PATTERNS_DIR"

# Generate pattern data from directories
PATTERN_DATA=$(
    find "$PATTERNS_DIR" -type d -mindepth 1 -maxdepth 1 | while read -r dir; do
        pattern=$(basename "$dir")
        # Skip if it starts with a dot (hidden directories)
        [[ $pattern = .* ]] && continue

        # Transform pattern name to readable title with pre-compiled regex
        title=$(printf '%s' "$pattern" |
                perl -pe 'BEGIN{
                    # Pre-compile regex patterns
                    %replace = (
                        "Cot" => "COT",
                        "Ai" => "AI",
                        "Cfp" => "CFP",
                        "Diy" => "DIY",
                        "Npc" => "NPC",
                        "Prd" => "PRD",
                        "Rpg" => "RPG",
                        "Rss" => "RSS",
                        "Dsrp" => "DSRP",
                        "Html" => "HTML",
                        "Csv" => "CSV",
                        "Ctf" => "CTF",
                        "Dm" => "DM",
                        "Poc" => "POC"
                    );
                }
                s/_/ /g;
                s/\b(\w)/\u$1/g;
                s/7s/7S/g;
                foreach $k (keys %replace) {
                    s/\b$k\b/$replace{$k}/g;
                }')

        printf '{ "title": "%s", "value": "%s" },' "$title" "$pattern"
    done | sort | sed '$ s/,$//' | tr -d '\n'
) 2>/dev/null

# Create new script with updated header
awk -v patterns="$PATTERN_DATA" '
/^# @raycast.argument1/ {
    print "# @raycast.argument1 { \"type\": \"dropdown\", \"optional\": true, \"placeholder\": \"Analysis Pattern\", \"data\": [ " patterns " ] }"
    next
}
{ print }' "$YOUTUBE_SCRIPT" > "$TEMP_SCRIPT"

# Replace original script with new version
mv "$TEMP_SCRIPT" "$YOUTUBE_SCRIPT"

printf "✅ Updated YouTube Analysis script with new patterns" >&2
