# The Ultimate Claude Code Guide

> From zero to power user — a comprehensive, self-contained guide to mastering Claude Code.

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

**Author**: [Florian BRUNIAUX](https://github.com/FlorianBruniaux) | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr)

**Contact**: [LinkedIn](https://www.linkedin.com/in/florian-bruniaux-43408b83/)

**Written with**: Claude (Anthropic)

---

## About This Guide

This guide is the result of **several months of daily practice and research** with Claude Code. I don't claim to be an "expert" — I'm simply sharing what I've learned along the way, humbly hoping to help my peers and evangelize good practices in AI-assisted development.

A significant source of inspiration for this work was [Claudelog.com](https://claudelog.com/), which I highly recommend for anyone wanting to go deeper.

**Important note**: This guide was largely generated with the help of AI. As such, it likely contains errors, inaccuracies, or outdated information. I would be delighted to receive any feedback, corrections, or — even better — pull requests to improve it. Don't hesitate to [open an issue](../../issues) or submit a PR!

**Language**: I wrote this guide in English by default to reach a wider audience, but French is my native language. I could easily translate it to French myself, or leverage AI and community contributions for other languages. Let me know if translations would be useful!

If you find value in this guide, have questions, or want to discuss Claude Code practices, feel free to reach out on [LinkedIn](https://www.linkedin.com/in/florian-bruniaux-43408b83/).

---

## What's Inside

| File | Description | Reading Time |
|------|-------------|--------------|
| [`english-ultimate-claude-code-guide.md`](./english-ultimate-claude-code-guide.md) | Complete guide (4000+ lines) | ~2.5 hours |
| [`cheatsheet-en.md`](./cheatsheet-en.md) | 1-page printable daily reference | 5 minutes |
| [`claude-code-ultimate-guide_notebooklm.pdf`](./claude-code-ultimate-guide_notebooklm.pdf) | Audio Deep Dive (NotebookLM podcast) | ~1 hour |
| [`claude-code-ultimate-guide_kimi.pdf`](./claude-code-ultimate-guide_kimi.pdf) | PDF version (Kimi export) | ~2.5 hours |

---

## Guide Overview

### 1. Quick Start (Day 1)
Installation, first workflow, essential commands, permission modes.

### 2. Core Concepts
- **Context Management** — The most critical concept (zones, recovery, poisoning)
- **Plan Mode** — Safe exploration before changes
- **Rewind** — Undo mistakes safely
- **Mental Model** — How Claude sees your codebase

### 3. Configuration
- `CLAUDE.md` files (global, project, local)
- The `.claude/` folder structure
- Settings & permissions
- Precedence rules

### 4. Agents
Create specialized AI personas for specific tasks:
- Code reviewer, debugger, backend architect
- Tool SEO for better agent discovery
- Multi-agent orchestration patterns

### 5. Skills
Reusable knowledge modules:
- Security Guardian (OWASP, secrets management)
- TDD (Red-Green-Refactor cycle)
- Creating your own skills

### 6. Commands
Custom slash commands:
- `/commit`, `/pr`, problem framer
- Variable interpolation with `$ARGUMENTS`

### 7. Hooks
Event-driven automation:
- Security blockers (pre-tool use)
- Auto-formatters (post-tool use)
- Context enrichers (prompt submit)
- Activity logging

### 8. MCP Servers
External tool integrations:
- **Serena** — Semantic code navigation
- **Context7** — Library documentation
- **Sequential** — Structured reasoning
- **Playwright** — Browser automation
- **Postgres** — Database queries

### 9. Advanced Patterns
- The Trinity (Plan + Think + Agents)
- CI/CD & IDE integration
- Tight feedback loops
- Todo as instruction mirrors
- Vibe coding & skeleton projects
- Batch operations

### 10. Reference
Commands table, keyboard shortcuts, troubleshooting, checklists.

### Appendix
Ready-to-use templates for agents, skills, commands, hooks, settings, and prompts.

---

## Quick Start

```bash
# Install Claude Code
curl -fsSL https://claude.ai/install.sh | sh

# Start in your project
cd your-project
claude
```

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

## Contributing

Found an error? Have a suggestion? Open an issue or PR.

---

## Resources

- [Official Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Claudelog.com](https://claudelog.com/) — Advanced tips & patterns (inspiration for some sections)

---

## License

This work is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

You are free to share and adapt this material, provided you give appropriate credit and distribute your contributions under the same license.

---

*Last updated: January 2025 | Version 1.0*