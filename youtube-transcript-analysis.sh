#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title YouTube Transcript (Analysis)
# @raycast.mode compact
# @raycast.packageName Fabric Tools
# @raycast.icon 📕

# Parameters:
# @raycast.argument1 { "type": "dropdown", "optional": true, "placeholder": "Analysis Pattern", "data": [ { "title": "Answer Interview Question", "value": "answer_interview_question" },{ "title": "Extract Primary Problem", "value": "extract_primary_problem" },{ "title": "Summarize Debate", "value": "summarize_debate" },{ "title": "Create Investigation Visualization", "value": "create_investigation_visualization" },{ "title": "Official Pattern Template", "value": "official_pattern_template" },{ "title": "Extract Extraordinary Claims", "value": "extract_extraordinary_claims" },{ "title": "Check Agreement", "value": "check_agreement" },{ "title": "Identify Job Stories", "value": "identify_job_stories" },{ "title": "Analyze Malware", "value": "analyze_malware" },{ "title": "Identify DSRP Distinctions", "value": "identify_dsrp_distinctions" },{ "title": "Create Sigma Rules", "value": "create_sigma_rules" },{ "title": "Suggest Pattern", "value": "suggest_pattern" },{ "title": "Recommend Talkpanel Topics", "value": "recommend_talkpanel_topics" },{ "title": "Create Network Threat Landscape", "value": "create_network_threat_landscape" },{ "title": "Label And Rate", "value": "label_and_rate" },{ "title": "Philocapsulate", "value": "philocapsulate" },{ "title": "Tweet", "value": "tweet" },{ "title": "Judge Output", "value": "judge_output" },{ "title": "Analyze Relationships", "value": "analyze_relationships" },{ "title": "Recommend Artists", "value": "recommend_artists" },{ "title": "Explain Terms", "value": "explain_terms" },{ "title": "Extract Wisdom DM", "value": "extract_wisdom_dm" },{ "title": "Analyze Comments", "value": "analyze_comments" },{ "title": "Create Recursive Outline", "value": "create_recursive_outline" },{ "title": "Rate AI Response", "value": "rate_ai_response" },{ "title": "Analyze Military Strategy", "value": "analyze_military_strategy" },{ "title": "Extract Ideas", "value": "extract_ideas" },{ "title": "Get Wow Per Minute", "value": "get_wow_per_minute" },{ "title": "Analyze Threat Report", "value": "analyze_threat_report" },{ "title": "Extract Skills", "value": "extract_skills" },{ "title": "Create NPC", "value": "create_npc" },{ "title": "Create Quiz", "value": "create_quiz" },{ "title": "Create Story Explanation", "value": "create_story_explanation" },{ "title": "Extract Jokes", "value": "extract_jokes" },{ "title": "Analyze Prose", "value": "analyze_prose" },{ "title": "Analyze Logs", "value": "analyze_logs" },{ "title": "Enrich Blog Post", "value": "enrich_blog_post" },{ "title": "Extract Algorithm Update Recommendations", "value": "extract_algorithm_update_recommendations" },{ "title": "Create Aphorisms", "value": "create_aphorisms" },{ "title": "Analyze Videos", "value": "analyze_videos" },{ "title": "Create Markmap Visualization", "value": "create_markmap_visualization" },{ "title": "Raw Query", "value": "raw_query" },{ "title": "Export Data As CSV", "value": "export_data_as_csv" },{ "title": "Summarize Paper", "value": "summarize_paper" },{ "title": "Summarize Git Diff", "value": "summarize_git_diff" },{ "title": "Analyze Presentation", "value": "analyze_presentation" },{ "title": "Analyze Prose Json", "value": "analyze_prose_json" },{ "title": "Analyze Proposition", "value": "analyze_proposition" },{ "title": "Create Design Document", "value": "create_design_document" },{ "title": "Extract Questions", "value": "extract_questions" },{ "title": "Extract Wisdom Nometa", "value": "extract_wisdom_nometa" },{ "title": "Extract Controversial Ideas", "value": "extract_controversial_ideas" },{ "title": "Summarize Micro", "value": "summarize_micro" },{ "title": "Capture Thinkers Work", "value": "capture_thinkers_work" },{ "title": "Analyze Candidates", "value": "analyze_candidates" },{ "title": "Translate", "value": "translate" },{ "title": "Create Better Frame", "value": "create_better_frame" },{ "title": "Create PRD", "value": "create_prd" },{ "title": "Analyze Interviewer Techniques", "value": "analyze_interviewer_techniques" },{ "title": "Extract Sponsors", "value": "extract_sponsors" },{ "title": "Create Micro Summary", "value": "create_micro_summary" },{ "title": "Give Relationship Advice", "value": "give_relationship_advice" },{ "title": "Extract Article Wisdom", "value": "extract_article_wisdom" },{ "title": "Identify DSRP Systems", "value": "identify_dsrp_systems" },{ "title": "Create Security Update", "value": "create_security_update" },{ "title": "Write Micro Essay", "value": "write_micro_essay" },{ "title": "Create Academic Paper", "value": "create_academic_paper" },{ "title": "Extract Wisdom", "value": "extract_wisdom" },{ "title": "Extract Wisdom Agents", "value": "extract_wisdom_agents" },{ "title": "Analyze Claims", "value": "analyze_claims" },{ "title": "Write Nuclei Template Rule", "value": "write_nuclei_template_rule" },{ "title": "Analyze Answers", "value": "analyze_answers" },{ "title": "Create Stride Threat Model", "value": "create_stride_threat_model" },{ "title": "Analyze Risk", "value": "analyze_risk" },{ "title": "Summarize Lecture", "value": "summarize_lecture" },{ "title": "Create Hormozi Offer", "value": "create_hormozi_offer" },{ "title": "Create Ttrc Narrative", "value": "create_ttrc_narrative" },{ "title": "Rate AI Result", "value": "rate_ai_result" },{ "title": "Write Semgrep Rule", "value": "write_semgrep_rule" },{ "title": "Compare And Contrast", "value": "compare_and_contrast" },{ "title": "Extract Book Recommendations", "value": "extract_book_recommendations" },{ "title": "Summarize", "value": "summarize" },{ "title": "Extract Latest Video", "value": "extract_latest_video" },{ "title": "Create Mermaid Visualization", "value": "create_mermaid_visualization" },{ "title": "Analyze Email Headers", "value": "analyze_email_headers" },{ "title": "Extract Videoid", "value": "extract_videoid" },{ "title": "Write Pull-Request", "value": "write_pull-request" },{ "title": "Improve Academic Writing", "value": "improve_academic_writing" },{ "title": "Write Essay", "value": "write_essay" },{ "title": "Ask Secure By Design Questions", "value": "ask_secure_by_design_questions" },{ "title": "Create Keynote", "value": "create_keynote" },{ "title": "Analyze Mistakes", "value": "analyze_mistakes" },{ "title": "Extract Most Redeeming Thing", "value": "extract_most_redeeming_thing" },{ "title": "Extract Primary Solution", "value": "extract_primary_solution" },{ "title": "Md Callout", "value": "md_callout" },{ "title": "Create User Story", "value": "create_user_story" },{ "title": "Rate Content", "value": "rate_content" },{ "title": "Analyze Threat Report Cmds", "value": "analyze_threat_report_cmds" },{ "title": "Create Video Chapters", "value": "create_video_chapters" },{ "title": "Get Youtube RSS", "value": "get_youtube_rss" },{ "title": "To Flashcards", "value": "to_flashcards" },{ "title": "Find Logical Fallacies", "value": "find_logical_fallacies" },{ "title": "Summarize RPG Session", "value": "summarize_rpg_session" },{ "title": "Create AI Jobs Analysis", "value": "create_ai_jobs_analysis" },{ "title": "Extract Business Ideas", "value": "extract_business_ideas" },{ "title": "Create Graph From Input", "value": "create_graph_from_input" },{ "title": "Extract Recipe", "value": "extract_recipe" },{ "title": "Solve With COT", "value": "solve_with_cot" },{ "title": "Explain Project", "value": "explain_project" },{ "title": "Create Show Intro", "value": "create_show_intro" },{ "title": "Create Report Finding", "value": "create_report_finding" },{ "title": "Extract Book Ideas", "value": "extract_book_ideas" },{ "title": "Analyze CFP Submission", "value": "analyze_cfp_submission" },{ "title": "Summarize Legislation", "value": "summarize_legislation" },{ "title": "Create RPG Summary", "value": "create_rpg_summary" },{ "title": "Create Visualization", "value": "create_visualization" },{ "title": "AI", "value": "ai" },{ "title": "Extract References", "value": "extract_references" },{ "title": "Identify DSRP Perspectives", "value": "identify_dsrp_perspectives" },{ "title": "Raycast", "value": "raycast" },{ "title": "Create 5 Sentence Summary", "value": "create_5_sentence_summary" },{ "title": "Sanitize Broken HTML To Markdown", "value": "sanitize_broken_html_to_markdown" },{ "title": "Summarize Pull-Requests", "value": "summarize_pull-requests" },{ "title": "Create Cyber Summary", "value": "create_cyber_summary" },{ "title": "Extract POC", "value": "extract_poc" },{ "title": "Refine Design Document", "value": "refine_design_document" },{ "title": "Extract Song Meaning", "value": "extract_song_meaning" },{ "title": "Humanize", "value": "humanize" },{ "title": "Improve Writing", "value": "improve_writing" },{ "title": "Analyze Tech Impact", "value": "analyze_tech_impact" },{ "title": "Extract CTF Writeup", "value": "extract_ctf_writeup" },{ "title": "Extract Texting Tips", "value": "extract_texting_tips" },{ "title": "Create Formal Email", "value": "create_formal_email" },{ "title": "Extract Health Recommendations", "value": "extract_health_recommendations" },{ "title": "Coding Master", "value": "coding_master" },{ "title": "Extract Core Message", "value": "extract_core_message" },{ "title": "Dialog With Socrates", "value": "dialog_with_socrates" },{ "title": "Prepare 7S Strategy", "value": "prepare_7s_strategy" },{ "title": "Find Hidden Message", "value": "find_hidden_message" },{ "title": "Summarize Git Changes", "value": "summarize_git_changes" },{ "title": "Extract Recommendations", "value": "extract_recommendations" },{ "title": "Create Idea Compass", "value": "create_idea_compass" },{ "title": "Rate Value", "value": "rate_value" },{ "title": "Identify DSRP Relationships", "value": "identify_dsrp_relationships" },{ "title": "Analyze Paper", "value": "analyze_paper" },{ "title": "Create Threat Scenarios", "value": "create_threat_scenarios" },{ "title": "Create DIY", "value": "create_diy" },{ "title": "Create Ttrc Graph", "value": "create_ttrc_graph" },{ "title": "Extract Insights", "value": "extract_insights" },{ "title": "Analyze Debate", "value": "analyze_debate" },{ "title": "Transcribe Minutes", "value": "transcribe_minutes" },{ "title": "Create Prediction Block", "value": "create_prediction_block" },{ "title": "Create Pattern", "value": "create_pattern" },{ "title": "Write Latex", "value": "write_latex" },{ "title": "Summarize Meeting", "value": "summarize_meeting" },{ "title": "Explain Code", "value": "explain_code" },{ "title": "Analyze Personality", "value": "analyze_personality" },{ "title": "Extract Product Features", "value": "extract_product_features" },{ "title": "Show Fabric Options Markmap", "value": "show_fabric_options_markmap" },{ "title": "Analyze Sales Call", "value": "analyze_sales_call" },{ "title": "Analyze Patent", "value": "analyze_patent" },{ "title": "Extract Predictions", "value": "extract_predictions" },{ "title": "Analyze Threat Report Trends", "value": "analyze_threat_report_trends" },{ "title": "Extract Instructions", "value": "extract_instructions" },{ "title": "Analyze Product Feedback", "value": "analyze_product_feedback" },{ "title": "Provide Guidance", "value": "provide_guidance" },{ "title": "Explain Math", "value": "explain_math" },{ "title": "Create Command", "value": "create_command" },{ "title": "Understand Relationships", "value": "understand_relationships" },{ "title": "Review Design", "value": "review_design" },{ "title": "Clean Text", "value": "clean_text" },{ "title": "Improve Prompt", "value": "improve_prompt" },{ "title": "Create Art Prompt", "value": "create_art_prompt" },{ "title": "Analyze Incident", "value": "analyze_incident" },{ "title": "Create Git Diff Commit", "value": "create_git_diff_commit" },{ "title": "Explain Docs", "value": "explain_docs" },{ "title": "Ask Uncle Duke", "value": "ask_uncle_duke" },{ "title": "Summarize Prompt", "value": "summarize_prompt" },{ "title": "Create Logo", "value": "create_logo" },{ "title": "Analyze Prose Pinker", "value": "analyze_prose_pinker" },{ "title": "Create Newsletter Entry", "value": "create_newsletter_entry" },{ "title": "Write Hackerone Report", "value": "write_hackerone_report" },{ "title": "Recommend Pipeline Upgrades", "value": "recommend_pipeline_upgrades" },{ "title": "Summarize Newsletter", "value": "summarize_newsletter" },{ "title": "Create Reading Plan", "value": "create_reading_plan" },{ "title": "Create Summary", "value": "create_summary" },{ "title": "Extract Main Idea", "value": "extract_main_idea" },{ "title": "Create Mermaid Visualization For Github", "value": "create_mermaid_visualization_for_github" },{ "title": "Extract Patterns", "value": "extract_patterns" },{ "title": "Improve Report Finding", "value": "improve_report_finding" },{ "title": "Agility Story", "value": "agility_story" },{ "title": "Convert To Markdown", "value": "convert_to_markdown" },{ "title": "Create Tags", "value": "create_tags" },{ "title": "Extract Insights DM", "value": "extract_insights_dm" },{ "title": "Create Coding Project", "value": "create_coding_project" },{ "title": "Create Upgrade Pack", "value": "create_upgrade_pack" },{ "title": "Analyze Spiritual Text", "value": "analyze_spiritual_text" } ] }
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
readonly TRANSCRIPT_CACHE_TTL=$((30*24*60*60))  # 30 days in seconds
readonly PATTERN_CACHE_TTL=$((7*24*60*60))      # 7 days in seconds
readonly TIMEOUT_TRANSCRIPT=15                   # seconds
readonly TIMEOUT_PATTERN=15                      # seconds

# Add debug function at the start of the script
debug() {
    printf "Debug: %s\n" "$*" >&2
}

# Initialize cache directories
init_cache() {
    mkdir -p "$TRANSCRIPT_CACHE_DIR" "$PATTERN_CACHE_DIR"
}

set -euo pipefail

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

get_youtube_transcript() {
    local url="$1"
    local cache_file="${TRANSCRIPT_CACHE_DIR}/$(echo -n "$url" | shasum -a 256 | cut -d' ' -f1)"

    # Check cache
    if [ -f "$cache_file" ]; then
        local file_age=$(($(date +%s) - $(stat -f %m "$cache_file")))
        if [ $file_age -lt "$TRANSCRIPT_CACHE_TTL" ]; then
            debug "Using cached transcript from $cache_file"
            cat "$cache_file"
            return 0
        fi
    fi

    debug "Fetching YouTube transcript for $url"
    local transcript
    if ! transcript=$(timeout "${TIMEOUT_TRANSCRIPT}s" fabric -y "$url" 2>&1); then
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
    if ! result=$(timeout "${TIMEOUT_PATTERN}s" fabric -p "$pattern" <<<"$transcript" 2>&1); then
        local exit_code=$?
        case $exit_code in
            124) echo "Error: Pattern processing timed out" >&2 ;;
            62) echo "Error: Rate limit exceeded. Please try again later" >&2 ;;
            *) echo "Error processing with pattern: $result" >&2 ;;
        esac
        return 1
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

# Move the main function call to the end of the file
main "$@"

main "$@"
