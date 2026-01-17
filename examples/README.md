# Claude Code Examples

Ready-to-use templates for Claude Code configuration.

> **[Browse Interactive Catalog](./index.html)** — View, copy, and download all templates with syntax highlighting

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
| [`github-actions/`](./github-actions/) | CI/CD workflows for GitHub Actions |
| [`workflows/`](./workflows/) | Advanced development workflow guides |
| [`modes/`](./modes/) | Behavioral modes for Claude (SuperClaude) |

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
| Modes | — | `~/.claude/MODE_*.md` |

> **Windows**: Replace `~/.claude/` with `%USERPROFILE%\.claude\`

## Templates Index

### Agents
| File | Purpose | Model |
|------|---------|-------|
| [code-reviewer.md](./agents/code-reviewer.md) | Thorough code review | Sonnet |
| [test-writer.md](./agents/test-writer.md) | TDD/BDD test generation | Sonnet |
| [security-auditor.md](./agents/security-auditor.md) | Security vulnerability detection | Sonnet |
| [refactoring-specialist.md](./agents/refactoring-specialist.md) | Clean code refactoring | Sonnet |
| [output-evaluator.md](./agents/output-evaluator.md) | LLM-as-a-Judge quality gate | Haiku |

### Skills
| File | Purpose |
|------|---------|
| [tdd-workflow.md](./skills/tdd-workflow.md) | Test-Driven Development process |
| [security-checklist.md](./skills/security-checklist.md) | OWASP Top 10 security checks |
| [pdf-generator.md](./skills/pdf-generator.md) | Professional PDF generation (Quarto/Typst) |

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
| [diagnose.md](./commands/diagnose.md) | `/diagnose` | Interactive troubleshooting assistant (FR/EN) |
| [validate-changes.md](./commands/validate-changes.md) | `/validate-changes` | LLM-as-a-Judge pre-commit validation |

### Hooks
| File | Event | Purpose |
|------|-------|---------|
| [dangerous-actions-blocker.sh](./hooks/bash/dangerous-actions-blocker.sh) | PreToolUse | Block dangerous commands/edits |
| [security-check.*](./hooks/) | PreToolUse | Block secrets in commands |
| [prompt-injection-detector.sh](./hooks/bash/prompt-injection-detector.sh) | PreToolUse | Detect injection attempts (+ANSI, null bytes) |
| [unicode-injection-scanner.sh](./hooks/bash/unicode-injection-scanner.sh) | PreToolUse | Detect zero-width, RTL, ANSI escape |
| [repo-integrity-scanner.sh](./hooks/bash/repo-integrity-scanner.sh) | PreToolUse | Scan README/package.json for injection |
| [mcp-config-integrity.sh](./hooks/bash/mcp-config-integrity.sh) | SessionStart | Verify MCP config hash (CVE protection) |
| [output-secrets-scanner.sh](./hooks/bash/output-secrets-scanner.sh) | PostToolUse | Detect secrets + env leakage |
| [auto-format.*](./hooks/) | PostToolUse | Auto-format after edits |
| [notification.sh](./hooks/bash/notification.sh) | Notification | Contextual macOS sound alerts |
| [output-validator.sh](./hooks/bash/output-validator.sh) | PostToolUse | Heuristic output validation |
| [session-logger.sh](./hooks/bash/session-logger.sh) | PostToolUse | Log operations for monitoring |
| [pre-commit-evaluator.sh](./hooks/bash/pre-commit-evaluator.sh) | Git hook | LLM-as-a-Judge pre-commit |

> **See [hooks/README.md](./hooks/README.md) for complete documentation and security hardening patterns**

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
| [check-claude.sh](./scripts/check-claude.sh) | Health check diagnostics (macOS/Linux) | Human |
| [check-claude.ps1](./scripts/check-claude.ps1) | Health check diagnostics (Windows) | Human |
| [clean-reinstall-claude.sh](./scripts/clean-reinstall-claude.sh) | Clean reinstall procedure (macOS/Linux) | Human |
| [clean-reinstall-claude.ps1](./scripts/clean-reinstall-claude.ps1) | Clean reinstall procedure (Windows) | Human |
| [session-stats.sh](./scripts/session-stats.sh) | Analyze session logs & costs | JSON / Human |
| [session-search.sh](./scripts/session-search.sh) | Fast session search & resume | Human |

> **Usage**: `./audit-scan.sh` for human output, `./audit-scan.sh --json` for JSON output
>
> **Session search**: `./session-search.sh "keyword"` to find past conversations, outputs ready-to-use `claude --resume` commands

### GitHub Actions
| File | Trigger | Purpose |
|------|---------|---------|
| [claude-pr-auto-review.yml](./github-actions/claude-pr-auto-review.yml) | PR open/update | Auto code review with inline comments |
| [claude-security-review.yml](./github-actions/claude-security-review.yml) | PR open/update | Security-focused scan (OWASP) |
| [claude-issue-triage.yml](./github-actions/claude-issue-triage.yml) | Issue opened | Auto-triage with labels and severity |

> **See [github-actions/README.md](./github-actions/README.md) for setup instructions and customization**

### Workflows
| File | Purpose |
|------|---------|
| [database-branch-setup.md](./workflows/database-branch-setup.md) | Isolated feature dev with database branches (Neon/PlanetScale) |

### Modes
| File | Purpose | Activation |
|------|---------|------------|
| [MODE_Learning.md](./modes/MODE_Learning.md) | Just-in-time explanations | `--learn` flag |

> **See [modes/README.md](./modes/README.md) for installation and SuperClaude framework reference**

---

*See the [main guide](../guide/ultimate-guide.md) for detailed explanations, or the [architecture guide](../guide/architecture.md) for how Claude Code works internally.*
