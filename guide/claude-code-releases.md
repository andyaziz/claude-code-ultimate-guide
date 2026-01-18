# Claude Code Release History

> Condensed changelog of Claude Code official releases.
> **Full details**: [github.com/anthropics/claude-code/CHANGELOG.md](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)
> **Machine-readable**: [claude-code-releases.yaml](../machine-readable/claude-code-releases.yaml)

**Latest**: v2.1.12 | **Updated**: 2026-01-18

---

## Quick Jump

- [2.1.x Series (January 2026)](#21x-series-january-2026) — Skill hot-reload, Vim motions, /plan command
- [2.0.x Series (Nov 2025 - Jan 2026)](#20x-series-november-2025---january-2026) — Opus 4.5, Claude in Chrome, Background agents
- [Breaking Changes Summary](#breaking-changes-summary)
- [Milestone Features](#milestone-features)

---

## 2.1.x Series (January 2026)

### v2.1.12 (2026-01-18)

- Bug fix: Message rendering

### v2.1.11 (2026-01-17)

- Fix: Excessive MCP connection requests for HTTP/SSE transports

### v2.1.10 (2026-01-17)

- New `Setup` hook event (--init, --init-only, --maintenance flags)
- Keyboard shortcut 'c' to copy OAuth URL
- File suggestions show as removable attachments
- [VSCode] Plugin install count + trust warnings

### v2.1.9 (2026-01-16)

- `auto:N` syntax for MCP tool search threshold configuration
- `plansDirectory` setting for custom plan file locations
- Session URL attribution to commits/PRs from web sessions
- PreToolUse hooks can return `additionalContext`
- `${CLAUDE_SESSION_ID}` string substitution for skills

### v2.1.7 (2026-01-15)

- `showTurnDuration` setting to hide turn duration messages
- MCP tool search auto mode enabled by default
- Inline display of agent final response in task notifications

**⚠️ Breaking**:
- OAuth/API Console URLs changed: `console.anthropic.com` → `platform.claude.com`
- Security fix: Wildcard permission rules could match compound commands

### v2.1.6 (2026-01-14)

- Search functionality in `/config` command
- Date range filtering in `/stats` (press `r` to cycle)
- Auto-discovery of skills from nested `.claude/skills` directories
- Updates section in `/doctor` showing auto-update channel

**⚠️ Security Fix**: Permission bypass via shell line continuation

### v2.1.5 (2026-01-13)

- `CLAUDE_CODE_TMPDIR` environment variable for custom temp directory

### v2.1.4 (2026-01-12)

- `CLAUDE_CODE_DISABLE_BACKGROUND_TASKS` environment variable

### v2.1.3 (2026-01-11)

- Merged slash commands and skills (simplified mental model)
- Release channel toggle (stable/latest) in `/config`
- `/doctor` warnings for unreachable permission rules

### v2.1.2 (2026-01-10)

- Windows Package Manager (winget) support
- Clickable hyperlinks for file paths (OSC 8 terminals)
- Shift+Tab shortcut in plan mode for auto-accept edits
- Large bash outputs saved to disk instead of truncated

**⚠️ Breaking**:
- Security fix: Command injection in bash command processing
- Deprecated: `C:\ProgramData\ClaudeCode` managed settings path

### v2.1.0 (2026-01-08) ⭐ MAJOR

**Highlights**:
- ⭐ **Automatic skill hot-reload** — Skills modified in `~/.claude/skills` or `.claude/skills` immediately available
- ⭐ **Shift+Enter works OOTB** in iTerm2, WezTerm, Ghostty, Kitty
- ⭐ **New Vim motions**: `;` `,` `y` `yy` `Y` `p` `P` text objects (`iw` `aw` `i"` etc.) `>>` `<<` `J`
- **Unified Ctrl+B** for backgrounding all running tasks
- `/plan` command shortcut to enable plan mode
- Slash command autocomplete anywhere in input
- `language` setting for response language (e.g., `language: "japanese"`)
- Skills `context: fork` support for forked sub-agent context
- Hooks support in agent/skill/command frontmatter
- MCP `list_changed` notifications support
- `/teleport` and `/remote-env` commands for web sessions
- Disable specific agents with `Task(AgentName)` syntax
- `--tools` flag in interactive mode
- YAML-style lists in frontmatter `allowed-tools`

**⚠️ Breaking**:
- OAuth URLs: `console.anthropic.com` → `platform.claude.com`
- Removed permission prompt for entering plan mode
- [SDK] Minimum zod peer dependency: `^4.0.0`

---

## 2.0.x Series (November 2025 - January 2026)

### v2.0.76 (2026-01-05)

- Fix: macOS code-sign warning with Claude in Chrome

### v2.0.74 (2026-01-04) ⭐

- ⭐ **LSP (Language Server Protocol) tool** for code intelligence (go-to-definition, find references, hover)
- `/terminal-setup` for Kitty, Alacritty, Zed, Warp
- Ctrl+T in `/theme` to toggle syntax highlighting
- Grouped skills/agents by source in `/context`

### v2.0.72 (2026-01-02) ⭐

- ⭐ **Claude in Chrome (Beta)** — Control browser directly from Claude Code
- Reduced terminal flickering
- QR code for mobile app download
- Thinking toggle changed: Tab → Alt+T

### v2.0.70 (2025-12-30)

- Enter key accepts/submits prompt suggestions immediately
- Wildcard syntax `mcp__server__*` for MCP tool permissions
- Auto-update toggle for plugin marketplaces
- 3x memory usage improvement for large conversations

**⚠️ Breaking**: Removed `#` shortcut for quick memory entry

### v2.0.67 (2025-12-26) ⭐

- ⭐ **Thinking mode enabled by default for Opus 4.5**
- Thinking config moved to `/config`
- Search in `/permissions` with `/` shortcut

### v2.0.64 (2025-12-22) ⭐

- ⭐ **Instant auto-compacting**
- ⭐ **Async agents and bash commands** with wake-up messages
- `/stats` with usage graphs, streaks, favorite model
- Named sessions: `/rename`, `/resume <name>`
- Support for `.claude/rules/` directory
- Image dimension metadata for coordinate mappings

### v2.0.60 (2025-12-18) ⭐

- ⭐ **Background agents** — Agents run while you work
- `--disable-slash-commands` CLI flag
- Model name in Co-Authored-By commits
- `/mcp enable|disable [server-name]`

### v2.0.51 (2025-12-10) ⭐ MAJOR

- ⭐ **Opus 4.5 released**
- ⭐ **Claude Code for Desktop**
- Updated usage limits for Opus 4.5
- Plan Mode builds more precise plans

### v2.0.45 (2025-12-05) ⭐

- ⭐ **Microsoft Foundry support**
- `PermissionRequest` hook for auto-approve/deny
- `&` prefix for background tasks to web

### v2.0.28 (2025-11-18) ⭐

- ⭐ **Plan mode: introduced Plan subagent**
- Subagents: resume capability
- Subagents: dynamic model selection
- `--max-budget-usd` flag (SDK)
- Git-based plugins branch/tag support (`#branch`)

### v2.0.24 (2025-11-10)

- Claude Code Web: Web → CLI teleport
- Sandbox mode for BashTool (Linux & Mac)
- Bedrock: `awsAuthRefresh` output display

---

## Breaking Changes Summary

### URLs

| Version | Change |
|---------|--------|
| v2.1.0, v2.1.7 | OAuth/API Console: `console.anthropic.com` → `platform.claude.com` |

### Windows

| Version | Change |
|---------|--------|
| v2.0.58 | Managed settings prefer `C:\Program Files\ClaudeCode` |
| v2.1.2 | Deprecated `C:\ProgramData\ClaudeCode` path |

### SDK

| Version | Change |
|---------|--------|
| v2.0.25 | Removed legacy SDK entrypoint → `@anthropic-ai/claude-agent-sdk` |
| v2.1.0 | Minimum zod peer dependency: `^4.0.0` |

### Shortcuts

| Version | Change |
|---------|--------|
| v2.0.70 | Removed `#` shortcut for quick memory entry |

### Security Fixes

| Version | Issue |
|---------|-------|
| v2.1.2 | Command injection in bash command processing |
| v2.1.6 | Shell line continuation permission bypass |
| v2.1.7 | Wildcard permission rules compound commands |

---

## Milestone Features

| Version | Key Features |
|---------|--------------|
| **v2.1.0** | Skill hot-reload, Shift+Enter OOTB, Vim motions, /plan command |
| **v2.0.74** | LSP tool for code intelligence |
| **v2.0.72** | Claude in Chrome (browser control) |
| **v2.0.67** | Thinking mode default for Opus 4.5 |
| **v2.0.64** | Instant auto-compact, async agents, named sessions |
| **v2.0.60** | Background agents |
| **v2.0.51** | Opus 4.5, Claude Code for Desktop |
| **v2.0.45** | Microsoft Foundry, PermissionRequest hook |
| **v2.0.28** | Plan subagent, subagent resume/model selection |
| **v2.0.24** | Web teleport, Sandbox mode |

---

## Updating This Document

1. **Watch**: [github.com/anthropics/claude-code/releases](https://github.com/anthropics/claude-code/releases)
2. **Update**: `machine-readable/claude-code-releases.yaml` (source of truth)
3. **Regenerate**: Update this markdown accordingly
4. **Sync landing**: Run `./scripts/check-landing-sync.sh`

---

*Last updated: 2026-01-18 | [Back to main guide](./ultimate-guide.md)*
