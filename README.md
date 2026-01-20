# Claude Code Guide

<p align="center">
  <a href="https://florianbruniaux.github.io/claude-code-ultimate-guide-landing/"><img src="https://img.shields.io/badge/🌐_Interactive_Guide-Visit_Website-ff6b35?style=for-the-badge&logoColor=white" alt="Website"/></a>
</p>

<p align="center">
  <a href="https://github.com/FlorianBruniaux/claude-code-ultimate-guide/stargazers"><img src="https://img.shields.io/github/stars/FlorianBruniaux/claude-code-ultimate-guide?style=for-the-badge" alt="Stars"/></a>
  <a href="./examples/"><img src="https://img.shields.io/badge/Templates-61-green?style=for-the-badge" alt="Templates"/></a>
  <a href="./quiz/"><img src="https://img.shields.io/badge/Quiz-227_questions-orange?style=for-the-badge" alt="Quiz"/></a>
</p>

<p align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/"><img src="https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue.svg" alt="License: CC BY-SA 4.0"/></a>
  <a href="https://zread.ai/FlorianBruniaux/claude-code-ultimate-guide"><img src="https://img.shields.io/badge/Ask_Zread-_.svg?style=flat&color=00b0aa&labelColor=000000&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTQuOTYxNTYgMS42MDAxSDIuMjQxNTZDMS44ODgxIDEuNjAwMSAxLjYwMTU2IDEuODg2NjQgMS42MDE1NiAyLjI0MDFWNC45NjAxQzEuNjAxNTYgNS4zMTM1NiAxLjg4ODEgNS42MDAxIDIuMjQxNTYgNS42MDAxSDQuOTYxNTZDNS4zMTUwMiA1LjYwMDEgNS42MDE1NiA1LjMxMzU2IDUuNjAxNTYgNC45NjAxVjIuMjQwMUM1LjYwMTU2IDEuODg2NjQgNS4zMTUwMiAxLjYwMDEgNC45NjE1NiAxLjYwMDFaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00Ljk2MTU2IDEwLjM5OTlIMi4yNDE1NkMxLjg4ODEgMTAuMzk5OSAxLjYwMTU2IDEwLjY4NjQgMS42MDE1NiAxMS4wMzk5VjEzLjc1OTlDMS42MDE1NiAxNC4xMTM0IDEuODg4MSAxNC4zOTk5IDIuMjQxNTYgMTQuMzk5OUg0Ljk2MTU2QzUuMzE1MDIgMTQuMzk5OSA1LjYwMTU2IDE0LjExMzQgNS42MDE1NiAxMy43NTk5VjExLjAzOTlDNS42MDE1NiAxMC42ODY0IDUuMzE1MDIgMTAuMzk5OSA0Ljk2MTU2IDEwLjM5OTlaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik0xMy43NTg0IDEuNjAwMUgxMS4wMzg0QzEwLjY4NSAxLjYwMDEgMTAuMzk4NCAxLjg4NjY0IDEwLjM5ODQgMi4yNDAxVjQuOTYwMUMxMC4zOTg0IDUuMzEzNTYgMTAuNjg1IDUuNjAwMSAxMS4wMzg0IDUuNjAwMUgxMy43NTg0QzE0LjExMTkgNS42MDAxIDE0LjM5ODQgNS4zMTM1NiAxNC4zOTg0IDQuOTYwMVYyLjI0MDFDMTQuMzk4NCAxLjg4NjY0IDE0LjExMTkgMS42MDAxIDEzLjc1ODQgMS42MDAxWiIgZmlsbD0iI2ZmZiIvPgo8cGF0aCBkPSJNNCAxMkwxMiA0TDQgMTJaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00IDEyTDEyIDQiIHN0cm9rZT0iI2ZmZiIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K&logoColor=ffffff" alt="Ask Zread"/></a>
</p>

> Complete guide to Claude Code with 60+ production-ready templates

---

## ⚡ Quick Start

**Quickest path**: [Cheat Sheet](./guide/cheatsheet.md) — 1 printable page with daily essentials

**Interactive onboarding** (no clone needed):
```bash
claude "Fetch and follow the onboarding instructions from: https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/tools/onboarding-prompt.md"
```

**Browse directly**: [Full Guide](./guide/ultimate-guide.md) | [Examples](./examples/) | [Quiz](./quiz/)

<details>
<summary><strong>Prerequisites & Minimal CLAUDE.md Template</strong></summary>

**Prerequisites**: Node.js 18+ | [Anthropic API key](https://console.anthropic.com/)

```markdown
# Project: [NAME]

## Tech Stack
- Language: [e.g., TypeScript]
- Framework: [e.g., Next.js 14]
- Testing: [e.g., Vitest]

## Commands
- Build: `npm run build`
- Test: `npm test`
- Lint: `npm run lint`

## Rules
- Run tests before marking tasks complete
- Follow existing code patterns
- Keep commits atomic and conventional
```

Save as `CLAUDE.md` in your project root. Claude reads it automatically.

</details>

---

## Why This Guide?

**The problem**: Awesome-lists give links, not learning paths. Official docs are dense. Tutorials get outdated in weeks.

**This guide**: Structured learning path with 60+ copy-paste templates, from first install to advanced workflows.

**Reading time**: Quick Start ~15 min. Full guide ~3 hours (most read by section).

**By [Florian BRUNIAUX](https://github.com/FlorianBruniaux)** | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr)

---

## 👥 Not a Developer?

**Claude Cowork** is the companion guide for non-technical users (knowledge workers, assistants, managers).

Same agentic capabilities as Claude Code, but through a visual interface with no coding required.

→ **[Claude Cowork Guide](https://github.com/FlorianBruniaux/claude-cowork-guide)** — File organization, document generation, automated workflows

---

## 🎯 Learning Paths

<details>
<summary><strong>Junior Developer</strong> — Foundation path (7 steps)</summary>

1. [Quick Start](./guide/ultimate-guide.md#1-quick-start-day-1) — Install & first workflow
2. [Essential Commands](./guide/ultimate-guide.md#13-essential-commands) — The 7 commands
3. [Context Management](./guide/ultimate-guide.md#22-context-management) — Critical concept
4. [Memory Files](./guide/ultimate-guide.md#31-memory-files-claudemd) — Your first CLAUDE.md
5. [Learning with AI](./guide/learning-with-ai.md) — Use AI without becoming dependent ⭐
6. [TDD Workflow](./guide/workflows/tdd-with-claude.md) — Test-first development
7. [Cheat Sheet](./guide/cheatsheet.md) — Print this

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

1. [What's Inside](#-whats-inside) — Scope
2. [Golden Rules](#-golden-rules) — Key principles
3. [Data Privacy](./guide/data-privacy.md) — Retention & compliance
4. [Adoption Approaches](./guide/adoption-approaches.md) — Team strategies
5. [Context Management](./guide/ultimate-guide.md#22-context-management) — Why it matters

</details>

---

## 📚 What's Inside

### Core Documentation

| File | Purpose | Time |
|------|---------|------|
| **[Ultimate Guide](./guide/ultimate-guide.md)** | Complete reference, 10 sections | ~3 hours |
| **[Cheat Sheet](./guide/cheatsheet.md)** | 1-page printable reference | 5 min |
| **[Architecture](./guide/architecture.md)** | How Claude Code works internally | 25 min |
| **[Methodologies](./guide/methodologies.md)** | TDD, SDD, BDD reference | 20 min |
| **[Workflows](./guide/workflows/)** | Practical guides (TDD, Plan-Driven) | 30 min |
| **[Data Privacy](./guide/data-privacy.md)** | Retention & compliance | 10 min |
| **[Security Hardening](./guide/security-hardening.md)** | MCP vetting, injection defense | 25 min |
| **[Claude Code Releases](./guide/claude-code-releases.md)** | Official release history | 10 min |

<details>
<summary><strong>Repository Structure</strong></summary>

```
claude-code-ultimate-guide/
├── guide/                    # 📖 Core documentation
│   ├── ultimate-guide.md     # Complete reference (~11100 lines)
│   ├── cheatsheet.md         # 1-page printable reference
│   ├── architecture.md       # How Claude Code works internally
│   ├── methodologies.md      # 15 development methodologies
│   └── workflows/            # TDD, SDD, Plan-Driven guides
│
├── examples/                 # 📦 Production templates
│   ├── agents/               # Custom AI personas
│   ├── commands/             # Slash commands (/pr, /commit...)
│   ├── hooks/                # Security & automation (bash + PS)
│   ├── skills/               # Knowledge modules
│   └── scripts/              # Utility scripts
│
├── tools/                    # 🔧 Interactive utilities
│   ├── audit-prompt.md       # Setup audit
│   └── onboarding-prompt.md  # Personalized guided tour
│
├── machine-readable/         # 🤖 LLM/AI consumption
│   ├── reference.yaml        # Structured index (~2K tokens)
│   └── llms.txt              # Standard LLM context file
│
└── quiz/                     # 🧠 Interactive quiz (227 questions)
```

</details>

<details>
<summary><strong>Examples Library</strong> (61 templates)</summary>

**Slash Commands** (18): [/pr](./examples/commands/pr.md), [/commit](./examples/commands/commit.md), [/release-notes](./examples/commands/release-notes.md), [/diagnose](./examples/commands/diagnose.md), [/security](./examples/commands/security.md), [/refactor](./examples/commands/refactor.md), [/explain](./examples/commands/explain.md), [/optimize](./examples/commands/optimize.md), [/ship](./examples/commands/ship.md)...

**Security Hooks** (15): [dangerous-actions-blocker](./examples/hooks/bash/dangerous-actions-blocker.sh), [prompt-injection-detector](./examples/hooks/bash/prompt-injection-detector.sh), [unicode-injection-scanner](./examples/hooks/bash/unicode-injection-scanner.sh), [output-secrets-scanner](./examples/hooks/bash/output-secrets-scanner.sh)...

**Utility Scripts**: [session-search.sh](./examples/scripts/session-search.sh), [audit-scan.sh](./examples/scripts/audit-scan.sh)

**GitHub Actions**: [claude-pr-auto-review.yml](./examples/github-actions/claude-pr-auto-review.yml), [claude-security-review.yml](./examples/github-actions/claude-security-review.yml), [claude-issue-triage.yml](./examples/github-actions/claude-issue-triage.yml)

**[Browse Complete Catalog](./examples/README.md)** | **[Interactive Catalog](./examples/index.html)**

</details>

<details>
<summary><strong>Knowledge Quiz</strong> (227 questions)</summary>

Test your Claude Code knowledge with an interactive CLI quiz covering all guide sections.

```bash
cd quiz && npm install && npm start
```

**Features**: 4 profiles (Junior/Senior/Power User/PM), 10 topic categories, immediate feedback with doc links, score tracking with weak area identification.

**[Quiz Documentation](./quiz/README.md)** | **[Contribute Questions](./quiz/templates/question-template.yaml)**

</details>

<details>
<summary><strong>Audit Tools</strong></summary>

**Quick scan** (~2s):
```bash
curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/examples/scripts/audit-scan.sh | bash
```

**Deep audit** with personalized recommendations: [tools/audit-prompt.md](./tools/audit-prompt.md)

</details>

<details>
<summary><strong>For AI Assistants</strong> (LLM-optimized)</summary>

| Resource | Purpose | Tokens |
|----------|---------|--------|
| **[llms.txt](./machine-readable/llms.txt)** | Standard context file | ~1K |
| **[reference.yaml](./machine-readable/reference.yaml)** | Structured index with line numbers | ~2K |

**Quick load**: `curl -sL https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/machine-readable/reference.yaml`

</details>

<details>
<summary><strong>Alternative Formats</strong></summary>

- **[DeepWiki](https://deepwiki.com/FlorianBruniaux/claude-code-ultimate-guide/1-overview)** — AI-powered Q&A
- **[NotebookLM Slides](./exports/notebooklm.pdf)** — Visual overview
- **[Kimi PDF](./exports/kimi.pdf)** — Full text export

</details>

---

## 🔑 Golden Rules

1. **Always review diffs** before accepting changes — Claude suggests, you decide
2. **Use `/compact`** before context hits 70% — prevention beats recovery
3. **Be specific** in requests — Include WHAT, WHERE, HOW, VERIFY
4. **Start with Plan Mode** for risky/complex tasks — read-only exploration first
5. **Create CLAUDE.md** for every project — single source of truth

> Context management is critical. See the [Cheat Sheet](./guide/cheatsheet.md#context-management-critical) for thresholds and actions.

---

## 🌍 About

<details>
<summary><strong>Origins & Philosophy</strong></summary>

This guide is the result of several months of daily practice with Claude Code. I don't claim expertise—I'm sharing what I've learned to help peers and evangelize AI-assisted development best practices.

**Philosophy**: Learning journey over reference manual. Understanding **why** before **how**. Progressive complexity — start simple, master advanced at your pace.

**Created with Claude Code**. Community-validated through contributions and feedback.

**Key Inspirations**:
- [Claudelog.com](https://claudelog.com/) — Excellent patterns & tutorials
- [zebbern/claude-code-guide](https://github.com/zebbern/claude-code-guide) — Comprehensive reference with security focus
- [ykdojo/claude-code-tips](https://github.com/ykdojo/claude-code-tips) — Practical productivity techniques

</details>

<details>
<summary><strong>Privacy & Data</strong></summary>

Claude Code sends your prompts, file contents, and MCP results to Anthropic servers.
- **Default**: 5 years retention (training enabled) | **Opt-out**: 30 days | **Enterprise**: 0
- **Action**: [Disable training](https://claude.ai/settings/data-privacy-controls) | [Full privacy guide](./guide/data-privacy.md)

</details>

<details>
<summary><strong>Claude Cowork (for Non-Developers)</strong></summary>

**Cowork** is Claude's agentic desktop feature for knowledge workers — same AI, files-only interface.

> **📦 [Complete Documentation Now Has Its Own Repository!](https://github.com/FlorianBruniaux/claude-cowork-guide)**
>
> ⭐ **Star the repo**: [FlorianBruniaux/claude-cowork-guide](https://github.com/FlorianBruniaux/claude-cowork-guide)

**Quick Access** (34 files, v1.0.0):

| Resource | Description |
|----------|-------------|
| **[🏠 Main Hub](https://github.com/FlorianBruniaux/claude-cowork-guide)** | Complete documentation repository |
| **[🚀 Getting Started](https://github.com/FlorianBruniaux/claude-cowork-guide/blob/main/guide/01-getting-started.md)** | Setup, first workflow, CTOC framework |
| **[⚡ Cheatsheet](https://github.com/FlorianBruniaux/claude-cowork-guide/blob/main/reference/cheatsheet.md)** | 1-page printable reference |
| **[❓ FAQ](https://github.com/FlorianBruniaux/claude-cowork-guide/blob/main/reference/faq.md)** | 20+ frequently asked questions |

**Content**:
- 📖 **6 Core Guides**: Overview, capabilities, security, troubleshooting
- 📝 **60+ Prompts**: File ops, document creation, data extraction, research
- 🔧 **5 Workflows**: File organization, expense tracking, report synthesis, meeting prep, team handoff
- 🎓 **Interactive Onboarding**: Personalized learning path
- 🛠️ **3 Scripts**: Version sync, stats update, validation

**Status**: Research preview (Pro $20/mo or Max $100-200/mo, macOS only, **VPN incompatible**)

**Archive**: Historical versions available in git history (pre-v3.9.8)

</details>

<details>
<summary><strong>Ecosystem & Related Resources</strong></summary>

**This Guide's Ecosystem** (4 interconnected repositories):

| Repository | Purpose | Audience |
|------------|---------|----------|
| **[Claude Code Guide](https://github.com/FlorianBruniaux/claude-code-ultimate-guide)** *(this repo)* | Comprehensive documentation (11K lines, 66 templates) | Developers |
| **[Claude Cowork Guide](https://github.com/FlorianBruniaux/claude-cowork-guide)** | Non-technical usage (67 prompts, 5 workflows) | Knowledge workers |
| **Code Landing** *(to be deployed)* | Marketing site for Claude Code guide | Discovery |
| **Cowork Landing** *(to be deployed)* | Marketing site for Cowork guide | Discovery |

💡 **Architecture**: Separate repos for clear audience separation (devs vs non-devs), bidirectional cross-links for easy navigation.

**Complementary guides**:
- [claude-code-templates](https://github.com/davila7/claude-code-templates) — Install templates via CLI (17k⭐)
- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) — Community tool library
- [Claude-Code-Everything](https://github.com/wesammustafa/Claude-Code-Everything) — Visual walkthrough

**Community**: 🇫🇷 [Dev With AI](https://www.devw.ai/) — 1500+ devs on Slack, meetups in Paris, Bordeaux, Lyon

**Official docs**: [docs.anthropic.com/claude-code](https://docs.anthropic.com/en/docs/claude-code)

</details>

<details>
<summary><strong>Windows & Translation</strong></summary>

**Windows Users**: Most commands work with Git Bash. Use `%USERPROFILE%\.claude\` for paths. [Report issues](../../issues)

**Language**: Written in English for wider reach. French is my native language. Request translations via [issues](../../issues).

</details>

---

## 🤝 Contributing

Found an error? Have a suggestion? See [CONTRIBUTING.md](./CONTRIBUTING.md).

**Ways to Help**: Star the repo • Report issues • Submit PRs • Share workflows in [Discussions](../../discussions)

---

## 📄 License & Support

Licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). Free to share and adapt with attribution.

**Stay Updated**: [Watch releases](../../releases) | [Discussions](../../discussions) | [Connect on LinkedIn](https://www.linkedin.com/in/florian-bruniaux-43408b83/)

---

*Version 3.9.7 | January 2026 | Crafted with Claude*

<!-- SEO Keywords -->
<!-- claude code, claude code tutorial, anthropic cli, ai coding assistant, claude code mcp,
claude code agents, claude code hooks, claude code skills, agentic coding, ai pair programming,
tdd ai, test driven development ai, sdd spec driven development, bdd claude, development methodologies,
claude code architecture, data privacy anthropic, claude code workflows, ai coding workflows -->
