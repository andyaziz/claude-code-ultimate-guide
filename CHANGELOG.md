# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- **Production-ready slash commands** in examples/commands/ (~25 KB)
  - **pr.md** (5.8 KB) - PR creation with scope analysis
    - Complexity scoring algorithm (code files × 2 + tests × 0.5 + directories × 3 + commits)
    - Scope coherence detection (related vs unrelated changes)
    - Semi-automatic split suggestions with git commands
    - Conventional commit format enforcement
    - Complete PR template with TLDR + description + test checklist
  - **release-notes.md** (7.2 KB) - Generate release notes in 3 formats
    - CHANGELOG.md format (Keep a Changelog standard)
    - GitHub Release / PR body format
    - User announcement format (tech-to-product language transformation)
    - Database migration detection (Prisma, Sequelize, Django, Alembic)
    - Semantic versioning determination from commit types
  - **sonarqube.md** (11.3 KB) - Analyze SonarCloud quality issues for PRs
    - Environment variable configuration ($SONARQUBE_TOKEN, $SONAR_PROJECT_KEY)
    - Bash script wrapper to handle zsh authentication issues
    - Node.js analysis script for grouping issues by rule and severity
    - Executive summary with top violators and action plan
    - Severity mapping (BLOCKER/CRITICAL → 🔴, MAJOR → 🟡, MINOR/INFO → 🔵)
- **Production-ready hooks** in examples/hooks/bash/ (~6.5 KB)
  - **dangerous-actions-blocker.sh** (5.2 KB) - PreToolUse security hook
    - Blocks destructive commands (rm -rf /, fork bombs, dd if=, mkfs)
    - Blocks git force push to main/master branches
    - Blocks npm/pnpm/yarn publish without confirmation
    - Detects secrets in commands (password=, api_key=, token= patterns)
    - Protects sensitive files (.env, credentials.json, SSH keys, .npmrc)
    - Path validation with $ALLOWED_PATHS environment variable
    - Generic implementation using $CLAUDE_PROJECT_DIR with fallback to pwd
  - **notification.sh** (1.3 KB) - Notification hook with contextual macOS alerts
    - 5 contextual sound mappings (success, error, waiting, warning, default)
    - Keyword-based context detection (completed/done → Hero.aiff, error/failed → Basso.aiff)
    - Non-blocking background execution
    - Native macOS notifications with osascript
    - Multi-language support (English/French keywords)
- **Comprehensive hooks documentation**
  - **examples/hooks/README.md** (12.4 KB) - Complete hook system guide
    - Available hooks table with 6 hook examples across events
    - Hook events reference (PreToolUse, PostToolUse, UserPromptSubmit, Notification, SessionStart, SessionEnd, Stop)
    - Configuration guide with settings.json examples and matcher patterns
    - Creating custom hooks template with environment variables
    - Best practices (short timeout, fail gracefully, minimal logging)
    - Advanced examples (git context enrichment, activity logger, migration detector)
    - Troubleshooting section (permission issues, timeout errors, jq installation)
- **README.md improvements** for better discoverability
  - Moved "What's Inside" section to line 24 (immediately after intro, before "About This Guide")
  - Added examples/ row to table: "Production-ready commands, hooks, agents | Browse as needed"
  - **DeepWiki interactive documentation explorer** section
    - Link to https://deepwiki.com/FlorianBruniaux/claude-code-ultimate-guide/1-overview
    - 4 bullet points explaining features (natural language queries, contextual navigation, semantic search, on-demand summaries)
    - Tagline: "Perfect for quick lookups when you don't want to read the full 7500+ lines"
  - **Ready-to-Use Examples** section with comprehensive tables
    - Commands table: 6 commands with purpose and highlights (/pr, /release-notes, /sonarqube, /commit, /review-pr, /git-worktree)
    - Hooks table: 4 hooks with events and purposes (dangerous-actions-blocker, notification, security-check, auto-format)
    - Link to examples/README.md for full catalog
- **Guide documentation extensions** (english-ultimate-claude-code-guide.md)
  - **Section 1.3 "Quick Actions & Shortcuts"** expanded (~80 lines)
    - New subsection "Shell Commands with `!`" with 9 concrete examples
      - Quick status checks (!git status, !npm run test, !docker ps)
      - View logs (!tail -f, !cat package.json)
      - Quick searches (!grep -r "TODO", !find . -name "*.test.ts")
    - Comparison table: when to use `!` vs asking Claude
    - Example workflow showing both approaches
    - New subsection "File References with `@`" with usage patterns
      - Single file, multiple files, wildcards, relative paths
      - "Why use `@`" section: precision, speed, context, clarity
      - Comparative example showing with/without `@`
  - Section 10 TL;DR updated with "Copy ready-to-use templates → examples/ directory"
  - Appendix updated with note redirecting to examples/ for production-ready templates

### Changed
- **examples/README.md** updated with new entries
  - Commands table: Added /pr, /release-notes, /sonarqube rows
  - Hooks table: Added dangerous-actions-blocker.sh, notification.sh rows
  - Added note: "See hooks/README.md for complete documentation"
- **README.md restructured** for immediate content comprehension
  - "What's Inside" moved from line 72 to line 24 (48 lines higher)
  - Removed duplicate "What's Inside" section (was at old location)
  - Removed duplicate DeepWiki reference from Resources section
  - Optimal information architecture: Title → Author → What's Inside → About
- **Guide statistics updated**
  - Guide expanded from 7,668 to 8,505 lines (+837 lines, +10.9%)
  - Word count updated to approximately 31,280 words
  - Reading time remains 3 hours (comprehensive read-through)

### Stats
- 6 new files created (~43 KB total)
  - 3 slash commands (pr.md, release-notes.md, sonarqube.md)
  - 2 bash hooks (dangerous-actions-blocker.sh, notification.sh)
  - 1 comprehensive documentation (hooks/README.md)
- 3 files modified (README.md, english-ultimate-claude-code-guide.md, examples/README.md)
- Guide grew by 837 lines (10.9% growth from v2.0.0)
- Focus on production-ready templates and improved documentation discoverability
- All commands and hooks fully generic (no project-specific references)

## [2.0.0] - 2026-01-10

### Added
- **Section 9.12: Git Best Practices & Workflows** (~400 lines)
  - Commit message best practices with Conventional Commits format
  - Git amend workflow with safety rules and verification process
  - Branch management patterns and naming conventions
  - Rewind vs Revert decision tree for different scenarios
  - **Git Worktrees comprehensive documentation**
    - Parallel branch development without context switching
    - Setup process and directory structure
    - Claude Code integration patterns
    - CLAUDE.md memory file strategies for worktrees
    - Best practices and troubleshooting guide
    - Cleanup procedures
- **Section 9.13: Cost Optimization Strategies** (~350 lines)
  - Model selection matrix (Haiku/Sonnet/Opus use cases and costs)
  - OpusPlan mode (Opus for planning, Sonnet for execution)
  - Token-saving techniques (selective loading, .claudeignore, proactive compacting)
  - Agent specialization for efficiency
  - Cost tracking with /status command and budget alerts
  - Economic workflows (Haiku for tests, Sonnet for implementation)
  - Token calculation reference with real pricing examples
  - Cost vs productivity trade-offs analysis
  - ROI calculations and cost-effectiveness metrics
- **examples/commands/git-worktree.md** - Slash command template
  - Systematic worktree setup workflow
  - Directory selection priority logic (.worktrees/ vs worktrees/)
  - Safety verification (.gitignore checks)
  - Auto-detection of package managers (pnpm, cargo, poetry, go)
  - Baseline test verification
  - Complete quick reference table
- **8 TL;DR/Recap sections** for improved navigation and learning journey
  - Section 2 TL;DR (Core Concepts) - 2 minute overview of mental model
  - Section 3 TL;DR (Memory & Settings) - 90 second memory hierarchy guide
  - Section 4 TL;DR (Agents) - 60 second quick start guide
  - Section 7 TL;DR (Hooks) - 60 second event system overview
  - Section 9 TL;DR (Advanced Patterns) - 3 minute pattern categories breakdown
  - Section 10 TL;DR (Reference) - 1 minute navigation table
  - Subsection 2.2 Quick Reference (Context Management zones)
  - Section 9 Recap Checklist (Pattern mastery verification before Section 10)
- **Format Enhancements** for better readability
  - Collapsible tables using `<details>` tags for dense content (MCP Server Catalog)
  - C-style comment format (`/*──────*/`) for multi-OS installation commands
  - Quick navigation anchor links at top of all 10 major sections
- **zebbern/claude-code-guide reference** in README Resources
  - New "Related Guides" section grouping zebbern and Claudelog as peer guides
  - Positioned prominently after Official docs section
  - Added context: "Comprehensive reference & troubleshooting guide with cybersecurity focus"

### Changed
- **Updated statistics** throughout documentation
  - Guide expanded from 7,481 to 7,668 lines (+187 lines, +2.5%)
  - Word count: 27,471 words (27K+)
  - Reading time estimate: 2.5 hours → 3 hours (more accurate for full guide)
  - README: "4000+ lines" → "7500+ lines, 27K+ words"
  - PDF Kimi reading time: 2.5 hours → 3 hours
- **Version alignment** across all files to 2.0
  - english-ultimate-claude-code-guide.md: Version 1.0 → 2.0
  - README.md: Version 1.0 → 2.0
  - claude-setup-audit-prompt.md: Version 1.0 → 2.0
  - cheatsheet-en.md: Already 2.0
- **Date updates** to January 2026
  - All "Last updated" fields across documentation
  - Status Overview Table dates (Jan 2025 → Jan 2026)
  - Pricing model reference date (January 2026)
  - Footer timestamps in all major files

### Fixed
- Removed duplicate Claudelog reference from "Frameworks & Tools" section (was in both Key inspirations and Resources)
- Improved organization of Resources section with clearer categorization

### Stats
- Guide now 7,668 lines (from 6,250 lines in v1.2.0)
- Added 187 lines of TL;DR/navigation content
- ~23% growth from v1.2.0
- Focus on user experience optimization and learning journey enhancement
- Major version bump reflects structural documentation paradigm shift (learning-focused TL;DRs throughout)

## [1.2.0] - 2025-01-10

### Added
- **Section 1.6: Migration Patterns** (~230 lines)
  - Complete guide for transitioning from GitHub Copilot to Claude Code
  - Cursor to Claude Code migration strategies
  - Hybrid workflow recommendations (when to use which tool)
  - Week-by-week migration checklist
  - Common migration issues and solutions
  - Success metrics and productivity indicators
- **Section 2.2: Cost Awareness & Optimization** (~220 lines)
  - Detailed pricing model breakdown (Sonnet/Opus/Haiku)
  - Cost optimization strategies (5 actionable patterns)
  - Real-world cost examples and ROI calculations
  - Budget tracking and cost-conscious workflows
  - Cost vs. value analysis (when to optimize, when not to)
  - Red flags for cost waste indicators
- **Section 9.3: Release Notes Generation** (~280 lines)
  - Command-based release notes automation
  - CI/CD integration for automated changelog
  - Interactive workflow for manual control
  - Three output formats (CHANGELOG.md, GitHub Release, User Announcement)
  - Best practices and common issues
  - Complete examples with real commit history
- **Section 10.4: Enhanced Troubleshooting** (~170 lines added)
  - MCP server connection issues (Serena, Context7, Sequential)
  - Permission pattern matching problems
  - Timeout handling strategies
  - Platform-specific installation issues (Windows, macOS, Linux)
- **Appendix A.10: Emergency Hotfix Checklist** (~140 lines)
  - Step-by-step hotfix protocol (8 phases)
  - Time-based decision matrix (<5 min to >30 min)
  - Claude Code hotfix-specific commands
  - Hotfix anti-patterns and best practices
  - Communication templates for incident updates
- **Appendix A.11: Git Archaeology Pattern** (~250 lines)
  - 6 archaeology patterns (mysterious code, feature evolution, bug introduction)
  - Claude-optimized git commands for investigation
  - Real-world examples (workarounds, breaking changes, dead code)
  - Archaeology prompt template
  - Finding domain experts via git history
- Enhanced Windows disclaimer in README (more visible, actionable)
- Updated `claude-setup-audit-prompt.md` with new checklist items
  - Cost Awareness evaluation criteria
  - Migration Patterns assessment
  - Release Notes automation check
  - Emergency procedures documentation
  - Git archaeology usage patterns

### Changed
- Improved Windows support visibility in README
  - Changed from small note to prominent callout box
  - Added specific areas of concern (PowerShell, paths, batch files)
  - Clear call-to-action for Windows contributors
  - Status indicator for platform support

### Stats
- Guide expanded from ~4955 lines to ~6250 lines (~26% growth)
- Added ~1300 lines of high-value, practical content
- 6 major new sections addressing real-world developer needs
- Focus on cost optimization, migration, and production scenarios

## [1.1.0] - 2025-01-10

### Added
- Comprehensive Windows compatibility support
  - PowerShell hook templates
  - Windows-specific paths throughout documentation
  - PowerShell profile setup instructions
  - Batch file alternatives where applicable
- Windows disclaimer in README (author on macOS, Windows untested)
- DeepWiki exploration link for interactive repository discovery
- `llms.txt` file for AI indexation

### Changed
- Installation instructions now prioritize npm (cross-platform)
- Cheatsheet updated with dual-platform paths (macOS/Linux + Windows)
- Audit prompt includes Windows paths

## [1.0.0] - 2025-01-09

### Added
- Complete Claude Code guide (4700+ lines)
  - Section 1: Quick Start
  - Section 2: Core Concepts (Context Management, Plan Mode, Rewind)
  - Section 3: Memory & Settings (CLAUDE.md, .claude/ folder)
  - Section 4: Agents (Custom AI personas, Tool SEO)
  - Section 5: Skills (Reusable knowledge modules)
  - Section 6: Commands (Custom slash commands)
  - Section 7: Hooks (Event-driven automation)
  - Section 8: MCP Servers (Serena, Context7, Sequential, Playwright)
  - Section 9: Advanced Patterns (Trinity, CI/CD, Vibe Coding)
  - Section 10: Reference (Commands, Troubleshooting, Checklists)
  - Appendix: Templates Collection
- 1-page printable cheatsheet (`cheatsheet-en.md`)
- Setup audit prompt (`claude-setup-audit-prompt.md`)
- PDF versions for offline reading
- NotebookLM audio deep dive

### Documentation
- README with quick start guide
- Table of contents with anchor links
- Quick links by topic
- Who Is This For section

## [0.1.0] - 2025-01-08

### Added
- Initial repository structure
- License (CC BY-SA 4.0)
- .gitignore for common patterns
