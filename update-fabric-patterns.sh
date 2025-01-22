#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Update Fabric Patterns
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

check_fabric() {
    debug "Debug: Checking for Fabric installation..." >&2

    # Define common paths as readonly array
    readonly POSSIBLE_GO_PATHS=(
        "$HOME/go/bin"
        "/usr/local/go/bin"
        "/opt/homebrew/bin"
        "/opt/homebrew/opt/go/bin"
        "$HOME/.local/share/mise/installs/go/*/bin"
    )

    # Build PATH addition once
    local path_addition
    printf -v path_addition "%s:" "${POSSIBLE_GO_PATHS[@]}"
    export PATH="$PATH:${path_addition%:}"  # Remove trailing colon
    debug "Updated PATH: $PATH"

    # Define fabric paths as readonly array
    readonly POSSIBLE_FABRIC_PATHS=(
        "$HOME/.local/share/mise/installs/go/*/bin/fabric"  # mise-managed fabric
        "$HOME/go/bin/fabric"
        "/usr/local/go/bin/fabric"
        "/opt/homebrew/bin/fabric"
        "/opt/homebrew/opt/go/bin/fabric"
        "$(which fabric 2>/dev/null || echo '')"
    )

    local fabric_found=false
    local actual_path
    for path in "${POSSIBLE_FABRIC_PATHS[@]}"; do
        # More efficient glob handling
        compgen -G "$path" > /dev/null || continue
        while IFS= read -r actual_path; do
            debug "Checking path: $actual_path"
            if [ -x "$actual_path" ]; then
                debug "Found Fabric at: $actual_path"
                export PATH="$(dirname "$actual_path"):$PATH"
                fabric_found=true
                break 2
            fi
        done < <(compgen -G "$path")
    done

    if [ "$fabric_found" = false ]; then
        printf "Error: Fabric not found. Install it with: go install github.com/danielmiessler/fabric@latest\n" >&2
        printf "Note: Make sure Go is installed and Fabric is in your PATH\n" >&2
        exit 1
    fi

    # Check fabric version
    debug "Fabric found. Checking version..."
    if ! fabric_version=$(fabric --version 2>&1); then
        debug "Warning: Could not get Fabric version"
    else
        debug "Fabric version: $fabric_version"
    fi

    debug "✅ Fabric check passed"
}

# Run fabric check and update
check_fabric
debug "Running fabric update..."
if ! fabric -U; then
    printf "Error: Failed to update Fabric patterns\n" >&2
    exit 1
fi

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
