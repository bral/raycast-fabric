#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Update Youtube Fabric Patterns
# @raycast.mode compact
# @raycast.packageName Fabric Tools
# @raycast.icon 🔄

# Documentation:
# @raycast.description Updates the available Fabric patterns list for YouTube Analysis
# @raycast.author Brannon Lucas
# @raycast.authorURL https://github.com/bral

set -euo pipefail

# Add debug function
debug() {
    printf "Debug: %s\n" "$*" >&2
}

check_fabric() {
    debug "Checking for Fabric installation..." >&2

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
                FABRIC_PATH="$actual_path"
                break 2
            fi
        done < <(compgen -G "$path")
    done

    if [ "$fabric_found" = false ]; then
        debug "Error: Fabric not found in any standard location"
        exit 1
    fi

    debug "✅ Fabric check passed"
}

# Setup Fabric first
check_fabric

# Define paths and resolve symlink if it exists
YOUTUBE_SCRIPT="$HOME/Documents/Raycast Scripts/youtube-transcript-analysis.sh"
debug "Initial script path: $YOUTUBE_SCRIPT"

# Check if file exists
if [ ! -e "$YOUTUBE_SCRIPT" ]; then
    debug "Listing contents of Raycast Scripts directory:"
    ls -la "${HOME}/Documents/Raycast Scripts/" >&2
    debug "Error: Script not found at '$YOUTUBE_SCRIPT'"
    exit 1
fi

# Resolve symlink
if [ -L "$YOUTUBE_SCRIPT" ]; then
    REAL_PATH=$(readlink -f "$YOUTUBE_SCRIPT")
    debug "Symlink detected, resolved to: $REAL_PATH"
    YOUTUBE_SCRIPT="$REAL_PATH"
fi

TEMP_SCRIPT="${YOUTUBE_SCRIPT}.tmp"
debug "Temp script path: $TEMP_SCRIPT"

# Generate pattern data using full path to fabric
debug "Retrieving Fabric patterns..."
PATTERN_DATA=$("$FABRIC_PATH" -l 2>/dev/null | grep -v '^$' | while read -r pattern; do
    # Skip empty lines and non-pattern lines
    [[ -z "$pattern" || "$pattern" =~ ^[[:space:]]*$ ]] && continue

    # Transform pattern name to readable title
    title=$(echo "$pattern" | sed -E 's/_/ /g; s/\b(\w)/\U\1/g')
    printf '{ "title": "%s", "value": "%s" },' "$title" "$pattern"
done | sort | sed '$ s/,$//' | tr -d '\n')

debug "Found patterns: $PATTERN_DATA"

if [ -z "$PATTERN_DATA" ]; then
    debug "Error: No patterns found from fabric -l"
    exit 1
fi

# Create new script with updated header
debug "Creating temporary script..."
if ! awk -v patterns="$PATTERN_DATA" '
/^# @raycast.argument1/ {
    print "# @raycast.argument1 { \"type\": \"dropdown\", \"optional\": true, \"placeholder\": \"Analysis Pattern\", \"data\": [ " patterns " ] }"
    next
}
{ print }' "$YOUTUBE_SCRIPT" > "$TEMP_SCRIPT"; then
    debug "Error: Failed to create temporary script"
    exit 1
fi

# Verify temp file was created and has content
if [ ! -s "$TEMP_SCRIPT" ]; then
    debug "Error: Temporary script is empty or was not created"
    exit 1
fi

# Replace original script with new version
debug "Replacing original script..."
if ! mv "$TEMP_SCRIPT" "$YOUTUBE_SCRIPT"; then
    debug "Error: Failed to replace original script"
    exit 1
fi

debug "✅ Successfully updated YouTube Analysis script with new patterns"
