# Claude Code Guide: Complete Tutorial & Best Practices

> The comprehensive guide to Claude Code — Anthropic's AI coding assistant CLI.
> From installation to advanced MCP servers, agents, skills, hooks, and CI/CD integration.

![Claude Code](https://img.shields.io/badge/Claude_Code-Guide-5A67D8?style=flat-square)
![Anthropic CLI](https://img.shields.io/badge/Anthropic-CLI-FF6B6B?style=flat-square)
![AI Coding](https://img.shields.io/badge/AI-Coding_Assistant-4CAF50?style=flat-square)
![MCP](https://img.shields.io/badge/MCP-Servers-FFA726?style=flat-square)

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![GitHub stars](https://img.shields.io/github/stars/FlorianBruniaux/claude-code-ultimate-guide?style=social)](https://github.com/FlorianBruniaux/claude-code-ultimate-guide/stargazers)
[![zread](https://img.shields.io/badge/Ask_Zread-_.svg?style=flat&color=00b0aa&labelColor=000000&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTQuOTYxNTYgMS42MDAxSDIuMjQxNTZDMS44ODgxIDEuNjAwMSAxLjYwMTU2IDEuODg2NjQgMS42MDE1NiAyLjI0MDFWNC45NjAxQzEuNjAxNTYgNS4zMTM1NiAxLjg4ODEgNS42MDAxIDIuMjQxNTYgNS42MDAxSDQuOTYxNTZDNS4zMTUwMiA1LjYwMDEgNS42MDE1NiA1LjMxMzU2IDUuNjAxNTYgNC45NjAxVjIuMjQwMUM1LjYwMTU2IDEuODg2NjQgNS4zMTUwMiAxLjYwMDEgNC45NjE1NiAxLjYwMDFaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00Ljk2MTU2IDEwLjM5OTlIMi4yNDE1NkMxLjg4ODEgMTAuMzk5OSAxLjYwMTU2IDEwLjY4NjQgMS42MDE1NiAxMS4wMzk5VjEzLjc1OTlDMS42MDE1NiAxNC4xMTM0IDEuODg4MSAxNC4zOTk5IDIuMjQxNTYgMTQuMzk5OUg0Ljk2MTU2QzUuMzE1MDIgMTQuMzk5OSA1LjYwMTU2IDE0LjExMzQgNS42MDE1NiAxMy43NTk5VjExLjAzOTlDNS42MDE1NiAxMC42ODY0IDUuMzE1MDIgMTAuMzk5OSA0Ljk2MTU2IDEwLjM5OTlaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik0xMy43NTg0IDEuNjAwMUgxMS4wMzg0QzEwLjY4NSAxLjYwMDEgMTAuMzk4NCAxLjg4NjY0IDEwLjM5ODQgMi4yNDAxVjQuOTYwMUMxMC4zOTg0IDUuMzEzNTYgMTAuNjg1IDUuNjAwMSAxMS4wMzg0IDUuNjAwMUgxMy43NTg0QzE0LjExMTkgNS42MDAxIDE0LjM5ODQgNS4zMTM1NiAxNC4zOTg0IDQuOTYwMVYyLjI0MDFDMTQuMzk4NCAxLjg4NjY0IDE0LjExMTkgMS42MDAxIDEzLjc1ODQgMS42MDAxWiIgZmlsbD0iI2ZmZiIvPgo8cGF0aCBkPSJNNCAxMkwxMiA0TDQgMTJaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00IDEyTDEyIDQiIHN0cm9rZT0iI2ZmZiIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K&logoColor=ffffff)](https://zread.ai/FlorianBruniaux/claude-code-ultimate-guide)

**Author**: [Florian BRUNIAUX](https://github.com/FlorianBruniaux) | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr)

**Contact**: [LinkedIn](https://www.linkedin.com/in/florian-bruniaux-43408b83/)

**Written with**: Claude (Anthropic)

> **If you find this guide useful, please consider giving it a star!** It helps others discover this resource and motivates continued updates.

---

## What's Inside

| File | Description | Reading Time |
|------|-------------|--------------|
| [`english-ultimate-claude-code-guide.md`](./english-ultimate-claude-code-guide.md) | Complete guide (8500+ lines, 32K+ words) | ~3 hours |
| [`cheatsheet-en.md`](./cheatsheet-en.md) | 1-page printable daily reference | 5 minutes |
| [`claude-setup-audit-prompt.md`](./claude-setup-audit-prompt.md) | Self-audit prompt for your setup | ~10 minutes |
| [`examples/`](./examples/) | Production-ready commands, hooks, agents | Browse as needed |
| [`claude-code-ultimate-guide_notebooklm.pdf`](./claude-code-ultimate-guide_notebooklm.pdf) | NotebookLM slides export | ~20 minutes |
| [`claude-code-ultimate-guide_kimi.pdf`](./claude-code-ultimate-guide_kimi.pdf) | PDF version (Kimi export) | ~3 hours |

### 🔍 Explore Interactively

**[DeepWiki: Interactive Documentation](https://deepwiki.com/FlorianBruniaux/claude-code-ultimate-guide/1-overview)**

Transform this repository into an interactive AI-powered documentation explorer:
- **Ask questions** in natural language about the guide
- **Navigate contextually** through interconnected concepts
- **Search semantically** beyond keyword matching
- **Get summaries** of specific sections on demand

Perfect for quick lookups when you don't want to read the full 8500+ lines.

---

## About This Guide

### Our Pedagogical Approach

Unlike reference manuals that simply list features, **this guide follows a learning journey** designed to take you from beginner to power user. We focus on:

- **Understanding why** before diving into how
- **Real-world patterns** you can use immediately
- **Progressive complexity** — start simple, master advanced techniques at your pace
- **Practical workflows** over theoretical concepts

Think of this as your **mentor for mastering Claude Code** — not just documentation.

### Origins & Philosophy

This guide is the result of **several months of daily practice and research** with Claude Code, Anthropic's AI coding assistant CLI. Whether you're exploring agentic development, LLM-powered coding workflows, or AI pair programming, this resource covers everything from basic setup to advanced MCP server orchestration.

I don't claim to be an "expert" — I'm simply sharing what I've learned along the way, humbly hoping to help my peers and evangelize good practices in AI-assisted development.

**Key inspirations for this work:**
- [Claudelog.com](https://claudelog.com/) — Excellent tips, patterns & tutorials (highly recommended)
- [zebbern/claude-code-guide](https://github.com/zebbern/claude-code-guide) — Comprehensive reference & troubleshooting guide with cybersecurity focus
- [ykdojo/claude-code-tips](https://github.com/ykdojo/claude-code-tips) — Practical tips & productivity techniques from Y.K. Dojo

**Important note**: This guide was largely generated with the help of AI. As such, it likely contains errors, inaccuracies, or outdated information. I would be delighted to receive any feedback, corrections, or — even better — pull requests to improve it. Don't hesitate to [open an issue](../../issues) or submit a PR!

> **⚠️ WINDOWS USERS - IMPORTANT DISCLAIMER**
>
> I work on macOS and **have not personally tested Windows-specific commands** (PowerShell, batch files, path syntax).
>
> **What this means for you:**
> - PowerShell scripts are AI-generated and may need adjustment
> - Path separators (`\` vs `/`) may be incorrect in some examples
> - Batch file hooks may require debugging
> - Git Bash commands should work as-is (they use Unix syntax)
>
> **How you can help:**
> 1. [Open an issue](../../issues) if you find Windows-specific problems
> 2. Submit a PR with corrections (Windows testers highly appreciated!)
> 3. Join our [community discussions](../../discussions) to share Windows-specific tips
>
> **Status**: We are actively seeking Windows contributors to improve platform support.

**Language**: I wrote this guide in English by default to reach a wider audience, but French is my native language. I could easily translate it to French myself, or leverage AI and community contributions for other languages. Let me know if translations would be useful!

If you find value in this guide, have questions, or want to discuss Claude Code practices, feel free to reach out on [LinkedIn](https://www.linkedin.com/in/florian-bruniaux-43408b83/).

---

## Ready-to-Use Examples

The [`examples/`](./examples/) directory contains production-ready templates you can copy directly into your projects:

### 🎯 Commands (Slash Commands)

| Command | Purpose | Highlights |
|---------|---------|------------|
| [/pr](./examples/commands/pr.md) | Create PRs with scope analysis | Complexity scoring, auto-detect scope issues, split suggestions |
| [/release-notes](./examples/commands/release-notes.md) | Generate release notes (3 formats) | CHANGELOG + PR body + Slack announcement, migration detection |
| [/sonarqube](./examples/commands/sonarqube.md) | Analyze SonarCloud quality issues | Executive summary, top violators, action plan |
| [/commit](./examples/commands/commit.md) | Conventional commit messages | Follows team conventions, auto-formats |
| [/review-pr](./examples/commands/review-pr.md) | PR review workflow | Structured feedback, security checks |
| [/git-worktree](./examples/commands/git-worktree.md) | Isolated git worktree setup | Safe parallel development |

### 🛡️ Hooks (Event Automation)

| Hook | Event | Purpose |
|------|-------|---------|
| [dangerous-actions-blocker.sh](./examples/hooks/bash/dangerous-actions-blocker.sh) | PreToolUse | Block `rm -rf /`, force push, secrets, dangerous edits |
| [notification.sh](./examples/hooks/bash/notification.sh) | Notification | macOS sound alerts (success, error, warning) |
| [security-check.sh](./examples/hooks/bash/security-check.sh) | PreToolUse | Detect secrets in commands |
| [auto-format.sh](./examples/hooks/bash/auto-format.sh) | PostToolUse | Auto-format with Prettier |

> **📖 See [examples/README.md](./examples/README.md) for complete catalog including agents, skills, and config templates**

---

## Table of Contents

Jump directly to any section in the [full guide](./english-ultimate-claude-code-guide.md):

| # | Section | Description |
|---|---------|-------------|
| 1 | [Quick Start](./english-ultimate-claude-code-guide.md#1-quick-start-day-1) | Installation, first workflow, essential commands |
| 2 | [Core Concepts](./english-ultimate-claude-code-guide.md#2-core-concepts) | Context management, Plan Mode, Rewind, Mental Model |
| 3 | [Memory & Settings](./english-ultimate-claude-code-guide.md#3-memory--settings) | CLAUDE.md files, .claude/ folder, precedence rules |
| 4 | [Agents](./english-ultimate-claude-code-guide.md#4-agents) | Custom AI personas, Tool SEO, orchestration patterns |
| 5 | [Skills](./english-ultimate-claude-code-guide.md#5-skills) | Reusable knowledge modules (Security, TDD...) |
| 6 | [Commands](./english-ultimate-claude-code-guide.md#6-commands) | Custom slash commands, variable interpolation |
| 7 | [Hooks](./english-ultimate-claude-code-guide.md#7-hooks) | Event-driven automation (security, formatting, logging) |
| 8 | [MCP Servers](./english-ultimate-claude-code-guide.md#8-mcp-servers) | Serena, Context7, Sequential, Playwright, Postgres |
| 9 | [Advanced Patterns](./english-ultimate-claude-code-guide.md#9-advanced-patterns) | Trinity, CI/CD, feedback loops, vibe coding |
| 10 | [Reference](./english-ultimate-claude-code-guide.md#10-reference) | Commands, shortcuts, troubleshooting, checklists |
| A | [Appendix](./english-ultimate-claude-code-guide.md#appendix-templates-collection) | Ready-to-use templates |

### Quick Links by Topic

**Getting Started**
- [Installation](./english-ultimate-claude-code-guide.md#11-installation) · [First Workflow](./english-ultimate-claude-code-guide.md#12-first-workflow) · [Essential Commands](./english-ultimate-claude-code-guide.md#13-essential-commands)

**Critical Concepts**
- [Context Management](./english-ultimate-claude-code-guide.md#22-context-management) · [Plan Mode](./english-ultimate-claude-code-guide.md#23-plan-mode) · [Memory Files](./english-ultimate-claude-code-guide.md#31-memory-files-claudemd)

**Customization**
- [Creating Agents](./english-ultimate-claude-code-guide.md#42-creating-custom-agents) · [Creating Skills](./english-ultimate-claude-code-guide.md#52-creating-skills) · [Creating Commands](./english-ultimate-claude-code-guide.md#62-creating-custom-commands) · [Creating Hooks](./english-ultimate-claude-code-guide.md#72-creating-hooks)

**Advanced**
- [The Trinity Pattern](./english-ultimate-claude-code-guide.md#91-the-trinity) · [CI/CD Integration](./english-ultimate-claude-code-guide.md#93-cicd-integration) · [MCP Configuration](./english-ultimate-claude-code-guide.md#83-configuration)

---

## Quick Start

```bash
# Install Claude Code (all platforms)
npm install -g @anthropic-ai/claude-code

# Or on macOS/Linux only:
curl -fsSL https://claude.ai/install.sh | sh

# Start in your project
cd your-project
claude
```

> **Windows Users**: Use `%USERPROFILE%\.claude\` instead of `~/.claude/` for all paths in this guide.

### The 7 Commands You Need

| Command | Action |
|---------|--------|
| `/help` | Show all commands |
| `/status` | Check context usage |
| `/compact` | Compress context (>70%) |
| `/clear` | Fresh start |
| `/plan` | Safe read-only mode |
| `/rewind` | Undo changes |
| `Ctrl+C` | Cancel operation |

### Context Management (Critical!)

| Context % | Action |
|-----------|--------|
| 0-50% | Work freely |
| 50-70% | Be selective |
| 70-90% | `/compact` now |
| 90%+ | `/clear` required |

---

## The Golden Rules

1. **Always review diffs** before accepting changes
2. **Use `/compact`** before context gets critical (>70%)
3. **Be specific** in requests (WHAT, WHERE, HOW, VERIFY)
4. **Start with Plan Mode** for complex/risky tasks
5. **Create CLAUDE.md** for every project

---

## Who Is This For?

- **Beginners**: Start with Quick Start (15 min) → be productive immediately
- **Intermediate**: Deep dive into Configuration, Agents, Skills
- **Power Users**: Advanced Patterns, MCP orchestration, CI/CD integration

---

## Learning Paths

Choose your path based on experience and goals:

### Junior Developer (45 min to productivity)
1. [Quick Start](./english-ultimate-claude-code-guide.md#1-quick-start-day-1) - Installation & first workflow
2. [Essential Commands](./english-ultimate-claude-code-guide.md#13-essential-commands) - The 7 commands you need
3. [Context Management](./english-ultimate-claude-code-guide.md#22-context-management) - Critical concept
4. [Memory Files](./english-ultimate-claude-code-guide.md#31-memory-files-claudemd) - Create your first CLAUDE.md
5. [Cheatsheet](./cheatsheet-en.md) - Print and keep nearby

### Senior Developer (40 min to mastery)
1. [Core Concepts](./english-ultimate-claude-code-guide.md#2-core-concepts) - Mental model & context zones
2. [Plan Mode](./english-ultimate-claude-code-guide.md#23-plan-mode) - Safe exploration
3. [Agents](./english-ultimate-claude-code-guide.md#4-agents) - Custom AI personas
4. [Hooks](./english-ultimate-claude-code-guide.md#7-hooks) - Event-driven automation
5. [CI/CD Integration](./english-ultimate-claude-code-guide.md#93-cicd-integration) - Pipeline automation

### Power User (2 hours for full mastery)
1. Read the [complete guide](./english-ultimate-claude-code-guide.md) end-to-end
2. [MCP Servers](./english-ultimate-claude-code-guide.md#8-mcp-servers) - Extended capabilities
3. [The Trinity Pattern](./english-ultimate-claude-code-guide.md#91-the-trinity) - Advanced workflows
4. [Audit your setup](./claude-setup-audit-prompt.md) - Optimize your configuration
5. Explore [examples/](./examples/) - Ready-to-use templates

### Non-Technical / Product Manager (20 min overview)
1. [What's Inside](#whats-inside) - Understand the scope
2. [The Golden Rules](#the-golden-rules) - Key principles
3. [Core Concepts](./english-ultimate-claude-code-guide.md#2-core-concepts) - High-level overview
4. [Context Management](./english-ultimate-claude-code-guide.md#22-context-management) - Why it matters

---

## Contributing

Found an error? Have a suggestion? See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

---

## Audit Your Setup

Want to know if your Claude Code setup follows best practices?

### Option 1: Quick Bash Scan (2 seconds)

**Script**: [`examples/scripts/audit-scan.sh`](./examples/scripts/audit-scan.sh)

```bash
# Human-readable output
./examples/scripts/audit-scan.sh

# JSON output for processing
./examples/scripts/audit-scan.sh --json

# Or download and run directly
curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/examples/scripts/audit-scan.sh | bash
```

**What it checks** (instantly):
- ✅ Global and project config files existence
- 📦 Tech stack detection (Node.js, Python, Go, Rust, etc.)
- 🔧 Extensions count (agents, commands, skills, hooks)
- 🔒 Security hooks presence (PreToolUse patterns)
- 📖 MCP servers configured
- 📏 CLAUDE.md quality metrics (size, @references)

### Option 2: Full Audit with Claude (~3 minutes)

**File**: [`claude-setup-audit-prompt.md`](./claude-setup-audit-prompt.md)

**How it works**:
1. Copy the prompt from the file
2. Run `claude --ultrathink` in your project
3. Paste the prompt and get a comprehensive audit report

**What it checks**:
- Everything from Option 1, plus:
- Context management practices
- Single Source of Truth patterns
- CI/CD integration patterns
- Best practices against the full guide

**Output**: A prioritized report with health score, quick wins, and ready-to-use templates tailored to your tech stack.

> **Performance**: The audit now uses bash/grep for ~80% faster scanning and 90% fewer tokens!

---

## Resources

### Official
- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code) — Official Anthropic docs

### Related Guides
- [zebbern/claude-code-guide](https://github.com/zebbern/claude-code-guide) — Comprehensive reference & troubleshooting guide with cybersecurity focus (excellent for security practitioners)
- [Claudelog.com](https://claudelog.com/) — Tips, patterns & tutorials (highly recommended for all users)
- [ykdojo/claude-code-tips](https://github.com/ykdojo/claude-code-tips) — Practical tips & productivity techniques (voice workflows, context management, terminal efficiency)
  - Additional topics worth exploring: voice transcription (superwhisper/MacWhisper), tmux autonomous testing, cc-safe tool, cascade method, container experimentation, half-clone technique
- [DeepTo Claude Code Guide](https://cc.deeptoai.com/docs/en/best-practices/claude-code-comprehensive-guide) — Comprehensive best practices covering XML-structured prompts, session continuation, image processing, Unix piping workflows, and cost tracking (ccusage tool)
- [Shipyard: Claude Code Cheat Sheet](https://shipyard.build/blog/claude-code-cheat-sheet/) — Quick reference covering CLI flags, MCP configuration patterns, and command examples

### Community Curated Lists
- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) — Extensive reference library (19.9k stars) covering commands, workflows, hooks, IDE integrations, and monitoring tools. **Note**: This is a curated collection for discovering solutions, not an architectural guide—it lists tools without guidance on how to combine them intelligently or which to choose based on specific needs
- [awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) — Custom skills collection
- [awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) — Full-stack & DevOps subagents
- [awesome-claude](https://github.com/alvinunreal/awesome-claude) — General Claude resources (SDKs, tools)
- [awesome-claude-prompts](https://github.com/langgptai/awesome-claude-prompts) — Prompt templates

### Frameworks & Tools
- [SuperClaude](https://github.com/SuperClaude-Org/SuperClaude_Framework) — Advanced configuration framework with 30+ commands

### Further Reading
- [Nick Tune: Coding Agent Development Workflows](https://medium.com/nick-tune-tech-strategy-blog/coding-agent-development-workflows-af52e6f912aa) — Advanced autonomous workflow patterns
- [Neon Branching Documentation](https://neon.tech/docs/guides/branching) — Database branching for development workflows
- [PlanetScale Branching Documentation](https://planetscale.com/docs/concepts/branching) — MySQL branching and deployment patterns

---

<!-- SEO Keywords - Do not remove
claude code, claude code tutorial, claude code guide, anthropic cli,
ai coding assistant, claude code mcp, claude code agents, claude code hooks,
claude code skills, claude code installation, claude code commands,
agentic coding, ai pair programming, llm development tools, ai developer tools,
anthropic claude, mcp servers, claude code ci/cd, claude code best practices
-->

## License

This work is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

You are free to share and adapt this material, provided you give appropriate credit and distribute your contributions under the same license.

---

*Last updated: January 2026 | Version 2.7*