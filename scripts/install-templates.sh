#!/bin/bash
# Claude Code Ultimate Guide - Template Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/scripts/install-templates.sh | bash -s -- [type] [name]
#
# Examples:
#   ./install-templates.sh list                          # List all available templates
#   ./install-templates.sh agent security-reviewer       # Install a specific agent
#   ./install-templates.sh hook dangerous-actions-blocker # Install a specific hook
#   ./install-templates.sh command pr                    # Install a specific command

set -e

REPO_RAW="https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main"
CLAUDE_DIR=".claude"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

show_help() {
    echo -e "${BLUE}Claude Code Ultimate Guide - Template Installer${NC}"
    echo ""
    echo "Usage:"
    echo "  $0 list                    List all available templates"
    echo "  $0 agent <name>            Install an agent template"
    echo "  $0 hook <name>             Install a hook (bash)"
    echo "  $0 command <name>          Install a slash command"
    echo "  $0 skill <name>            Install a skill"
    echo "  $0 memory <name>           Install a CLAUDE.md template"
    echo ""
    echo "Examples:"
    echo "  $0 list"
    echo "  $0 agent security-reviewer"
    echo "  $0 hook dangerous-actions-blocker"
    echo "  $0 command pr"
    echo "  $0 command release-notes"
    echo ""
    echo "Templates are installed to .claude/ directory"
}

list_templates() {
    echo -e "${BLUE}📦 Available Templates${NC}"
    echo ""

    echo -e "${GREEN}Agents:${NC}"
    echo "  security-reviewer, performance-auditor, migration-assistant,"
    echo "  accessibility-auditor, documentation-writer, refactoring-specialist,"
    echo "  test-coverage-analyst, dependency-updater, code-reviewer"
    echo ""

    echo -e "${GREEN}Hooks (bash):${NC}"
    echo "  dangerous-actions-blocker, prompt-injection-detector, unicode-injection-scanner,"
    echo "  repo-integrity-scanner, mcp-config-integrity, output-secrets-scanner,"
    echo "  notification, auto-format, security-check, session-logger, claudemd-scanner"
    echo ""

    echo -e "${GREEN}Commands:${NC}"
    echo "  pr, release-notes, sonarqube, commit, diagnose, generate-tests,"
    echo "  review-pr, git-worktree, validate-changes, quiz,"
    echo "  catchup, security, refactor, explain, optimize, ship"
    echo ""

    echo -e "${GREEN}Skills:${NC}"
    echo "  pdf-generator, TDD, backend-architect, security-guardian,"
    echo "  bilan-hebdo-tech-product, skill-creator, using-git-worktree"
    echo ""

    echo -e "${GREEN}Memory (CLAUDE.md templates):${NC}"
    echo "  minimal, comprehensive, nextjs, python, rust, security-focused"
    echo ""

    echo -e "${YELLOW}Tip:${NC} Run '$0 <type> <name>' to install"
}

ensure_dir() {
    local dir="$1"
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo -e "${YELLOW}Created directory: $dir${NC}"
    fi
}

install_agent() {
    local name="$1"
    local dest_dir="${CLAUDE_DIR}/agents"
    local dest_file="${dest_dir}/${name}.md"
    local url="${REPO_RAW}/examples/agents/${name}.md"

    ensure_dir "$dest_dir"

    echo -e "${BLUE}Downloading agent: ${name}...${NC}"
    if curl -fsSL "$url" -o "$dest_file" 2>/dev/null; then
        echo -e "${GREEN}✓ Installed: ${dest_file}${NC}"
    else
        echo -e "${RED}✗ Failed to download agent: ${name}${NC}"
        echo "  Check available agents with: $0 list"
        exit 1
    fi
}

install_hook() {
    local name="$1"
    local dest_dir="${CLAUDE_DIR}/hooks"
    local dest_file="${dest_dir}/${name}.sh"
    local url="${REPO_RAW}/examples/hooks/bash/${name}.sh"

    ensure_dir "$dest_dir"

    echo -e "${BLUE}Downloading hook: ${name}...${NC}"
    if curl -fsSL "$url" -o "$dest_file" 2>/dev/null; then
        chmod +x "$dest_file"
        echo -e "${GREEN}✓ Installed: ${dest_file}${NC}"
        echo -e "${YELLOW}Note: Configure in settings.json to enable this hook${NC}"
    else
        echo -e "${RED}✗ Failed to download hook: ${name}${NC}"
        echo "  Check available hooks with: $0 list"
        exit 1
    fi
}

install_command() {
    local name="$1"
    local dest_dir="${CLAUDE_DIR}/commands"
    local dest_file="${dest_dir}/${name}.md"
    local url="${REPO_RAW}/examples/commands/${name}.md"

    ensure_dir "$dest_dir"

    echo -e "${BLUE}Downloading command: ${name}...${NC}"
    if curl -fsSL "$url" -o "$dest_file" 2>/dev/null; then
        echo -e "${GREEN}✓ Installed: ${dest_file}${NC}"
        echo -e "${YELLOW}Use with: /${name} in Claude Code${NC}"
    else
        echo -e "${RED}✗ Failed to download command: ${name}${NC}"
        echo "  Check available commands with: $0 list"
        exit 1
    fi
}

install_skill() {
    local name="$1"
    local dest_dir="${CLAUDE_DIR}/skills"
    local dest_file="${dest_dir}/${name}.md"
    local url="${REPO_RAW}/examples/skills/${name}.md"

    ensure_dir "$dest_dir"

    echo -e "${BLUE}Downloading skill: ${name}...${NC}"
    if curl -fsSL "$url" -o "$dest_file" 2>/dev/null; then
        echo -e "${GREEN}✓ Installed: ${dest_file}${NC}"
    else
        echo -e "${RED}✗ Failed to download skill: ${name}${NC}"
        echo "  Check available skills with: $0 list"
        exit 1
    fi
}

install_memory() {
    local name="$1"
    local dest_file="CLAUDE.md"
    local url="${REPO_RAW}/examples/memory/${name}.md"

    if [ -f "$dest_file" ]; then
        echo -e "${YELLOW}Warning: CLAUDE.md already exists${NC}"
        read -p "Overwrite? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Aborted."
            exit 0
        fi
    fi

    echo -e "${BLUE}Downloading memory template: ${name}...${NC}"
    if curl -fsSL "$url" -o "$dest_file" 2>/dev/null; then
        echo -e "${GREEN}✓ Installed: ${dest_file}${NC}"
        echo -e "${YELLOW}Customize this file for your project${NC}"
    else
        echo -e "${RED}✗ Failed to download memory template: ${name}${NC}"
        echo "  Check available templates with: $0 list"
        exit 1
    fi
}

# Main
case "${1:-}" in
    ""|help|--help|-h)
        show_help
        ;;
    list)
        list_templates
        ;;
    agent)
        [ -z "${2:-}" ] && { echo -e "${RED}Error: Agent name required${NC}"; exit 1; }
        install_agent "$2"
        ;;
    hook)
        [ -z "${2:-}" ] && { echo -e "${RED}Error: Hook name required${NC}"; exit 1; }
        install_hook "$2"
        ;;
    command)
        [ -z "${2:-}" ] && { echo -e "${RED}Error: Command name required${NC}"; exit 1; }
        install_command "$2"
        ;;
    skill)
        [ -z "${2:-}" ] && { echo -e "${RED}Error: Skill name required${NC}"; exit 1; }
        install_skill "$2"
        ;;
    memory)
        [ -z "${2:-}" ] && { echo -e "${RED}Error: Memory template name required${NC}"; exit 1; }
        install_memory "$2"
        ;;
    *)
        echo -e "${RED}Unknown type: $1${NC}"
        echo "Use: agent, hook, command, skill, memory"
        exit 1
        ;;
esac
