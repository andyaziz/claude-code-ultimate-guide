#!/bin/bash
# Fetch latest Claude Code releases and show diff
# Usage: ./scripts/update-cc-releases.sh
#
# This script fetches the official CHANGELOG and shows new versions
# You then manually add the condensed entries to claude-code-releases.yaml

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
RELEASES_FILE="$REPO_DIR/machine-readable/claude-code-releases.yaml"
CHANGELOG_URL="https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md"
TMP_FILE="/tmp/claude-code-changelog.md"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "=== Claude Code Releases Update ==="
echo ""

# Get current version from our YAML
CURRENT_VERSION=$(grep "^latest:" "$RELEASES_FILE" | cut -d'"' -f2)
echo -e "${BLUE}Current tracked version:${NC} $CURRENT_VERSION"

# Fetch latest CHANGELOG
echo -e "${BLUE}Fetching official CHANGELOG...${NC}"
curl -sL "$CHANGELOG_URL" -o "$TMP_FILE"

if [ ! -s "$TMP_FILE" ]; then
    echo "ERROR: Failed to fetch CHANGELOG"
    exit 1
fi

# Extract latest version from CHANGELOG (format: "## X.Y.Z")
LATEST_VERSION=$(grep -oE "^## [0-9]+\.[0-9]+\.[0-9]+" "$TMP_FILE" | head -1 | sed 's/## //')
echo -e "${BLUE}Latest official version:${NC} $LATEST_VERSION"
echo ""

# Compare versions
if [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
    echo -e "${GREEN}✓ Already up to date!${NC}"
    rm -f "$TMP_FILE"
    exit 0
fi

echo -e "${YELLOW}⚠ New versions available!${NC}"
echo ""

# Show new versions (between current and latest)
echo -e "${BLUE}New releases since $CURRENT_VERSION:${NC}"
echo "────────────────────────────────────────"

# Extract versions newer than current
awk -v current="$CURRENT_VERSION" '
    /^## [0-9]+\.[0-9]+\.[0-9]+/ {
        match($0, /[0-9]+\.[0-9]+\.[0-9]+/)
        ver = substr($0, RSTART, RLENGTH)
        if (ver == current) exit
        in_version = 1
        print ""
        print $0
        next
    }
    in_version { print }
' "$TMP_FILE" | head -100

echo ""
echo "────────────────────────────────────────"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "1. Review the changes above"
echo "2. Add condensed entries to: machine-readable/claude-code-releases.yaml"
echo "3. Update guide/claude-code-releases.md"
echo "4. Update 'latest' and 'updated' fields"
echo "5. Run: ./scripts/check-landing-sync.sh"
echo ""
echo -e "${BLUE}Full CHANGELOG saved to:${NC} $TMP_FILE"
echo ""
echo "Tip: Use Claude to help condense the entries:"
echo "  claude -p \"Condense these release notes for claude-code-releases.yaml: \$(cat $TMP_FILE | head -200)\""
