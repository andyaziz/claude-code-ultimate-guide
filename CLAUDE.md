# Claude Code Ultimate Guide - Project Context

## Purpose

This repository is the **comprehensive documentation for Claude Code** (Anthropic's CLI tool). It teaches users how to use Claude Code effectively through guides, examples, and templates.

**Meta-note**: This repo documents Claude Code, so its own configuration should be exemplary.

## Repository Structure

```
guide/                    # Core documentation
├── ultimate-guide.md     # Main guide (~9500 lines, the reference)
├── cheatsheet.md         # 1-page printable summary
├── architecture.md       # How Claude Code works internally
├── methodologies.md      # TDD, SDD, BDD workflows
├── data-privacy.md       # What data is sent to Anthropic
├── security-hardening.md # Security best practices
└── workflows/            # Step-by-step workflow guides

examples/                 # Production-ready templates
├── agents/               # Custom agent templates
├── commands/             # Slash command templates
├── hooks/                # Event hook examples (bash/powershell)
├── skills/               # Skill module templates
└── scripts/              # Utility scripts (audit, health check)

machine-readable/         # For LLM consumption
├── reference.yaml        # Condensed index (~2K tokens)
└── llms.txt              # AI indexation file

tools/                    # Interactive utilities
├── audit-prompt.md       # Setup audit prompt
└── onboarding-prompt.md  # Personalized learning prompt
```

## Key Files

| File | Purpose |
|------|---------|
| `VERSION` | Single source of truth for version (currently 3.6.0) |
| `guide/ultimate-guide.md` | The main reference (search here first) |
| `guide/cheatsheet.md` | Quick reference for daily use |
| `machine-readable/reference.yaml` | LLM-optimized index with line numbers |
| `CHANGELOG.md` | All changes with detailed descriptions |

## Commands

### Version Management
```bash
# Check version consistency across all docs
./scripts/sync-version.sh --check

# Fix version mismatches (updates from VERSION file)
./scripts/sync-version.sh

# Bump version
echo "3.7.0" > VERSION && ./scripts/sync-version.sh
```

### Before Committing
```bash
# Verify versions are synchronized
./scripts/sync-version.sh --check
```

## Conventions

### Documentation Style
- **Accuracy over marketing**: No invented percentages or unverified claims
- **Practical examples**: Every concept has a concrete example
- **Source attribution**: Credit community contributions with links
- **Version alignment**: All version numbers must match `VERSION` file

### File Organization
- New guides → `guide/`
- New templates → `examples/{agents,commands,hooks,skills}/`
- Navigation updates → Update both `README.md` and `guide/README.md`

### Versioning
- `VERSION` file is the single source of truth
- Run `./scripts/sync-version.sh` after changing version
- Files that contain version: README.md, cheatsheet.md, ultimate-guide.md, reference.yaml

## Current Focus

Check `IDEAS.md` for planned improvements and `CHANGELOG.md [Unreleased]` for work in progress.

## Quick Lookups

For answering questions about Claude Code:
1. Search `machine-readable/reference.yaml` first (has line numbers to full guide)
2. Use those line numbers to read relevant sections from `guide/ultimate-guide.md`
3. Check `examples/` for ready-to-use templates
