#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title YouTube Summary
# @raycast.mode fullOutput
# @raycast.packageName YouTube Tools
# @raycast.icon 📕

# Optional parameters:
# @raycast.argument1 { "type": "text", "optional": true, "placeholder": "URL (or will use current browser URL)" }

# Documentation:
# @raycast.description Get AI summary of YouTube video using Fabric
# @raycast.author Brannon
# @raycast.authorURL https://github.com/bral

# Dependencies:
# @raycast.dependencies ["fabric >= 1.0.0"]

# Add debug function at the start of the script
debug() {
    echo "Debug: $*" >&2
}

set -euo pipefail

readonly SUPPORTED_BROWSERS=(
    "Google Chrome:URL of active tab of front window"
    "Safari:URL of current tab of front window"
    "Arc:URL of active tab of front window"
    "Brave Browser:URL of active tab of front window"
    "Firefox:URL of active tab of front window"
)

check_fabric() {
    echo "Debug: Checking for Fabric installation..." >&2

    # Add all possible Go binary locations to PATH, including mise path
    export PATH="$PATH:$HOME/go/bin:/usr/local/go/bin:/opt/homebrew/bin:/opt/homebrew/opt/go/bin:$HOME/.local/share/mise/installs/go/*/bin"
    echo "Debug: Updated PATH: $PATH" >&2

    # Try multiple possible fabric locations
    local possible_paths=(
        "$HOME/.local/share/mise/installs/go/*/bin/fabric"  # mise-managed fabric
        "$HOME/go/bin/fabric"
        "/usr/local/go/bin/fabric"
        "/opt/homebrew/bin/fabric"
        "/opt/homebrew/opt/go/bin/fabric"
        "$(which fabric 2>/dev/null || echo '')"
    )

    local fabric_found=false
    for path in "${possible_paths[@]}"; do
        # Handle glob patterns
        for actual_path in $path; do
            echo "Debug: Checking path: $actual_path" >&2
            if [ -x "$actual_path" ]; then
                echo "Debug: Found Fabric at: $actual_path" >&2
                export PATH="$(dirname "$actual_path"):$PATH"
                fabric_found=true
                break 2
            fi
        done
    done

    if [ "$fabric_found" = false ]; then
        echo "Error: Fabric not found. Install it with: go install github.com/danielmiessler/fabric@latest" >&2
        echo "Note: Make sure Go is installed and Fabric is in your PATH" >&2
        exit 1
    fi

    # Check fabric version
    echo "Debug: Fabric found. Checking version..." >&2
    local fabric_version
    fabric_version=$(fabric --version 2>&1) || true
    echo "Debug: Fabric version: $fabric_version" >&2

    echo "Debug: Fabric check passed" >&2
}

get_browser_url() {
    # First check which app is frontmost
    echo "Debug: Checking frontmost application..." >&2
    local frontmost_app
    frontmost_app=$(osascript -e 'tell application "System Events" to get name of first process whose frontmost is true' 2>&1)
    echo "Debug: Frontmost application is: '$frontmost_app'" >&2

    local url=""
    # Check frontmost app first
    if [[ "$frontmost_app" == "Arc" ]]; then
        echo "Debug: Attempting to get Arc URL..." >&2
        url=$(osascript -e 'tell application "Arc" to get URL of active tab of front window' 2>&1) || true
        echo "Debug: Arc URL attempt result: '$url'" >&2
    elif [[ "$frontmost_app" == "Google Chrome" ]]; then
        echo "Debug: Attempting to get Chrome URL..." >&2
        url=$(osascript -e 'tell application "Google Chrome" to get URL of active tab of front window' 2>&1) || true
        echo "Debug: Chrome URL attempt result: '$url'" >&2
    elif [[ "$frontmost_app" == "Safari" ]]; then
        echo "Debug: Attempting to get Safari URL..." >&2
        url=$(osascript -e 'tell application "Safari" to get URL of current tab of front window' 2>&1) || true
        echo "Debug: Safari URL attempt result: '$url'" >&2
    fi

    # If frontmost app failed, try other browsers as fallback
    if [ -z "$url" ]; then
        echo "Debug: Frontmost browser failed or not a browser, trying others..." >&2
        for browser in "Arc" "Google Chrome" "Safari" "Brave Browser" "Firefox"; do
            echo "Debug: Trying $browser..." >&2
            url=$(osascript -e "tell application \"$browser\" to get URL of active tab of front window" 2>/dev/null) || true
            if [ ! -z "$url" ]; then
                echo "Debug: Got URL from $browser" >&2
                break
            fi
        done
    fi

    if [ -z "$url" ]; then
        echo "Debug: No URL found in any browser" >&2
        return 1
    fi

    echo "Debug: Final retrieved URL: '$url'" >&2
    echo "$url"
}

get_yt_summary() {
    local url="$1"
    local pattern="${2:-summarize}"  # Default to summarize if no pattern specified
    local cache_dir="${HOME}/.cache/raycast/youtube-summaries"
    # Use more secure hash function
    local cache_file="${cache_dir}/$(echo -n "$url" | shasum -a 256 | cut -d' ' -f1)"

    # Create cache directory if it doesn't exist
    mkdir -p "$cache_dir"

    # Add cache file max age (30 days)
    local max_age=$((30*24*60*60))  # 30 days in seconds

    # Check cache and its age
    if [ -f "$cache_file" ]; then
        local file_age=$(($(date +%s) - $(stat -f %m "$cache_file")))
        if [ $file_age -lt $max_age ]; then
            debug "Using cached result from $cache_file"
            cat "$cache_file"
            return 0
        fi
    fi

    local output
    # First get YouTube content, then pipe it through summarize pattern
    if ! output=$(timeout 30s fabric -y "$url" | fabric -p summarize 2>&1); then
        local exit_code=$?
        case $exit_code in
            124) echo "Error: Summarization timed out" >&2 ;;
            60) echo "Error: Video is private or unavailable" >&2 ;;
            61) echo "Error: Video is too long for summarization" >&2 ;;
            62) echo "Error: Rate limit exceeded. Please try again later" >&2 ;;
            *) echo "Error processing with Fabric: $output" >&2 ;;
        esac
        return 1
    fi

    # Cache the successful result
    echo "$output" > "$cache_file"
    debug "Cached result to $cache_file"
    echo "$output"
}

validate_youtube_url() {
    echo "Debug: Starting URL validation function" >&2
    local url="$1"
    echo "Debug: Received URL: '$url'" >&2
    local youtube_regex='^(https?://)?(www\.)?(youtube\.com/(watch|shorts)\?v=|youtu\.be/)[a-zA-Z0-9_-]+([&?][a-zA-Z0-9_=-]*)*$'

    # Temporarily disable exit on error and save current options
    local old_opts=$-
    set +e

    if [[ ! $url =~ $youtube_regex ]]; then
        local status=$?
        echo "Debug: Regex match failed with status $status" >&2
        echo "Error: Invalid YouTube URL. Please provide a valid YouTube video URL." >&2
        # Restore previous options
        if [[ $old_opts =~ e ]]; then set -e; fi
        exit 1
    fi

    # Restore previous options
    if [[ $old_opts =~ e ]]; then set -e; fi

    echo "Debug: URL validation passed" >&2
    return 0
}

main() {
    local url=""
    local pattern="summarize"  # Set default pattern

    # Handle arguments with proper checks
    if [ -n "${1:-}" ]; then
        url="$1"
        debug "Using provided URL argument: '$url'"
    fi

    if [ -n "${2:-}" ]; then
        pattern="$2"
    fi
    debug "Using pattern: '$pattern'"

    # If no URL provided, try to get it from browser
    if [ -z "$url" ]; then
        debug "Getting URL from browser..."
        if ! url=$(get_browser_url); then
            echo "Error: No URL found. Please make sure you're on a browser window or provide a URL." >&2
            exit 1
        fi
    fi

    debug "URL to process: '$url'"

    if ! validate_youtube_url "$url"; then
        echo "Error: Invalid YouTube URL" >&2
        exit 1
    fi

    debug "URL validation passed, checking Fabric..."
    check_fabric

    debug "Getting YouTube content and generating analysis..."
    local result
    if ! result=$(get_yt_summary "$url" "$pattern"); then
        exit 1
    fi

    # Copy to clipboard and open Raycast AI
    echo "$result" | pbcopy
    open "raycast://ai"

    echo "Analysis copied to clipboard!" >&2
}

main "$@"
