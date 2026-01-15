# Claude Code Guide

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![GitHub stars](https://img.shields.io/github/stars/FlorianBruniaux/claude-code-ultimate-guide?style=social)](https://github.com/FlorianBruniaux/claude-code-ultimate-guide/stargazers)
[![Ask Zread](https://img.shields.io/badge/Ask_Zread-_.svg?style=flat&color=00b0aa&labelColor=000000&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTQuOTYxNTYgMS42MDAxSDIuMjQxNTZDMS44ODgxIDEuNjAwMSAxLjYwMTU2IDEuODg2NjQgMS42MDE1NiAyLjI0MDFWNC45NjAxQzEuNjAxNTYgNS4zMTM1NiAxLjg4ODEgNS42MDAxIDIuMjQxNTYgNS42MDAxSDQuOTYxNTZDNS4zMTUwMiA1LjYwMDEgNS42MDE1NiA1LjMxMzU2IDUuNjAxNTYgNC45NjAxVjIuMjQwMUM1LjYwMTU2IDEuODg2NjQgNS4zMTUwMiAxLjYwMDEgNC45NjE1NiAxLjYwMDFaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00Ljk2MTU2IDEwLjM5OTlIMi4yNDE1NkMxLjg4ODEgMTAuMzk5OSAxLjYwMTU2IDEwLjY4NjQgMS42MDE1NiAxMS4wMzk5VjEzLjc1OTlDMS42MDE1NiAxNC4xMTM0IDEuODg4MSAxNC4zOTk5IDIuMjQxNTYgMTQuMzk5OUg0Ljk2MTU2QzUuMzE1MDIgMTQuMzk5OSA1LjYwMTU2IDE0LjExMzQgNS42MDE1NiAxMy43NTk5VjExLjAzOTlDNS42MDE1NiAxMC42ODY0IDUuMzE1MDIgMTAuMzk5OSA0Ljk2MTU2IDEwLjM5OTlaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik0xMy43NTg0IDEuNjAwMUgxMS4wMzg0QzEwLjY4NSAxLjYwMDEgMTAuMzk4NCAxLjg4NjY0IDEwLjM5ODQgMi4yNDAxVjQuOTYwMUMxMC4zOTg0IDUuMzEzNTYgMTAuNjg1IDUuNjAwMSAxMS4wMzg0IDUuNjAwMUgxMy43NTg0QzE0LjExMTkgNS42MDAxIDE0LjM5ODQgNS4zMTM1NiAxNC4zOTg0IDQuOTYwMVYyLjI0MDFDMTQuMzk4NCAxLjg4NjY0IDE0LjExMTkgMS42MDAxIDEzLjc1ODQgMS42MDAxWiIgZmlsbD0iI2ZmZiIvPgo8cGF0aCBkPSJNNCAxMkwxMiA0TDQgMTJaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00IDEyTDEyIDQiIHN0cm9rZT0iI2ZmZiIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K&logoColor=ffffff)](https://zread.ai/FlorianBruniaux/claude-code-ultimate-guide)

---

**Transparency note**: This guide reflects my personal experience after several months of daily Claude Code usage. I'm sharing what I've learned, not claiming expertise. The tool evolves constantly, and so does my understanding. [Feedback welcome](./CONTRIBUTING.md).

---

> **Privacy Notice**: Claude Code sends your prompts, file contents, and MCP results to Anthropic servers.
> - **Default**: 5 years retention (training enabled) | **Opt-out**: 30 days | **Enterprise**: 0
> - **Action**: [Disable training](https://claude.ai/settings/data-privacy-controls) | [Full privacy guide](./guide/data-privacy.md)

---

## Get Started in 60 Seconds

**Option A: One-liner** (no clone needed)
```bash
claude "Fetch and follow the onboarding instructions from: https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/tools/onboarding-prompt.md"
```

<details>
<summary>📸 <strong>Preview: Interactive Onboarding Flow</strong></summary>

<table>
<tr>
<td width="50%"><img src="./assets/screenshots/onboarding-01-language.png" alt="Language selection"/><br/><em>1. Choose your language</em></td>
<td width="50%"><img src="./assets/screenshots/onboarding-02-goal.png" alt="Goal selection"/><br/><em>2. Select your goal</em></td>
</tr>
<tr>
<td width="50%"><img src="./assets/screenshots/onboarding-03-level.png" alt="Level selection"/><br/><em>3. Pick your experience level</em></td>
<td width="50%"><img src="./assets/screenshots/onboarding-04-content.png" alt="Time selection"/><br/><em>4. Set available time</em></td>
</tr>
</table>

</details>

**Option B: From cloned repo**
1. Copy the prompt from [tools/onboarding-prompt.md](./tools/onboarding-prompt.md#4-the-prompt)
2. Run `claude` → Paste → Enter

Claude asks 2-4 questions then guides you through personalized content based on your profile.

**Or browse directly:** [Cheat Sheet](./guide/cheatsheet.md) | [Quick Start](./guide/ultimate-guide.md#1-quick-start-day-1) | [Full Guide](./guide/ultimate-guide.md)

---

## 5 Rules to Remember

1. **Review diffs** before accepting changes
2. **`/compact` at 70%** context usage (check with `/status`)
3. **Be specific**: WHAT + WHERE + HOW + VERIFY
4. **Plan Mode first** for risky/complex tasks (Shift+Tab×2)
5. **Create CLAUDE.md** for every project

---

## Choose Your Path

| I want to... | Go here |
|--------------|---------|
| Learn step by step | Run the onboarding command above |
| Find something specific | [Guide Navigation](#-guide-navigation) |
| Test my knowledge | [Quiz](./quiz/) |
| Fix a problem | [Troubleshooting](./guide/ultimate-guide.md#troubleshooting) |

---

## Why This Guide?

> Installation, agents, MCP servers, hooks, skills, and CI/CD integration—documented through several months of daily practice. A structured learning journey sharing what I've learned so far.

**By [Florian BRUNIAUX](https://github.com/FlorianBruniaux)** | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr) | [Connect on LinkedIn](https://www.linkedin.com/in/florian-bruniaux-43408b83/)

**The Problem**: Most Claude Code resources are scattered blog posts or dense reference manuals. You're left piecing together workflows and discovering critical concepts too late.

**This guide**: A structured learning journey with ready-to-use examples. Your mileage will vary—the goal is to save you the exploration time I've already spent.

| Traditional Docs | This Guide |
|------------------|------------|
| Lists features | Teaches workflows |
| Reference lookup | Progressive learning |
| Theoretical concepts | Production-ready patterns |
| "Figure it out" | "Here's exactly how" |

**Reading time**: The Quick Start takes ~15 minutes. Full guide is ~3 hours but most people read by section as needed.

> **If this guide saves you hours of trial-and-error, please star it.**

### Prerequisites

- **Node.js 18+** (or use the [shell installer](./guide/ultimate-guide.md#11-installation) on macOS/Linux)
- **Anthropic API key** — [Get one here](https://console.anthropic.com/)

---

### ⚡ Audit Your Setup

Already have Claude Code installed? Quickly scan your configuration:

```bash
curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/examples/scripts/audit-scan.sh | bash
```

**Instant checks**: Config files, tech stack, extensions, security hooks, MCP servers, CLAUDE.md quality

**Want deeper analysis?** Use [`tools/audit-prompt.md`](./tools/audit-prompt.md) for personalized recommendations (~3 min).

### 🤖 LLM Reference

Give any AI assistant instant Claude Code expertise (~2K tokens):

```bash
curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/machine-readable/reference.yaml
```

**Use cases**: Paste output into ChatGPT/Claude/Gemini, add to system prompts, or reference in Claude Code with `@machine-readable/reference.yaml`

**What's inside**: Decision trees, command reference, context zones, MCP servers, agent templates, troubleshooting—optimized for machine consumption. Points to line numbers in the [full guide](./guide/ultimate-guide.md) for deep dives.

### 🔬 Deep Audit (Personalized Recommendations)

Get a comprehensive, **context-aware** audit that analyzes your project's README, CLAUDE.md files, and business domain to provide tailored recommendations:

> 🔒 **Privacy**: The audit downloads reference files from this repo, then analyzes YOUR local files with your Claude CLI. Your project files are sent only to your Anthropic API endpoint, not to this repository or any third party.

**Quick Version** (~10 sec):
```bash
curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/examples/scripts/audit-scan.sh | bash -s -- --json | claude -p "Analyze this Claude Code setup. Give: 1) Health score 0-100 2) Top 3 quick wins 3) CLAUDE.md template for detected stack. Be concise."
```

**Full Audit with Context** (~30 sec, recommended):
```bash
# Claude Code Deep Audit - Context-Aware Version
# Downloads reference files, reads YOUR local files, analyzes with Claude
REF=$(curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/machine-readable/reference.yaml)
SCAN=$(curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/examples/scripts/audit-scan.sh | bash -s -- --json 2>/dev/null)
README_CONTENT=$(head -100 README.md 2>/dev/null || echo "No README.md found")
CLAUDE_MD=$(cat CLAUDE.md 2>/dev/null || echo "No CLAUDE.md found")
LOCAL_CLAUDE_MD=$(cat .claude/CLAUDE.md 2>/dev/null || echo "No .claude/CLAUDE.md found")

claude -p "Reference:
$REF

Scan results:
$SCAN

Project README (first 100 lines):
$README_CONTENT

Project CLAUDE.md:
$CLAUDE_MD

Local .claude/CLAUDE.md:
$LOCAL_CLAUDE_MD

IMPORTANT: Focus on INCREMENTAL improvements to existing setup. Don't suggest creating things that already exist. If CLAUDE.md exists, suggest specific improvements to it rather than a full rewrite.

Based on ALL this context, provide:
1. Stack Recap: runtime, framework, test runner, bundler, database, key integrations detected
2. Health Score (0-100) - be strict: penalize missing SSoT pattern if >100 lines without @refs
3. Findings table: Priority|Element|Status|Action (only gaps, not what exists)
4. Top 3 quick wins (<5 min) - MUST be specific to THIS project's domain (not generic advice)
5. If CLAUDE.md exists: list 3-5 specific improvements (not a full template). If missing: provide ~100 line template
6. Suggested agents/commands/hooks that DON'T duplicate existing ones - check extensions count first
7. Ideas to leverage Claude Code for this specific domain and detected integrations"
```

**What you get**:
- **Stack recap**: Runtime, framework, test runner, bundler, database, and key integrations auto-detected
- Strict health score (penalizes large CLAUDE.md without @refs)
- **Incremental improvements**: Specific fixes for YOUR setup, not generic advice
- Domain-aware suggestions (e.g., EdTech → session planning agents, E-commerce → inventory commands)
- Non-duplicate suggestions: Only recommends agents/commands you don't already have

**Want maximum depth?** Use [tools/audit-prompt.md](./tools/audit-prompt.md) with `claude --ultrathink`

### 🧠 Knowledge Quiz

Test your Claude Code knowledge with an interactive CLI quiz. **159 curated questions** covering all 10 guide sections, with immediate feedback and documentation links.

```bash
# Quick start
cd quiz && npm install && npm start

# With options
node quiz/src/index.js --profile senior --topics 2,4,7 --count 10
```

<details>
<summary><strong>Example Session</strong> (click to expand)</summary>

```
============================================================
   CLAUDE CODE KNOWLEDGE QUIZ
============================================================

? Select your profile: Senior Developer (40 min to mastery)
? Select topics to quiz: All topics (recommended)

------------------------------------------------------------
Question 1/20 [Core Concepts]

At what context percentage should you use /compact?

  A) 0-50%
  B) 50-70%
  C) 70-90%
  D) Only at 100%

? Your answer: C

✓ CORRECT!

------------------------------------------------------------
Question 2/20 [Hooks]

What exit code should a PreToolUse hook return to BLOCK an operation?

  A) 0
  B) 1
  C) 2
  D) -1

? Your answer: A

✗ INCORRECT. The correct answer is C) 2

Explanation:
Exit code 2 blocks the operation. Exit code 0 allows it to proceed.
Other exit codes are treated as errors and logged but don't block.

See: guide/ultimate-guide.md#72-creating-hooks

------------------------------------------------------------
   QUIZ COMPLETE
------------------------------------------------------------

Overall Score: 16/20 (80%)

By Category:
  Core Concepts       6/7  (86%)  [████████░░]
  Agents              5/7  (71%)  [███████░░░]
  Hooks               5/6  (83%)  [████████░░]

Weak Areas (< 75%):
  - Agents: Review section 4 in the guide

? What would you like to do? Retry wrong questions only
```

</details>

**Features**:
- **4 profiles**: Junior (15q), Senior (20q), Power User (25q), PM (10q)
- **10 topic categories** matching guide sections
- **Immediate feedback** with explanations and doc links
- **Score tracking** with category breakdown and weak area identification
- **Session history** saved to `~/.claude-quiz/`
- **Replay options**: Retry wrong questions or start fresh
- **Cross-platform**: Works on macOS, Linux, and Windows

**See**: [Quiz Documentation](./quiz/README.md) | [Contribute Questions](./quiz/templates/question-template.yaml)

### 🎯 By Role (Tailored Learning Paths)

<details>
<summary><strong>Junior Developer</strong> — Foundation path (6 steps)</summary>

1. [Quick Start](./guide/ultimate-guide.md#1-quick-start-day-1) — Install & first workflow
2. [Essential Commands](./guide/ultimate-guide.md#13-essential-commands) — The 7 commands
3. [Context Management](./guide/ultimate-guide.md#22-context-management) — Critical concept
4. [Memory Files](./guide/ultimate-guide.md#31-memory-files-claudemd) — Your first CLAUDE.md
5. [TDD Workflow](./guide/workflows/tdd-with-claude.md) — Test-first development
6. [Cheat Sheet](./guide/cheatsheet.md) — Print this

</details>

<details>
<summary><strong>Senior Developer</strong> — Intermediate path (6 steps)</summary>

1. [Core Concepts](./guide/ultimate-guide.md#2-core-concepts) — Mental model
2. [Plan Mode](./guide/ultimate-guide.md#23-plan-mode) — Safe exploration
3. [Methodologies](./guide/methodologies.md) — TDD, SDD, BDD reference
4. [Agents](./guide/ultimate-guide.md#4-agents) — Custom AI personas
5. [Hooks](./guide/ultimate-guide.md#7-hooks) — Event automation
6. [CI/CD Integration](./guide/ultimate-guide.md#93-cicd-integration) — Pipelines

</details>

<details>
<summary><strong>Power User</strong> — Comprehensive path (7 steps)</summary>

1. [Complete Guide](./guide/ultimate-guide.md) — End-to-end
2. [Architecture](./guide/architecture.md) — How Claude Code works
3. [Security Hardening](./guide/security-hardening.md) — MCP vetting, injection defense
4. [MCP Servers](./guide/ultimate-guide.md#8-mcp-servers) — Extended capabilities
5. [Trinity Pattern](./guide/ultimate-guide.md#91-the-trinity) — Advanced workflows
6. [Observability](./guide/observability.md) — Monitor costs & sessions
7. [Examples](./examples/) — Production templates

</details>

<details>
<summary><strong>Product Manager</strong> — Overview path (5 steps)</summary>

1. [What's Inside](#-complete-toolkit) — Scope
2. [Golden Rules](#-golden-rules) — Key principles
3. [Data Privacy](./guide/data-privacy.md) — Retention & compliance
4. [Adoption Approaches](./guide/adoption-approaches.md) — Team strategies
5. [Context Management](./guide/ultimate-guide.md#22-context-management) — Why it matters

</details>

---

## 📚 Complete Toolkit

### Core Documentation

| File | Purpose | Time Investment |
|------|---------|-----------------|
| **[Ultimate Guide](./guide/ultimate-guide.md)** | Complete reference, 10 sections | ~3 hours (or by section) |
| **[Cheat Sheet](./guide/cheatsheet.md)** | 1-page printable reference | 5 minutes |
| **[Architecture & Internals](./guide/architecture.md)** | How Claude Code works under the hood | ~25 minutes |
| **[Methodologies](./guide/methodologies.md)** | 15 development methodologies reference | ~20 minutes |
| **[Workflows](./guide/workflows/)** | Practical guides (TDD, SDD, Plan-Driven) | ~30 minutes |
| **[Data Privacy](./guide/data-privacy.md)** | Data retention and privacy guide | ~10 minutes |
| **[Security Hardening](./guide/security-hardening.md)** | MCP vetting, injection defense, CVEs | ~25 minutes |
| **[Observability](./guide/observability.md)** | Session monitoring and cost tracking | ~15 minutes |
| **[LLM Reference](./machine-readable/reference.yaml)** | Machine-optimized index (~2K tokens) | For Claude/AI assistants |
| **[Setup Audit](./tools/audit-prompt.md)** | Optimize your configuration | ~10 minutes |
| **[Examples Library](./examples/)** | Production-ready templates | Browse as needed |

<details>
<summary><strong>Alternative Formats</strong> (Interactive AI, PDFs)</summary>

- **[DeepWiki](https://deepwiki.com/FlorianBruniaux/claude-code-ultimate-guide/1-overview)** — AI-powered Q&A, semantic search, instant summaries
- **[NotebookLM Slides](./exports/notebooklm.pdf)** — Visual overview (~20 min)
- **[Kimi PDF](./exports/kimi.pdf)** — Full text export (~3 hours)

</details>

### Repository Structure

```
claude-code-ultimate-guide/
├── guide/                    # 📖 Core documentation
│   ├── ultimate-guide.md     # Complete reference (~9500 lines)
│   ├── cheatsheet.md         # 1-page printable reference
│   ├── architecture.md       # How Claude Code works internally
│   ├── adoption-approaches.md # Team implementation strategies
│   ├── data-privacy.md       # Data retention and privacy guide
│   ├── methodologies.md      # 15 development methodologies reference
│   ├── observability.md      # Session monitoring and cost tracking
│   └── workflows/            # Practical workflow guides
│       ├── tdd-with-claude.md
│       ├── spec-first.md
│       ├── plan-driven.md
│       └── iterative-refinement.md
│
├── tools/                    # 🔧 Interactive utilities
│   ├── audit-prompt.md       # Setup audit with recommendations
│   ├── onboarding-prompt.md  # Personalized guided tour
│   └── mobile-access.md      # Mobile access setup (ttyd + Tailscale)
│
├── machine-readable/         # 🤖 LLM/AI consumption
│   ├── reference.yaml        # Structured index (~2K tokens)
│   └── llms.txt              # Standard LLM context file
│
├── exports/                  # 📄 Generated outputs
│   ├── notebooklm.pdf        # Visual slides
│   └── kimi.pdf              # Full PDF export
│
├── examples/                 # 📦 Production templates
│   ├── agents/               # Custom AI personas
│   ├── commands/             # Slash commands (/pr, /commit, /diagnose...)
│   ├── hooks/                # Security & automation (bash + PowerShell)
│   ├── skills/               # Reusable knowledge modules
│   ├── scripts/              # Setup & diagnostic utilities
│   ├── github-actions/       # CI/CD workflows
│   ├── config/               # Configuration templates
│   ├── memory/               # CLAUDE.md templates
│   ├── modes/                # Behavioral modes (SuperClaude)
│   └── workflows/            # Advanced workflow guides
│
└── quiz/                     # 🧠 Interactive knowledge quiz (159 questions)
```

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
| [/diagnose](./examples/commands/diagnose.md) | Interactive troubleshooting | Bilingual FR/EN, auto-scans environment |
| [/generate-tests](./examples/commands/generate-tests.md) | Generate test suites | TDD integration, coverage focus |
| [/review-pr](./examples/commands/review-pr.md) | Review pull requests | Code quality analysis |
| [/git-worktree](./examples/commands/git-worktree.md) | Manage git worktrees | Parallel development |
| [/validate-changes](./examples/commands/validate-changes.md) | Validate code changes | Pre-commit checks |

### Utility Scripts

| Script | Purpose | Performance |
|--------|---------|-------------|
| [session-search.sh](./examples/scripts/session-search.sh) | Fast session search & resume | 15ms list, 400ms search |
| [audit-scan.sh](./examples/scripts/audit-scan.sh) | Setup audit scanner | ~2s |

### Security & Automation Hooks

| Hook | Event | Purpose |
|------|-------|---------|
| [dangerous-actions-blocker.sh](./examples/hooks/bash/dangerous-actions-blocker.sh) | PreToolUse | Block `rm -rf /`, force push, secrets |
| [prompt-injection-detector.sh](./examples/hooks/bash/prompt-injection-detector.sh) | PreToolUse | Detect injection attempts |
| [unicode-injection-scanner.sh](./examples/hooks/bash/unicode-injection-scanner.sh) | PreToolUse | Detect zero-width, RTL, ANSI escape |
| [repo-integrity-scanner.sh](./examples/hooks/bash/repo-integrity-scanner.sh) | PreToolUse | Scan README/package.json for injection |
| [mcp-config-integrity.sh](./examples/hooks/bash/mcp-config-integrity.sh) | SessionStart | Verify MCP config hash (CVE protection) |
| [output-secrets-scanner.sh](./examples/hooks/bash/output-secrets-scanner.sh) | PostToolUse | Detect exposed secrets |
| [notification.sh](./examples/hooks/bash/notification.sh) | Notification | macOS sound alerts |
| [auto-format.sh](./examples/hooks/bash/auto-format.sh) | PostToolUse | Auto-format with Prettier |

**[See All 14 Hooks](./examples/hooks/)** — Includes session-logger, security-check, claudemd-scanner, and more

### GitHub Actions (CI/CD)

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| [claude-pr-auto-review.yml](./examples/github-actions/claude-pr-auto-review.yml) | PR open | Auto code review with inline comments |
| [claude-security-review.yml](./examples/github-actions/claude-security-review.yml) | PR open | Security scan (OWASP Top 10) |
| [claude-issue-triage.yml](./examples/github-actions/claude-issue-triage.yml) | Issue opened | Auto-triage with labels |

**[See Complete Catalog](./examples/README.md)** — Includes agents, skills, memory templates, config files, workflows

---

## 📖 Guide Navigation

Jump directly to any section in the [Ultimate Guide](./guide/ultimate-guide.md):

| Section | After this, you can... | When |
|---------|------------------------|------|
| **[1. Quick Start](./guide/ultimate-guide.md#1-quick-start-day-1)** | Run Claude Code and complete your first AI-assisted task | Day 1 |
| **[2. Core Concepts](./guide/ultimate-guide.md#2-core-concepts)** | Manage context efficiently and avoid common pitfalls | Week 1 |
| **[3. Memory & Settings](./guide/ultimate-guide.md#3-memory--settings)** | Create CLAUDE.md files that improve AI responses | First project |
| **[4. Agents](./guide/ultimate-guide.md#4-agents)** | Build custom AI personas for specialized workflows | Advanced |
| **[5. Skills](./guide/ultimate-guide.md#5-skills)** | Package reusable knowledge modules for your team | Scaling |
| **[6. Commands](./guide/ultimate-guide.md#6-commands)** | Create custom slash commands with variable interpolation | Automation |
| **[7. Hooks](./guide/ultimate-guide.md#7-hooks)** | Automate security checks and formatting on every action | Production |
| **[8. MCP Servers](./guide/ultimate-guide.md#8-mcp-servers)** | Extend Claude with databases, browsers, and external tools | Extended |
| **[9. Advanced Patterns](./guide/ultimate-guide.md#9-advanced-patterns)** | Orchestrate Trinity workflows and CI/CD pipelines | Power user |
| **[10. Reference](./guide/ultimate-guide.md#10-reference)** | Look up commands, shortcuts, and troubleshooting tips | Daily |

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

> *These thresholds are based on my experience. Your optimal workflow may differ.*

---

## 🌍 About This Guide

### Our Philosophy

**Learning journey over reference manual.** We focus on:

- Understanding **why** before diving into **how**
- Real-world patterns you can use immediately
- Progressive complexity — start simple, master advanced at your pace
- Practical workflows over theoretical concepts

Think of this as **a structured learning companion** — not just documentation.

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

*Version 3.7.1 | January 2026 | Crafted with Claude*

<!-- SEO Keywords -->
<!-- claude code, claude code tutorial, anthropic cli, ai coding assistant, claude code mcp,
claude code agents, claude code hooks, claude code skills, agentic coding, ai pair programming,
tdd ai, test driven development ai, sdd spec driven development, bdd claude, development methodologies,
claude code architecture, data privacy anthropic, claude code workflows, ai coding workflows -->