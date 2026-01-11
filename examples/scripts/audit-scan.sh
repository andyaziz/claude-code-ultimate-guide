#!/bin/bash
# claude-audit-scan.sh - Fast Claude Code setup scanner
#
# Scans your Claude Code configuration (global + project) and outputs
# a structured report of what's configured, what's missing, and quality patterns.
#
# Usage:
#   ./audit-scan.sh           # Human-readable output (default)
#   ./audit-scan.sh --json    # JSON output for Claude processing
#   ./audit-scan.sh --help    # Show this help

set -euo pipefail

# Colors for human output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Output mode (default: human)
OUTPUT_MODE="human"

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --json)
      OUTPUT_MODE="json"
      shift
      ;;
    --help|-h)
      grep '^#' "$0" | sed 's/^# \?//'
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use --help for usage information"
      exit 1
      ;;
  esac
done

# Helper functions
check_file() {
  [[ -f "$1" ]] && echo "true" || echo "false"
}

count_files() {
  if [[ -d "$1" ]]; then
    find "$1" -maxdepth 1 -type f 2>/dev/null | wc -l | tr -d ' '
  else
    echo "0"
  fi
}

check_pattern() {
  local file="$1"
  local pattern="$2"
  if [[ -f "$file" ]]; then
    grep -q "$pattern" "$file" 2>/dev/null && echo "true" || echo "false"
  else
    echo "false"
  fi
}

get_file_lines() {
  [[ -f "$1" ]] && wc -l < "$1" | tr -d ' ' || echo "0"
}

count_pattern() {
  [[ -f "$1" ]] && grep -c "$2" "$1" 2>/dev/null || echo "0"
}

# Expand home directory
GLOBAL_DIR="${HOME}/.claude"

# === DATA COLLECTION ===

# Global config
GLOBAL_CLAUDE_MD=$(check_file "${GLOBAL_DIR}/CLAUDE.md")
GLOBAL_SETTINGS=$(check_file "${GLOBAL_DIR}/settings.json")
GLOBAL_MCP=$(check_file "${GLOBAL_DIR}/mcp.json")

# Project config
PROJECT_CLAUDE_MD=$(check_file "./CLAUDE.md")
LOCAL_CLAUDE_MD=$(check_file "./.claude/CLAUDE.md")
PROJECT_SETTINGS=$(check_file "./.claude/settings.json")
LOCAL_SETTINGS=$(check_file "./.claude/settings.local.json")

# Extensions
AGENTS_COUNT=$(count_files "./.claude/agents")
COMMANDS_COUNT=$(count_files "./.claude/commands")
SKILLS_COUNT=$(count_files "./.claude/skills")
HOOKS_COUNT=$(count_files "./.claude/hooks")
RULES_COUNT=$(count_files "./.claude/rules")

# Tech stack detection
TECH_STACK="unknown"
if [[ -f "package.json" ]]; then
  TECH_STACK="nodejs"
elif [[ -f "pyproject.toml" ]] || [[ -f "requirements.txt" ]]; then
  TECH_STACK="python"
elif [[ -f "go.mod" ]]; then
  TECH_STACK="go"
elif [[ -f "Cargo.toml" ]]; then
  TECH_STACK="rust"
elif [[ -f "composer.json" ]]; then
  TECH_STACK="php"
fi

# Quality patterns
HAS_SECURITY_HOOKS="false"
if [[ -d "./.claude/hooks" ]]; then
  grep -l "PreToolUse" ./.claude/hooks/* 2>/dev/null >/dev/null && HAS_SECURITY_HOOKS="true"
fi

# MCP servers (check global config)
MCP_SERVERS=""
if [[ -f "${GLOBAL_DIR}/mcp.json" ]]; then
  # Extract server names (works with or without jq)
  if command -v jq &> /dev/null; then
    MCP_SERVERS=$(jq -r '.mcpServers | keys[]' "${GLOBAL_DIR}/mcp.json" 2>/dev/null | tr '\n' ',' | sed 's/,$//')
  else
    # Fallback: simple grep
    MCP_SERVERS=$(grep -oE '"[a-zA-Z0-9_-]+"\\s*:' "${GLOBAL_DIR}/mcp.json" 2>/dev/null | sed 's/"//g;s/://g' | tr '\n' ',' | sed 's/,$//')
  fi
fi

# Memory file quality (if exists)
CLAUDE_MD_LINES="0"
CLAUDE_MD_REFS="0"
if [[ -f "./CLAUDE.md" ]]; then
  CLAUDE_MD_LINES=$(get_file_lines "./CLAUDE.md")
  CLAUDE_MD_REFS=$(count_pattern "./CLAUDE.md" "@")
fi

# Single Source of Truth pattern
HAS_SSOT="false"
if [[ -f "./CLAUDE.md" ]]; then
  grep -qE "^@|/docs/|/conventions/" "./CLAUDE.md" 2>/dev/null && HAS_SSOT="true"
fi

# === OUTPUT ===

if [[ "$OUTPUT_MODE" == "json" ]]; then
  # JSON output
  cat <<EOF
{
  "global": {
    "claude_md": $GLOBAL_CLAUDE_MD,
    "settings": $GLOBAL_SETTINGS,
    "mcp": $GLOBAL_MCP
  },
  "project": {
    "claude_md": $PROJECT_CLAUDE_MD,
    "local_claude_md": $LOCAL_CLAUDE_MD,
    "settings": $PROJECT_SETTINGS,
    "local_settings": $LOCAL_SETTINGS
  },
  "extensions": {
    "agents": $AGENTS_COUNT,
    "commands": $COMMANDS_COUNT,
    "skills": $SKILLS_COUNT,
    "hooks": $HOOKS_COUNT,
    "rules": $RULES_COUNT
  },
  "tech_stack": "$TECH_STACK",
  "quality": {
    "has_security_hooks": $HAS_SECURITY_HOOKS,
    "has_ssot_references": $HAS_SSOT,
    "claude_md_lines": $CLAUDE_MD_LINES,
    "claude_md_refs": $CLAUDE_MD_REFS,
    "mcp_servers": "$MCP_SERVERS"
  }
}
EOF
else
  # Human-readable output
  echo -e "${BLUE}=== CLAUDE CODE SETUP AUDIT ===${NC}\n"

  echo -e "${BLUE}📁 GLOBAL CONFIG${NC} (~/.claude/)"
  [[ "$GLOBAL_CLAUDE_MD" == "true" ]] && echo -e "  ${GREEN}✅${NC} CLAUDE.md" || echo -e "  ${RED}❌${NC} CLAUDE.md"
  [[ "$GLOBAL_SETTINGS" == "true" ]] && echo -e "  ${GREEN}✅${NC} settings.json" || echo -e "  ${RED}❌${NC} settings.json"
  [[ "$GLOBAL_MCP" == "true" ]] && echo -e "  ${GREEN}✅${NC} mcp.json" || echo -e "  ${RED}❌${NC} mcp.json"

  echo -e "\n${BLUE}📁 PROJECT CONFIG${NC} (./)"
  [[ "$PROJECT_CLAUDE_MD" == "true" ]] && echo -e "  ${GREEN}✅${NC} CLAUDE.md" || echo -e "  ${YELLOW}⚠️${NC}  CLAUDE.md (recommended)"
  [[ "$LOCAL_CLAUDE_MD" == "true" ]] && echo -e "  ${GREEN}✅${NC} .claude/CLAUDE.md (local)" || echo -e "  ${YELLOW}⚠️${NC}  .claude/CLAUDE.md (optional)"
  [[ "$PROJECT_SETTINGS" == "true" ]] && echo -e "  ${GREEN}✅${NC} .claude/settings.json" || echo -e "  ${YELLOW}⚠️${NC}  .claude/settings.json (optional)"

  echo -e "\n${BLUE}🔧 EXTENSIONS${NC} (.claude/)"
  echo -e "  Agents:   $AGENTS_COUNT"
  echo -e "  Commands: $COMMANDS_COUNT"
  echo -e "  Skills:   $SKILLS_COUNT"
  echo -e "  Hooks:    $HOOKS_COUNT"
  echo -e "  Rules:    $RULES_COUNT"

  echo -e "\n${BLUE}💻 TECH STACK${NC}"
  echo -e "  Detected: $TECH_STACK"

  echo -e "\n${BLUE}✨ QUALITY PATTERNS${NC}"
  [[ "$HAS_SECURITY_HOOKS" == "true" ]] && echo -e "  ${GREEN}✅${NC} Security hooks (PreToolUse)" || echo -e "  ${RED}❌${NC} Security hooks (recommended)"
  [[ "$HAS_SSOT" == "true" ]] && echo -e "  ${GREEN}✅${NC} Single Source of Truth (@refs)" || echo -e "  ${YELLOW}⚠️${NC}  SSoT pattern (recommended)"

  if [[ "$PROJECT_CLAUDE_MD" == "true" ]]; then
    echo -e "  ${BLUE}ℹ️${NC}  CLAUDE.md: $CLAUDE_MD_LINES lines, $CLAUDE_MD_REFS @references"
    if [[ $CLAUDE_MD_LINES -gt 200 ]]; then
      echo -e "    ${YELLOW}⚠️${NC}  Consider shortening (>200 lines)"
    fi
  fi

  if [[ -n "$MCP_SERVERS" ]]; then
    echo -e "  ${GREEN}✅${NC} MCP servers: $MCP_SERVERS"
  else
    echo -e "  ${YELLOW}⚠️${NC}  No MCP servers configured"
  fi

  echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "Scan complete! Use ${YELLOW}--json${NC} flag for machine-readable output."
fi
