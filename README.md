# raycast-fabric

1. A README.md file with:
```markdown
# YouTube Video Analysis for Raycast

Analyze YouTube videos using AI through Raycast.

## Features
- Get summaries of YouTube videos
- Extract key insights and wisdom
- Analyze claims made in videos
- Cache results for faster repeat access
- Support for multiple browsers

## Prerequisites
1. [Go](https://go.dev/doc/install)
2. [Fabric](https://github.com/danielmiessler/fabric)
3. [Raycast](https://www.raycast.com)

## Installation
1. Install Go: Follow instructions at https://go.dev/doc/install
2. Install Fabric:
   ```bash
   go install github.com/danielmiessler/fabric@latest
   ```
3. Copy the script to your Raycast Scripts directory
4. Make it executable:
   ```bash
   chmod +x path/to/script
   ```
5. Restart Raycast

## Usage
1. Open Raycast
2. Type "YouTube Analysis"
3. Enter a URL or let it use the current browser tab
4. Choose an analysis pattern
5. Wait for results!

## Troubleshooting
- Make sure Go is installed and in your PATH
- Verify Fabric is installed: `which fabric`
- Check browser permissions in System Settings
```
