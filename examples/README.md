# Claude Code Examples

Ready-to-use templates for Claude Code configuration.

## Structure

| Folder | Description |
|--------|-------------|
| [`agents/`](./agents/) | Custom AI personas for specialized tasks |
| [`skills/`](./skills/) | Reusable knowledge modules |
| [`commands/`](./commands/) | Custom slash commands |
| [`hooks/`](./hooks/) | Event-driven automation scripts |
| [`config/`](./config/) | Configuration file templates |
| [`memory/`](./memory/) | CLAUDE.md memory file templates |
| [`scripts/`](./scripts/) | Utility scripts for setup and diagnostics |

## Quick Start

1. Copy the template you need
2. Customize for your project
3. Place in the correct location (see paths below)

## File Locations

| Type | Project Location | Global Location |
|------|------------------|-----------------|
| Agents | `.claude/agents/` | `~/.claude/agents/` |
| Skills | `.claude/skills/` | `~/.claude/skills/` |
| Commands | `.claude/commands/` | `~/.claude/commands/` |
| Hooks | `.claude/hooks/` | `~/.claude/hooks/` |
| Config | `.claude/` | `~/.claude/` |
| Memory | `./CLAUDE.md` or `.claude/CLAUDE.md` | `~/.claude/CLAUDE.md` |

> **Windows**: Replace `~/.claude/` with `%USERPROFILE%\.claude\`

## Templates Index

### Agents
| File | Purpose | Model |
|------|---------|-------|
| [code-reviewer.md](./agents/code-reviewer.md) | Thorough code review | Sonnet |
| [test-writer.md](./agents/test-writer.md) | TDD/BDD test generation | Sonnet |
| [security-auditor.md](./agents/security-auditor.md) | Security vulnerability detection | Sonnet |
| [refactoring-specialist.md](./agents/refactoring-specialist.md) | Clean code refactoring | Sonnet |

### Skills
| File | Purpose |
|------|---------|
| [tdd-workflow.md](./skills/tdd-workflow.md) | Test-Driven Development process |
| [security-checklist.md](./skills/security-checklist.md) | OWASP Top 10 security checks |

### Commands
| File | Trigger | Purpose |
|------|---------|---------|
| [commit.md](./commands/commit.md) | `/commit` | Conventional commit messages |
| [pr.md](./commands/pr.md) | `/pr` | Create well-structured PRs with scope analysis |
| [review-pr.md](./commands/review-pr.md) | `/review-pr` | PR review workflow |
| [release-notes.md](./commands/release-notes.md) | `/release-notes` | Generate release notes in 3 formats |
| [sonarqube.md](./commands/sonarqube.md) | `/sonarqube` | Analyze SonarCloud quality issues for PRs |
| [generate-tests.md](./commands/generate-tests.md) | `/generate-tests` | Test generation |
| [git-worktree.md](./commands/git-worktree.md) | `/git-worktree` | Isolated git worktree setup |

### Hooks
| File | Event | Purpose |
|------|-------|---------|
| [dangerous-actions-blocker.sh](./hooks/bash/dangerous-actions-blocker.sh) | PreToolUse | Block dangerous commands/edits |
| [security-check.*](./hooks/) | PreToolUse | Block secrets in commands |
| [auto-format.*](./hooks/) | PostToolUse | Auto-format after edits |
| [notification.sh](./hooks/bash/notification.sh) | Notification | Contextual macOS sound alerts |

> **See [hooks/README.md](./hooks/README.md) for complete documentation and examples**

### Config
| File | Purpose |
|------|---------|
| [settings.json](./config/settings.json) | Hooks configuration |
| [mcp.json](./config/mcp.json) | MCP servers setup |
| [.gitignore-claude](./config/.gitignore-claude) | Git ignore patterns |

### Memory
| File | Purpose |
|------|---------|
| [CLAUDE.md.project-template](./memory/CLAUDE.md.project-template) | Team project memory |
| [CLAUDE.md.personal-template](./memory/CLAUDE.md.personal-template) | Personal global memory |

### Scripts
| File | Purpose | Output |
|------|---------|--------|
| [audit-scan.sh](./scripts/audit-scan.sh) | Fast setup audit scanner | JSON / Human |
| [check-claude.sh](./scripts/check-claude.sh) | Health check diagnostics | Human |
| [clean-reinstall-claude.sh](./scripts/clean-reinstall-claude.sh) | Clean reinstall procedure | Human |

> **Usage**: `./audit-scan.sh` for human output, `./audit-scan.sh --json` for JSON output

---

*See the [main guide](../english-ultimate-claude-code-guide.md) for detailed explanations.*
