# Master Claude Code: The Complete Guide from Beginner to Power User

> **Transform Anthropic's AI coding CLI into your superpower.** 8500+ lines covering installation, agents, MCP servers, hooks, skills, and CI/CD integration—presented as a learning journey, not a reference manual.

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![GitHub stars](https://img.shields.io/github/stars/FlorianBruniaux/claude-code-ultimate-guide?style=social)](https://github.com/FlorianBruniaux/claude-code-ultimate-guide/stargazers)
[![Ask Zread](https://img.shields.io/badge/Ask_Zread-_.svg?style=flat&color=00b0aa&labelColor=000000&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTQuOTYxNTYgMS42MDAxSDIuMjQxNTZDMS44ODgxIDEuNjAwMSAxLjYwMTU2IDEuODg2NjQgMS42MDE1NiAyLjI0MDFWNC45NjAxQzEuNjAxNTYgNS4zMTM1NiAxLjg4ODEgNS42MDAxIDIuMjQxNTYgNS42MDAxSDQuOTYxNTZDNS4zMTUwMiA1LjYwMDEgNS42MDE1NiA1LjMxMzU2IDUuNjAxNTYgNC45NjAxVjIuMjQwMUM1LjYwMTU2IDEuODg2NjQgNS4zMTUwMiAxLjYwMDEgNC45NjE1NiAxLjYwMDFaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00Ljk2MTU2IDEwLjM5OTlIMi4yNDE1NkMxLjg4ODEgMTAuMzk5OSAxLjYwMTU2IDEwLjY4NjQgMS42MDE1NiAxMS4wMzk5VjEzLjc1OTlDMS42MDE1NiAxNC4xMTM0IDEuODg4MSAxNC4zOTk5IDIuMjQxNTYgMTQuMzk5OUg0Ljk2MTU2QzUuMzE1MDIgMTQuMzk5OSA1LjYwMTU2IDE0LjExMzQgNS42MDE1NiAxMy43NTk5VjExLjAzOTlDNS42MDE1NiAxMC42ODY0IDUuMzE1MDIgMTAuMzk5OSA0Ljk2MTU2IDEwLjM5OTlaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik0xMy43NTg0IDEuNjAwMUgxMS4wMzg0QzEwLjY4NSAxLjYwMDEgMTAuMzk4NCAxLjg4NjY0IDEwLjM5ODQgMi4yNDAxVjQuOTYwMUMxMC4zOTg0IDUuMzEzNTYgMTAuNjg1IDUuNjAwMSAxMS4wMzg0IDUuNjAwMUgxMy43NTg0QzE0LjExMTkgNS42MDAxIDE0LjM5ODQgNS4zMTM1NiAxNC4zOTg0IDQuOTYwMVYyLjI0MDFDMTQuMzk4NCAxLjg4NjY0IDE0LjExMTkgMS42MDAxIDEzLjc1ODQgMS42MDAxWiIgZmlsbD0iI2ZmZiIvPgo8cGF0aCBkPSJNNCAxMkwxMiA0TDQgMTJaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00IDEyTDEyIDQiIHN0cm9rZT0iI2ZmZiIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K&logoColor=ffffff)](https://zread.ai/FlorianBruniaux/claude-code-ultimate-guide)

**By [Florian BRUNIAUX](https://github.com/FlorianBruniaux)** | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr) | [Connect on LinkedIn](https://www.linkedin.com/in/florian-bruniaux-43408b83/)

---

## Why This Guide Exists

**The Problem**: Most Claude Code resources are either scattered blog posts or dense reference manuals. You're left piecing together workflows, guessing at best practices, and discovering critical concepts too late.

**Our Solution**: A structured learning journey that takes you from installation to advanced orchestration in hours, not weeks—with ready-to-use examples you can deploy immediately.

### What Makes This Different

| Traditional Docs | This Guide |
|------------------|------------|
| Lists features | Teaches workflows |
| Reference lookup | Progressive mastery |
| Theoretical concepts | Production-ready patterns |
| "Figure it out" | "Here's exactly how" |

**Your Investment**: 45 minutes to productivity. 2 hours to mastery. 8500+ lines organized by learning path, not alphabetically.

> **If this guide saves you hours of trial-and-error, please star it.** Your support helps others discover this resource and motivates continued updates.

### Prerequisites

- **Node.js 18+** (or use the [shell installer](./english-ultimate-claude-code-guide.md#11-installation) on macOS/Linux)
- **Anthropic API key** — [Get one here](https://console.anthropic.com/)
- **~$5-20/month** typical usage cost (varies with usage intensity)

---

## Start Here: Choose Your Path

### 🚀 Quick Start (15 minutes)

**Goal**: Be productive immediately.

```bash
# Install (all platforms)
npm install -g @anthropic-ai/claude-code

# Start coding
cd your-project
claude
```

**Learn**: [Installation Guide](./english-ultimate-claude-code-guide.md#11-installation) → [First Workflow](./english-ultimate-claude-code-guide.md#12-first-workflow) → [Cheat Sheet](./cheatsheet-en.md)

### 🧭 Not Sure Where to Start?

| If you... | Start here | Time |
|-----------|------------|------|
| Just installed Claude Code | [Quick Start](#-quick-start-15-minutes) | 15 min |
| Want to understand core concepts | [Junior Path](#-by-role-tailored-learning-paths) | 45 min |
| Already use AI coding tools | [Senior Path](#-by-role-tailored-learning-paths) | 40 min |
| Need to configure a team setup | [Power User Path](#-by-role-tailored-learning-paths) | 2h |
| Need to evaluate/approve adoption | [PM Path](#-by-role-tailored-learning-paths) | 20 min |
| Want to check your current setup | [Audit Your Setup](#-audit-your-setup) | 2 sec |
| Want AI assistants to know Claude Code | [LLM Reference](#-llm-reference) | 1 curl |

### ⚡ Audit Your Setup

Already have Claude Code installed? Scan your configuration in 2 seconds:

```bash
curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/examples/scripts/audit-scan.sh | bash
```

**Instant checks**: Config files, tech stack, extensions, security hooks, MCP servers, CLAUDE.md quality

**Want deeper analysis?** Use [`claude-setup-audit-prompt.md`](./claude-setup-audit-prompt.md) for personalized recommendations (~3 min).

### 🤖 LLM Reference

Give any AI assistant instant Claude Code expertise (~2K tokens):

```bash
curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/claude-code-reference.yaml
```

**Use cases**: Paste output into ChatGPT/Claude/Gemini, add to system prompts, or reference in Claude Code with `@claude-code-reference.yaml`

**What's inside**: Decision trees, command reference, context zones, MCP servers, agent templates, troubleshooting—optimized for machine consumption. Points to line numbers in the [full guide](./english-ultimate-claude-code-guide.md) for deep dives.

### 🎯 By Role (Tailored Learning Paths)

<table>
<tr>
<td width="50%">

**Junior Developer** (45 min to productivity)

1. [Quick Start](./english-ultimate-claude-code-guide.md#1-quick-start-day-1) — Install & first workflow
2. [Essential Commands](./english-ultimate-claude-code-guide.md#13-essential-commands) — The 7 commands
3. [Context Management](./english-ultimate-claude-code-guide.md#22-context-management) — Critical concept
4. [Memory Files](./english-ultimate-claude-code-guide.md#31-memory-files-claudemd) — Your first CLAUDE.md
5. [Cheat Sheet](./cheatsheet-en.md) — Print this

</td>
<td width="50%">

**Senior Developer** (40 min to mastery)

1. [Core Concepts](./english-ultimate-claude-code-guide.md#2-core-concepts) — Mental model
2. [Plan Mode](./english-ultimate-claude-code-guide.md#23-plan-mode) — Safe exploration
3. [Agents](./english-ultimate-claude-code-guide.md#4-agents) — Custom AI personas
4. [Hooks](./english-ultimate-claude-code-guide.md#7-hooks) — Event automation
5. [CI/CD Integration](./english-ultimate-claude-code-guide.md#93-cicd-integration) — Pipelines

</td>
</tr>
<tr>
<td width="50%">

**Power User** (2 hours for full mastery)

1. [Complete Guide](./english-ultimate-claude-code-guide.md) — End-to-end
2. [MCP Servers](./english-ultimate-claude-code-guide.md#8-mcp-servers) — Extended capabilities
3. [Trinity Pattern](./english-ultimate-claude-code-guide.md#91-the-trinity) — Advanced workflows
4. [Audit](./claude-setup-audit-prompt.md) — Optimize setup
5. [Examples](./examples/) — Production templates

</td>
<td width="50%">

**Product Manager** (20 min overview)

1. [What's Inside](#-complete-toolkit) — Scope
2. [Golden Rules](#-golden-rules) — Key principles
3. [Core Concepts](./english-ultimate-claude-code-guide.md#2-core-concepts) — High-level
4. [Context Management](./english-ultimate-claude-code-guide.md#22-context-management) — Why it matters

</td>
</tr>
</table>

---

## 📚 Complete Toolkit

### Core Documentation

| File | Purpose | Time Investment |
|------|---------|-----------------|
| **[Ultimate Guide](./english-ultimate-claude-code-guide.md)** | 8500+ lines, 32K+ words, 10 sections | ~3 hours (or by section) |
| **[Cheat Sheet](./cheatsheet-en.md)** | 1-page printable reference | 5 minutes |
| **[LLM Reference](./claude-code-reference.yaml)** | Machine-optimized index (~2K tokens) | For Claude/AI assistants |
| **[Setup Audit](./claude-setup-audit-prompt.md)** | Optimize your configuration | ~10 minutes |
| **[Examples Library](./examples/)** | Production-ready templates | Browse as needed |

<details>
<summary><strong>Alternative Formats</strong> (Interactive AI, PDFs)</summary>

- **[DeepWiki](https://deepwiki.com/FlorianBruniaux/claude-code-ultimate-guide/1-overview)** — AI-powered Q&A, semantic search, instant summaries
- **[NotebookLM Slides](./claude-code-ultimate-guide_notebooklm.pdf)** — Visual overview (~20 min)
- **[Kimi PDF](./claude-code-ultimate-guide_kimi.pdf)** — Full text export (~3 hours)

</details>

---

## 🎯 Production-Ready Examples

Copy-paste templates from [`examples/`](./examples/) for immediate use:

### Slash Commands

| Command | Purpose | Highlights |
|---------|---------|------------|
| [/pr](./examples/commands/pr.md) | Create PRs with scope analysis | Complexity scoring, auto-split detection |
| [/release-notes](./examples/commands/release-notes.md) | Generate release notes (3 formats) | CHANGELOG + PR body + Slack |
| [/sonarqube](./examples/commands/sonarqube.md) | Analyze quality issues | Executive summary, action plans |
| [/commit](./examples/commands/commit.md) | Conventional commits | Follows team conventions |

### Security & Automation Hooks

| Hook | Event | Purpose |
|------|-------|---------|
| [dangerous-actions-blocker.sh](./examples/hooks/bash/dangerous-actions-blocker.sh) | PreToolUse | Block `rm -rf /`, force push, secrets |
| [notification.sh](./examples/hooks/bash/notification.sh) | Notification | macOS sound alerts |
| [auto-format.sh](./examples/hooks/bash/auto-format.sh) | PostToolUse | Auto-format with Prettier |

### GitHub Actions (CI/CD)

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| [claude-pr-auto-review.yml](./examples/github-actions/claude-pr-auto-review.yml) | PR open | Auto code review with inline comments |
| [claude-security-review.yml](./examples/github-actions/claude-security-review.yml) | PR open | Security scan (OWASP Top 10) |
| [claude-issue-triage.yml](./examples/github-actions/claude-issue-triage.yml) | Issue opened | Auto-triage with labels |

**[See Complete Catalog](./examples/README.md)** — Includes agents, skills, memory templates, config files, workflows

---

## 📖 Guide Navigation

Jump directly to any section in the [Ultimate Guide](./english-ultimate-claude-code-guide.md):

| Section | After this, you can... | When |
|---------|------------------------|------|
| **[1. Quick Start](./english-ultimate-claude-code-guide.md#1-quick-start-day-1)** | Run Claude Code and complete your first AI-assisted task | Day 1 |
| **[2. Core Concepts](./english-ultimate-claude-code-guide.md#2-core-concepts)** | Manage context efficiently and avoid common pitfalls | Week 1 |
| **[3. Memory & Settings](./english-ultimate-claude-code-guide.md#3-memory--settings)** | Create CLAUDE.md files that improve AI responses | First project |
| **[4. Agents](./english-ultimate-claude-code-guide.md#4-agents)** | Build custom AI personas for specialized workflows | Advanced |
| **[5. Skills](./english-ultimate-claude-code-guide.md#5-skills)** | Package reusable knowledge modules for your team | Scaling |
| **[6. Commands](./english-ultimate-claude-code-guide.md#6-commands)** | Create custom slash commands with variable interpolation | Automation |
| **[7. Hooks](./english-ultimate-claude-code-guide.md#7-hooks)** | Automate security checks and formatting on every action | Production |
| **[8. MCP Servers](./english-ultimate-claude-code-guide.md#8-mcp-servers)** | Extend Claude with databases, browsers, and external tools | Extended |
| **[9. Advanced Patterns](./english-ultimate-claude-code-guide.md#9-advanced-patterns)** | Orchestrate Trinity workflows and CI/CD pipelines | Power user |
| **[10. Reference](./english-ultimate-claude-code-guide.md#10-reference)** | Look up commands, shortcuts, and troubleshooting tips | Daily |

---

## 🔑 Golden Rules

Master these five principles before diving deeper:

1. **Always review diffs** before accepting changes — Claude suggests, you decide
2. **Use `/compact`** before context hits 70% — prevention beats recovery
3. **Be specific** in requests — Include WHAT, WHERE, HOW, VERIFY
4. **Start with Plan Mode** for risky/complex tasks — read-only exploration first
5. **Create CLAUDE.md** for every project — single source of truth

**Context Management Quick Reference**:

| Context % | Status | Action |
|-----------|--------|--------|
| 0-50% | Green | Work freely |
| 50-70% | Yellow | Be selective |
| 70-90% | Orange | `/compact` now |
| 90%+ | Red | `/clear` required |

---

## 🌍 About This Guide

### Our Philosophy

**Learning journey over reference manual.** We focus on:

- Understanding **why** before diving into **how**
- Real-world patterns you can use immediately
- Progressive complexity — start simple, master advanced at your pace
- Practical workflows over theoretical concepts

Think of this as **your mentor for Claude Code mastery** — not just documentation.

### Origins & Transparency

This guide is the result of several months of daily practice with Claude Code. I don't claim expertise—I'm sharing what I've learned to help peers and evangelize AI-assisted development best practices.

**Key Inspirations**:
- [Claudelog.com](https://claudelog.com/) — Excellent patterns & tutorials
- [zebbern/claude-code-guide](https://github.com/zebbern/claude-code-guide) — Comprehensive reference with security focus
- [ykdojo/claude-code-tips](https://github.com/ykdojo/claude-code-tips) — Practical productivity techniques

**Created with Claude Code**. Community-validated through contributions and feedback. Found an issue? [Report it](../../issues) | [Contribute](./CONTRIBUTING.md)

> **Windows Users**: Most commands work with Git Bash. Use `%USERPROFILE%\.claude\` for paths. PowerShell scripts may need adjustment. [Report Windows issues](../../issues) | [Help improve support](./CONTRIBUTING.md)

### Language & Translation

Written in English for wider reach. French is my native language—I can translate directly or leverage AI + community for other languages. Request translations via [issues](../../issues).

---

## 🤝 Contributing

Found an error? Have a suggestion? See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

**Ways to Help**:
- Star the repo to increase visibility
- Report issues (especially Windows-specific)
- Submit PRs with corrections or enhancements
- Share your workflows in [Discussions](../../discussions)
- Request missing topics or examples

---

## 📚 Related Resources

### Complementary Guides

- **[zebbern/claude-code-guide](https://github.com/zebbern/claude-code-guide)** — Comprehensive troubleshooting with cybersecurity focus
- **[Claudelog.com](https://claudelog.com/)** — Tips, patterns, tutorials (highly recommended)
- **[ykdojo/claude-code-tips](https://github.com/ykdojo/claude-code-tips)** — Voice workflows, context management, terminal efficiency
- **[DeepTo Guide](https://cc.deeptoai.com/docs/en/best-practices/claude-code-comprehensive-guide)** — XML prompts, session continuation, image processing
- **[Shipyard Cheat Sheet](https://shipyard.build/blog/claude-code-cheat-sheet/)** — CLI flags, MCP patterns

### Community Collections

- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) — Extensive tool library (19.9k stars)
- [awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) — Custom skills
- [awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) — Full-stack agents

### Frameworks & Advanced Reading

- [SuperClaude](https://github.com/SuperClaude-Org/SuperClaude_Framework) — Advanced configuration framework
- [Nick Tune: Coding Agent Workflows](https://medium.com/nick-tune-tech-strategy-blog/coding-agent-development-workflows-af52e6f912aa) — Autonomous patterns

### Official Documentation

- [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code) — Anthropic official reference

---

## 📄 License

Licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). Free to share and adapt with attribution and same-license distribution.

---

## ⭐ Support This Project

If this guide saved you time, helped you master Claude Code, or inspired your workflows:

1. **Star this repository** — Help others discover it
2. **Share your success stories** in [Discussions](../../discussions)
3. **Contribute improvements** via [Pull Requests](../../pulls)
4. **Connect on [LinkedIn](https://www.linkedin.com/in/florian-bruniaux-43408b83/)** to discuss AI-assisted development

---

*Version 2.9.3 | January 2026 | Crafted with Claude*

<!-- SEO Keywords -->
<!-- claude code, claude code tutorial, anthropic cli, ai coding assistant, claude code mcp,
claude code agents, claude code hooks, claude code skills, agentic coding, ai pair programming -->