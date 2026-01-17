# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

---

## [3.8.2] - 2026-01-17

### Added

- **Landing Site Synchronization System**
  - New script `scripts/check-landing-sync.sh` verifying 4 metrics:
    - Version (`VERSION` vs landing index.html)
    - Templates count (`find examples/` vs landing badges)
    - Quiz questions (`questions.json` vs index.html + quiz.html)
    - Guide lines (with ±500 tolerance)
  - CLAUDE.md updated with sync documentation and expected output
  - Landing site CLAUDE.md created with sync workflow and line numbers

### Fixed

- **Templates count corrected**: 87 → 49 in README.md badges and text
  - Badge count was wrong since original creation
  - Actual count verified with `find examples/ -type f`

---

## [3.8.1] - 2026-01-16

### Added

- **PDF Generation documentation**
  - New workflow guide: `guide/workflows/pdf-generation.md`
  - New skill template: `examples/skills/pdf-generator.md`
  - Covers Quarto + Typst stack, YAML frontmatter, design system, troubleshooting
  - Updated `machine-readable/reference.yaml` with deep_dive entries

### Changed

- **Whitepapers PDF template modernized** (internal)
  - New color palette: Slate + Indigo (WCAG AA compliant)
  - Typography: Inter font, JetBrains Mono for code
  - Cover page redesign: Claude Code logo, minimal white design
  - Fixed nested markdown code blocks (42 blocks using `````markdown`)
  - Added clickable GitHub links for all script references

---

## [3.8.0] - 2026-01-16

### Added

- **TL;DR Quick Start section** in README.md
  - Quick reference table: Cheat Sheet (2 min), Starter CLAUDE.md (30 sec), 5 Rules (1 min)
  - Copy-paste CLAUDE.md template directly in README
  - Optimized for TTFV (Time-to-First-Value) < 5 minutes
  - Prominent badges at top: version, license, Claude Code support

- **French Whitepapers documentation** in README.md
  - New section documenting 8 whitepapers in French (~185 pages total)
  - Learning paths by profile: Junior (25 min), Senior (1h15), Tech Lead (1h15)
  - Files in `whitepapers/` directory using Quarto (.qmd) format

- **CODE_OF_CONDUCT.md** (new file)
  - Contributor Covenant v2.1
  - Standard OSS community guidelines

- **Distribution playbooks** (internal, gitignored)
  - `claudedocs/distribution-playbook.md`: Ready-to-use content for awesome-claude-code PR, Reddit, dev.to, Twitter
  - `claudedocs/github-discussions-setup.md`: Step-by-step GitHub Discussions setup
  - French distribution strategy: Dev With AI Slack, LinkedIn FR

### Changed

- **CONTRIBUTING.md completely rewritten**
  - Added welcome message and contribution types table
  - Clear PR process with checklist
  - Quality checklist before submitting
  - References to GitHub Discussions and Code of Conduct

- **README.md restructured**
  - "Why This Guide" section rewritten for clarity
  - Repository structure updated to include whitepapers/
  - Dev With AI community reference added

### Internal

- Added `claudedocs/` and `whitepapers/` to `.gitignore` (internal docs)

---

## [3.7.1] - 2026-01-15

### Added

- **Intellectual Property Considerations** section in `guide/data-privacy.md`
  - Disclaimer about legal advice limitations
  - Key considerations: ownership, license contamination, vendor indemnification, sector compliance
  - Guidance to consult legal counsel for specific situations

---

## [3.7.0] - 2026-01-15

### Added - Session Search v2.1

Major upgrade to the session search utility (`cs`) with new features and bug fixes.

#### New Features

| Feature | Description | Example |
|---------|-------------|---------|
| **Multi-word AND search** | All words must match (was broken in v1) | `cs "prisma migration"` |
| **Project filter** | Filter by project name (substring) | `cs -p myproject "bug"` |
| **Date filter** | Filter by date (today, 7d, YYYY-MM-DD) | `cs --since 7d` |
| **JSON output** | Machine-readable output for scripting | `cs --json "api" \| jq .` |
| **Timeout** | 3-second timeout prevents long searches | Automatic |
| **Clean previews** | XML tags stripped, unicode filtered | No more `<local-command-caveat>` |

#### Performance

| Operation | Time |
|-----------|------|
| Cache lookup | ~16ms |
| Index rebuild | ~6s (239 sessions) |
| Fulltext search | 3-4s (timeout-bounded) |

#### Usage Examples

```bash
cs                          # 10 most recent sessions
cs "Prisma migration"       # Multi-word AND search
cs -p MethodeAristote "api" # Filter by project + keyword
cs --since 7d               # Last 7 days
cs --since today -n 20      # Today's sessions
cs --json "test" | jq .     # JSON for scripting
```

#### Files Modified

- `examples/scripts/session-search.sh` - Script v2.1 (367 lines)
- `guide/observability.md` - Documentation updated with new options

#### Quality Score Progression

| Version | Score | Key Improvements |
|---------|-------|------------------|
| v1.0 | 6/10 | Basic functionality |
| v2.0 | 8/10 | +AND search, +filters, +JSON |
| v2.1 | **9.3/10** | +JSON fix, +clean previews |

---

## [3.6.1] - 2026-01-15

### Fixed - Critical Factual Corrections

Major audit identifying and correcting factual errors that could mislead users about Claude Code's actual behavior.

#### 1. `--add-dir` Flag (Wrong Description → Permissions, Not Context Loading)

**Before**: Documented as "loading directories into context" / "focused context"
**Reality**: Grants tool access to directories outside CWD (permissions only, no token impact)

| File | Correction |
|------|------------|
| guide/ultimate-guide.md | "focused context" → "allow tool access outside CWD" |
| guide/cheatsheet.md | "Add directory" → "Allow access outside CWD" |
| machine-readable/reference.yaml | "limit loaded dirs" → "access dirs outside CWD" |
| quiz/questions/10-reference.yaml | Question + explanation corrected |

#### 2. `excludePatterns` → `permissions.deny` (Never Existed)

**Before**: Documented `excludePatterns` as a valid settings key
**Reality**: Never existed - the correct syntax is `permissions.deny`

| File | Correction |
|------|------------|
| guide/ultimate-guide.md | New syntax + warning |
| guide/data-privacy.md | New syntax + deprecation note |
| examples/scripts/audit-scan.sh | Detection + message fixed |
| tools/audit-prompt.md | 3 references corrected |

#### 3. `.claudeignore` Removed (Does Not Exist)

**Before**: Documented as a file exclusion mechanism like `.gitignore`
**Reality**: Not an official feature - use `permissions.deny` instead

| File | Correction |
|------|------------|
| guide/ultimate-guide.md | References → `permissions.deny` |
| guide/data-privacy.md | Section removed |
| CHANGELOG.md:1244 | Historical reference corrected |

#### 4. "Selective Context Loading" Myth → Lazy Loading Reality

**Before**: Implied Claude loads entire codebase or selectively loads directories
**Reality**: Claude uses lazy loading - reads files on-demand via Read/Grep tools

| File | Correction |
|------|------------|
| guide/ultimate-guide.md | New section explaining lazy loading |
| guide/cheatsheet.md | "Giant context loads" → "Vague prompts" |
| machine-readable/reference.yaml | "load giant context" → "bloated CLAUDE.md" |

#### 5. Invented CLI Flags (SuperClaude Extension Confusion)

**Before**: `--think`, `--think-hard`, `--ultrathink`, `--headless`, `--learn`, `--uc`, `--web` documented as official CLI flags
**Reality**: These are SuperClaude framework extensions (prompt injection), NOT official Claude Code flags

| Correction Type | Details |
|-----------------|---------|
| `--headless` | Replaced with `-p` (the actual flag for non-interactive mode) |
| `--think` variants | Clarified as "prompt keywords", not CLI flags |
| SuperClaude section | Added warning: "Non-official Extension" |
| Cheatsheet | Think flags table reformatted as prompt keywords |
| Decision tree | "Use --think" → "Use extended thinking prompts" |

#### 6. `@` File Reference Behavior

**Before**: "Claude loads file content automatically"
**After**: "Signals Claude to read files on-demand via tools"

### Added - Session Search Tool (`cs`)

**Problem solved**: After weeks of Claude Code usage, finding past conversations becomes painful:
- `claude --resume` is interactive (no search)
- Sessions accumulate in `~/.claude/projects/`
- No quick way to search "that session where I talked about auth"

**Solution**: `cs` — Zero-dependency bash script for searching and resuming sessions.

```bash
cs                    # List 10 recent sessions (15ms)
cs "authentication"   # Full-text search (400ms)
cs -n 20              # More results

# Output:
# 2026-01-15 08:32 │ my-project │ Implement OAuth flow for...
#   claude --resume 84287c0d-8778-4a8d-abf1-eb2807e327a8
```

**Performance comparison**:

| Tool | List | Search | Deps | Resume cmd |
|------|------|--------|------|------------|
| `cs` (this script) | 15ms | 400ms | None | ✅ Shown |
| claude-conversation-extractor | 230ms | 1.7s | Python | ❌ |
| `claude --resume` native | 500ms+ | ❌ | None | Interactive |

**Files created/modified**:

| File | Description |
|------|-------------|
| `examples/scripts/session-search.sh` | Script in repo (source) |
| `examples/README.md` | Entry in Scripts table |
| `guide/observability.md` | Section "Session Search & Resume" |
| `guide/ultimate-guide.md:505-524` | Examples in "Finding session IDs" |
| `README.md:398-403` | Section "Utility Scripts" |
| `machine-readable/reference.yaml` | `deep_dive.session_search` entry |

**Installation** (local):
```bash
# Copy script
cp examples/scripts/session-search.sh ~/.claude/scripts/cs
chmod +x ~/.claude/scripts/cs

# Add alias to shell
echo 'alias cs="~/.claude/scripts/cs"' >> ~/.zshrc
source ~/.zshrc
```

### Added - Security Documentation

| File | Addition |
|------|----------|
| guide/security-hardening.md | Section 1.2 "Known Limitations of permissions.deny" |

**Content**:
- Blocking matrix (Read/Edit/Write/Bash)
- Security gaps documented (GitHub #4160)
- Recommended exhaustive config
- Defense-in-depth strategy

### Files Modified (15 total)

```
guide/ultimate-guide.md
guide/cheatsheet.md
guide/data-privacy.md
guide/security-hardening.md
guide/observability.md
machine-readable/reference.yaml
examples/scripts/audit-scan.sh
examples/scripts/session-search.sh (NEW)
examples/README.md
tools/audit-prompt.md
quiz/questions/01-quick-start.yaml
quiz/questions/10-reference.yaml
CHANGELOG.md
```

### Root Cause Analysis

The factual errors originated from:
1. **SuperClaude framework confusion**: User had `~/.claude/FLAGS.md` with custom flags that were documented as if official
2. **Assumption propagation**: "selective loading" concept was assumed from other AI tools
3. **Outdated syntax**: `excludePatterns` may have been planned but never implemented

---

## [3.6.0] - 2026-01-15

### Added - Version Sync Infrastructure

Single source of truth for versioning across all documentation.

#### New Files
- **VERSION** - Canonical version file (single source of truth)
- **scripts/sync-version.sh** - Automated version synchronization script
  - `--check` mode for CI validation (exit 1 if mismatch)
  - Auto-fixes all 3.x.x versions across docs
  - macOS/Linux compatible

#### Fixed
- **Version inconsistencies resolved**:
  - guide/cheatsheet.md: 3.5.0 → 3.6.0
  - guide/ultimate-guide.md: 3.0.7, 3.5.0 → 3.6.0
  - machine-readable/reference.yaml: 3.5.0 → 3.6.0

---

### Improved - README.md Navigation & Structure

Documentation alignment and navigation improvements.

#### README.md Updates
- **Repository Structure**: Added guide/workflows/, examples/modes/, examples/config/, examples/memory/
- **Core Documentation**: Added 5 entries (methodologies.md, workflows/, data-privacy.md, security-hardening.md, observability.md)
- **Slash Commands**: Added 4 commands (generate-tests, review-pr, git-worktree, validate-changes)
- **Security Hooks**: Added 2 hooks + link to complete catalog
- **🧭 Not Sure Where to Start?**: Added 6 navigation entries (Workflows, Methodologies, Architecture, Data Privacy, Security Hardening, Observability)
- **By Role Paths**: Enhanced all 4 paths with new resources (Power User +1: Security Hardening)
- **SEO Keywords**: Added 9 keywords (tdd ai, sdd, bdd, methodologies, architecture, workflows, data privacy, ai coding workflows)

#### guide/README.md Updates
- Added security-hardening.md to Contents table

---

## [3.5.0] - 2026-01-14

### Added - Development Methodologies & Workflows

Comprehensive documentation covering 15 structured development methodologies for AI-assisted development (2025-2026), with practical workflow guides.

#### New Files
- **guide/methodologies.md** (NEW, ~400 lines) - Complete methodology reference:
  - 15 methodologies organized in 6-tier pyramid (Orchestration → Optimization)
  - BMAD, SDD, TDD, BDD, DDD, ATDD, CDD, FDD, Context Engineering, Eval-Driven, Multi-Agent, Iterative Loops, Prompt Engineering
  - Decision tree for choosing the right approach
  - SDD tools reference (Spec Kit, OpenSpec, Specmatic)
  - Combination patterns by project type
  - Claude Fit ratings for each methodology

- **guide/workflows/** (NEW directory, 4 files, ~700 lines total):
  - **tdd-with-claude.md** - Test-Driven Development workflow with Claude-specific prompting patterns
  - **spec-first.md** - Spec-First Development (SDD) adapted for CLAUDE.md
  - **plan-driven.md** - Effective use of /plan mode
  - **iterative-refinement.md** - Prompt → Observe → Reprompt loops

#### Guide Updates
- **guide/ultimate-guide.md** - Section 9.14 "Development Methodologies" (NEW, ~60 lines):
  - Quick decision tree for workflow selection
  - 4 core workflows summary table
  - 15 methodologies reference table
  - SDD tools overview
  - Combination patterns by situation

#### Navigation Updates
- **guide/README.md** - Contents table updated with methodologies.md and workflows/

### Sources
- Anthropic Engineering Blog (claude-code-best-practices, context-engineering)
- GitHub (Spec Kit official announcement)
- Martin Fowler (SDD essays)
- Fission AI (OpenSpec)
- Specmatic.io
- Community production reports (2025-2026)

### Stats
- 5 new files created (~1,100 lines total)
- 2 files modified (ultimate-guide.md, guide/README.md)
- Focus on practical, actionable workflows over theory

---

## [3.4.0] - 2026-01-14

### Added - Architecture & Internals Documentation

New comprehensive documentation explaining how Claude Code works internally, based on official Anthropic sources and verified community analysis.

#### New Files
- **guide/architecture.md** (NEW, ~800 lines) - Complete technical deep-dive:
  - The Master Loop (`while(tool_call)` architecture)
  - The Tool Arsenal (8 core tools: Bash, Read, Edit, Write, Grep, Glob, Task, TodoWrite)
  - Context Management Internals (~200K token budget, auto-compaction)
  - Sub-Agent Architecture (isolated context, max depth=1)
  - Permission & Security Model (interactive prompts + allow/deny + hooks)
  - MCP Integration (JSON-RPC 2.0, treated as native tools)
  - The Edit Tool internals (exact match → fuzzy matching)
  - Session Persistence (--resume, --continue)
  - Philosophy: "Less Scaffolding, More Model"
  - Claude Code vs Alternatives comparison table
  - Sources with explicit confidence levels (Tier 1/2/3)
  - Appendix: What We Don't Know (transparency about gaps)
  - 5 ASCII diagrams (Master Loop, Context Budget, Sub-Agent, Permission Layers, MCP)

#### Guide Updates
- **guide/ultimate-guide.md** - Section 2.7 "Under the Hood" (NEW, ~100 lines):
  - Summary of architecture concepts with ASCII diagram
  - Links to full architecture.md for deep dives
  - Cross-references to existing sections (7-Hooks, 8.6-MCP Security)
  - Updated Table of Contents

- **guide/cheatsheet.md** - "Under the Hood (Quick Facts)" section (NEW):
  - 5-row table with key architecture concepts
  - Link to architecture.md for deep dive

#### Navigation Updates
- **README.md** - Core Documentation table + Repository Structure updated
- **guide/README.md** - Contents table updated with architecture.md
- **machine-readable/reference.yaml** - New `architecture:` section + deep_dive refs
- **machine-readable/llms.txt** - Guide structure + file list updated
- **tools/audit-prompt.md** - Related Resources updated
- **tools/onboarding-prompt.md** - Related Resources updated
- **examples/README.md** - Footer reference added

### Sources
- Tier 1 (Official): anthropic.com/engineering/claude-code-best-practices, code.claude.com/docs
- Tier 2 (Verified): PromptLayer analysis, community observations
- Tier 3 (Inferred): Marked with confidence levels

### Stats
- 1 new file created (architecture.md, ~800 lines)
- 10 files modified (navigation, versioning)
- Focus on transparency about Claude Code internals with source citations

---

## [3.3.1] - 2026-01-14

### Changed
- **IDEAS.md** - Consolidated and curated research topics
  - High Priority: Unified "MCP Security Hardening" (merged 3 overlapping topics)
  - Medium Priority: Kept CI/CD Workflows Gallery + MCP Server Catalog
  - Lower Priority: CLAUDE.md Patterns Library (templates by stack)
  - Discarded: Added 6 topics already covered in guide (prompt engineering, context optimization, task decomposition, agent architecture, case studies, tool comparisons)
  - Technical writer agent validation of all ideas against reference.yaml

### Stats
- IDEAS.md reduced from 12 research topics to 4 actionable items
- Discarded section expanded from 3 to 16 entries with clear justifications
- Focus on actionable research vs theoretical exploration

---

## [3.3.0] - 2026-01-14

### Added - LLM Handbook Integration + Google Agent Whitepaper

This release combines learnings from the LLM Engineers Handbook (guardrails, observability, evaluation) and Google's Agent Whitepaper (context triage, security patterns, validation checklists).

#### Advanced Guardrails
- **examples/hooks/bash/prompt-injection-detector.sh** - PreToolUse hook detecting:
  - Role override attempts ("ignore previous instructions", "you are now")
  - Jailbreak patterns ("DAN mode", "developer mode")
  - Delimiter injection (`</system>`, `[INST]`, `<<SYS>>`)
  - Authority impersonation and base64-encoded payloads
- **examples/hooks/bash/output-validator.sh** - PostToolUse heuristic validation:
  - Placeholder content detection (`/path/to/`, `TODO:`, `example.com`)
  - Potential secrets in output (regex patterns)
  - Uncertainty indicators and incomplete implementations
- **examples/hooks/bash/claudemd-scanner.sh** - SessionStart hook (NEW):
  - Scans CLAUDE.md files for prompt injection attacks before session
  - Detects: "ignore previous instructions", shell injection (`curl | bash`), base64 obfuscation
  - Warns about suspicious patterns in repository memory files
- **examples/hooks/bash/output-secrets-scanner.sh** - PostToolUse hook (NEW):
  - Scans tool outputs for leaked secrets (API keys, tokens, private keys)
  - Catches secrets before they appear in responses or commits
  - Detects: OpenAI/Anthropic/AWS keys, GitHub tokens, database URLs

#### Observability & Monitoring
- **examples/hooks/bash/session-logger.sh** - PostToolUse operation logging:
  - JSONL format to `~/.claude/logs/activity-YYYY-MM-DD.jsonl`
  - Token estimation, project tracking, session IDs
- **examples/scripts/session-stats.sh** - Log analysis script:
  - Daily/weekly/monthly summaries
  - Cost estimation with configurable rates
  - Tool usage and project breakdowns
- **guide/observability.md** - Full observability documentation (~180 lines):
  - Setup instructions, cost tracking, patterns
  - Limitations clearly documented

#### LLM-as-a-Judge Evaluation
- **examples/agents/output-evaluator.md** - Quality gate agent (Haiku):
  - Scores: Correctness, Completeness, Safety (0-10)
  - Verdicts: APPROVE, NEEDS_REVIEW, REJECT
  - JSON output format for automation
- **examples/commands/validate-changes.md** - `/validate-changes` command:
  - Pre-commit validation workflow
  - Integrates with output-evaluator agent
- **examples/hooks/bash/pre-commit-evaluator.sh** - Git pre-commit hook:
  - Opt-in LLM evaluation before commits
  - Cost: ~$0.01-0.05/commit (Haiku)
  - Bypass with `--no-verify` or `CLAUDE_SKIP_EVAL=1`

#### Google Agent Whitepaper Integration
- **guide/ultimate-guide.md Section 2.2.4** - Context Triage Guide (NEW):
  - What to keep vs evacuate when approaching context limits
  - Priority matrix: Critical (current task) → Important (recent decisions) → Evacuate (old context)
  - Recovery patterns for session continuation
- **guide/ultimate-guide.md Section 3.1.3** - CLAUDE.md Injection Warning (NEW):
  - Security risks when cloning unfamiliar repositories
  - Recommendation to use `claudemd-scanner.sh` hook
  - Examples of malicious patterns to watch for
- **guide/ultimate-guide.md Section 4.2.4** - Agent Validation Checklist (NEW):
  - 12-point checklist before deploying custom agents
  - Covers: tool restrictions, output validation, error handling, cost control
  - Based on Google's agent validation framework
- **guide/ultimate-guide.md Section 8.6** - MCP Security (NEW):
  - Tool Shadowing attacks: malicious MCP tools mimicking legitimate ones
  - Confused Deputy attacks: MCP servers tricked into unauthorized actions
  - Mitigation strategies and trust verification patterns
- **guide/ultimate-guide.md Section 3.3.3** - Session vs Memory (NEW):
  - Clarifies session context (ephemeral) vs persistent memory (Serena write_memory)
  - When to use each for long-running projects
  - Recovery patterns after context limits

### Changed
- **examples/hooks/README.md** - Added "Advanced Guardrails" section with all new hooks
- **examples/README.md** - Updated index with all new files
- **guide/README.md** - Added observability.md to contents

### Stats
- 10 new files created
- 8 files modified
- 5 new guide sections added
- Focus: Production LLM patterns + Security hardening + Context management

---

## [3.2.0] - 2026-01-14

### Added
- **guide/data-privacy.md** - Comprehensive data privacy documentation (NEW, ~200 lines)
  - TL;DR retention table: 5 years (default) | 30 days (opt-out) | 0 (Enterprise ZDR)
  - Data flow diagram showing what leaves your machine
  - Known risks with MCP database connections
  - Protection measures (excludePatterns, hooks, MCP safety)
  - Quick checklist for immediate action

- **README.md** - Privacy notice encart (3 lines after transparency note)
  - Retention summary with action link
  - Direct link to opt-out and full guide

- **guide/ultimate-guide.md** - Section 2.6 "Data Flow & Privacy" (~45 lines)
  - Data types sent table
  - Retention policies table
  - Link to dedicated guide
  - Updated TOC and quick jump navigation

- **tools/onboarding-prompt.md** - Phase 0.5 Privacy Awareness
  - Privacy notice shown after level assessment
  - Asks user about privacy settings configuration

- **tools/audit-prompt.md** - Privacy configuration checks
  - Phase 1.2: PRIVACY CONFIGURATION bash checks
  - Phase 2.1: Privacy Configuration checklist
  - Glossary: "Data Retention" and "excludePatterns" terms

- **examples/scripts/audit-scan.sh** - PRIVACY CHECK section
  - Human output: .env exclusion check, DB MCP warning, opt-out link
  - JSON output: `"privacy"` object with env_excluded, has_db_mcp, opt_out_link, guide_link

- **examples/scripts/check-claude.sh** - Privacy reminder section
  - Shows retention info and opt-out link during health check

- **examples/hooks/bash/privacy-warning.sh** - SessionStart hook (NEW)
  - Displays privacy reminder box once per terminal session
  - Suppresses with `PRIVACY_WARNING_SHOWN=1` env var

- **guide/cheatsheet.md** - Golden Rule #7 added
  - "Know what's sent — prompts, files, MCP results → Anthropic"

### Stats
- 2 new files created (data-privacy.md, privacy-warning.sh)
- 8 files modified (README, guide, cheatsheet, audit-scan, check-claude, onboarding, audit-prompt)
- Focus on user awareness of data retention and actionable opt-out

## [3.1.0] - 2026-01-13

### Changed
- **Major repository restructuring** - Reorganized 15 root files into 4 thematic directories
  - `guide/` - Core documentation (ultimate-guide.md, cheatsheet.md, adoption-approaches.md)
  - `tools/` - Interactive utilities (audit-prompt.md, onboarding-prompt.md, mobile-access.md)
  - `machine-readable/` - LLM/AI consumption (reference.yaml, llms.txt)
  - `exports/` - Generated outputs (notebooklm.pdf, kimi.pdf)
- **File renaming** for cleaner paths:
  - `english-ultimate-claude-code-guide.md` → `guide/ultimate-guide.md`
  - `cheatsheet-en.md` → `guide/cheatsheet.md`
  - `claude-setup-audit-prompt.md` → `tools/audit-prompt.md`
  - `personalized-onboarding-prompt.md` → `tools/onboarding-prompt.md`
  - `mobile-access-setup.md` → `tools/mobile-access.md`
  - `claude-code-reference.yaml` → `machine-readable/reference.yaml`
- **README.md** - Added "Repository Structure" section with visual tree
- **150+ internal links updated** across all documentation files
- **Deleted** empty `to-ignore/` directory

### Added
- `guide/README.md` - Index for core documentation folder
- `tools/README.md` - Index for interactive utilities folder
- `machine-readable/README.md` - Index for LLM consumption folder
- `exports/README.md` - Index for generated outputs folder

### Stats
- 10 files moved to new locations
- 4 new README.md files created
- 150+ links updated
- Navigation significantly improved

## [3.0.7] - 2026-01-13

### Added
- **mobile-access-setup.md** - Mobile access guide for Claude Code (NEW, WIP/UNTESTED)
  - Problem statement: Claude Code lacks native session relay/sync across devices
  - Solution: ttyd + Tailscale for ToS-safe mobile access
  - Complete setup script with tmux for persistent sessions
  - Security considerations and ToS compliance notes
  - Alternatives comparison (Happy Coder, Claude Code Web, tmux+SSH)
  - Troubleshooting guide
  - Marked as WIP/UNTESTED - community feedback welcome

- **README.md** - Added mobile access guide to navigation table
  - New row: "Want mobile access to Claude Code" → Mobile Access Setup → WIP

### Stats
- 1 new file created (mobile-access-setup.md, ~300 lines)
- 2 files modified (README.md, cheatsheet-en.md version bump)
- Focus on ToS-safe remote access without third-party wrappers

## [3.0.6] - 2026-01-13

### Changed
- **Documentation honesty overhaul** - Removed marketing language and unverified claims
  - **README.md** (~12 edits):
    - Added transparency disclaimer after badges
    - Changed "Transform...superpower" → factual description of content
    - Changed "Our Solution: in hours, not weeks" → honest framing
    - Replaced time estimates with depth categories (Essentials, Foundation, Intermediate, Comprehensive)
    - Fixed "2 seconds" claims → "Quick (~30 seconds)"
    - Corrected privacy claim ("Everything runs locally" → accurate API explanation)
    - Changed "mentor for Claude Code mastery" → "structured learning companion"
  - **english-ultimate-claude-code-guide.md** (~15 edits):
    - Added "Before You Start" disclaimer section at top
    - Removed "Guide Status 100% Complete" table (false certainty)
    - Added qualifying note after context thresholds table
    - "90% of daily usage" → "the ones I use most frequently"
    - "20-30% faster" → subjective productivity indicators
    - "Saves 30-40%" → "Frees significant context space"
    - Removed invented ROI table with fake calculations
    - "Never guesses - always verifies" → with LLM hallucination warning
    - Removed "12,400% ROI" ridiculous claim
    - "90% of tasks" → "most common tasks"
    - "80-90% savings" → "significant (varies by project)"
  - **adoption-approaches.md** (already in 3.0.5):
    - Added disclaimer about Claude Code being young (~1 year)
    - Added "What We Don't Know Yet" section
    - Changed prescriptive language to tentative observations

### Stats
- 3 files modified (README.md, english-ultimate-claude-code-guide.md, cheatsheet-en.md)
- ~30 edits removing invented percentages, times, and marketing claims
- Focus on honest, qualified observations over false authority

## [3.0.5] - 2026-01-13

### Added
- **adoption-approaches.md** - Comprehensive adoption philosophy guide (NEW, ~355 lines)
  - Addresses community feedback: "turnkey setup" vs "autonomous learning" approaches
  - **Decision Tree** for immediate routing based on context (time, team size, uniqueness)
  - **Turnkey Quickstart** (15 min) with 3 verifiable steps
  - **Autonomous Learning Path** with 4 phases + time estimates + line references
  - **Adoption Checkpoints** with pass/fail criteria (Day 1, Week 1, Week 2, Month 1)
  - **Anti-patterns** table with symptoms and solutions
  - **Team Size Guidelines** with config structures for solo/4-10/10+ developers
  - **Scenario Decisions**: CTO evaluation, team disagreements, inherited configs, upgrade triggers
  - **Quick Reference**: daily commands table + cost-conscious model selection
  - Aligns with `claude-code-reference.yaml` patterns (decision trees, line refs, context zones)

### Changed
- **README.md** - Added adoption guide to "Not Sure Where to Start?" navigation table
  - New row: "Choosing turnkey vs. autonomous approach" → Adoption Guide → 5 min

### Stats
- 1 new file created (adoption-approaches.md, ~355 lines)
- 1 file modified (README.md, +1 line)
- Focus on helping users choose the right adoption strategy for their context

## [3.0.4] - 2026-01-13

### Added
- **examples/commands/diagnose.md** - Interactive troubleshooting assistant (NEW)
  - Bilingual support (FR/EN) with automatic language detection
  - 12 problem categories: permissions, MCP servers, config, performance, installation, agents/skills
  - Auto-fetches latest guide from GitHub for up-to-date troubleshooting data
  - Integrates with `audit-scan.sh --json` for environment scanning
  - Structured diagnostic output: root cause → solution → template → reference
  - Common patterns documented: repeated permission prompts, MCP not found, context saturation
  - Usage: Copy to `~/.claude/commands/` then invoke with `/diagnose`

### Changed
- **README.md** - Added `/diagnose` to commands table and navigation
- **examples/README.md** - Added `/diagnose` to commands index
- **cheatsheet-en.md** - Version bump to 3.0.4

### Stats
- 1 new file created (diagnose.md, ~210 lines)
- 3 files modified (README.md, examples/README.md, cheatsheet-en.md)
- Focus on self-service troubleshooting for common Claude Code issues

## [3.0.3] - 2026-01-13

### Enhanced
- **audit-scan.sh v2.0** - Major improvements based on community feedback (2 test projects)
  - **P0.1: MCP Detection globale** - Now detects both project-specific AND global MCPs from `~/.claude.json`
    - Previously only checked `projects[path].mcpServers`, now also checks top-level `mcpServers`
    - Shows separate counts: project MCPs vs global MCPs with their sources
  - **P0.2: MCP documented vs configured** - New feature detecting MCPs mentioned in CLAUDE.md but not actually configured
    - Scans CLAUDE.md files for known MCPs (serena, context7, sequential, playwright, morphllm, magic, filesystem)
    - Warns when MCP is documented but missing from config: "Documented but NOT configured: serena"
    - Helps catch configuration drift
  - **P1.1: +35 integrations detected** - Expanded from ~25 to ~60 packages
    - Chat/Communication: TalkJS, Knock, Stream
    - Maps: MapLibre, Mapbox, Google Maps
    - File Upload: Bytescale, UploadThing, Cloudinary
    - Admin: Forest Admin, Refine
    - Validation: Zod, Yup, Valibot
    - UI Libraries: Chakra UI, Material UI, DaisyUI, Mantine
    - Database providers: Neon, PlanetScale, Vercel Postgres, Upstash, Turso
    - Analytics: Vercel Analytics, Mixpanel, Hotjar, Amplitude
    - Feature flags: Vercel Flags, LaunchDarkly
    - Forms: React Hook Form, Formik
    - Auth: Kinde
    - Payments: LemonSqueezy
    - AI: Vercel AI SDK
    - CMS: Payload CMS
    - State: Jotai
  - **P1.2: Test framework warning** - Now explicitly warns when no test framework detected
    - Checks package.json deps, config files (jest.config.*, vitest.config.*), and test file patterns
    - Shows ❌ "No test framework detected" in quality patterns
  - **P1.3: MCP Recommendations** - Context-aware suggestions based on detected stack
    - context7 recommended for modern frameworks (Next.js, React, Vue, etc.)
    - sequential-thinking for complex architectures (with DB or NestJS/Next.js)
    - playwright for projects without E2E testing
    - serena for TypeScript projects
  - **P2.1: SSoT detection élargie** - Now searches for @refs in codebase even without CLAUDE.md
    - If >5 files contain `@*.md` references, considers SSoT pattern adopted
  - **P2.2: shadcn/ui detection** - Special case handling (not in package.json)
    - Detects presence of `components/ui/` or `src/components/ui/` folders
  - **JSON output enhanced** with new fields:
    - `quality.has_test_framework` (boolean)
    - `mcp.project_servers`, `mcp.global_servers` (separated)
    - `mcp.documented`, `mcp.missing` (doc vs config gap)
    - `mcp.recommendations` (stack-based suggestions)
  - **Human output enhanced**:
    - New "🔌 MCP SERVERS" section with project/global breakdown
    - Warning for documented but unconfigured MCPs
    - Recommendations displayed with 💡 icon

### Fixed
- **audit-scan.sh** - `ALL_DEPS` unbound variable error when running outside Node.js projects
  - Initialized `ALL_DEPS=""` before conditional blocks

### Stats
- 1 file modified (audit-scan.sh, ~200 lines added/modified)
- Integration detection improved from ~25 to ~60 packages
- MCP detection now covers all configuration locations
- Based on feedback from Native Spaces (venue booking) and Méthode Aristote (EdTech) projects

## [3.0.2] - 2026-01-12

### Added
- **personalized-onboarding-prompt.md** - Interactive onboarding prompt (~200 lines)
  - Multilingual support: User chooses preferred language first
  - 3 experience levels: Beginner (🟢), Intermediate (🟡), Power User (🔴)
  - Progressive exploration with deeper/next/skip controls
  - Tailored learning paths per level
  - Optional practical exercises
  - Self-paced interactive Q&A format

- **README.md** - Added onboarding prompt to "Not Sure Where to Start?" table
  - New row: "Want a guided tour" → Personalized Onboarding → ~15 min

### Stats
- 1 new file created (personalized-onboarding-prompt.md, ~200 lines)
- 1 file modified (README.md)
- Focus on accessible, multilingual onboarding experience

## [3.0.1] - 2026-01-12

### Added
- **Custom Statusline Setup** documentation
  - New section in `english-ultimate-claude-code-guide.md` (lines 990-1027)
  - [ccstatusline](https://github.com/sirmalloc/ccstatusline) as recommended solution
  - Enhanced statusline displays: model, git branch, file changes (+/-), context metrics
  - Custom script option with JSON stdin format
  - `/statusline` command reference for auto-generation
  - Added to `cheatsheet-en.md` (lines 130-133)

### Stats
- 2 files modified (english-ultimate-claude-code-guide.md ~38 lines, cheatsheet-en.md ~4 lines)
- Focus on developer experience and terminal customization

## [3.0.0] - 2026-01-12

### Added
- **quiz/** - Interactive CLI quiz to test Claude Code knowledge (MAJOR FEATURE)
  - 159 curated questions across 10 categories (matching guide sections)
  - 4 user profiles: Junior (15q), Senior (20q), Power User (25q), PM (10q)
  - Immediate feedback with explanations and documentation links
  - Score tracking with category breakdown and weak area identification
  - Session persistence to `~/.claude-quiz/` for progress history
  - Replay options: retry wrong questions or start fresh quiz
  - Optional dynamic question generation via `claude -p`
  - Cross-platform: Node.js (works on macOS, Linux, Windows)

- **README.md** - New "Knowledge Quiz" section in navigation
  - Added quiz to "Not Sure Where to Start?" table
  - Collapsible example session showing quiz flow
  - Links to quiz documentation and contribution template

### Files Created
```
quiz/
├── package.json           # Node.js config
├── README.md              # Full documentation with examples
├── src/
│   ├── index.js           # Entry point + CLI args
│   ├── ui.js              # Terminal display
│   ├── prompts.js         # User prompts (inquirer)
│   ├── questions.js       # YAML loading + filtering
│   ├── quiz.js            # Quiz engine
│   ├── score.js           # Score tracking
│   ├── session.js         # Persistence
│   └── dynamic.js         # claude -p generation
├── questions/             # 10 YAML files (159 questions)
└── templates/
    └── question-template.yaml
```

### Stats
- 20+ new files
- 159 questions covering all guide sections
- New learning tool for the community

## [2.9.9] - 2026-01-12

### Enhanced
- **audit-scan.sh** - SSoT refactor warning
  - New `needs_ssot_refactor` flag: true if CLAUDE.md >100 lines with 0 @references
  - Human output shows red warning suggesting SSoT pattern (split into @docs/)
  - JSON output includes `needs_ssot_refactor` in quality section

- **README.md** - Improved Full Audit prompt for incremental suggestions
  - Added IMPORTANT instruction to focus on incremental improvements, not generic advice
  - Health score now penalizes large CLAUDE.md without @refs
  - Quick wins must be domain-specific, not generic
  - If CLAUDE.md exists: suggest 3-5 improvements instead of full template
  - Agents/commands suggestions must not duplicate existing ones

### Stats
- 2 files modified
- Audit now provides targeted, incremental recommendations

## [2.9.8] - 2026-01-12

### Enhanced
- **audit-scan.sh** - Enhanced stack detection with detailed breakdown
  - Now detects: runtime, framework, test runner, bundler, database/ORM
  - Generic integration detection from package.json (auth, payments, AI, monitoring, etc.)
  - Works without jq (grep-based fallback for all JSON parsing)
  - Stack recap shown at top of human output
  - JSON output includes full `stack` object with all detected components

- **README.md** - Updated Full Audit prompt
  - Now requests Stack Recap as first output item
  - CLAUDE.md template increased from ~60 to ~100 lines
  - Added integration-aware suggestions in output description

### Fixed
- **audit-scan.sh** - jq fallback now works for MCP detection in ~/.claude.json

### Stats
- 2 files modified (audit-scan.sh ~150 lines added, README.md prompt updated)
- Detects 25+ common integrations (Clerk, Stripe, OpenAI, Sentry, etc.)

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
  - Token-saving techniques (concise CLAUDE.md, targeted @references, proactive compacting)
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
