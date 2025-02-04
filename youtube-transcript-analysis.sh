#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title YouTube Transcript (Analysis)
# @raycast.mode compact
# @raycast.packageName Fabric Tools
# @raycast.icon 📕

# Parameters:
# @raycast.argument1 { "type": "dropdown", "optional": true, "placeholder": "Analysis Pattern", "data": [ { "title": "agility story", "value": "agility_story" },{ "title": "ai", "value": "ai" },{ "title": "analyze answers", "value": "analyze_answers" },{ "title": "analyze candidates", "value": "analyze_candidates" },{ "title": "analyze cfp submission", "value": "analyze_cfp_submission" },{ "title": "analyze claims", "value": "analyze_claims" },{ "title": "analyze comments", "value": "analyze_comments" },{ "title": "analyze debate", "value": "analyze_debate" },{ "title": "analyze email headers", "value": "analyze_email_headers" },{ "title": "analyze incident", "value": "analyze_incident" },{ "title": "analyze interviewer techniques", "value": "analyze_interviewer_techniques" },{ "title": "analyze logs", "value": "analyze_logs" },{ "title": "analyze malware", "value": "analyze_malware" },{ "title": "analyze military strategy", "value": "analyze_military_strategy" },{ "title": "analyze mistakes", "value": "analyze_mistakes" },{ "title": "analyze paper", "value": "analyze_paper" },{ "title": "analyze patent", "value": "analyze_patent" },{ "title": "analyze personality", "value": "analyze_personality" },{ "title": "analyze presentation", "value": "analyze_presentation" },{ "title": "analyze product feedback", "value": "analyze_product_feedback" },{ "title": "analyze proposition", "value": "analyze_proposition" },{ "title": "analyze prose", "value": "analyze_prose" },{ "title": "analyze prose json", "value": "analyze_prose_json" },{ "title": "analyze prose pinker", "value": "analyze_prose_pinker" },{ "title": "analyze relationships", "value": "analyze_relationships" },{ "title": "analyze risk", "value": "analyze_risk" },{ "title": "analyze sales call", "value": "analyze_sales_call" },{ "title": "analyze spiritual text", "value": "analyze_spiritual_text" },{ "title": "analyze tech impact", "value": "analyze_tech_impact" },{ "title": "analyze threat report", "value": "analyze_threat_report" },{ "title": "analyze threat report cmds", "value": "analyze_threat_report_cmds" },{ "title": "analyze threat report trends", "value": "analyze_threat_report_trends" },{ "title": "analyze videos", "value": "analyze_videos" },{ "title": "answer interview question", "value": "answer_interview_question" },{ "title": "ask secure by design questions", "value": "ask_secure_by_design_questions" },{ "title": "ask uncle duke", "value": "ask_uncle_duke" },{ "title": "capture thinkers work", "value": "capture_thinkers_work" },{ "title": "check agreement", "value": "check_agreement" },{ "title": "clean text", "value": "clean_text" },{ "title": "coding master", "value": "coding_master" },{ "title": "compare and contrast", "value": "compare_and_contrast" },{ "title": "convert to markdown", "value": "convert_to_markdown" },{ "title": "create 5 sentence summary", "value": "create_5_sentence_summary" },{ "title": "create academic paper", "value": "create_academic_paper" },{ "title": "create ai jobs analysis", "value": "create_ai_jobs_analysis" },{ "title": "create aphorisms", "value": "create_aphorisms" },{ "title": "create art prompt", "value": "create_art_prompt" },{ "title": "create better frame", "value": "create_better_frame" },{ "title": "create coding project", "value": "create_coding_project" },{ "title": "create command", "value": "create_command" },{ "title": "create cyber summary", "value": "create_cyber_summary" },{ "title": "create design document", "value": "create_design_document" },{ "title": "create diy", "value": "create_diy" },{ "title": "create formal email", "value": "create_formal_email" },{ "title": "create git diff commit", "value": "create_git_diff_commit" },{ "title": "create graph from input", "value": "create_graph_from_input" },{ "title": "create hormozi offer", "value": "create_hormozi_offer" },{ "title": "create idea compass", "value": "create_idea_compass" },{ "title": "create investigation visualization", "value": "create_investigation_visualization" },{ "title": "create keynote", "value": "create_keynote" },{ "title": "create logo", "value": "create_logo" },{ "title": "create markmap visualization", "value": "create_markmap_visualization" },{ "title": "create mermaid visualization", "value": "create_mermaid_visualization" },{ "title": "create mermaid visualization for github", "value": "create_mermaid_visualization_for_github" },{ "title": "create micro summary", "value": "create_micro_summary" },{ "title": "create network threat landscape", "value": "create_network_threat_landscape" },{ "title": "create newsletter entry", "value": "create_newsletter_entry" },{ "title": "create npc", "value": "create_npc" },{ "title": "create pattern", "value": "create_pattern" },{ "title": "create prd", "value": "create_prd" },{ "title": "create prediction block", "value": "create_prediction_block" },{ "title": "create quiz", "value": "create_quiz" },{ "title": "create reading plan", "value": "create_reading_plan" },{ "title": "create recursive outline", "value": "create_recursive_outline" },{ "title": "create report finding", "value": "create_report_finding" },{ "title": "create rpg summary", "value": "create_rpg_summary" },{ "title": "create security update", "value": "create_security_update" },{ "title": "create show intro", "value": "create_show_intro" },{ "title": "create sigma rules", "value": "create_sigma_rules" },{ "title": "create story explanation", "value": "create_story_explanation" },{ "title": "create stride threat model", "value": "create_stride_threat_model" },{ "title": "create summary", "value": "create_summary" },{ "title": "create tags", "value": "create_tags" },{ "title": "create threat scenarios", "value": "create_threat_scenarios" },{ "title": "create ttrc graph", "value": "create_ttrc_graph" },{ "title": "create ttrc narrative", "value": "create_ttrc_narrative" },{ "title": "create upgrade pack", "value": "create_upgrade_pack" },{ "title": "create user story", "value": "create_user_story" },{ "title": "create video chapters", "value": "create_video_chapters" },{ "title": "create visualization", "value": "create_visualization" },{ "title": "dialog with socrates", "value": "dialog_with_socrates" },{ "title": "enrich blog post", "value": "enrich_blog_post" },{ "title": "explain code", "value": "explain_code" },{ "title": "explain docs", "value": "explain_docs" },{ "title": "explain math", "value": "explain_math" },{ "title": "explain project", "value": "explain_project" },{ "title": "explain terms", "value": "explain_terms" },{ "title": "export data as csv", "value": "export_data_as_csv" },{ "title": "extract algorithm update recommendations", "value": "extract_algorithm_update_recommendations" },{ "title": "extract article wisdom", "value": "extract_article_wisdom" },{ "title": "extract book ideas", "value": "extract_book_ideas" },{ "title": "extract book recommendations", "value": "extract_book_recommendations" },{ "title": "extract business ideas", "value": "extract_business_ideas" },{ "title": "extract controversial ideas", "value": "extract_controversial_ideas" },{ "title": "extract core message", "value": "extract_core_message" },{ "title": "extract ctf writeup", "value": "extract_ctf_writeup" },{ "title": "extract extraordinary claims", "value": "extract_extraordinary_claims" },{ "title": "extract health recommendations", "value": "extract_health_recommendations" },{ "title": "extract ideas", "value": "extract_ideas" },{ "title": "extract insights", "value": "extract_insights" },{ "title": "extract insights dm", "value": "extract_insights_dm" },{ "title": "extract instructions", "value": "extract_instructions" },{ "title": "extract jokes", "value": "extract_jokes" },{ "title": "extract latest video", "value": "extract_latest_video" },{ "title": "extract main idea", "value": "extract_main_idea" },{ "title": "extract most redeeming thing", "value": "extract_most_redeeming_thing" },{ "title": "extract patterns", "value": "extract_patterns" },{ "title": "extract poc", "value": "extract_poc" },{ "title": "extract predictions", "value": "extract_predictions" },{ "title": "extract primary problem", "value": "extract_primary_problem" },{ "title": "extract primary solution", "value": "extract_primary_solution" },{ "title": "extract product features", "value": "extract_product_features" },{ "title": "extract questions", "value": "extract_questions" },{ "title": "extract recipe", "value": "extract_recipe" },{ "title": "extract recommendations", "value": "extract_recommendations" },{ "title": "extract references", "value": "extract_references" },{ "title": "extract skills", "value": "extract_skills" },{ "title": "extract song meaning", "value": "extract_song_meaning" },{ "title": "extract sponsors", "value": "extract_sponsors" },{ "title": "extract texting tips", "value": "extract_texting_tips" },{ "title": "extract videoid", "value": "extract_videoid" },{ "title": "extract wisdom", "value": "extract_wisdom" },{ "title": "extract wisdom agents", "value": "extract_wisdom_agents" },{ "title": "extract wisdom dm", "value": "extract_wisdom_dm" },{ "title": "extract wisdom nometa", "value": "extract_wisdom_nometa" },{ "title": "find hidden message", "value": "find_hidden_message" },{ "title": "find logical fallacies", "value": "find_logical_fallacies" },{ "title": "get wow per minute", "value": "get_wow_per_minute" },{ "title": "get youtube rss", "value": "get_youtube_rss" },{ "title": "give relationship advice", "value": "give_relationship_advice" },{ "title": "humanize", "value": "humanize" },{ "title": "identify dsrp distinctions", "value": "identify_dsrp_distinctions" },{ "title": "identify dsrp perspectives", "value": "identify_dsrp_perspectives" },{ "title": "identify dsrp relationships", "value": "identify_dsrp_relationships" },{ "title": "identify dsrp systems", "value": "identify_dsrp_systems" },{ "title": "identify job stories", "value": "identify_job_stories" },{ "title": "improve academic writing", "value": "improve_academic_writing" },{ "title": "improve prompt", "value": "improve_prompt" },{ "title": "improve report finding", "value": "improve_report_finding" },{ "title": "improve writing", "value": "improve_writing" },{ "title": "judge output", "value": "judge_output" },{ "title": "label and rate", "value": "label_and_rate" },{ "title": "md callout", "value": "md_callout" },{ "title": "official pattern template", "value": "official_pattern_template" },{ "title": "philocapsulate", "value": "philocapsulate" },{ "title": "prepare 7s strategy", "value": "prepare_7s_strategy" },{ "title": "provide guidance", "value": "provide_guidance" },{ "title": "rate ai response", "value": "rate_ai_response" },{ "title": "rate ai result", "value": "rate_ai_result" },{ "title": "rate content", "value": "rate_content" },{ "title": "rate value", "value": "rate_value" },{ "title": "raw query", "value": "raw_query" },{ "title": "raycast", "value": "raycast" },{ "title": "recommend artists", "value": "recommend_artists" },{ "title": "recommend pipeline upgrades", "value": "recommend_pipeline_upgrades" },{ "title": "recommend talkpanel topics", "value": "recommend_talkpanel_topics" },{ "title": "refine design document", "value": "refine_design_document" },{ "title": "review design", "value": "review_design" },{ "title": "sanitize broken html to markdown", "value": "sanitize_broken_html_to_markdown" },{ "title": "show fabric options markmap", "value": "show_fabric_options_markmap" },{ "title": "solve with cot", "value": "solve_with_cot" },{ "title": "suggest pattern", "value": "suggest_pattern" },{ "title": "summarize", "value": "summarize" },{ "title": "summarize debate", "value": "summarize_debate" },{ "title": "summarize git changes", "value": "summarize_git_changes" },{ "title": "summarize git diff", "value": "summarize_git_diff" },{ "title": "summarize lecture", "value": "summarize_lecture" },{ "title": "summarize legislation", "value": "summarize_legislation" },{ "title": "summarize meeting", "value": "summarize_meeting" },{ "title": "summarize micro", "value": "summarize_micro" },{ "title": "summarize newsletter", "value": "summarize_newsletter" },{ "title": "summarize paper", "value": "summarize_paper" },{ "title": "summarize prompt", "value": "summarize_prompt" },{ "title": "summarize pull-requests", "value": "summarize_pull-requests" },{ "title": "summarize rpg session", "value": "summarize_rpg_session" },{ "title": "to flashcards", "value": "to_flashcards" },{ "title": "transcribe minutes", "value": "transcribe_minutes" },{ "title": "translate", "value": "translate" },{ "title": "tweet", "value": "tweet" },{ "title": "understand relationships", "value": "understand_relationships" },{ "title": "write essay", "value": "write_essay" },{ "title": "write hackerone report", "value": "write_hackerone_report" },{ "title": "write latex", "value": "write_latex" },{ "title": "write micro essay", "value": "write_micro_essay" },{ "title": "write nuclei template rule", "value": "write_nuclei_template_rule" },{ "title": "write pull-request", "value": "write_pull-request" },{ "title": "write semgrep rule", "value": "write_semgrep_rule" } ] }
# @raycast.argument2 { "type": "text", "optional": true, "placeholder": "URL (or current browser URL)" }

# Documentation:
# @raycast.description Get AI analysis of YouTube videos using Fabric
# @raycast.author Brannon Lucas
# @raycast.authorURL https://github.com/bral

# Dependencies:
# @raycast.dependencies ["fabric >= 1.0.0"]

# Constants
readonly CACHE_DIR="${HOME}/.cache/raycast/youtube"
readonly TRANSCRIPT_CACHE_DIR="${CACHE_DIR}/transcripts"
readonly PATTERN_CACHE_DIR="${CACHE_DIR}/patterns"
readonly TRANSCRIPT_CACHE_TTL=$((30*24*60*60))   # 30 days in seconds
readonly PATTERN_CACHE_TTL=$((7*24*60*60))       # 7 days in seconds
readonly TIMEOUT_TRANSCRIPT=360                   # seconds
readonly TIMEOUT_PATTERN=360                      # seconds
readonly OBSIDIAN_VAULT="/Users/brannonlucas/Documents/Obsidian Vault/Youtube Transcripts"    # Optional vault path

# Global variables for Fabric configuration
FABRIC_DEFAULT_VENDOR=""
FABRIC_DEFAULT_MODEL=""

# Add debug function at the start of the script
debug() {
    if [[ -n "${DEBUG:-}" ]]; then
        printf "Debug: %s\n" "$*" >&2
    fi
}

# Initialize cache directories
init_cache() {
    mkdir -p "$TRANSCRIPT_CACHE_DIR" "$PATTERN_CACHE_DIR"
}

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

get_default_fabric_model() {
    # Run fabric -d and send empty responses to the prompts using printf
    output=$(printf '\n\n' | fabric -d)

    # Set global variables for vendor and model
    FABRIC_DEFAULT_VENDOR=$(echo "$output" | grep "DEFAULT_VENDOR:" | awk '{print $2}')
    FABRIC_DEFAULT_MODEL=$(echo "$output" | grep "DEFAULT_MODEL:" | awk '{print $2}')

    debug "Current Fabric Configuration - Vendor: $FABRIC_DEFAULT_VENDOR, Model: $FABRIC_DEFAULT_MODEL"
}

get_browser_url() {
    debug "Checking frontmost application..."

    # Get frontmost app
    local frontmost_app
    frontmost_app=$(osascript -e 'tell application "System Events" to get name of first process whose frontmost is true' 2>&1)
    debug "Frontmost application is: '$frontmost_app'"

    # Try to get URL using generic browser pattern
    local url
    url=$(osascript -e "tell application \"$frontmost_app\" to get URL of active tab of front window" 2>/dev/null) || true
    debug "URL attempt result: '$url'"

    if [[ -z "$url" ]]; then
        # Set specific error message based on what we found
        printf "Current application '%s' is not a supported browser\n" "$frontmost_app" >&2
        return 1
    fi

    debug "Final retrieved URL: '$url'"
    echo "$url"
}

get_video_title() {
    local url="$1"
    local title

    # Try to get title using curl and grep
    if ! title=$(curl -s "$url" | grep -o '<title>[^<]*' | sed 's/<title>//; s/ - YouTube//'); then
        debug "Failed to get video title, using timestamp instead"
        title=$(date +%Y%m%d%H%M%S)
    fi

    # Sanitize the title for use in filename
    title=$(echo "$title" | tr -dc '[:alnum:] ._-' | tr -s ' ' | tr ' ' '-')
    echo "$title"
}

get_youtube_transcript() {
    local url="$1"
    local cache_file="${TRANSCRIPT_CACHE_DIR}/$(echo -n "$url" | shasum -a 256 | cut -d' ' -f1)"

    # Check cache
    if [ -f "$cache_file" ]; then
        local file_age=$(($(date +%s) - $(stat -f %m "$cache_file")))
        if [ $file_age -lt "$TRANSCRIPT_CACHE_TTL" ]; then
            debug "Using cached transcript from $cache_file"
            echo "Using cached transcript" >&2
            cat "$cache_file"
            return 0
        fi
    fi

    debug "Fetching YouTube transcript for $url"
    local transcript
    if ! transcript=$(perl -e 'alarm shift; exec @ARGV' "${TIMEOUT_TRANSCRIPT}" fabric -y "$url" 2>&1); then
        local exit_code=$?
        case $exit_code in
            124) echo "Error: Transcript fetch timed out" >&2 ;;
            60) echo "Error: Video is private or unavailable" >&2 ;;
            61) echo "Error: Video is too long" >&2 ;;
            *) echo "Error fetching transcript: $transcript" >&2 ;;
        esac
        return 1
    fi

    echo "$transcript" > "$cache_file"
    debug "Cached transcript to $cache_file"
    echo "$transcript"
}

save_to_obsidian() {
    local transcript="$1"
    local url="$2"

    # If not defined or doesn't exist, skip
    [[ -z "$OBSIDIAN_VAULT" || ! -d "$OBSIDIAN_VAULT" ]] && return 0

    local title="$(get_video_title "$url")"
    local filename="${OBSIDIAN_VAULT}/YouTube-${title}.md"

    if [ -f "$filename" ]; then
        debug "Transcript already exists in Obsidian: $filename"
        echo "ℹ️ Transcript already exists in Obsidian vault"
        return 0
    fi

    local timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    {
      echo "---"
      echo "title: \"${title}\""
      echo "url: \"${url}\""
      echo "date: \"${timestamp}\""
      echo "type: youtube-transcript"
      echo "status: needs_analysis"
      echo "---"
      echo
      echo "$transcript"
    } > "$filename"

    debug "Saved transcript as: $filename"
}

is_thinking_model() {
    local model="${1:-$FABRIC_DEFAULT_MODEL}"
    case "$model" in
        "o1*"|"o3*")
            return 0  # true
            ;;
        *)
            return 1  # false
            ;;
    esac
}

process_with_pattern() {
    local transcript="$1"
    local pattern="${2:-summarize}"
    local cache_file="${PATTERN_CACHE_DIR}/$(echo -n "$transcript-$pattern" | shasum -a 256 | cut -d' ' -f1)"

    # Check cache
    if [ -f "$cache_file" ]; then
        local file_age=$(($(date +%s) - $(stat -f %m "$cache_file")))
        if [ $file_age -lt "$PATTERN_CACHE_TTL" ]; then
            debug "Using cached pattern result from $cache_file"
            cat "$cache_file"
            return 0
        fi
    fi

    debug "Processing transcript with pattern: $pattern"
    local result
    local fabric_cmd="fabric"

    # Get current model and check if it's a thinking model
    get_default_fabric_model
    if is_thinking_model; then
        debug "Using thinking model ($FABRIC_DEFAULT_MODEL) - no temperature/streaming support"
        fabric_cmd="fabric -m $FABRIC_DEFAULT_MODEL"
    fi

    if ! result=$(perl -e 'alarm shift; exec @ARGV' "${TIMEOUT_PATTERN}s" $fabric_cmd -p "$pattern" <<<"$transcript" 2>&1); then
        local exit_code=$?
        case $exit_code in
            124) echo "Error: Pattern processing timed out" >&2 ;;
            62) echo "Error: Rate limit exceeded. Please try again later" >&2 ;;
            *)
                if [ $exit_code -ne 0 ]; then
                    echo "Error: Pattern processing failed with exit code $exit_code" >&2
                    echo "$result" >&2
                fi
            ;;
        esac
        return $exit_code
    fi

    echo "$result" > "$cache_file"
    debug "Cached pattern result to $cache_file"
    echo "$result"
}

validate_youtube_url() {
    debug "Starting URL validation function"
    local url="$1"
    debug "Received URL: '$url'"

    # Comprehensive YouTube URL regex
    local youtube_regex='^(https?://)?(www\.)?(youtube\.com/(watch|shorts)\?v=|youtu\.be/)[a-zA-Z0-9_-]+([&?][a-zA-Z0-9_=-]*)*$'

    if [[ ! $url =~ $youtube_regex ]]; then
        debug "URL validation failed"
        echo "Error: Invalid YouTube URL. Please provide a valid YouTube video URL." >&2
        return 1
    fi

    debug "URL validation passed"
    return 0
}

main() {
    set -euo pipefail

    # Initialize cache directories at startup
    init_cache

    local url=""
    local pattern="${1:-}"  # Changed to allow empty pattern
    debug "Pattern argument: '$pattern'"

    # Handle URL argument
    if [ -n "${2:-}" ]; then
        url="$2"
        debug "Using provided URL argument: '$url'"
    fi

    # If no URL provided, try to get it from browser
    if [ -z "$url" ]; then
        if ! url=$(get_browser_url); then
            echo "Error: Please switch to a browser window with a YouTube video or provide a URL directly." >&2
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

    # Get transcript
    local transcript
    if ! transcript=$(get_youtube_transcript "$url"); then
        exit 1
    fi

     # Save transcript to Obsidian if vault is configured
    save_to_obsidian "$transcript" "$url"
    [ -n "$OBSIDIAN_VAULT" ] && echo "✅ Transcript saved to Obsidian vault!"

    # If no pattern specified, copy transcript directly to clipboard
    if [ -z "$pattern" ]; then
        echo "$transcript" | pbcopy
        debug "Transcript copied to clipboard"
        echo "✅ Transcript copied to clipboard!"
        exit 0
    fi

    # Otherwise process with pattern
    local result
    if ! result=$(process_with_pattern "$transcript" "$pattern"); then
        exit 1
    fi

    # Copy pattern result to clipboard
    echo "$result" | pbcopy
    debug "Result copied to clipboard"

    echo "✅ Analysis copied to clipboard!"
}

main "$@"
