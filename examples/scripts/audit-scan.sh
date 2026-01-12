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
CYAN='\033[0;36m'
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

count_md_files() {
  if [[ -d "$1" ]]; then
    # Count all .md files recursively (commands/skills can have subfolders)
    find "$1" -type f -name "*.md" ! -name "README.md" 2>/dev/null | wc -l | tr -d ' '
  else
    echo "0"
  fi
}

count_script_files() {
  if [[ -d "$1" ]]; then
    # Count hook scripts (.sh, .js, .py, .ts)
    find "$1" -type f \( -name "*.sh" -o -name "*.js" -o -name "*.py" -o -name "*.ts" \) 2>/dev/null | wc -l | tr -d ' '
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
  if [[ -f "$1" ]]; then
    local count
    count=$(grep -c "$2" "$1" 2>/dev/null) || count="0"
    echo "$count"
  else
    echo "0"
  fi
}

# JSON helper - extract value without jq (fallback)
json_extract() {
  local file="$1"
  local key="$2"
  grep -oE "\"$key\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" "$file" 2>/dev/null | head -1 | sed 's/.*:[[:space:]]*"\([^"]*\)".*/\1/'
}

# JSON helper - extract keys from object (fallback)
json_keys() {
  local file="$1"
  grep -oE '"[a-zA-Z0-9_@/-]+"[[:space:]]*:' "$file" 2>/dev/null | sed 's/"//g;s/://g;s/[[:space:]]//g' | head -50
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

# Extensions (count .md files recursively, hooks are scripts)
AGENTS_COUNT=$(count_md_files "./.claude/agents")
COMMANDS_COUNT=$(count_md_files "./.claude/commands")
SKILLS_COUNT=$(count_md_files "./.claude/skills")
HOOKS_COUNT=$(count_script_files "./.claude/hooks")
RULES_COUNT=$(count_md_files "./.claude/rules")

# === ENHANCED STACK DETECTION ===

TECH_STACK="unknown"
STACK_FRAMEWORK=""
STACK_RUNTIME=""
STACK_TEST=""
STACK_BUNDLER=""
STACK_DB=""
STACK_INTEGRATIONS=""

# Detect by manifest file
if [[ -f "package.json" ]]; then
  TECH_STACK="nodejs"
  STACK_RUNTIME="Node.js"

  # Extract dependencies (with or without jq)
  DEPS=""
  DEV_DEPS=""
  if command -v jq &> /dev/null; then
    DEPS=$(jq -r '.dependencies // {} | keys[]' package.json 2>/dev/null | tr '\n' ' ')
    DEV_DEPS=$(jq -r '.devDependencies // {} | keys[]' package.json 2>/dev/null | tr '\n' ' ')
  else
    # Fallback: grep-based extraction
    DEPS=$(grep -A 1000 '"dependencies"' package.json 2>/dev/null | grep -B 1000 -m 1 '}' | grep -oE '"[^"]+":' | sed 's/"//g;s/://g' | tr '\n' ' ')
    DEV_DEPS=$(grep -A 1000 '"devDependencies"' package.json 2>/dev/null | grep -B 1000 -m 1 '}' | grep -oE '"[^"]+":' | sed 's/"//g;s/://g' | tr '\n' ' ')
  fi
  ALL_DEPS="$DEPS $DEV_DEPS"

  # Framework detection
  [[ "$ALL_DEPS" == *"next"* ]] && STACK_FRAMEWORK="Next.js"
  [[ "$ALL_DEPS" == *"nuxt"* ]] && STACK_FRAMEWORK="Nuxt"
  [[ "$ALL_DEPS" == *"@angular/core"* ]] && STACK_FRAMEWORK="Angular"
  [[ "$ALL_DEPS" == *"vue"* && -z "$STACK_FRAMEWORK" ]] && STACK_FRAMEWORK="Vue"
  [[ "$ALL_DEPS" == *"react"* && -z "$STACK_FRAMEWORK" ]] && STACK_FRAMEWORK="React"
  [[ "$ALL_DEPS" == *"express"* && -z "$STACK_FRAMEWORK" ]] && STACK_FRAMEWORK="Express"
  [[ "$ALL_DEPS" == *"fastify"* && -z "$STACK_FRAMEWORK" ]] && STACK_FRAMEWORK="Fastify"
  [[ "$ALL_DEPS" == *"nestjs"* || "$ALL_DEPS" == *"@nestjs/core"* ]] && STACK_FRAMEWORK="NestJS"
  [[ "$ALL_DEPS" == *"svelte"* ]] && STACK_FRAMEWORK="Svelte"
  [[ "$ALL_DEPS" == *"astro"* ]] && STACK_FRAMEWORK="Astro"
  [[ "$ALL_DEPS" == *"remix"* ]] && STACK_FRAMEWORK="Remix"

  # Test framework detection
  [[ "$ALL_DEPS" == *"vitest"* ]] && STACK_TEST="Vitest"
  [[ "$ALL_DEPS" == *"jest"* && -z "$STACK_TEST" ]] && STACK_TEST="Jest"
  [[ "$ALL_DEPS" == *"mocha"* && -z "$STACK_TEST" ]] && STACK_TEST="Mocha"
  [[ "$ALL_DEPS" == *"playwright"* ]] && STACK_TEST="${STACK_TEST:+$STACK_TEST + }Playwright"
  [[ "$ALL_DEPS" == *"cypress"* ]] && STACK_TEST="${STACK_TEST:+$STACK_TEST + }Cypress"

  # Bundler detection
  [[ "$ALL_DEPS" == *"vite"* ]] && STACK_BUNDLER="Vite"
  [[ "$ALL_DEPS" == *"webpack"* && -z "$STACK_BUNDLER" ]] && STACK_BUNDLER="Webpack"
  [[ "$ALL_DEPS" == *"esbuild"* && -z "$STACK_BUNDLER" ]] && STACK_BUNDLER="esbuild"
  [[ "$ALL_DEPS" == *"turbo"* ]] && STACK_BUNDLER="${STACK_BUNDLER:+$STACK_BUNDLER + }Turborepo"

  # Database/ORM detection
  [[ "$ALL_DEPS" == *"prisma"* || "$ALL_DEPS" == *"@prisma/client"* ]] && STACK_DB="Prisma"
  [[ "$ALL_DEPS" == *"drizzle"* ]] && STACK_DB="Drizzle"
  [[ "$ALL_DEPS" == *"typeorm"* ]] && STACK_DB="TypeORM"
  [[ "$ALL_DEPS" == *"mongoose"* ]] && STACK_DB="Mongoose (MongoDB)"
  [[ "$ALL_DEPS" == *"sequelize"* ]] && STACK_DB="Sequelize"

  # Key integrations detection (generic - look for notable packages)
  INTEGRATIONS_LIST=""
  # Auth
  [[ "$ALL_DEPS" == *"@clerk"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Clerk, "
  [[ "$ALL_DEPS" == *"next-auth"* || "$ALL_DEPS" == *"@auth/"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}NextAuth, "
  [[ "$ALL_DEPS" == *"@supabase"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Supabase, "
  [[ "$ALL_DEPS" == *"firebase"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Firebase, "
  # Payments
  [[ "$ALL_DEPS" == *"stripe"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Stripe, "
  # AI/ML
  [[ "$ALL_DEPS" == *"openai"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}OpenAI, "
  [[ "$ALL_DEPS" == *"@anthropic"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Anthropic, "
  [[ "$ALL_DEPS" == *"langchain"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}LangChain, "
  # Communication
  [[ "$ALL_DEPS" == *"@daily-co"* || "$ALL_DEPS" == *"daily-js"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Daily.co, "
  [[ "$ALL_DEPS" == *"twilio"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Twilio, "
  [[ "$ALL_DEPS" == *"sendgrid"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}SendGrid, "
  [[ "$ALL_DEPS" == *"resend"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Resend, "
  # Monitoring
  [[ "$ALL_DEPS" == *"@sentry"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Sentry, "
  [[ "$ALL_DEPS" == *"posthog"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}PostHog, "
  # CMS/Content
  [[ "$ALL_DEPS" == *"sanity"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Sanity, "
  [[ "$ALL_DEPS" == *"contentful"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Contentful, "
  # State management
  [[ "$ALL_DEPS" == *"zustand"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Zustand, "
  [[ "$ALL_DEPS" == *"@tanstack/react-query"* || "$ALL_DEPS" == *"react-query"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}TanStack Query, "
  [[ "$ALL_DEPS" == *"trpc"* || "$ALL_DEPS" == *"@trpc"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}tRPC, "
  # UI
  [[ "$ALL_DEPS" == *"tailwindcss"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Tailwind, "
  [[ "$ALL_DEPS" == *"@radix-ui"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}Radix UI, "
  [[ "$ALL_DEPS" == *"shadcn"* ]] && INTEGRATIONS_LIST="${INTEGRATIONS_LIST}shadcn/ui, "

  # Clean up trailing comma
  STACK_INTEGRATIONS=$(echo "$INTEGRATIONS_LIST" | sed 's/, $//')

elif [[ -f "pyproject.toml" ]] || [[ -f "requirements.txt" ]]; then
  TECH_STACK="python"
  STACK_RUNTIME="Python"

  # Python framework detection
  PYTHON_DEPS=""
  if [[ -f "requirements.txt" ]]; then
    PYTHON_DEPS=$(cat requirements.txt 2>/dev/null | tr '\n' ' ')
  fi
  if [[ -f "pyproject.toml" ]]; then
    PYTHON_DEPS="$PYTHON_DEPS $(cat pyproject.toml 2>/dev/null | tr '\n' ' ')"
  fi

  [[ "$PYTHON_DEPS" == *"django"* ]] && STACK_FRAMEWORK="Django"
  [[ "$PYTHON_DEPS" == *"fastapi"* ]] && STACK_FRAMEWORK="FastAPI"
  [[ "$PYTHON_DEPS" == *"flask"* && -z "$STACK_FRAMEWORK" ]] && STACK_FRAMEWORK="Flask"
  [[ "$PYTHON_DEPS" == *"pytest"* ]] && STACK_TEST="pytest"
  [[ "$PYTHON_DEPS" == *"sqlalchemy"* ]] && STACK_DB="SQLAlchemy"
  [[ "$PYTHON_DEPS" == *"prisma"* ]] && STACK_DB="Prisma"

elif [[ -f "go.mod" ]]; then
  TECH_STACK="go"
  STACK_RUNTIME="Go"
  [[ -f "go.mod" ]] && grep -q "gin-gonic" go.mod 2>/dev/null && STACK_FRAMEWORK="Gin"
  [[ -f "go.mod" ]] && grep -q "echo" go.mod 2>/dev/null && STACK_FRAMEWORK="Echo"

elif [[ -f "Cargo.toml" ]]; then
  TECH_STACK="rust"
  STACK_RUNTIME="Rust"
  [[ -f "Cargo.toml" ]] && grep -q "actix" Cargo.toml 2>/dev/null && STACK_FRAMEWORK="Actix"
  [[ -f "Cargo.toml" ]] && grep -q "axum" Cargo.toml 2>/dev/null && STACK_FRAMEWORK="Axum"

elif [[ -f "composer.json" ]]; then
  TECH_STACK="php"
  STACK_RUNTIME="PHP"
  [[ -f "composer.json" ]] && grep -q "laravel" composer.json 2>/dev/null && STACK_FRAMEWORK="Laravel"
  [[ -f "composer.json" ]] && grep -q "symfony" composer.json 2>/dev/null && STACK_FRAMEWORK="Symfony"
fi

# Quality patterns
HAS_SECURITY_HOOKS="false"
if [[ -d "./.claude/hooks" ]]; then
  grep -l "PreToolUse" ./.claude/hooks/* 2>/dev/null >/dev/null && HAS_SECURITY_HOOKS="true"
fi

# MCP servers detection
# Claude Code stores MCP config in multiple locations:
# 1. ~/.claude.json under projects.<cwd>.mcpServers (per-project, most common)
# 2. ~/.claude/mcp.json (legacy global)
# 3. ./.claude/mcp.json (project-level)
MCP_SERVERS=""
MCP_SOURCE=""
CURRENT_DIR=$(pwd)

# Check 1: Project-specific MCP in ~/.claude.json
if [[ -f "${HOME}/.claude.json" ]]; then
  if command -v jq &> /dev/null; then
    # Get MCP servers for current project path
    MCP_SERVERS=$(jq -r --arg path "$CURRENT_DIR" '.projects[$path].mcpServers // {} | keys[]' "${HOME}/.claude.json" 2>/dev/null | tr '\n' ',' | sed 's/,$//')
    if [[ -n "$MCP_SERVERS" ]]; then
      MCP_SOURCE="~/.claude.json (project)"
    fi
  else
    # Fallback: Try to find the project section and extract mcpServers keys
    # This is a simplified grep-based approach
    if grep -q "\"$CURRENT_DIR\"" "${HOME}/.claude.json" 2>/dev/null; then
      MCP_SERVERS=$(grep -A 100 "\"$CURRENT_DIR\"" "${HOME}/.claude.json" 2>/dev/null | grep -A 50 "mcpServers" | grep -oE '"[a-zA-Z0-9_-]+"[[:space:]]*:' | head -10 | sed 's/"//g;s/://g' | tr '\n' ',' | sed 's/,$//')
      if [[ -n "$MCP_SERVERS" ]]; then
        MCP_SOURCE="~/.claude.json (project)"
      fi
    fi
  fi
fi

# Check 2: Project-level .claude/mcp.json
if [[ -z "$MCP_SERVERS" && -f "./.claude/mcp.json" ]]; then
  if command -v jq &> /dev/null; then
    MCP_SERVERS=$(jq -r '.mcpServers // {} | keys[]' "./.claude/mcp.json" 2>/dev/null | tr '\n' ',' | sed 's/,$//')
    if [[ -n "$MCP_SERVERS" ]]; then
      MCP_SOURCE=".claude/mcp.json (project)"
    fi
  else
    MCP_SERVERS=$(grep -oE '"[a-zA-Z0-9_-]+"[[:space:]]*:' "./.claude/mcp.json" 2>/dev/null | head -20 | sed 's/"//g;s/://g' | tr '\n' ',' | sed 's/,$//')
    if [[ -n "$MCP_SERVERS" ]]; then
      MCP_SOURCE=".claude/mcp.json (project)"
    fi
  fi
fi

# Check 3: Legacy global ~/.claude/mcp.json
if [[ -z "$MCP_SERVERS" && -f "${GLOBAL_DIR}/mcp.json" ]]; then
  if command -v jq &> /dev/null; then
    MCP_SERVERS=$(jq -r '.mcpServers // {} | keys[]' "${GLOBAL_DIR}/mcp.json" 2>/dev/null | tr '\n' ',' | sed 's/,$//')
    if [[ -n "$MCP_SERVERS" ]]; then
      MCP_SOURCE="~/.claude/mcp.json (global)"
    fi
  else
    MCP_SERVERS=$(grep -oE '"[a-zA-Z0-9_-]+"[[:space:]]*:' "${GLOBAL_DIR}/mcp.json" 2>/dev/null | head -20 | sed 's/"//g;s/://g' | tr '\n' ',' | sed 's/,$//')
    if [[ -n "$MCP_SERVERS" ]]; then
      MCP_SOURCE="~/.claude/mcp.json (global)"
    fi
  fi
fi

# Count MCP servers
MCP_COUNT=0
if [[ -n "$MCP_SERVERS" ]]; then
  MCP_COUNT=$(echo "$MCP_SERVERS" | tr ',' '\n' | grep -c . || echo "0")
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
NEEDS_SSOT_REFACTOR="false"
if [[ -f "./CLAUDE.md" ]]; then
  grep -qE "^@|/docs/|/conventions/" "./CLAUDE.md" 2>/dev/null && HAS_SSOT="true"
  # Warning: large CLAUDE.md without @references should use SSoT pattern
  if [[ $CLAUDE_MD_LINES -gt 100 && $CLAUDE_MD_REFS -eq 0 ]]; then
    NEEDS_SSOT_REFACTOR="true"
  fi
fi

# === OUTPUT ===

if [[ "$OUTPUT_MODE" == "json" ]]; then
  # JSON output - ensure all values are properly formatted
  cat <<EOF
{
  "global": {
    "claude_md": $GLOBAL_CLAUDE_MD,
    "settings": $GLOBAL_SETTINGS,
    "mcp_json": $GLOBAL_MCP
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
  "stack": {
    "type": "$TECH_STACK",
    "runtime": "$STACK_RUNTIME",
    "framework": "$STACK_FRAMEWORK",
    "test": "$STACK_TEST",
    "bundler": "$STACK_BUNDLER",
    "database": "$STACK_DB",
    "integrations": "$STACK_INTEGRATIONS"
  },
  "quality": {
    "has_security_hooks": $HAS_SECURITY_HOOKS,
    "has_ssot_references": $HAS_SSOT,
    "needs_ssot_refactor": $NEEDS_SSOT_REFACTOR,
    "claude_md_lines": $CLAUDE_MD_LINES,
    "claude_md_refs": $CLAUDE_MD_REFS
  },
  "mcp": {
    "configured": $([ -n "$MCP_SERVERS" ] && echo "true" || echo "false"),
    "count": $MCP_COUNT,
    "servers": "$MCP_SERVERS",
    "source": "$MCP_SOURCE"
  }
}
EOF
else
  # Human-readable output
  echo -e "${BLUE}=== CLAUDE CODE SETUP AUDIT ===${NC}\n"

  # Stack recap at the top
  echo -e "${CYAN}💻 STACK DETECTED${NC}"
  if [[ "$TECH_STACK" != "unknown" ]]; then
    echo -e "  Runtime:      ${GREEN}$STACK_RUNTIME${NC}"
    [[ -n "$STACK_FRAMEWORK" ]] && echo -e "  Framework:    ${GREEN}$STACK_FRAMEWORK${NC}"
    [[ -n "$STACK_TEST" ]] && echo -e "  Testing:      $STACK_TEST"
    [[ -n "$STACK_BUNDLER" ]] && echo -e "  Bundler:      $STACK_BUNDLER"
    [[ -n "$STACK_DB" ]] && echo -e "  Database:     $STACK_DB"
    [[ -n "$STACK_INTEGRATIONS" ]] && echo -e "  Integrations: $STACK_INTEGRATIONS"
  else
    echo -e "  ${YELLOW}⚠️${NC}  Could not detect stack (no package.json, pyproject.toml, etc.)"
  fi

  echo -e "\n${BLUE}📁 GLOBAL CONFIG${NC} (~/.claude/)"
  [[ "$GLOBAL_CLAUDE_MD" == "true" ]] && echo -e "  ${GREEN}✅${NC} CLAUDE.md" || echo -e "  ${RED}❌${NC} CLAUDE.md"
  [[ "$GLOBAL_SETTINGS" == "true" ]] && echo -e "  ${GREEN}✅${NC} settings.json" || echo -e "  ${RED}❌${NC} settings.json"
  [[ "$GLOBAL_MCP" == "true" ]] && echo -e "  ${GREEN}✅${NC} mcp.json (legacy)" || echo -e "  ${YELLOW}⚠️${NC}  mcp.json (not required, MCP in ~/.claude.json)"

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

  echo -e "\n${BLUE}✨ QUALITY PATTERNS${NC}"
  [[ "$HAS_SECURITY_HOOKS" == "true" ]] && echo -e "  ${GREEN}✅${NC} Security hooks (PreToolUse)" || echo -e "  ${RED}❌${NC} Security hooks (recommended)"
  [[ "$HAS_SSOT" == "true" ]] && echo -e "  ${GREEN}✅${NC} Single Source of Truth (@refs)" || echo -e "  ${YELLOW}⚠️${NC}  SSoT pattern (recommended)"

  if [[ "$PROJECT_CLAUDE_MD" == "true" ]]; then
    echo -e "  ${BLUE}ℹ️${NC}  CLAUDE.md: $CLAUDE_MD_LINES lines, $CLAUDE_MD_REFS @references"
    if [[ "$NEEDS_SSOT_REFACTOR" == "true" ]]; then
      echo -e "    ${RED}⚠️${NC}  Large file without @refs → Consider SSoT pattern (split into @docs/)"
    elif [[ $CLAUDE_MD_LINES -gt 200 ]]; then
      echo -e "    ${YELLOW}⚠️${NC}  Consider shortening (>200 lines)"
    fi
  fi

  if [[ -n "$MCP_SERVERS" ]]; then
    echo -e "  ${GREEN}✅${NC} MCP servers ($MCP_COUNT): $MCP_SERVERS"
    echo -e "      ${BLUE}Source:${NC} $MCP_SOURCE"
  else
    echo -e "  ${YELLOW}⚠️${NC}  No MCP servers configured for this project"
  fi

  echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "Scan complete! Use ${YELLOW}--json${NC} flag for machine-readable output."
fi
