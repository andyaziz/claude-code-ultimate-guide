# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [2.9.7] - 2026-01-12

### Enhanced
- **README.md** - Deep Audit now context-aware
  - Full Audit command now reads project's README.md, CLAUDE.md, and .claude/CLAUDE.md
  - Claude analyzes business domain to provide tailored recommendations
  - Domain-specific suggestions (EdTech → session agents, E-commerce → inventory commands)
  - Privacy notice: all data stays local, nothing sent back to repo

### Stats
- 1 file modified (README.md)
- Deep Audit now provides personalized, domain-aware recommendations

## [2.9.6] - 2026-01-12

### Fixed
- **audit-scan.sh** - Count files recursively in subfolders
  - Commands in subfolders (e.g., `commands/tech/`, `commands/product/`) now counted
  - Split into `count_md_files()` for .md and `count_script_files()` for hooks (.sh/.js/.py/.ts)
  - Excludes README.md from counts
  - Bug found: Was reporting 0 commands when 10 existed in subfolders

### Stats
- 1 file modified (audit-scan.sh, ~15 lines)
- Critical fix for accurate extension counting

## [2.9.5] - 2026-01-12

### Added
- **README.md** - Deep Audit section with one-liner commands
  - New row in "Not Sure Where to Start?" table
  - `🔬 Deep Audit` section with two options:
    - Quick Version (~10 sec): Single curl pipe to Claude
    - Full Audit (~30 sec): Downloads YAML reference + scan for comprehensive analysis
  - Outputs: Health score, prioritized findings, CLAUDE.md template, suggested extensions

### Stats
- 1 file modified (README.md, ~35 lines added)
- Focus on one-command personalized audit experience

## [2.9.4] - 2026-01-12

### Added
- **examples/modes/** - New folder for behavioral modes
  - `MODE_Learning.md` - Complete Learning Mode ready to copy to `~/.claude/`
  - `README.md` - Installation guide with SuperClaude framework reference
- **examples/README.md** - Updated with modes folder and templates

### Stats
- 2 new files created (MODE_Learning.md, modes/README.md)
- 1 file modified (examples/README.md)
- Focus on making SuperClaude Learning Mode plug-and-play

## [2.9.3] - 2026-01-12

### Added
- **README.md** - LLM Reference section with curl one-liner
  - New row in "Not Sure Where to Start?" table
  - `🤖 LLM Reference` section with instant curl command
  - Use cases: ChatGPT/Claude/Gemini context, system prompts, `@` reference
  - Clarification that YAML points to line numbers in full guide for deep dives
- **english-ultimate-claude-code-guide.md** - Learning Mode documentation (~136 lines)
  - SuperClaude Behavioral Modes overview table
  - Complete Learning Mode installation guide (4 steps)
  - Usage examples with `--learn`, `--learn focus:X`, `--learn batch` flags
  - Offer format examples (standard and token-efficient)
  - Integration matrix with other modes
  - Priority rules and example session
- **claude-code-reference.yaml** - Learning mode additions
  - `deep_dive` refs: superclaude_modes, learning_mode
  - `decide` section: learning flag
  - `cli` section: --learn, --learn focus:X, --no-learn flags

### Stats
- 3 files modified (README.md, english-ultimate-claude-code-guide.md, claude-code-reference.yaml)
- ~150 lines added across files
- Focus on LLM context sharing and SuperClaude Learning Mode documentation

## [2.9.2] - 2026-01-12

### Added
- **claude-code-reference.yaml** - Machine-optimized LLM index (~2K tokens)
  - **Decision tree** as first section (most used lookup)
  - **Prompting formula** (WHAT/WHERE/HOW/VERIFY pattern)
  - **38 deep_dive line references** to english-ultimate-claude-code-guide.md
  - 22 sections covering: commands, shortcuts, CLI flags, context management, memory files, MCP servers, think levels, cost optimization, anti-patterns, troubleshooting
  - Flat YAML structure (max 1 level nesting) for optimal LLM parsing
  - ~97% token reduction vs full guide (2K vs 70K tokens)
- **README.md** - Added LLM Reference row in Core Documentation table
- **llms.txt** - Added Machine-Optimized Reference section with YAML file description

### Stats
- 1 new file created (claude-code-reference.yaml, 282 lines)
- 2 files modified (README.md, llms.txt)
- Use case: Claude Code self-reference for fast user question answering

## [2.9.1] - 2026-01-12

### Fixed
- **Cheatsheet completeness audit** (cheatsheet-en.md, ~15 lines modified)
  - **Missing commands added**:
    - `/execute` - Exit Plan Mode (counterpart to `/plan`)
    - `/model` - Switch model (sonnet/opus/opusplan)
  - **Missing keyboard shortcuts added**:
    - `Ctrl+R` - Retry last operation
    - `Ctrl+L` - Clear screen (keeps context)
  - **Missing CLI flags added**:
    - `-c` / `--continue` - Continue last session
    - `-r` / `--resume <id>` - Resume specific session
    - `--headless` - Non-interactive (CI/CD)
  - **Missing maintenance command added**:
    - `claude update` - Check/install updates
  - **Inconsistency fixed**:
    - Removed false `/resume` slash command from Context Recovery Commands
    - Replaced with correct CLI flags (`claude -c`, `claude -r <id>`)
  - **Clarification**:
    - `/status` vs `/context` descriptions clarified (session state vs detailed token breakdown)
  - Cheatsheet version: 2.8 → 2.8.1

### Stats
- 1 file modified (cheatsheet-en.md)
- Audit coverage improved from ~36% to ~85% of documented commands
- Format preserved: 377 lines, 1-page printable maintained

## [2.9.0] - 2026-01-12

### Fixed
- **MCP detection bug in audit-scan.sh** (~60 lines modified)
  - **Root cause**: Script searched for `~/.claude/mcp.json` which doesn't exist
  - **Actual location**: Claude Code stores MCP config in `~/.claude.json` under `projects.<path>.mcpServers`
  - **Solution**: Multi-source detection with priority:
    1. `~/.claude.json` → `projects.<cwd>.mcpServers` (most common)
    2. `./.claude/mcp.json` (project-level)
    3. `~/.claude/mcp.json` (legacy global)
  - JSON output now includes detailed `mcp` section (configured, count, servers, source)
  - Human output shows server count and source location
- **Bug `0\n0` in `claude_md_refs`** (~8 lines)
  - **Root cause**: `grep -c ... || echo "0"` could produce double output
  - **Solution**: Rewritten `count_pattern()` function to properly capture and return count

### Changed
- **audit-scan.sh** enhanced (~50 lines)
  - Added `MCP_SOURCE` variable to track where MCP config was found
  - Added `MCP_COUNT` variable for server count
  - Global `mcp.json` message changed from error to info (not required)
  - JSON output restructured with separate `mcp` object
- **claude-setup-audit-prompt.md** updated (~40 lines)
  - Phase 1.1: Now checks `~/.claude.json` instead of `~/.claude/mcp.json`
  - Phase 1.2: Complete MCP detection rewrite covering all 3 locations
  - Glossary: Updated MCP definition to explain config locations
  - Version: 2.8 → 2.9

### Stats
- 2 files modified (audit-scan.sh, claude-setup-audit-prompt.md)
- Bug impact: Scripts now correctly detect MCP servers (was showing "No MCP" even when configured)
- Tested: Verified on Méthode Aristote project with 9 MCP servers

## [2.8.0] - 2026-01-11

### Added
- **Verified CLI commands and flags from Medium article analysis** (~61 lines)
  - **Section 1.1 "Updating Claude Code"** (lines 210-241)
    - `claude update` command - Check and install available updates
    - `claude doctor` command - Verify auto-updater health and system integrity
    - Maintenance commands reference table with usage guidance
    - Update frequency recommendations (weekly, before major work, after system changes)
    - Alternative npm update method documented
  - **Section 10.1 Built-in Commands** (line 7746)
    - `/output-style` - Change response format (concise/detailed/code)
    - `/feedback` - Report bugs or send feedback to Anthropic (renamed from `/bug`)
  - **Section 10.3 CLI Flags Reference** (lines 7837, 7848)
    - `--json-schema <schema>` - JSON Schema for structured output validation
    - `--max-budget-usd <amount>` - Maximum API spend limit (with `--print` only)
  - **Section 10.4 Quick Diagnostic Guide** (lines 7893-7913)
    - Symptom-based troubleshooting table with 8 common scenarios
    - Quick Fix + Prevention columns for rapid issue resolution
    - 5-step diagnosis flow (context → connectivity → configuration → permissions → doctor)
    - Covers: context overflow, rate limits, MCP issues, permission prompts, session corruption

- **README.md navigation improvements** (~50 lines)
  - Decision Helper table after Quick Start (6 user personas with direct links)
  - Moved Audit section to prominent position after Quick Start
  - Reframed AI admission from apologetic to professional tone
  - Added Prerequisites section (Node.js, API key, cost estimate)
  - Outcome-based Guide Navigation ("After this, you can...")
  - Consolidated PDFs/DeepWiki into collapsible `<details>` section
  - Shortened Windows disclaimer (5 lines → 1 line)
  - Added GitHub Actions section to Production-Ready Examples
- **examples/README.md catalog completion**
  - Added `github-actions/` folder to Structure table (3 CI/CD workflows)
  - Added `workflows/` folder to Structure table (database branch setup)
  - Complete Templates Index with all 9 example categories

### Changed
- **Verification methodology improvements**
  - All additions verified via `claude --help` output or direct user testing
  - Rejected 6+ unverified elements from Medium article (false positives and non-existent commands)
  - Avoided documenting 16 already-present elements (prevented redundancy)
  - Maintained guide credibility by only adding 100% confirmed features
- **README.md restructured** for better first-time user experience
  - Clear decision support for new users ("Not Sure Where to Start?")
  - Audit tool more discoverable (moved from buried position)
  - Professional AI disclosure without being apologetic

### Stats
- Guide expanded from 8,787 to 8,848 lines (+61 lines, +0.7%)
- 6 sections modified (Installation, Commands Table, CLI Flags, Troubleshooting, README, examples/README)
- Focus on maintenance commands, structured output, rapid diagnostics, and navigation UX
- Verification ratio: 7 confirmed additions / 22 rejected claims (~32% valid from source article)
- README improvements: Decision Helper, Audit visibility, GitHub Actions showcase

## [2.7.0] - 2026-01-11

### Added
- **Audit optimization with bash scanning** (~350 lines across 4 files)
  - **examples/scripts/audit-scan.sh** (NEW, ~230 lines)
    - Fast Claude Code setup scanner with dual output modes
    - JSON output (`--json`) for Claude processing
    - Human-readable output (default) with color-coded results (✅/❌/⚠️)
    - Scans: global config (~/.claude/), project config (./CLAUDE.md, .claude/), extensions (agents/commands/skills/hooks/rules)
    - Tech stack auto-detection (Node.js, Python, Go, Rust, PHP via manifest files)
    - Quality pattern checks: security hooks (PreToolUse), SSoT references (@refs), MCP servers
    - Performance: ~80% faster than file-reading approach (~2s vs ~30s)
    - Token efficiency: ~90% reduction (~500 tokens vs ~5000 tokens)
  - **claude-setup-audit-prompt.md Phase 1-2 rewrite** (~120 lines modified)
    - Phase 1.1 "Quick Configuration Scan" replaced file reads with bash commands
    - Phase 1.2 "Quality Pattern Checks" uses grep/wc/find for targeted validation
    - Phase 1.3 references external audit-scan.sh for comprehensive scanning
    - Added "Efficient Guide Reference Lookup" with sed line range extraction
    - Reduced audit time estimate from ~5-10 minutes to ~2-3 minutes
    - Version updated: 2.1 → 2.2
  - **examples/README.md scripts section** (~20 lines)
    - Added `scripts/` folder to structure table
    - Scripts table documenting 3 utility scripts (audit-scan.sh, check-claude.sh, clean-reinstall-claude.sh)
    - Usage examples for both JSON and human-readable output modes
  - **README.md "Audit Your Setup" section rewrite** (~60 lines)
    - Two-option approach: Quick Bash Scan (2 seconds) vs Claude-powered audit (2-3 minutes)
    - Performance comparison: "~80% faster scanning and 90% fewer tokens"
    - Option 1: Direct script execution with curl download example
    - Option 2: Claude-powered analysis referencing audit prompt
    - Clear usage instructions for both `--json` and default modes

### Changed
- **Version alignment** across documentation
  - README.md: Version 2.6 → 2.7
  - english-ultimate-claude-code-guide.md: Already at 2.7
  - claude-setup-audit-prompt.md: Version 2.1 → 2.2

### Stats
- 1 new file created (audit-scan.sh, ~230 lines)
- 4 files modified (claude-setup-audit-prompt.md, examples/README.md, README.md, CHANGELOG.md)
- Performance improvement: 80% faster scanning, 90% token reduction
- Focus on efficiency, developer experience, and programmatic auditing
- Script supports both human-readable and machine-readable (JSON) output

## [2.6.0] - 2026-01-11

### Added
- **Section 8.5: Plugin System** (~245 lines, comprehensive documentation)
  - **Plugin System fundamentals** (lines 4836-5073)
    - What are plugins: packaged agents, skills, commands, domain-specific tooling
    - Plugin commands table: install, enable, disable, uninstall, update, validate
    - Marketplace management: add, list, update, remove marketplaces
    - Using plugins workflow from marketplace to session usage
    - Plugin session loading with `--plugin-dir` flag for testing
  - **When to Use Plugins** decision matrix
    - Team workflows: Share standardized agents/skills via private marketplace
    - Domain expertise: Pre-built security, accessibility, performance plugins
    - Repeating patterns: Package custom workflows for reuse
    - Community solutions: Leverage community expertise
  - **Creating Custom Plugins** guide
    - Directory structure with manifest (plugin.json)
    - Example security-audit plugin manifest
    - Validation command: `claude plugin validate ./my-plugin`
  - **Plugin vs. MCP Server** comparison table
    - Plugin = "How Claude thinks" (workflows, specialized agents)
    - MCP Server = "What Claude can do" (tools, external systems)
    - Clear guidance on when to use which
  - **Security Considerations** section
    - Before installing: trust source, review manifest, test in isolation
    - Red flags: network access without reason, obfuscated code, no documentation
  - **Example Use Cases** with real workflows
    - Team Code Standards Plugin (private marketplace)
    - Security Audit Suite (community plugin)
    - Accessibility Testing (a11y plugin with WCAG compliance)
  - **Troubleshooting** guide
    - Plugin not found after install
    - Plugin conflicts resolution
    - Plugin not loading in session
- **Keyboard Shortcut: `Esc×2` double-tap** (line 7487)
  - Added to Section 10.2 Keyboard Shortcuts table
  - Clarifies double-tap pattern: Rewind to previous checkpoint (same as `/rewind`)
  - Resolves inconsistency between TL;DR mention and shortcuts table
- **Plugin command** in Section 10.1 Commands Table (line 7696)
  - `/plugin` command: Manage Claude Code plugins (Config category)
- **Plugin flag** in Section 10.3 CLI Flags Reference (line 7782)
  - `--plugin-dir`: Load plugins from directory (repeatable flag)

### Changed
- **Table of Contents updated** (line 147)
  - Added [8.5 Plugin System](#85-plugin-system) entry
- **Section 8 Quick Jump navigation enhanced** (line 4530)
  - Added Plugin System link to quick navigation bar
- **TL;DR Power Features table** (line 80)
  - Added "Plugins: Community-created extension packages" row
- **Version alignment** across documentation
  - english-ultimate-claude-code-guide.md: Version 2.5 → 2.6
  - README.md: Version 2.5 → 2.6

### Stats
- Guide expanded from 8,545 to 8,787 lines (+242 lines, +2.8%)
- Plugin System section: ~245 lines of comprehensive documentation
- 1 keyboard shortcut clarified (Esc×2)
- 2 command/flag additions (/plugin, --plugin-dir)
- Focus on extensibility and community-driven functionality
- Zero loss of existing functionality

## [2.5.0] - 2026-01-11

### Removed
- **Content cleanup and optimization** (~1048 lines removed, -10.9%)
  - **DeepSeek Integration section** (~200 lines, lines 9123-9321)
    - Third-party provider documentation not specific to Claude Code
    - Replaced reference in configuration table with generic "Alternative auth token"
  - **Git Archaeology Pattern** (~250 lines, lines 8834-9081)
    - General Git technique, not Claude Code-specific
  - **Emergency Hotfix Checklist** (~140 lines, lines 8695-8832)
    - Generic development workflow, not specific to Claude Code
  - **Maturity Model & Success Metrics** (~95 lines, lines 8544-8691)
    - Gamification content that added weight without Claude Code value
  - **Prompt Templates** (~105 lines, lines 8437-8542)
    - Generic prompt templates not specific to Claude Code
  - **Task-specific checklists** (Bug Fix, Feature, Code Review, Refactoring)
    - General development checklists, not Claude Code workflows
  - **Community Resources fictional dates** (table column removed)
    - Removed "Last Updated" column with fictional future dates (Apr 2025, Oct 2025, Jul 2025, Aug 2025)
    - Reduced from 5 to 3 essential awesome-lists

### Changed
- **Health Check Scripts externalized** to `examples/scripts/`
  - Replaced ~90 lines of inline PowerShell/Bash scripts with links
  - Created `examples/scripts/check-claude.sh` (macOS/Linux health check)
  - Created `examples/scripts/check-claude.ps1` (Windows health check)
  - Main guide now references external scripts for maintainability
- **Clean Reinstall Scripts externalized** to `examples/scripts/`
  - Replaced ~75 lines of inline reinstall procedures with links
  - Created `examples/scripts/clean-reinstall-claude.sh` (macOS/Linux reinstall)
  - Created `examples/scripts/clean-reinstall-claude.ps1` (Windows reinstall)
  - Improves separation of concerns (guide vs utilities)
- **Nick Tune reference condensed**
  - Reduced from ~40 lines to 3 lines with link only
  - Kept attribution but removed excessive detail
- **Daily Workflow & Checklists streamlined**
  - Removed generic checklists (Bug Fix, Feature, Code Review, Refactoring)
  - Kept only Claude Code-specific parts (Daily Workflow, Prompt Quality)
- **Table of Contents cleaned**
  - Removed obsolete references to A.8 (Prompt Templates) and A.9 (Success Metrics)
  - Fixed document structure coherence

### Fixed
- Version consistency across documentation (2.4 aligned)
- Code block balance verification (673 markers, properly balanced)
- Removed broken internal references to deleted sections

### Stats
- Document reduced from 9,593 to 8,545 lines (-1,048 lines, -10.9%)
- 4 new script files created in examples/scripts/ (~350 lines externalized)
- Focus shifted to Claude Code-specific content only
- Improved maintainability through script externalization
- Zero loss of essential Claude Code functionality

## [2.4.0] - 2026-01-10

### Added
- **Database Branch Isolation with Git Worktrees** (~540 lines across 3 files)
  - **examples/commands/git-worktree.md** enhanced (~90 lines added)
    - Database provider auto-detection (Neon, PlanetScale, Local Postgres, Supabase)
    - Suggested commands for DB branch creation per provider
    - `.worktreeinclude` setup documentation for .env copying
    - "When to Create Database Branch" decision table
    - Cleanup commands including DB branch deletion
    - Common mistakes section expanded with DB-related pitfalls
  - **examples/workflows/database-branch-setup.md** (NEW, ~350 lines)
    - Complete provider-specific setup guides (Neon, PlanetScale, Local Postgres)
    - TL;DR section for 90% use case (Neon quick start)
    - Provider comparison table with branching capabilities
    - 3 isolation patterns: Cloud branching, Local schema, Shared DB
    - Decision tree for choosing DB isolation strategy
    - Real-world workflow examples with commands
    - Troubleshooting section with common issues
    - Prerequisites and CLI installation per provider
  - **english-ultimate-claude-code-guide.md** Section 9.12 enhanced (~95 lines)
    - "Database Branch Isolation with Worktrees" new subsection
    - Problem/Solution framing for schema conflicts
    - Provider detection explanation
    - "When to create DB branch" decision table
    - Complete workflow example with Neon
    - Prerequisites for all major providers
    - Links to detailed workflow guide
  - **Source attribution**: [Neon database branching](https://neon.tech/docs/guides/branching) and [PlanetScale branching workflows](https://planetscale.com/docs/concepts/branching)

### Changed
- **Guide statistics updated**
  - Guide expanded from 9,700+ to 9,592 lines (optimized structure, net -108 lines)
  - Content reorganized for better progressive disclosure
  - Reduced redundancy through single source of truth pattern
- **Documentation architecture improved**
  - Command reference (git-worktree.md) kept concise and scannable
  - Detailed workflows separated into dedicated guide
  - Clear separation: Quick Reference → Complete Tutorial

### Stats
- 1 new file created (workflows/database-branch-setup.md, ~350 lines)
- 3 files modified (git-worktree.md +90, guide +95, examples/README.md)
- Focus on database isolation patterns for modern dev workflows
- Maintenance-friendly: Single source of truth for provider commands

## [2.3.0] - 2026-01-10

### Added
- **DeepTo Claude Code Guide integration** (~800 lines across 5 sections)
  - **Image Processing** (Section 2.3.2, lines 377-445)
    - Direct image input via paste/drag-drop in terminal
    - Screenshot analysis, UI debugging, error message analysis
    - Best practices for image-based workflows
    - Supported formats: PNG, JPG, GIF, WebP, screenshots
  - **Session Continuation and Resume** (Section 2.3.4, lines 447-560)
    - `claude --continue` / `-c` to resume last session
    - `claude --resume <id>` / `-r <id>` for specific sessions
    - Use cases table: long-term projects, research, interrupted work, daily workflows
    - Context preservation across terminal sessions
    - Integration with MCP Serena for persistent memory
  - **XML-Structured Prompts** (Section 2.6, lines 1582-2148)
    - Semantic organization using `<instruction>`, `<context>`, `<code_example>`, `<constraints>`, `<output>` tags
    - Benefits table: disambiguation, role clarity, example isolation, constraint definition
    - 3 practical examples: code review, feature implementation, bug investigation
    - Advanced patterns: nested tags, multiple examples, conditional instructions
    - Integration with CLAUDE.md and Plan Mode
    - Template library for common scenarios
  - **ccusage CLI Tool** (Section 3.5.3, around line 970)
    - Detailed cost analytics and tracking
    - Model-specific breakdowns (Haiku/Sonnet/Opus)
    - Token usage analysis and optimization insights
    - Installation and usage instructions
  - **Unix Piping Workflows** (Section 9.3.3, line 4490)
    - Feeding content to Claude via stdin pipes
    - Output format options (text, json, markdown)
    - Build script integration patterns
    - CI/CD pipeline examples (linting, testing, security)
    - Automated analysis and report generation
  - **DeepTo Guide reference** added to README.md Resources section
    - Listed alongside zebbern, Claudelog, and ykdojo guides
    - Brief description covering all integrated concepts
  - **Source attribution** included in all new sections
    - Proper credit to https://cc.deeptoai.com/docs/en/best-practices/claude-code-comprehensive-guide
    - Following same attribution format used for other community guides

### Changed
- **Guide statistics updated**
  - Guide expanded to approximately 9,700+ lines (+800 lines from DeepTo integration)
  - Enhanced coverage of context management, structured prompting, and automation
- **README.md Resources section enhanced**
  - Added DeepTo Claude Code Guide to Related Guides

### Stats
- 0 new files created (documentation enhancement only)
- 3 files modified (README.md, english-ultimate-claude-code-guide.md, CHANGELOG.md)
- Focus on advanced prompting techniques, cost optimization, and automation workflows
- Integration of community best practices from DeepTo guide

## [2.2.0] - 2026-01-10

### Added
- **ykdojo/claude-code-tips reference integration** (~300 lines, 6 tips)
  - Added to References section in README.md (2 locations: Key inspirations + Related Guides)
  - Added to Learning Sites table in guide (Section 10.3.3, lines 8277, 8500)
  - Listed as peer guide alongside Claudelog and zebbern
  - **Tip 1: Undocumented Commands** integrated in Section 10.1 Commands Table
    - `/usage` - Check rate limits and token allocation
    - `/stats` - View usage statistics with activity graphs
    - `/chrome` - Toggle native browser integration
    - `/mcp` - Manage Model Context Protocol servers
  - **Tips 3+4+8: Keyboard Shortcuts** integrated in Section 10.2
    - Restructured with 2 categories: "Session Control" + "Input & Navigation"
    - `Ctrl+A` - Jump to beginning of line
    - `Ctrl+E` - Jump to end of line
    - `Ctrl+W` - Delete previous word
    - `Ctrl+G` - Open external editor for long text
    - `Ctrl+B` - Run command in background
  - **Tip 5: Session Handoff Pattern** new subsection in Section 2.2 (lines 1252-1308)
    - Complete template with 5 sections (Accomplished, Current State, Decisions, Next Steps, Context)
    - When-to-use table with 5 scenarios (end of day, context limit, switching focus, interruption, debugging)
    - Storage location: `claudedocs/handoffs/handoff-YYYY-MM-DD.md`
    - Pro tip: Ask Claude to generate handoff automatically
  - **Tip 12: GitHub Actions CLI Debugging** new subsection in Section 9.3 (lines 4445-4500)
    - Quick investigation workflow with `gh run` commands
    - Common commands table: list, view, view logs, watch, rerun
    - Practical example combining `gh` with Claude Code
    - Pro tip: Pipe failed logs directly to Claude for analysis
  - **Additional topics worth exploring** section added (lines 8516-8522)
    - 6 non-integrated but pertinent topics from ykdojo listed
    - Voice transcription workflows (superwhisper/MacWhisper)
    - Tmux for autonomous testing
    - cc-safe security tool
    - Cascade multitasking method
    - Container experimentation with Docker
    - Half-clone technique for context trimming

### Changed
- **Guide statistics updated**
  - Guide expanded from 8,505 to 8,929 lines (+424 lines, +5.0%)
  - Word count increased from ~31,280 to 33,219 words (+1,939 words, +6.2%)
  - Reading time updated: "~3 hours" → "~2h15min" (more precise estimate)
- **Version alignment** across documentation
  - english-ultimate-claude-code-guide.md: Version 2.1 → 2.2
  - README.md: Version 2.1 → 2.2
  - CHANGELOG.md: New release 2.2.0 documented

### Stats
- 0 new files created (documentation enhancement only)
- 3 files modified (README.md, english-ultimate-claude-code-guide.md, CHANGELOG.md)
- Guide grew by 424 lines (5.0% growth from v2.1.0)
- Focus on productivity techniques and terminal efficiency
- Integration of battle-tested workflows from Y.K. Dojo

## [2.1.0] - 2026-01-10

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
