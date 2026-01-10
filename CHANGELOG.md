# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

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
