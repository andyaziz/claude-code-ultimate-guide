# The Ultimate Claude Code Guide

> A comprehensive, self-contained guide to mastering Claude Code - from zero to power user.

**Author**: Florian BRUNIAUX | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr)

**Written with**: Claude (Anthropic)

**Reading time**: ~3 hours (full) | ~15 minutes (Quick Start only)

**Last updated**: January 2026

**Version**: 2.0

---

<div align="center">

### 📊 Guide Status Overview

| Section | Status | Coverage | Last Updated |
|---------|--------|----------|--------------|
| **Quick Start & Installation** | ✅ Complete | 100% | Jan 2026 |
| **Core Concepts** | ✅ Complete | 100% | Jan 2026 |
| **Memory & Settings** | ✅ Complete | 100% | Jan 2026 |
| **Agents & Skills** | ✅ Complete | 100% | Jan 2026 |
| **Commands & Hooks** | ✅ Complete | 100% | Jan 2026 |
| **MCP Integration** | ✅ Complete | 100% | Jan 2026 |
| **Advanced Patterns** | ✅ Complete | 100% | Jan 2026 |
| **Reference & Troubleshooting** | ✅ Complete | 100% | Jan 2026 |

**Legend**: ✅ Complete | 🔄 In Progress | 📝 Planned | ⚠️ Needs Update

</div>

---

## TL;DR - The 5-Minute Summary

If you only have 5 minutes, here's what you need to know:

### Essential Commands
```bash
claude                    # Start Claude Code
/help                     # Show all commands
/status                   # Check context usage
/compact                  # Compress context when >70%
/clear                    # Fresh start
/plan                     # Safe read-only mode
Ctrl+C                    # Cancel operation
```

### The Workflow
```
Describe → Claude Analyzes → Review Diff → Accept/Reject → Verify
```

### Context Management (Critical!)
| Context % | Action |
|-----------|--------|
| 0-50% | Work freely |
| 50-70% | Be selective |
| 70-90% | `/compact` now |
| 90%+ | `/clear` required |

### Memory Hierarchy
```
~/.claude/CLAUDE.md       → Global (all projects)
/project/CLAUDE.md        → Project (committed)
/project/.claude/         → Personal (not committed)
```

### Power Features
| Feature | What It Does |
|---------|--------------|
| **Agents** | Specialized AI personas for specific tasks |
| **Skills** | Reusable knowledge modules |
| **Hooks** | Automation scripts triggered by events |
| **MCP Servers** | External tools (Serena, Context7, Playwright...) |

### The Golden Rules
1. **Always review diffs** before accepting changes
2. **Use `/compact`** before context gets critical
3. **Be specific** in your requests (WHAT, WHERE, HOW, VERIFY)
4. **Start with Plan Mode** for complex/risky tasks
5. **Create CLAUDE.md** for every project

### Quick Decision Tree
```
Simple task → Just ask Claude
Complex task → Use TodoWrite to plan
Risky change → Enter Plan Mode first
Repeating task → Create an agent or command
Context full → /compact or /clear
```

**Now read Section 1 for the full Quick Start, or jump to any section you need.**

---

## Table of Contents

- [1. Quick Start (Day 1)](#1-quick-start-day-1)
  - [1.1 Installation](#11-installation)
  - [1.2 First Workflow](#12-first-workflow)
  - [1.3 Essential Commands](#13-essential-commands)
  - [1.4 Permission Modes](#14-permission-modes)
  - [1.5 Productivity Checklist](#15-productivity-checklist)
- [2. Core Concepts](#2-core-concepts)
  - [2.1 The Interaction Loop](#21-the-interaction-loop)
  - [2.2 Context Management](#22-context-management)
  - [2.3 Plan Mode](#23-plan-mode)
  - [2.4 Rewind](#24-rewind)
  - [2.5 Mental Model](#25-mental-model)
- [3. Memory & Settings](#3-memory--settings)
  - [3.1 Memory Files (CLAUDE.md)](#31-memory-files-claudemd)
  - [3.2 The .claude/ Folder Structure](#32-the-claude-folder-structure)
  - [3.3 Settings & Permissions](#33-settings--permissions)
  - [3.4 Precedence Rules](#34-precedence-rules)
- [4. Agents](#4-agents)
  - [4.1 What Are Agents](#41-what-are-agents)
  - [4.2 Creating Custom Agents](#42-creating-custom-agents)
  - [4.3 Agent Template](#43-agent-template)
  - [4.4 Best Practices](#44-best-practices)
  - [4.5 Agent Examples](#45-agent-examples)
- [5. Skills](#5-skills)
  - [5.1 Understanding Skills](#51-understanding-skills)
  - [5.2 Creating Skills](#52-creating-skills)
  - [5.3 Skill Template](#53-skill-template)
  - [5.4 Skill Examples](#54-skill-examples)
- [6. Commands](#6-commands)
  - [6.1 Slash Commands](#61-slash-commands)
  - [6.2 Creating Custom Commands](#62-creating-custom-commands)
  - [6.3 Command Template](#63-command-template)
  - [6.4 Command Examples](#64-command-examples)
- [7. Hooks](#7-hooks)
  - [7.1 The Event System](#71-the-event-system)
  - [7.2 Creating Hooks](#72-creating-hooks)
  - [7.3 Hook Templates](#73-hook-templates)
  - [7.4 Security Hooks](#74-security-hooks)
  - [7.5 Hook Examples](#75-hook-examples)
- [8. MCP Servers](#8-mcp-servers)
  - [8.1 What is MCP](#81-what-is-mcp)
  - [8.2 Available Servers](#82-available-servers)
  - [8.3 Configuration](#83-configuration)
  - [8.4 Server Selection Guide](#84-server-selection-guide)
- [9. Advanced Patterns](#9-advanced-patterns)
  - [9.1 The Trinity](#91-the-trinity)
  - [9.2 Composition Patterns](#92-composition-patterns)
  - [9.3 CI/CD Integration](#93-cicd-integration)
  - [9.4 IDE Integration](#94-ide-integration)
  - [9.5 Tight Feedback Loops](#95-tight-feedback-loops)
  - [9.6 Todo as Instruction Mirrors](#96-todo-as-instruction-mirrors)
  - [9.7 Output Styles](#97-output-styles)
  - [9.8 Vibe Coding & Skeleton Projects](#98-vibe-coding--skeleton-projects)
  - [9.9 Batch Operations Pattern](#99-batch-operations-pattern)
  - [9.10 Continuous Improvement Mindset](#910-continuous-improvement-mindset)
  - [9.11 Common Pitfalls & Best Practices](#911-common-pitfalls--best-practices)
- [10. Reference](#10-reference)
  - [10.1 Commands Table](#101-commands-table)
  - [10.2 Keyboard Shortcuts](#102-keyboard-shortcuts)
  - [10.3 Configuration Reference](#103-configuration-reference)
  - [10.4 Troubleshooting](#104-troubleshooting)
  - [10.5 Cheatsheet](#105-cheatsheet)
  - [10.6 Daily Workflow & Checklists](#106-daily-workflow--checklists)
- [Appendix: Templates Collection](#appendix-templates-collection)
  - [Appendix A: File Locations Reference](#appendix-a-file-locations-reference)
  - [A.8 Prompt Templates](#a8-prompt-templates)
  - [A.9 Success Metrics & Maturity Model](#a9-success-metrics--maturity-model)

---

# 1. Quick Start (Day 1)

_Quick jump:_ [Installation](#11-installation) · [First Workflow](#12-first-workflow) · [Essential Commands](#13-essential-commands) · [Permission Modes](#14-permission-modes) · [Productivity Checklist](#15-productivity-checklist) · [Migrating from Other Tools](#16-migrating-from-other-ai-coding-tools)

---

**Reading time**: 15 minutes

**Skill level**: Beginner

**Goal**: Go from zero to productive

## 1.1 Installation

Choose your preferred installation method based on your operating system:

```C
/*──────────────────────────────────────────────────────────────*/
/* Universal Method       */ npm install -g @anthropic-ai/claude-code
/*──────────────────────────────────────────────────────────────*/
/* Windows (CMD)          */ npm install -g @anthropic-ai/claude-code
/* Windows (PowerShell)   */ irm https://claude.ai/install.ps1 | iex
/*──────────────────────────────────────────────────────────────*/
/* macOS (npm)            */ npm install -g @anthropic-ai/claude-code
/* macOS (Homebrew)       */ brew install claude-code
/* macOS (Shell Script)   */ curl -fsSL https://claude.ai/install.sh | sh
/*──────────────────────────────────────────────────────────────*/
/* Linux (npm)            */ npm install -g @anthropic-ai/claude-code
/* Linux (Shell Script)   */ curl -fsSL https://claude.ai/install.sh | sh
```

### Verify Installation

```bash
claude --version
```

### Platform-Specific Paths

| Platform | Global Config Path | Shell Config |
|----------|-------------------|--------------|
| **macOS/Linux** | `~/.claude/` | `~/.zshrc` or `~/.bashrc` |
| **Windows** | `%USERPROFILE%\.claude\` | PowerShell profile |

> **Windows Users**: Throughout this guide, when you see `~/.claude/`, use `%USERPROFILE%\.claude\` or `C:\Users\YourName\.claude\` instead.

### First Launch

```bash
cd your-project
claude
```

On first launch:

1. You'll be prompted to authenticate with your Anthropic account
2. Accept the terms of service
3. Claude Code will index your project (may take a few seconds for large codebases)

## 1.2 First Workflow

Let's fix a bug together. This demonstrates the core interaction loop.

### Step 1: Describe the Problem

```
You: There's a bug in the login function - users can't log in with email addresses containing a plus sign
```

### Step 2: Claude Analyzes

Claude will:
- Search your codebase for relevant files
- Read the login-related code
- Identify the issue
- Propose a fix

### Step 3: Review the Diff

```diff
- const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
+ const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
```

💡 **Critical**: Always read the diff before accepting. This is your safety net.

### Step 4: Accept or Reject

- Press `y` to accept the change
- Press `n` to reject and ask for alternatives
- Press `e` to edit the change manually

### Step 5: Verify

```
You: Run the tests to make sure this works
```

Claude will run your test suite and report results.

### Step 6: Commit (Optional)

```
You: Commit this fix
```

Claude will create a commit with an appropriate message.

## 1.3 Essential Commands

These 7 commands cover 90% of daily usage:

| Command | Action | When to Use |
|---------|--------|-------------|
| `/help` | Show all commands | When you're lost |
| `/clear` | Clear conversation | Start fresh |
| `/compact` | Summarize context | Running low on context |
| `/status` | Show session info | Check context usage |
| `/exit` or `Ctrl+D` | Exit Claude Code | Done working |
| `/plan` | Enter Plan Mode | Safe exploration |
| `/rewind` | Undo changes | Made a mistake |

### Quick Actions

| Shortcut | Action |
|----------|--------|
| `!command` | Run shell command directly |
| `@file.ts` | Reference a specific file |
| `Ctrl+C` | Cancel current operation |
| `Ctrl+R` | Retry last operation |
| `Esc` | Dismiss current suggestion |

## 1.4 Permission Modes

Claude Code has three permission modes that control how much autonomy Claude has:

### Default Mode

Claude asks permission before:
- Editing files
- Running commands
- Making commits

This is the safest mode for learning.

### Auto-accept Mode

```
You: Turn on auto-accept for the rest of this session
```

Claude will execute changes without asking. Use when you trust the operation and want speed.

⚠️ **Warning**: Only use auto-accept for well-defined, reversible operations.

### Plan Mode

```
/plan
```

Claude can only read and analyze - no modifications allowed. Perfect for:
- Understanding unfamiliar code
- Exploring architectural options
- Safe investigation before changes

Exit with `/execute` when ready to make changes.

## 1.5 Productivity Checklist

You're ready for Day 2 when you can:

- [ ] Launch Claude Code in your project
- [ ] Describe a task and review the proposed changes
- [ ] Accept or reject changes after reading the diff
- [ ] Run a shell command with `!`
- [ ] Reference a file with `@`
- [ ] Use `/clear` to start fresh
- [ ] Use `/status` to check context usage
- [ ] Exit cleanly with `/exit` or `Ctrl+D`

## 1.6 Migrating from Other AI Coding Tools

Switching from GitHub Copilot, Cursor, or other AI assistants? Here's what you need to know.

### Why Claude Code is Different

| Feature | GitHub Copilot | Cursor | Claude Code |
|---------|---------------|--------|-------------|
| **Interaction** | Inline autocomplete | Chat + autocomplete | CLI + conversation |
| **Context** | Current file | Open files | Entire project |
| **Autonomy** | Suggestions only | Edit + chat | Full task execution |
| **Customization** | Limited | Extensions | Agents, skills, hooks, MCP |
| **Cost Model** | $10-20/month flat | $20/month flat | Pay-per-use ($0.10-$0.50/hour) |

**Key mindset shift**: Claude Code is a **conversational coding partner**, not an autocomplete tool.

### Migration Guide: GitHub Copilot → Claude Code

#### What Copilot Does Well

- **Inline suggestions** - Fast autocomplete as you type
- **Familiar workflow** - Works inside your editor
- **Low friction** - No context switching

#### What Claude Code Does Better

- **Multi-file refactoring** - Copilot: one file at a time | Claude: entire codebase
- **Complex tasks** - Copilot: suggests lines | Claude: implements features
- **Understanding context** - Copilot: current file | Claude: project-wide awareness
- **Explaining code** - Copilot: limited | Claude: detailed explanations
- **Debugging** - Copilot: weak | Claude: systematic root cause analysis

#### Hybrid Approach (Recommended)

**Use Copilot for:**
- Quick autocomplete while typing
- Boilerplate code generation
- Simple function completions

**Use Claude Code for:**
- Feature implementation (multi-file changes)
- Debugging complex issues
- Code reviews and refactoring
- Understanding unfamiliar codebases
- Writing tests for entire modules

**Workflow example**:

```bash
# Morning: Plan feature with Claude Code
claude
You: "I need to add user authentication. What's the best approach for this codebase?"
# Claude analyzes project, suggests architecture

# During coding: Use Copilot for inline completions
# Type in VS Code, Copilot autocompletes

# Afternoon: Debug with Claude Code
claude
You: "Login fails on mobile but works on desktop. Debug this."
# Claude systematically investigates

# End of day: Review with Claude Code
claude
You: "Review my changes today. Check for security issues."
# Claude reviews all modified files
```

### Migration Guide: Cursor → Claude Code

#### What Cursor Does Well

- **Inline editing** - Direct code modifications in editor
- **GUI interface** - Familiar VS Code experience
- **Chat + autocomplete** - Both modalities in one tool

#### What Claude Code Does Better

- **Terminal-native workflow** - Better for CLI-heavy developers
- **Advanced customization** - Agents, skills, hooks, commands
- **MCP servers** - Extensibility beyond what Cursor offers
- **Cost efficiency** - Pay for what you use vs. flat $20/month
- **Git integration** - Native git operations, commit generation
- **CI/CD integration** - Headless mode for automation

#### When to Switch

**Stick with Cursor if:**
- You strongly prefer GUI over CLI
- You want all-in-one IDE experience
- You use it >4 hours/day (flat rate is better)
- You don't need advanced customization

**Switch to Claude Code if:**
- You're comfortable with terminal workflows
- You want deeper customization (agents, hooks)
- You work with complex, multi-repo projects
- You want to integrate AI into CI/CD
- You prefer pay-per-use pricing

#### Running Both

You can use both tools simultaneously:

```bash
# Cursor for editing and quick changes
# Claude Code in terminal for complex tasks

# Example workflow:
# 1. Use Cursor to explore and make quick edits
# 2. Open terminal: claude
# 3. Ask Claude Code: "Review my changes and suggest improvements"
# 4. Apply suggestions in Cursor
# 5. Use Claude Code to generate tests
```

### Migration Checklist

#### Week 1: Learning Phase

```markdown
□ Complete Quick Start (Section 1)
□ Understand context management (critical!)
□ Try 3-5 small tasks (bug fixes, small features)
□ Learn when to use /plan mode
□ Practice reviewing diffs before accepting
```

#### Week 2: Establishing Workflow

```markdown
□ Create project CLAUDE.md file
□ Set up 1-2 custom commands for frequent tasks
□ Configure MCP servers (Serena, Context7)
□ Define your hybrid workflow (when to use Claude Code vs. other tools)
□ Track costs and optimize based on usage
```

#### Week 3-4: Advanced Usage

```markdown
□ Create custom agents for specialized tasks
□ Set up hooks for automation (formatting, linting)
□ Integrate into CI/CD if applicable
□ Build team patterns if working with others
□ Refine CLAUDE.md based on learnings
```

### Common Migration Issues

**Issue 1: "I miss inline suggestions"**

- **Solution**: Keep using Copilot/Cursor for autocomplete, use Claude Code for complex tasks
- **Alternative**: Request Claude to generate code snippets you can paste

**Issue 2: "Context switching is annoying"**

- **Solution**: Use split terminal (editor on left, Claude Code on right)
- **Tip**: Set up keyboard shortcut to toggle terminal focus

**Issue 3: "I don't know when to use which tool"**

- **Rule of thumb**:
  - **<5 lines of code** → Use Copilot/autocomplete
  - **5-50 lines, single file** → Either tool works
  - **>50 lines or multi-file** → Use Claude Code

**Issue 4: "Claude Code is slower than autocomplete"**

- **Reality check**: Claude Code solves different problems
- **Don't compare**: Autocomplete vs. full task execution
- **Optimize**: Use specific queries, manage context well

**Issue 5: "Costs are unpredictable"**

- **Solution**: Track costs in Anthropic Console
- **Budget**: Set mental budget per session ($0.10-$0.50)
- **Optimize**: Use `/compact`, be specific in queries

### Transition Strategies

**Strategy 1: Gradual (Recommended)**

```
Week 1: Use Claude Code 1-2 times/day for specific tasks
Week 2: Use Claude Code for all debugging and reviews
Week 3: Use Claude Code for feature implementation
Week 4: Full workflow integration
```

**Strategy 2: Cold Turkey**

```
Day 1: Disable Copilot/Cursor, force yourself to use only Claude Code
Day 2-3: Frustration period (learning curve)
Day 4-7: Productivity recovery
Week 2+: Full proficiency
```

**Strategy 3: Task-Based**

```
Use Claude Code exclusively for:
- All new features
- All debugging sessions
- All code reviews

Keep Copilot/Cursor for:
- Quick edits
- Autocomplete
```

### Measuring Success

**You know you've successfully migrated when:**

- [ ] You instinctively reach for Claude Code for complex tasks
- [ ] You understand context management without thinking
- [ ] You've created at least 2-3 custom commands/agents
- [ ] You can estimate costs before starting a session
- [ ] You prefer Claude Code's explanations over inline docs
- [ ] You've integrated Claude Code into your daily workflow

**Productivity indicators:**

- Completing features 20-30% faster
- Spending less time debugging
- Higher code quality (caught by Claude reviews)
- Better understanding of unfamiliar code

---

# 2. Core Concepts

_Quick jump:_ [The Interaction Loop](#21-the-interaction-loop) · [Context Management](#22-context-management) · [Plan Mode](#23-plan-mode) · [Rewind](#24-rewind) · [Mental Model](#25-mental-model)

---

## 📌 Section 2 TL;DR (2 minutes)

**What you'll learn**: The mental model and critical workflows for Claude Code mastery.

### Key Concepts:
- **Interaction Loop**: Describe → Analyze → Review → Accept/Reject cycle
- **Context Management** 🔴 CRITICAL: Watch `Ctx(u):` — /compact at 70%, /clear at 90%
- **Plan Mode**: Read-only exploration before making changes
- **Rewind**: Undo with Esc×2 or /rewind
- **Mental Model**: Claude = expert pair programmer, not autocomplete

### The One Rule:
> Always check context % before starting complex tasks. High context = degraded quality.

**Read this section if**: You want to avoid the #1 mistake (context overflow)
**Skip if**: You just need quick command reference (go to Section 10)

---

**Reading time**: 20 minutes

**Skill level**: Day 1-3

**Goal**: Understand how Claude Code thinks

## 2.1 The Interaction Loop

Every Claude Code interaction follows this pattern:

```
┌─────────────────────────────────────────────────────────┐
│                    INTERACTION LOOP                     │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   1. DESCRIBE  ──→  You explain what you need           │
│        │                                                │
│        ▼                                                │
│   2. ANALYZE   ──→  Claude explores the codebas         │
│        │                                                 │
│        ▼                                                 │
│   3. PROPOSE   ──→  Claude suggests changes (diff)       │
│        │                                                 │
│        ▼                                                 │
│   4. REVIEW    ──→  You read and evaluate                │
│        │                                                 │
│        ▼                                                 │
│   5. DECIDE    ──→  Accept / Reject / Modify             │
│        │                                                 │
│        ▼                                                 │
│   6. VERIFY    ──→  Run tests, check behavior            │
│        │                                                 │
│        ▼                                                 │
│   7. COMMIT    ──→  Save changes (optional)              │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

### Key Insight

The loop is designed so that **you remain in control**. Claude proposes, you decide.

## 2.2 Context Management

🔴 **This is the most important concept in Claude Code.**

### 📌 Context Management Quick Reference

**The zones**:
- 🟢 0-50%: Work freely
- 🟡 50-75%: Be selective
- 🔴 75-90%: `/compact` now
- ⚫ 90%+: `/clear` required

**When context is high**:
1. `/compact` (saves context, frees space)
2. `/clear` (fresh start, loses history)

**Prevention**: Load only needed files, compact regularly, commit frequently

---

### What is Context?

Context is Claude's "working memory" for your conversation. It includes:
- All messages in the conversation
- Files Claude has read
- Command outputs
- Tool results

### The Context Budget

Claude has a **200,000 token** context window. Think of it like RAM - when it fills up, things slow down or fail.

### Reading the Statusline

The statusline shows your context usage:

```
Claude Code │ Ctx(u): 45% │ Cost: $0.23 │ Session: 1h 23m
```

| Metric | Meaning |
|--------|---------|
| `Ctx(u): 45%` | You've used 45% of context |
| `Cost: $0.23` | API cost so far |
| `Session: 1h 23m` | Time elapsed |

### Context Zones

| Zone | Usage | Action |
|------|-------|--------|
| 🟢 Green | 0-50% | Work freely |
| 🟡 Yellow | 50-75% | Start being selective |
| 🔴 Red | 75-90% | Use `/compact` or `/clear` |
| ⚫ Critical | 90%+ | Must clear or risk errors |

### Context Recovery Strategies

When context gets high:

**Option 1: Compact** (`/compact`)
- Summarizes the conversation
- Preserves key context
- Reduces usage by ~50%

**Option 2: Clear** (`/clear`)
- Starts fresh
- Loses all context
- Use when changing topics

**Option 3: Targeted Approach**
- Be specific in queries
- Avoid "read the entire file"
- Use symbol references: "read the `calculateTotal` function"

### What Consumes Context?

| Action | Context Cost |
|--------|--------------|
| Reading a small file | Low (~500 tokens) |
| Reading a large file | High (~5K+ tokens) |
| Running commands | Medium (~1K tokens) |
| Multi-file search | High (~3K+ tokens) |
| Long conversations | Accumulates |

### Context Depletion Symptoms

Learn to recognize when context is running out:

| Symptom | Severity | Action |
|---------|----------|--------|
| Shorter responses than usual | 🟡 Warning | Continue with caution |
| Forgetting CLAUDE.md instructions | 🟠 Serious | Document state, prepare checkpoint |
| Inconsistencies with earlier conversation | 🔴 Critical | New session needed |
| Errors on code already discussed | 🔴 Critical | New session needed |
| "I can't access that file" (when it was read) | 🔴 Critical | New session immediately |

### Context Inspection

Check your context usage in detail:

```
/context
```

Example output:
```
┌─────────────────────────────────────────────────────────────┐
│ CONTEXT USAGE                                    67% used   │
├─────────────────────────────────────────────────────────────┤
│ System Prompt          ████████░░░░░░░░░░░░░░░░  12,450 tk  │
│ System Tools           ██░░░░░░░░░░░░░░░░░░░░░░   3,200 tk  │
│ MCP Tools (5 servers)  ████████████░░░░░░░░░░░░  18,600 tk  │
│ Conversation           ████████████████████░░░░  89,200 tk  │
├─────────────────────────────────────────────────────────────┤
│ TOTAL                                           123,450 tk  │
│ REMAINING                                        76,550 tk  │
└─────────────────────────────────────────────────────────────┘
```

💡 **The Last 20% Rule**: Reserve ~20% of context for:
- Multi-file operations at end of session
- Last-minute corrections
- Generating summary/checkpoint

### Cost Awareness & Optimization

Claude Code isn't free - you're using API credits. Understanding costs helps optimize usage.

#### Pricing Model (as of January 2026)

Claude Code uses **Claude Sonnet 3.5** by default:

| Model | Input (per 1M tokens) | Output (per 1M tokens) | Context Window |
|-------|----------------------|------------------------|----------------|
| **Sonnet 3.5** | $3.00 | $15.00 | 200K tokens |
| Opus 4 | $15.00 | $75.00 | 200K tokens |
| Haiku 3.5 | $0.80 | $4.00 | 200K tokens |

**Reality check**: A typical 1-hour session costs **$0.10 - $0.50** depending on usage patterns.

#### What Costs the Most?

| Action | Tokens Consumed | Estimated Cost |
|--------|-----------------|----------------|
| Read a 100-line file | ~500 | $0.0015 |
| Read 10 files (1000 lines) | ~5,000 | $0.015 |
| Long conversation (20 messages) | ~30,000 | $0.090 |
| MCP tool call (Serena, Context7) | ~2,000 | $0.006 |
| Running tests (with output) | ~3,000-10,000 | $0.009-$0.030 |
| Code generation (100 lines) | ~2,000 output | $0.030 |

**The expensive operations**:
1. **Reading entire large files** - 2000+ line files add up fast
2. **Multiple MCP server calls** - Each server adds ~2K tokens overhead
3. **Long conversations without `/compact`** - Context accumulates
4. **Repeated trial and error** - Each iteration costs

#### Cost Optimization Strategies

**Strategy 1: Be specific in queries**

```bash
# ❌ Expensive - reads entire file
"Check auth.ts for issues"
# ~5K tokens if file is large

# ✅ Cheaper - targets specific location
"Check the login function in auth.ts:45-60"
# ~500 tokens
```

**Strategy 2: Use `/compact` proactively**

```bash
# Without /compact - conversation grows
Context: 10% → 30% → 50% → 70% → 90%
Cost per message increases as context grows

# With /compact at 70%
Context: 10% → 30% → 50% → 70% → [/compact] → 30% → 50%
Saves 30-40% on subsequent messages
```

**Strategy 3: Choose the right model**

```bash
# Use Haiku for simple tasks (4x cheaper input, 3.75x cheaper output)
claude --model haiku "Fix this typo in README.md"

# Use Sonnet (default) for standard work
claude "Refactor this module"

# Use Opus only for critical/complex tasks
claude --model opus "Design the entire authentication system"
```

**Strategy 4: Limit MCP servers**

```json
// ❌ Expensive - 5 MCP servers loaded
{
  "mcpServers": {
    "serena": {...},
    "context7": {...},
    "sequential": {...},
    "playwright": {...},
    "postgres": {...}
  }
}
// ~10K tokens overhead per session

// ✅ Cheaper - load only what you need
{
  "mcpServers": {
    "serena": {...}  // Only for this project
  }
}
// ~2K tokens overhead
```

**Strategy 5: Batch operations**

```bash
# ❌ Expensive - 5 separate prompts
"Read file1.ts"
"Read file2.ts"
"Read file3.ts"
"Read file4.ts"
"Read file5.ts"

# ✅ Cheaper - single batched request
"Read file1.ts, file2.ts, file3.ts, file4.ts, file5.ts and analyze them together"
# Shared context, single response
```

#### Tracking Costs

**Real-time tracking**:

The status line shows current session cost:

```
Claude Code │ Ctx(u): 45% │ Cost: $0.23 │ Session: 1h 23m
                              ↑ Current session cost
```

**Monthly tracking**:

Check your Anthropic Console for detailed usage:
- https://console.anthropic.com/settings/usage

**Cost budgeting**:

```bash
# Set a mental budget per session
- Quick task (5-10 min): $0.05-$0.10
- Feature work (1-2 hours): $0.20-$0.50
- Deep refactor (half day): $1.00-$2.00

# If you're consistently over budget:
1. Use /compact more often
2. Be more specific in queries
3. Consider using Haiku for simpler tasks
4. Reduce MCP servers
```

#### Cost vs. Value

**Don't over-optimize!**

Spending $0.50 to save 30 minutes is a **60x ROI** if your time is worth $30/hour.

| Time Saved | Cost | Your Hourly Rate | ROI |
|------------|------|------------------|-----|
| 30 min | $0.50 | $30/hr | 30x |
| 1 hour | $1.00 | $50/hr | 50x |
| 2 hours | $2.00 | $75/hr | 75x |

**When to optimize**:
- ✅ You're on a tight budget (student, hobbyist)
- ✅ High-volume usage (>4 hours/day)
- ✅ Team usage (5+ developers)

**When NOT to optimize**:
- ❌ Your time is more expensive than API costs
- ❌ You're spending more time optimizing than the savings
- ❌ Optimization hurts productivity (being too restrictive)

#### Cost-Conscious Workflows

**For solo developers on a budget:**

```markdown
1. Start with Haiku for exploration/planning
2. Switch to Sonnet for implementation
3. Use /compact aggressively (every 50-60% context)
4. Limit to 1-2 MCP servers
5. Be specific in all queries
6. Batch operations when possible

Monthly cost estimate: $5-$15 for 20-30 hours
```

**For professional developers:**

```markdown
1. Use Sonnet as default (optimal balance)
2. Use /compact when needed (70%+ context)
3. Use full MCP setup (productivity matters)
4. Don't micro-optimize queries
5. Use Opus for critical architectural decisions

Monthly cost estimate: $20-$50 for 40-80 hours
```

**For teams:**

```markdown
1. Shared MCP infrastructure (Context7, Serena)
2. Standardized CLAUDE.md to avoid repeated explanations
3. Agent library to avoid rebuilding patterns
4. CI/CD integration for automation
5. Track costs per developer in Anthropic Console

Monthly cost estimate: $50-$200 for 5-10 developers
```

#### Red Flags (Cost Waste Indicators)

| Indicator | Cause | Fix |
|-----------|-------|-----|
| Sessions consistently >$1 | Not using `/compact` | Set reminder at 70% context |
| Cost per message >$0.05 | Context bloat | Start fresh `/clear` |
| >$5/day for hobby project | Over-using or inefficient queries | Review query specificity |
| Haiku failing simple tasks | Using wrong model tier | Use Sonnet for anything non-trivial |

### Context Poisoning (Bleeding)

**Definition**: When information from one task contaminates another.

**Pattern 1: Style Bleeding**
```
Task 1: "Create a blue button"
Claude: [Creates blue button]

Task 2: "Create a form"
Claude: [Creates form... with all buttons blue!]
        ↑ The "blue" bled into the new task

Solution: Use explicit boundaries
"---NEW TASK---
Create a form. Use default design system colors."
```

**Pattern 2: Instruction Contamination**
```
Instruction 1: "Always use arrow functions"
Instruction 2: "Follow project conventions" (which uses function)

Claude: [Paralyzed, alternating between styles]

Solution: Clarify priority
"In case of conflict, project conventions take precedence over my preferences."
```

**Pattern 3: Temporal Confusion**
```
Early session: "auth.ts contains login logic"
... 2h of work ...
You renamed auth.ts to authentication.ts

Claude: "I'll modify auth.ts..."
        ↑ Using outdated info

Solution: Explicit updates
"Note: auth.ts was renamed to authentication.ts"
```

**Context Hygiene Checklist**:
- [ ] New tasks = explicit markdown boundaries
- [ ] Structural changes = inform Claude explicitly
- [ ] Contradictory instructions = clarify priority
- [ ] Long session (>2h) = consider `/clear` or new session
- [ ] Erratic behavior = check with `/context`

### Sanity Check Technique

Verify that Claude has loaded your configuration correctly.

**Simple Method**:

1. Add at the top of CLAUDE.md:
```markdown
# My name is [Your Name]
# Project: [Project Name]
# Stack: [Your tech stack]
```

2. Ask Claude: "What is my name? What project am I working on?"

3. If correct → Configuration loaded properly

**Advanced: Multiple Checkpoints**
```markdown
# === CHECKPOINT 1 === Project: MyApp ===

[... 500 lines of instructions ...]

# === CHECKPOINT 2 === Stack: Next.js ===

[... 500 lines of instructions ...]

# === CHECKPOINT 3 === Owner: [Name] ===
```

Ask "What is checkpoint 2?" to verify Claude read that far.

| Failure Symptom | Probable Cause | Solution |
|-----------------|----------------|----------|
| Doesn't know your name | CLAUDE.md not loaded | Check file location |
| Inconsistent answers | Typo in filename | Must be `CLAUDE.md` (not `clause.md`) |
| Partial knowledge | Context exhausted | `/clear` or new session |

## 2.3 Plan Mode

Plan Mode is Claude Code's "look but don't touch" mode.

### Entering Plan Mode

```
/plan
```

Or ask Claude directly:

```
You: Let's plan this feature before implementing
```

### What Plan Mode Allows

- ✅ Reading files
- ✅ Searching the codebase
- ✅ Analyzing architecture
- ✅ Proposing approaches
- ✅ Writing to a plan file

### What Plan Mode Prevents

- ❌ Editing files
- ❌ Running commands that modify state
- ❌ Creating new files
- ❌ Making commits

### When to Use Plan Mode

| Situation | Use Plan Mode? |
|-----------|----------------|
| Exploring unfamiliar codebase | ✅ Yes |
| Investigating a bug | ✅ Yes |
| Planning a new feature | ✅ Yes |
| Fixing a typo | ❌ No |
| Quick edit to known file | ❌ No |

### Exiting Plan Mode

```
/execute
```

Or Claude will ask: "Ready to implement this plan?"

### Auto Plan Mode

**Concept**: Automatically trigger planning mode before any risky operation.

**Configuration File** (`~/.claude/auto-plan-mode.txt`):
```
Before executing ANY tool (Read, Write, Edit, Bash, Grep, Glob, WebSearch), you MUST:
1. FIRST: Use exit_plan_mode tool to present your plan
2. WAIT: For explicit user approval before proceeding
3. ONLY THEN: Execute the planned actions

Each new user request requires a fresh plan - previous approvals don't carry over.
```

**Launch with Auto Plan Mode**:

*macOS/Linux:*
```bash
# Direct
claude --append-system-prompt "Before executing ANY tool..."

# Via file (recommended)
claude --append-system-prompt "$(cat ~/.claude/auto-plan-mode.txt)"

# Alias in .zshrc/.bashrc
alias claude-safe='claude --append-system-prompt "$(cat ~/.claude/auto-plan-mode.txt)"'
```

*Windows (PowerShell):*
```powershell
# Create the config file at %USERPROFILE%\.claude\auto-plan-mode.txt with the same content

# Direct
claude --append-system-prompt "Before executing ANY tool..."

# Via file (add to $PROFILE)
function claude-safe {
    $planPrompt = Get-Content "$env:USERPROFILE\.claude\auto-plan-mode.txt" -Raw
    claude --append-system-prompt $planPrompt $args
}
```

**Resulting Workflow**:
```
User: "Add an email field to the User model"

Claude (Auto Plan Mode active):
┌─────────────────────────────────────────────────────────────┐
│ 📋 PROPOSED PLAN                                            │
│                                                             │
│ 1. Read schema.prisma to understand current model           │
│ 2. Add field email: String? @unique                         │
│ 3. Generate Prisma migration                                │
│ 4. Update TypeScript types                                  │
│ 5. Add Zod validation in routers                            │
│                                                             │
│ ⚠️ Impact: 3 files modified, 1 migration created            │
│                                                             │
│ Approve this plan? (y/n)                                    │
└─────────────────────────────────────────────────────────────┘

User: "y"

Claude: [Executes the plan]
```

**Result**: 76% fewer tokens with better results because the plan is validated before execution.

### OpusPlan Mode

**Concept**: Use Opus for planning (superior reasoning) and Sonnet for implementation (cost-efficient).

**Why OpusPlan?**
- **Cost optimization**: Opus tokens cost more than Sonnet
- **Best of both worlds**: Opus-quality planning + Sonnet-speed execution
- **Token savings**: Planning is typically shorter than implementation

**Activation**:
```
/model opusplan
```

Or in `~/.claude/settings.json`:
```json
{
  "model": "opusplan"
}
```

**How It Works**:
1. In **Plan Mode** (`/plan` or `Shift+Tab` twice) → Uses **Opus**
2. In **Act Mode** (normal execution) → Uses **Sonnet**
3. Automatic switching based on mode

**Recommended Workflow**:
```
1. /model opusplan        → Enable OpusPlan
2. Shift+Tab × 2          → Enter Plan Mode (Opus)
3. Describe your task     → Get Opus-quality planning
4. Shift+Tab              → Exit to Act Mode (Sonnet)
5. Execute the plan       → Sonnet implements efficiently
```

**Alternative Approach with Subagents**:

You can also control model usage per agent:

```yaml
# .claude/agents/planner.md
---
name: planner
model: opus
tools: Read, Grep, Glob
---
# Strategic Planning Agent
```

```yaml
# .claude/agents/implementer.md
---
name: implementer
model: haiku
tools: Write, Edit, Bash
---
# Fast Implementation Agent
```

**Pro Users Note**: OpusPlan is particularly valuable for Pro subscribers with limited Opus tokens. It lets you leverage Opus reasoning for critical planning while preserving tokens for more sessions.

## 2.4 Rewind

Rewind is Claude Code's undo mechanism.

### Using Rewind

```
/rewind
```

Or:

```
You: Undo the last change
```

### What Rewind Does

- Reverts file changes
- Restores previous state
- Works across multiple files

### Limitations

- Only works on Claude's changes (not manual edits)
- Works within the current session
- Git commits are NOT automatically reverted

### Best Practice: Checkpoint Before Risk

Before a risky operation:

```
You: Let's commit what we have before trying this experimental approach
```

This creates a git checkpoint you can always return to.

## 2.5 Mental Model

Understanding how Claude Code "thinks" makes you more effective.

### Claude's View of Your Project

```
┌─────────────────────────────────────────────────────────┐
│                   YOUR PROJECT                          │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   ┌─────────────┐    ┌─────────────┐    ┌───────────┐   │
│   │   Files     │    │   Git       │    │  Config   │   │
│   │   (.ts,.py) │    │   History   │    │  Files    │   │
│   └─────────────┘    └─────────────┘    └───────────┘   │
│          │                  │                  │        │
│          ▼                  ▼                  ▼        │
│   ┌─────────────────────────────────────────────────┐   │
│   │              Claude's Understanding             │   │
│   │   - File structure & relationships              │   │
│   │   - Code patterns & conventions                 │   │
│   │   - Recent changes (from git)                   │   │
│   │   - Project rules (from CLAUDE.md)              │   │
│   └─────────────────────────────────────────────────┘   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### What Claude Knows

1. **File Structure**: Claude can navigate and search your files
2. **Code Content**: Claude can read and understand code
3. **Git State**: Claude sees branches, commits, changes
4. **Project Rules**: Claude reads CLAUDE.md for conventions

### What Claude Doesn't Know

1. **Runtime State**: Claude can't see running processes
2. **External Services**: Claude can't access your databases directly
3. **Your Intent**: Claude needs clear instructions
4. **Hidden Files**: Claude respects .gitignore by default

### Communicating Effectively

**Good prompt**:
```
The login function in src/auth/login.ts isn't validating email addresses properly.
Plus signs should be allowed but they're being rejected.
```

**Weak prompt**:
```
Login is broken
```

The more context you provide, the better Claude can help.

---

# 3. Memory & Settings

_Quick jump:_ [Memory Files (CLAUDE.md)](#31-memory-files-claudemd) · [.claude/ Folder Structure](#32-the-claude-folder-structure) · [Settings & Permissions](#33-settings--permissions) · [Precedence Rules](#34-precedence-rules)

---

## 📌 Section 3 TL;DR (90 seconds)

**The Memory Hierarchy** (most important concept):

```
~/.claude/CLAUDE.md          → Global (all projects)
/project/CLAUDE.md           → Project (team, committed to git)
/project/.claude/            → Local overrides (personal, not committed)
```

**Rule**: More specific beats more general (local > project > global)

**Quick Actions**:
- Team instructions → Create `/project/CLAUDE.md`
- Personal preferences → Use `/project/.claude/settings.local.json`
- Global shortcuts → Add to `~/.claude/CLAUDE.md`

**Read this section if**: You work on multiple projects or in a team
**Skip if**: Single project, solo developer (can configure as you go)

---

**Reading time**: 15 minutes
**Skill level**: Week 1
**Goal**: Customize Claude Code for your project

## 3.1 Memory Files (CLAUDE.md)

CLAUDE.md files are persistent instructions that Claude reads at the start of every session. They're called "memory" files because they give Claude long-term memory of your preferences, conventions, and project context — persisting across sessions rather than being forgotten after each conversation.

### Three Levels of Memory

```
┌─────────────────────────────────────────────────────────┐
│                    MEMORY HIERARCHY                     │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   ~/.claude/CLAUDE.md          (Global - All projects)  │
│        │                                                │
│        ▼                                                │
│   /project/CLAUDE.md           (Project - This repo)    │
│        │                                                │
│        ▼                                                │
│   /project/.claude/CLAUDE.md   (Local - Personal prefs) │
│                                                         │
│   Priority: Local > Project > Global                    │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Level 1: Global (~/.claude/CLAUDE.md)

Personal preferences that apply to all your projects:

```markdown
# Global Claude Code Settings

## Communication Style
- Be concise in responses
- Use code examples over explanations
- Ask clarifying questions before major changes

## Preferred Tools
- Use TypeScript over JavaScript
- Prefer pnpm over npm
- Use Prettier for formatting

## Safety Rules
- Always run tests before committing
- Never force push to main
- Check for secrets before committing
```

### Level 2: Project (/project/CLAUDE.md)

Shared team conventions checked into version control:

```markdown
# Project: MyApp

## Tech Stack
- Next.js 14 with App Router
- TypeScript 5.3
- PostgreSQL with Prisma
- TailwindCSS

## Code Conventions
- Use functional components
- Use `const` arrow functions
- File naming: kebab-case (my-component.tsx)

## Architecture
- API routes in /app/api
- Components in /components
- Database queries in /lib/db

## Commands
- `pnpm dev` - Start development
- `pnpm test` - Run tests
- `pnpm lint` - Check linting
```

### Level 3: Local (/project/.claude/CLAUDE.md)

Personal overrides not committed to git (add to .gitignore):

```markdown
# My Local Preferences

## Overrides
- Skip pre-commit hooks for quick iterations
- Use verbose logging during debugging
```

### CLAUDE.md Best Practices

| Do | Don't |
|-----|-------|
| Keep it concise | Write essays |
| Include examples | Be vague |
| Update when conventions change | Let it go stale |
| Reference external docs | Duplicate documentation |

### Single Source of Truth Pattern

When using multiple AI tools (Claude Code, CodeRabbit, SonarQube, Copilot...), they can conflict if each has different conventions. The solution: **one source of truth for all tools**.

**Recommended structure**:

```
/docs/conventions/
├── coding-standards.md    # Style, naming, patterns
├── architecture.md        # System design decisions
├── testing.md             # Test conventions
└── anti-patterns.md       # What to avoid
```

**Then reference from everywhere**:

```markdown
# In CLAUDE.md
@docs/conventions/coding-standards.md
@docs/conventions/architecture.md
```

```yaml
# In .coderabbit.yml
knowledge_base:
  code_guidelines:
    filePatterns:
      - "docs/conventions/*.md"
```

**Why this matters**: Without a single source, your local agent might approve code that CodeRabbit then flags — wasting cycles. With aligned conventions, all tools enforce the same standards.

> Inspired by [Nick Tune's Coding Agent Development Workflows](https://medium.com/nick-tune-tech-strategy-blog/coding-agent-development-workflows-af52e6f912aa)

## 3.2 The .claude/ Folder Structure

The `.claude/` folder is your project's Claude Code directory for memory, settings, and extensions.

### Full Structure

```
.claude/
├── CLAUDE.md              # Local instructions (gitignored)
├── settings.json          # Hook configuration
├── settings.local.json    # Personal permissions (gitignored)
├── agents/                # Custom agent definitions
│   ├── README.md
│   ├── backend-architect.md
│   ├── code-reviewer.md
│   └── ...
├── commands/              # Custom slash commands
│   ├── tech/
│   │   ├── commit.md
│   │   └── pr.md
│   ├── product/
│   │   └── problem-framer.md
│   └── support/
│       └── support-assistant.md
├── hooks/                 # Event-driven scripts
│   ├── README.md
│   ├── auto-format.sh
│   └── git-context.sh
├── rules/                 # Auto-loaded conventions
│   ├── code-conventions.md
│   └── git-workflow.md
├── skills/                # Knowledge modules
│   ├── README.md
│   └── security-guardian/
│       ├── SKILL.md
│       └── checklists/
└── plans/                 # Saved plan files
```

### What Goes Where

| Content Type | Location | Shared? |
|--------------|----------|---------|
| Team conventions | `rules/` | ✅ Commit |
| Reusable agents | `agents/` | ✅ Commit |
| Team commands | `commands/` | ✅ Commit |
| Automation hooks | `hooks/` | ✅ Commit |
| Knowledge modules | `skills/` | ✅ Commit |
| Personal preferences | `CLAUDE.md` | ❌ Gitignore |
| Personal permissions | `settings.local.json` | ❌ Gitignore |

## 3.3 Settings & Permissions

### settings.json (Team Configuration)

This file configures hooks and is committed to the repo:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash|Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/hooks/security-check.sh",
            "timeout": 5000
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/hooks/auto-format.sh"
          }
        ]
      }
    ],
    "UserPromptSubmit": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/hooks/git-context.sh"
          }
        ]
      }
    ]
  }
}
```

### settings.local.json (Personal Permissions)

Personal permission overrides (gitignored):

```json
{
  "permissions": {
    "allow": [
      "Bash(git *)",
      "Bash(pnpm *)",
      "Bash(npm test)",
      "Edit",
      "Write",
      "WebSearch"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(sudo *)"
    ],
    "ask": [
      "Bash(npm publish)",
      "Bash(git push --force)"
    ]
  }
}
```

### Permission Patterns

| Pattern | Matches |
|---------|---------|
| `Bash(git *)` | Any git command |
| `Bash(pnpm *)` | Any pnpm command |
| `Edit` | All file edits |
| `Write` | All file writes |
| `WebSearch` | Web search capability |
| `mcp__serena__*` | All Serena MCP tools |

### Permission Behavior

| Category | Behavior |
|----------|----------|
| `allow` | Auto-approve without asking |
| `deny` | Block completely |
| `ask` | Prompt for confirmation |
| (default) | Use default permission mode |

### allowedTools Configuration (Alternative)

For granular control, use `~/.claude.json`:

```json
{
  "allowedTools": [
    "Read(*)",
    "Grep(*)",
    "Glob(*)",
    "WebFetch(*)",
    "TodoRead",
    "TodoWrite",
    "Task(*)",
    "Bash(git status:*)",
    "Bash(git diff:*)",
    "Bash(git log:*)",
    "Bash(pnpm typecheck:*)",
    "Bash(pnpm lint:*)",
    "Bash(pnpm test:*)"
  ]
}
```

**Pattern Logic**:
| Pattern | Meaning | Example |
|---------|---------|---------|
| `Read(*)` | All reads | Any file |
| `Bash(git status:*)` | Specific command | `git status` allowed |
| `Bash(pnpm *:*)` | Command prefix | `pnpm test`, `pnpm build` |
| `Edit(*)` | All edits | ⚠️ Dangerous |

**Progressive Permission Levels**:

**Level 1 - Beginner (very restrictive)**:
```json
{
  "allowedTools": ["Read(*)", "Grep(*)", "Glob(*)"]
}
```

**Level 2 - Intermediate**:
```json
{
  "allowedTools": [
    "Read(*)", "Grep(*)", "Glob(*)",
    "Bash(git:*)", "Bash(pnpm:*)",
    "TodoRead", "TodoWrite"
  ]
}
```

**Level 3 - Advanced**:
```json
{
  "allowedTools": [
    "Read(*)", "Grep(*)", "Glob(*)", "WebFetch(*)",
    "Edit(*)", "Write(*)",
    "Bash(git:*)", "Bash(pnpm:*)", "Bash(npm:*)",
    "Task(*)", "TodoRead", "TodoWrite"
  ]
}
```

⚠️ **Never use `--dangerously-skip-permissions`**

Horror stories from r/ClaudeAI include:
- `rm -rf node_modules` followed by `rm -rf .` (path error)
- `git push --force` to main unintentionally
- `DROP TABLE users` in a poorly generated migration
- Deletion of `.env` files with credentials

**Always prefer granular `allowedTools` over disabling permissions entirely.**

### Dynamic Memory (Profile Switching)

**Concept**: Temporarily modify CLAUDE.md for specific tasks, then restore.

**Technique 1: Git Stash**
```bash
# Before modification
git stash push -m "CLAUDE.md original" CLAUDE.md

# Claude modifies CLAUDE.md for specific task
# ... work ...

# After task
git stash pop
```

**Technique 2: Profile Library**
```
~/.claude/profiles/
├── default.md          # General config
├── security-audit.md   # For security audits
├── refactoring.md      # For major refactoring
├── documentation.md    # For writing docs
└── debugging.md        # For debug sessions
```

**Profile Switch Script**:
```bash
#!/bin/bash
# ~/.local/bin/claude-profile

PROFILE=$1
cp ~/.claude/profiles/${PROFILE}.md ./CLAUDE.md
echo "Switched to profile: $PROFILE"
```

Usage:
```bash
claude-profile security-audit
claude  # Launches with security profile
```

**Technique 3: Parallel Instances**
```bash
# Terminal 1: Main project
cd ~/projects/myapp
claude  # Loads myapp's CLAUDE.md

# Terminal 2: Worktree for isolated feature
cd ~/projects/myapp-feature-x
# Different CLAUDE.md, isolated context
claude
```

## 3.4 Precedence Rules

When memory files or settings conflict, Claude Code uses this precedence:

### Settings Precedence

```
Highest Priority
       │
       ▼
┌──────────────────────────────────┐
│  settings.local.json             │  Personal overrides
└──────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────┐
│  settings.json                   │  Project settings
└──────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────┐
│  ~/.claude/settings.json         │  Global defaults
└──────────────────────────────────┘
       │
       ▼
Lowest Priority
```

### CLAUDE.md Precedence

```
Highest Priority
       │
       ▼
┌──────────────────────────────────┐
│  .claude/CLAUDE.md               │  Local (personal)
└──────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────┐
│  /project/CLAUDE.md              │  Project (team)
└──────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────┐
│  ~/.claude/CLAUDE.md             │  Global (personal)
└──────────────────────────────────┘
       │
       ▼
Lowest Priority
```

### Rules Auto-Loading

Files in `.claude/rules/` are automatically loaded and combined:

```
.claude/rules/
├── code-conventions.md    ──┐
├── git-workflow.md        ──┼──→  All loaded automatically
└── architecture.md        ──┘
```

---

# 4. Agents

_Quick jump:_ [What Are Agents](#41-what-are-agents) · [Creating Custom Agents](#42-creating-custom-agents) · [Agent Template](#43-agent-template) · [Best Practices](#44-best-practices) · [Agent Examples](#45-agent-examples)

---

## 📌 Section 4 TL;DR (60 seconds)

**What are Agents**: Specialized AI personas for specific tasks (think "expert consultants")

**When to create one**:
- ✅ Task repeats often (security reviews, API design)
- ✅ Requires specialized knowledge domain
- ✅ Needs consistent behavior/tone
- ❌ One-off tasks (just ask Claude directly)

**Quick Start**:
1. Create `.claude/agents/my-agent.md`
2. Add YAML frontmatter (name, description, tools, model)
3. Write instructions
4. Use: `@my-agent "task description"`

**Popular agent types**: Security auditor, Test generator, Code reviewer, API designer

**Read this section if**: You have repeating tasks or need domain expertise
**Skip if**: All your tasks are one-off exploratory work

---

**Reading time**: 20 minutes
**Skill level**: Week 1-2
**Goal**: Create specialized AI assistants

## 4.1 What Are Agents

Agents are specialized sub-processes that Claude can delegate tasks to.

### Why Use Agents?

| Without Agents | With Agents |
|----------------|-------------|
| One Claude doing everything | Specialized experts for each domain |
| Context gets cluttered | Each agent has focused context |
| Generic responses | Domain-specific expertise |
| Manual tool selection | Pre-configured tool access |

### Agent vs Direct Prompt

```
Direct Prompt:
You: Review this code for security issues, focusing on OWASP Top 10,
     checking for SQL injection, XSS, CSRF, and authentication vulnerabilities...

With Agent:
You: Use the security-reviewer agent to audit this code
```

The agent encapsulates all that expertise.

### Built-in vs Custom Agents

| Type | Source | Example |
|------|--------|---------|
| Built-in | Claude Code default | Explore, Plan |
| Custom | Your `.claude/agents/` | Backend architect, Code reviewer |

## 4.2 Creating Custom Agents

Agents are markdown files in `.claude/agents/` with YAML frontmatter.

### Agent File Structure

```markdown
---
name: agent-name
description: Clear activation trigger (50-100 chars)
model: sonnet
tools: Read, Write, Edit, Bash, Grep, Glob
skills:
  - skill-name
disallowedTools:
  - WebSearch
---

[Markdown instructions for the agent]
```

### Frontmatter Fields

| Field | Required | Description |
|-------|----------|-------------|
| `name` | ✅ | Kebab-case identifier |
| `description` | ✅ | When to activate this agent |
| `model` | ❌ | `sonnet` (default), `opus`, or `haiku` |
| `tools` | ❌ | Allowed tools (comma-separated) |
| `skills` | ❌ | Skills to inherit |
| `disallowedTools` | ❌ | Tools to block |

### Model Selection

| Model | Best For | Speed | Cost |
|-------|----------|-------|------|
| `haiku` | Quick tasks, simple changes | Fast | Low |
| `sonnet` | Most tasks (default) | Balanced | Medium |
| `opus` | Complex reasoning, architecture | Slow | High |

## 4.3 Agent Template

Copy this template to create your own agent:

```markdown
---
name: your-agent-name
description: Use this agent when [specific trigger description]
model: sonnet
tools: Read, Write, Edit, Bash, Grep, Glob
skills: []
---

# Your Agent Name

## Role Definition

You are an expert in [domain]. Your responsibilities include:
- [Responsibility 1]
- [Responsibility 2]
- [Responsibility 3]

## Activation Triggers

Use this agent when:
- [Trigger 1]
- [Trigger 2]
- [Trigger 3]

## Methodology

When given a task, you should:
1. [Step 1]
2. [Step 2]
3. [Step 3]
4. [Step 4]

## Output Format

Your deliverables should include:
- [Output 1]
- [Output 2]

## Constraints

- [Constraint 1]
- [Constraint 2]

## Examples

### Example 1: [Scenario Name]

**User**: [Example prompt]

**Your approach**:
1. [What you do first]
2. [What you do next]
3. [Final output]
```

## 4.4 Best Practices

### Do's and Don'ts

| ✅ Do | ❌ Don't |
|-------|----------|
| Make agents specialists | Create generalist agents |
| Define clear triggers | Use vague descriptions |
| Include concrete examples | Leave activation ambiguous |
| Limit tool access | Give all tools to all agents |
| Compose via skills | Duplicate expertise |

### Specialization Over Generalization

**Good**: An agent for each concern
```
backend-architect    → API design, database, performance
security-reviewer    → OWASP, auth, encryption
test-engineer        → Test strategy, coverage, TDD
```

**Bad**: One agent for everything
```
full-stack-expert    → Does everything (poorly)
```

### Explicit Activation Triggers

**Good description**:
```yaml
description: Use when designing APIs, reviewing database schemas, or optimizing backend performance
```

**Bad description**:
```yaml
description: Backend stuff
```

### Skill Composition

Instead of duplicating knowledge:

```yaml
# security-reviewer.md
skills:
  - security-guardian  # Inherits OWASP knowledge
```

## 4.5 Agent Examples

### Example 1: Code Reviewer Agent

```markdown
---
name: code-reviewer
description: Use for code quality reviews, security audits, and performance analysis
model: sonnet
tools: Read, Grep, Glob
skills:
  - security-guardian
---

# Code Reviewer

## Role Definition

You are a senior code reviewer with expertise in:
- Code quality and maintainability
- Security best practices (OWASP Top 10)
- Performance optimization
- Test coverage analysis

## Activation Triggers

Use this agent when:
- Completing a feature before PR
- Reviewing someone else's code
- Auditing security-sensitive code
- Analyzing performance bottlenecks

## Methodology

1. **Understand Context**: Read the code and understand its purpose
2. **Check Quality**: Evaluate readability, maintainability, DRY principles
3. **Security Scan**: Look for OWASP Top 10 vulnerabilities
4. **Performance Review**: Identify potential bottlenecks
5. **Provide Feedback**: Structured report with severity levels

## Output Format

### Code Review Report

**Summary**: [1-2 sentence overview]

**Critical Issues** (Must Fix):
- [Issue with file:line reference]

**Warnings** (Should Fix):
- [Issue with file:line reference]

**Suggestions** (Nice to Have):
- [Improvement opportunity]

**Positive Notes**:
- [What was done well]
```

### Example 2: Debugger Agent

```markdown
---
name: debugger
description: Use when encountering errors, test failures, or unexpected behavior
model: sonnet
tools: Read, Bash, Grep, Glob
---

# Debugger

## Role Definition

You are a systematic debugger who:
- Investigates root causes, not symptoms
- Uses evidence-based debugging
- Never guesses - always verifies

## Methodology

1. **Reproduce**: Confirm the issue exists
2. **Isolate**: Narrow down to smallest reproducible case
3. **Analyze**: Read code, check logs, trace execution
4. **Hypothesize**: Form theories about the cause
5. **Test**: Verify hypothesis with minimal changes
6. **Fix**: Implement the solution
7. **Verify**: Confirm fix works and doesn't break other things

## Output Format

### Debug Report

**Issue**: [Description]
**Root Cause**: [What's actually wrong]
**Evidence**: [How you know]
**Fix**: [What to change]
**Verification**: [How to confirm it works]
```

### Example 3: Backend Architect Agent

```markdown
---
name: backend-architect
description: Use for API design, database optimization, and system architecture decisions
model: opus
tools: Read, Write, Edit, Bash, Grep
skills:
  - backend-patterns
---

# Backend Architect

## Role Definition

You are a senior backend architect specializing in:
- API design (REST, GraphQL, tRPC)
- Database modeling and optimization
- System scalability
- Clean architecture patterns

## Activation Triggers

Use this agent when:
- Designing new API endpoints
- Optimizing database queries
- Planning system architecture
- Refactoring backend code

## Methodology

1. **Requirements Analysis**: Understand the business need
2. **Architecture Review**: Check current system state
3. **Design Options**: Propose 2-3 approaches with trade-offs
4. **Recommendation**: Suggest best approach with rationale
5. **Implementation Plan**: Break down into actionable steps

## Constraints

- Follow existing project patterns
- Prioritize backward compatibility
- Consider performance implications
- Document architectural decisions
```

## 4.6 Advanced Agent Patterns

### Tool SEO - Optimizing Agent Descriptions

The `description` field determines when Claude auto-activates your agent. Optimize it like SEO:

```yaml
# ❌ Bad description
description: Reviews code

# ✅ Good description (Tool SEO)
description: |
  Security code reviewer - use PROACTIVELY when:
  - Reviewing authentication/authorization code
  - Analyzing API endpoints
  - Checking input validation
  - Auditing data handling
  Triggers: security, auth, vulnerability, OWASP, injection
```

**Tool SEO Techniques**:
1. **"use PROACTIVELY"**: Encourages automatic activation
2. **Explicit triggers**: Keywords that trigger the agent
3. **Listed contexts**: When the agent is relevant
4. **Short nicknames**: `sec-1`, `perf-a`, `doc-gen`

### Agent Weight Classification

| Category | Tokens | Init Time | Optimal Use |
|----------|--------|-----------|-------------|
| **Lightweight** | <3K | <1s | Frequent tasks, workers |
| **Medium** | 10-15K | 2-3s | Analysis, reviews |
| **Heavy** | 25K+ | 5-10s | Architecture, full audits |

**Golden Rule**: A lightweight agent used 100x > A heavy agent used 10x

### The 7-Parallel-Task Method

Launch 7 specialized sub-agents in parallel for complete features:

```
┌─────────────────────────────────────────────────────────────┐
│   PARALLEL FEATURE IMPLEMENTATION                           │
│                                                             │
│   Task 1: Components     → Create React components          │
│   Task 2: Styles         → Generate Tailwind styles         │
│   Task 3: Tests          → Write unit tests                 │
│   Task 4: Types          → Define TypeScript types          │
│   Task 5: Hooks          → Create custom hooks              │
│   Task 6: Integration    → Connect with API/state           │
│   Task 7: Config         → Update configurations            │
│                                                             │
│   All in parallel → Final consolidation                     │
└─────────────────────────────────────────────────────────────┘
```

**Example Prompt**:
```
Implement the "User Profile" feature using 7 parallel sub-agents:

1. COMPONENTS: Create UserProfile.tsx, UserAvatar.tsx, UserStats.tsx
2. STYLES: Define Tailwind classes in a styles file
3. TESTS: Write tests for each component
4. TYPES: Create types in types/user-profile.ts
5. HOOKS: Create useUserProfile and useUserStats hooks
6. INTEGRATION: Connect with existing tRPC router
7. CONFIG: Update exports and routing

Launch all agents in parallel.
```

### Split Role Sub-Agents

**Concept**: Multi-perspective analysis in parallel.

**Process**:
```
┌─────────────────────────────────────────────────────────────┐
│   SPLIT ROLE ANALYSIS                                       │
│                                                             │
│   Step 1: Setup                                             │
│   └─ Activate Plan Mode + ultrathink                        │
│                                                             │
│   Step 2: Role Suggestion                                   │
│   └─ "What expert roles would analyze this code?"           │
│      Claude suggests: Security, Performance, UX, etc.       │
│                                                             │
│   Step 3: Selection                                         │
│   └─ "Use: Security Expert, Senior Dev, Code Reviewer"      │
│                                                             │
│   Step 4: Parallel Analysis                                 │
│   ├─ Security Agent: [Vulnerability analysis]               │
│   ├─ Senior Agent: [Architecture analysis]                  │
│   └─ Reviewer Agent: [Readability analysis]                 │
│                                                             │
│   Step 5: Consolidation                                     │
│   └─ Synthesize 3 reports into recommendations              │
└─────────────────────────────────────────────────────────────┘
```

**Code Review Prompt**:
```
Analyze this PR with the following perspectives:
1. Senior Engineer: Architecture and patterns
2. Security Expert: Vulnerabilities and risks
3. Performance Engineer: Bottlenecks and optimizations
4. Junior Dev: Readability and documentation
5. QA Engineer: Testability and edge cases
```

**UX Review Prompt**:
```
Evaluate this interface with perspectives:
1. Designer: Visual consistency and design system
2. New User: Discoverability ease
3. Power User: Efficiency and shortcuts
4. Accessibility Expert: WCAG compliance
5. Mobile User: Responsive and touch
```

### Parallelization Decision Matrix

```
┌─────────────────────────────────────────────────────────────┐
│   PARALLELIZABLE?                                           │
│                                                             │
│              Non-destructive          Destructive           │
│              (read-only)              (write)               │
│                                                             │
│   Independent   ✅ PARALLEL           ⚠️ SEQUENTIAL        │
│                 Max efficiency         Plan Mode first      │
│                                                             │
│   Dependent     ⚠️ SEQUENTIAL         ❌ CAREFUL            │
│                 Order matters          Risk of conflicts    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**✅ Perfectly parallelizable**:
```
"Search 8 different GitHub repos for best practices on X"
"Analyze these 5 files for vulnerabilities (without modifying)"
"Compare 4 libraries and produce a comparative report"
```

**⚠️ Sequential recommended**:
```
"Refactor these 3 files (they depend on each other)"
"Migrate DB schema then update models then update routers"
```

**❌ Needs extra care**:
```
"Modify these 10 files in parallel"
→ Risk: conflicts if files share imports/exports
→ Solution: Plan Mode → Identify dependencies → Sequence if needed
```

### Multi-Agent Orchestration Pattern

```
┌─────────────────────────────────────────────────────────────┐
│   ORCHESTRATION PATTERN                                     │
│                                                             │
│                    ┌──────────────┐                         │
│                    │  Sonnet 4.5  │                         │
│                    │ Orchestrator │                         │
│                    └──────┬───────┘                         │
│                           │                                 │
│              ┌────────────┼────────────┐                    │
│              │            │            │                    │
│              ▼            ▼            ▼                    │
│        ┌─────────┐  ┌─────────┐  ┌─────────┐                │
│        │ Haiku   │  │ Haiku   │  │ Haiku   │                │
│        │ Worker1 │  │ Worker2 │  │ Worker3 │                │
│        └────┬────┘  └────┬────┘  └────┬────┘                │
│              │            │            │                    │
│              └────────────┼────────────┘                    │
│                           │                                 │
│                           ▼                                 │
│                    ┌──────────────┐                         │
│                    │  Sonnet 4.5  │                         │
│                    │  Validator   │                         │
│                    └──────────────┘                         │
│                                                             │
│   Cost: 2-2.5x cheaper than Opus everywhere                 │
│   Quality: Equivalent for 90% of tasks                      │
└─────────────────────────────────────────────────────────────┘
```

### Tactical Model Selection Matrix

| Task | Model | Justification |
|------|-------|---------------|
| Read and summarize a file | Haiku | Simple, fast |
| Write a standard component | Sonnet | Good balance |
| Debug complex issue | Sonnet + ultrathink | Depth needed |
| System architecture | Opus | Maximum reasoning |
| Critical security review | Opus | High stakes |
| Generate tests | Haiku | Repetitive pattern |
| Refactor 50 files | Sonnet orchestrate + Haiku workers | Optimized cost |

**Cost Optimization Example**:
```
Scenario: Refactoring 100 files

❌ Naive approach:
- Opus for everything
- Cost: ~$50-100
- Time: 2-3h

✅ Optimized approach:
- Sonnet: Analysis and plan (1x)
- Haiku: Parallel workers (100x)
- Sonnet: Final validation (1x)
- Cost: ~$5-15
- Time: 1h (parallelized)

Savings: 80-90%
```

---

# 5. Skills

_Quick jump:_ [Understanding Skills](#51-understanding-skills) · [Creating Skills](#52-creating-skills) · [Skill Template](#53-skill-template) · [Skill Examples](#54-skill-examples)

---

**Reading time**: 15 minutes
**Skill level**: Week 2
**Goal**: Create reusable knowledge modules

## 5.1 Understanding Skills

Skills are knowledge packages that agents can inherit.

### Skills vs Agents vs Commands

| Concept | Purpose | Invocation |
|---------|---------|------------|
| **Agent** | Specialized role | Task tool delegation |
| **Skill** | Knowledge module | Inherited by agents |
| **Command** | Process workflow | Slash command |

### Why Skills?

Without skills:
```
Agent A: Has security knowledge (duplicated)
Agent B: Has security knowledge (duplicated)
Agent C: Has security knowledge (duplicated)
```

With skills:
```
security-guardian skill: Single source of security knowledge
Agent A: inherits security-guardian
Agent B: inherits security-guardian
Agent C: inherits security-guardian
```

### What Makes a Good Skill?

| Good Skill | Bad Skill |
|------------|-----------|
| Reusable across agents | Single-agent specific |
| Domain-focused | Too broad |
| Contains reference material | Just instructions |
| Includes checklists | Missing verification |

## 5.2 Creating Skills

Skills live in `.claude/skills/{skill-name}/` directories.

### Skill Folder Structure

```
skill-name/
├── SKILL.md          # Required - Main instructions
├── reference.md      # Optional - Detailed documentation
├── checklists/       # Optional - Verification lists
│   ├── security.md
│   └── performance.md
├── examples/         # Optional - Code patterns
│   ├── good-example.ts
│   └── bad-example.ts
└── scripts/          # Optional - Helper scripts
    └── audit.sh
```

### SKILL.md Frontmatter

```yaml
---
name: skill-name
description: Short description for activation (100 chars)
allowed-tools: Read, Grep, Bash
context: fork
agent: specialist
---
```

| Field | Description |
|-------|-------------|
| `name` | Kebab-case identifier |
| `description` | Activation trigger |
| `allowed-tools` | Tools this skill can use |
| `context` | `fork` (isolated) or `inherit` (shared) |
| `agent` | `specialist` (domain) or `general` (broad) |

## 5.3 Skill Template

```markdown
---
name: your-skill-name
description: Expert guidance for [domain] problems
allowed-tools: Read, Grep, Bash
context: fork
agent: specialist
---

# Your Skill Name

## Expertise Areas

This skill provides knowledge in:
- [Area 1]
- [Area 2]
- [Area 3]

## When to Apply

Use this skill when:
- [Situation 1]
- [Situation 2]

## Methodology

When activated, follow this approach:
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Key Concepts

### Concept 1: [Name]
[Explanation]

### Concept 2: [Name]
[Explanation]

## Checklists

### Pre-Implementation Checklist
- [ ] [Check 1]
- [ ] [Check 2]
- [ ] [Check 3]

### Post-Implementation Checklist
- [ ] [Verification 1]
- [ ] [Verification 2]

## Examples

### Good Pattern
```[language]
// Good example
```

### Anti-Pattern
```[language]
// Bad example - don't do this
```

## Reference Material

See `reference.md` for detailed documentation.

## 5.4 Skill Examples

### Example 1: Security Guardian Skill

```markdown
---
name: security-guardian
description: Security expertise for OWASP Top 10, auth, and data protection
allowed-tools: Read, Grep, Bash
context: fork
agent: specialist
---

# Security Guardian

## Expertise Areas

- OWASP Top 10 vulnerabilities
- Authentication & Authorization
- Data protection & encryption
- API security
- Secrets management

## OWASP Top 10 Checklist

### A01: Broken Access Control
- [ ] Check authorization on every endpoint
- [ ] Verify row-level permissions
- [ ] Test IDOR vulnerabilities
- [ ] Check for privilege escalation

### A02: Cryptographic Failures
- [ ] Check for hardcoded secrets
- [ ] Verify TLS configuration
- [ ] Review password hashing (bcrypt/argon2)
- [ ] Check data encryption at rest

### A03: Injection
- [ ] Review SQL queries (parameterized?)
- [ ] Check NoSQL operations
- [ ] Review command execution
- [ ] Check XSS vectors

[... more checklists ...]

## Authentication Patterns

### Good: Secure Password Hashing
```typescript
import { hash, verify } from 'argon2';

const hashedPassword = await hash(password);
const isValid = await verify(hashedPassword, inputPassword);
```

### Bad: Insecure Hashing
```typescript
// DON'T DO THIS
const hashed = md5(password);
const hashed = sha1(password);
```

## Secrets Management

### Never Commit Secrets
```
# .gitignore
.env
.env.local
*.pem
*credentials*
```

### Use Environment Variables
```typescript
// Good
const apiKey = process.env.API_KEY;

// Bad
const apiKey = "sk-1234567890abcdef";
```


### Example 2: TDD Skill

```markdown
---
name: tdd
description: Test-Driven Development methodology and patterns
allowed-tools: Read, Write, Bash
context: inherit
agent: specialist
---

# TDD (Test-Driven Development)

## The TDD Cycle

┌─────────────────────────────────────────────────────────┐
│                    RED → GREEN → REFACTOR               │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   1. RED     ──→  Write a failing test                  │
│        │                                                │
│        ▼                                                │
│   2. GREEN   ──→  Write minimal code to pass            │
│        │                                                │
│        ▼                                                │
│   3. REFACTOR ──→  Improve code, keep tests green       │
│        │                                                │
│        └────────────→  Repeat                           │
│                                                         │
└─────────────────────────────────────────────────────────┘


## Methodology

### Step 1: RED (Write Failing Test)

Write a test for the behavior you want BEFORE writing any code.

```typescript
// user.test.ts
describe('User', () => {
  it('should validate email format', () => {
    expect(isValidEmail('test@example.com')).toBe(true);
    expect(isValidEmail('invalid')).toBe(false);
  });
});
```

Run: `pnpm test` → Should FAIL (function doesn't exist)

### Step 2: GREEN (Minimal Implementation)

Write the MINIMUM code to make the test pass.

```typescript
// user.ts
export const isValidEmail = (email: string): boolean => {
  return email.includes('@');
};
```

Run: `pnpm test` → Should PASS

### Step 3: REFACTOR (Improve)

Now improve the implementation while keeping tests green.

```typescript
// user.ts (improved)
export const isValidEmail = (email: string): boolean => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
};
```

Run: `pnpm test` → Should still PASS

## Test Structure: AAA Pattern

```typescript
it('should calculate order total', () => {
  // Arrange - Set up test data
  const items = [
    { price: 10, quantity: 2 },
    { price: 5, quantity: 3 }
  ];

  // Act - Execute the code
  const total = calculateTotal(items);

  // Assert - Verify the result
  expect(total).toBe(35);
});
```

## 5.5 Community Skill Repositories

### Cybersecurity Skills Repository

The Claude Code community has created specialized skill collections for specific domains. One notable collection focuses on cybersecurity and penetration testing.

**Repository**: [zebbern/claude-code-guide](https://github.com/zebbern/claude-code-guide)
**Skills Directory**: [/skills](https://github.com/zebbern/claude-code-guide/tree/main/skills)

This repository contains **29 cybersecurity-focused skills** covering penetration testing, vulnerability assessment, and security analysis:

**Penetration Testing & Exploitation**
- SQL Injection Testing
- XSS (Cross-Site Scripting) Testing
- Broken Authentication Testing
- IDOR (Insecure Direct Object Reference) Testing
- File Path Traversal Testing
- Active Directory Attacks
- Privilege Escalation (Linux & Windows)

**Security Tools & Frameworks**
- Metasploit Framework
- Burp Suite Testing
- SQLMap Database Pentesting
- Wireshark Analysis
- Shodan Reconnaissance
- Scanning Tools

**Infrastructure Security**
- AWS Penetration Testing
- Cloud Penetration Testing
- Network 101
- SSH Penetration Testing
- SMTP Penetration Testing

**Application Security**
- API Fuzzing & Bug Bounty
- WordPress Penetration Testing
- HTML Injection Testing
- Top Web Vulnerabilities

**Methodologies & References**
- Ethical Hacking Methodology
- Pentest Checklist
- Pentest Commands
- Red Team Tools
- Linux Shell Scripting

#### Usage Example

To use these skills in your Claude Code setup:

1. Clone or download specific skills from the repository
2. Copy the skill folder to your `.claude/skills/` directory
3. Reference in your agents using the `skills` frontmatter field

```bash
# Example: Add SQL injection testing skill
cd ~/.claude/skills/
curl -L https://github.com/zebbern/claude-code-guide/archive/refs/heads/main.zip -o skills.zip
unzip -j skills.zip "claude-code-guide-main/skills/sql-injection-testing/*" -d sql-injection-testing/
```

Then reference in an agent:

```yaml
---
name: security-auditor
role: Security testing specialist
skills: ["sql-injection-testing"]
---
```

#### Important Disclaimer

> **Note**: These cybersecurity skills have not been fully tested by the maintainers of this guide. While they appear well-structured and comprehensive based on their documentation, you should:
>
> - **Test thoroughly** before using in production security assessments
> - **Ensure you have proper authorization** before conducting any penetration testing
> - **Review and validate** the techniques against your organization's security policies
> - **Use only in legal contexts** with written permission from system owners
> - **Contribute back** if you find issues or improvements

The skills appear to follow proper ethical hacking guidelines and include appropriate legal prerequisites, but as with any security tooling, verification is essential.

#### Contributing

If you create specialized skills for other domains (DevOps, data science, ML/AI, etc.), consider sharing them with the community through similar repositories or pull requests to existing collections.

---

# 6. Commands

_Quick jump:_ [Slash Commands](#61-slash-commands) · [Creating Custom Commands](#62-creating-custom-commands) · [Command Template](#63-command-template) · [Command Examples](#64-command-examples)

---

**Reading time**: 10 minutes
**Skill level**: Week 1-2
**Goal**: Create custom slash commands

## 6.1 Slash Commands

Slash commands are shortcuts for common workflows.

### Built-in Commands

| Command | Action |
|---------|--------|
| `/help` | Show all commands |
| `/clear` | Clear conversation |
| `/compact` | Summarize context |
| `/status` | Show session info |
| `/plan` | Enter Plan Mode |
| `/rewind` | Undo changes |
| `/exit` | Exit Claude Code |

### Custom Commands

You can create your own commands in `.claude/commands/`:

```
/tech:commit    → .claude/commands/tech/commit.md
/tech:pr        → .claude/commands/tech/pr.md
/product:scope  → .claude/commands/product/scope.md
```

## 6.2 Creating Custom Commands

Commands are markdown files that define a process.

### Command File Location

```
.claude/commands/
├── tech/           # Development workflows
│   ├── commit.md
│   └── pr.md
├── product/        # Product workflows
│   └── problem-framer.md
└── support/        # Support workflows
    └── ticket-analyzer.md
```

### Command Naming

| File | Invocation |
|------|------------|
| `commit.md` in `tech/` | `/tech:commit` |
| `pr.md` in `tech/` | `/tech:pr` |
| `problem-framer.md` in `product/` | `/product:problem-framer` |

### Variable Interpolation

Commands can accept arguments:

```markdown
# My Command

You received the following arguments: $ARGUMENTS

Process them accordingly.
```

Usage:
```
/tech:deploy production
```

`$ARGUMENTS` becomes `production`.

## 6.3 Command Template

```markdown
# Command Name

## Purpose

[Brief description of what this command does]

## Process

Follow these steps:

1. **Step 1 Name**
   [Detailed instructions]

2. **Step 2 Name**
   [Detailed instructions]

3. **Step 3 Name**
   [Detailed instructions]

## Arguments

If arguments provided ($ARGUMENTS): [How to handle them]
If no arguments: [Default behavior]

## Output Format

[Expected output structure]

## Examples

### Example 1
Input: `/command arg1`
Output: [Expected result]

## Error Handling

If [error condition]:
- [Recovery action]
```

## 6.4 Command Examples

### Example 1: Commit Command

```markdown
# Commit Current Changes

## Purpose

Create a well-formatted git commit following Conventional Commits.

## Process

1. **Check Status**
   Run `git status` to see all changes.

2. **Analyze Changes**
   Run `git diff` to understand what changed.

3. **Review History**
   Run `git log -5 --oneline` to see recent commit style.

4. **Draft Message**
   Create commit message following:
   - `feat`: New feature
   - `fix`: Bug fix
   - `refactor`: Code restructuring
   - `docs`: Documentation
   - `test`: Test changes
   - `chore`: Maintenance

5. **Stage and Commit**
   ```bash
   git add [relevant files]
   git commit -m "[type](scope): description"
   ```

6. **Verify**
   Run `git status` to confirm commit succeeded.

## Arguments

If $ARGUMENTS provided:
- Use as commit message hint: "$ARGUMENTS"

## Output Format

Commit: [hash] [message]
Files: [number] changed


### Example 2: PR Command

```markdown
# Create Pull Request

## Purpose

Create a well-documented pull request on GitHub.

## Process

1. **Check Branch State**
   - `git status` - Verify clean working directory
   - `git branch` - Confirm on feature branch
   - `git log main..HEAD` - Review all commits

2. **Analyze Changes**
   - `git diff main...HEAD` - See all changes vs main
   - Understand the full scope of the PR

3. **Push if Needed**
   If branch not pushed:
   ```bash
   git push -u origin [branch-name]
   ```

4. **Create PR**

```bash
gh pr create --title "[title]" --body "[body]"
```

## PR Body Template

```markdown
## Summary
[1-3 bullet points describing changes]

## Changes
- [Specific change 1]
- [Specific change 2]

## Testing
- [ ] Unit tests pass
- [ ] Manual testing completed
- [ ] No regressions

## Screenshots
[If UI changes]
```

## Arguments

If $ARGUMENTS provided:
- Use as PR title hint

## Error Handling

If not on feature branch:
- WARN: "Create a feature branch first"

If working directory dirty:
- ASK: "Commit changes first?"

### Example 3: Problem Framer Command

```markdown
# Problem Framer

## Purpose

Challenge and refine problem definitions before solution design.

## Process

1. **Capture Initial Problem**
   Record the problem as stated by user.

2. **5 Whys Analysis**
   Ask "Why?" 5 times to find root cause:
   - Why 1: [First answer]
   - Why 2: [Deeper answer]
   - Why 3: [Even deeper]
   - Why 4: [Getting to root]
   - Why 5: [Root cause]

3. **Stakeholder Analysis**
   - Who is affected?
   - Who has decision power?
   - Who benefits from solution?

4. **Constraint Identification**
   - Technical constraints
   - Business constraints
   - Time constraints
   - Resource constraints

5. **Success Criteria**
   Define measurable outcomes:
   - [Metric 1]: [Target]
   - [Metric 2]: [Target]

6. **Reframe Problem**
   Write refined problem statement:
   "How might we [action] for [user] so that [outcome]?"

## Output Format

### Problem Analysis Report

**Original Problem**: [As stated]

**Root Cause**: [From 5 Whys]

**Refined Problem Statement**:
"How might we [X] for [Y] so that [Z]?"

**Success Criteria**:
1. [Measurable outcome 1]
2. [Measurable outcome 2]

**Constraints**:
- [Constraint 1]
- [Constraint 2]
```

---

# 7. Hooks

_Quick jump:_ [The Event System](#71-the-event-system) · [Creating Hooks](#72-creating-hooks) · [Hook Templates](#73-hook-templates) · [Security Hooks](#74-security-hooks) · [Hook Examples](#75-hook-examples)

---

## 📌 Section 7 TL;DR (60 seconds)

**What are Hooks**: Scripts that run automatically on events (like git hooks)

**Event types**:
- `PreToolUse` → Before Claude runs a tool (e.g., block dangerous commands)
- `PostToolUse` → After Claude runs a tool (e.g., auto-format code)
- `UserPromptSubmit` → When you send a message (e.g., inject context)

**Common use cases**:
- 🛡️ Security: Block file deletions, prevent secrets in commits
- 🎨 Quality: Auto-format, lint, run tests
- 📊 Logging: Track commands, audit changes

**Quick Start**: See [7.3 Hook Templates](#73-hook-templates) for copy-paste examples

**Read this section if**: You want automation or need safety guardrails
**Skip if**: Manual control is sufficient for your workflow

---

**Reading time**: 20 minutes
**Skill level**: Week 2-3
**Goal**: Automate Claude Code with event-driven scripts

## 7.1 The Event System

Hooks are scripts that run automatically when specific events occur.

### Event Types

| Event | When It Fires | Use Case |
|-------|---------------|----------|
| `PreToolUse` | Before any tool runs | Security validation |
| `PostToolUse` | After any tool runs | Formatting, logging |
| `UserPromptSubmit` | User sends a message | Context enrichment |
| `Notification` | Claude sends notification | Sound alerts |
| `SessionStart` | Session begins | Initialization |
| `SessionEnd` | Session ends | Cleanup |
| `Stop` | User interrupts | Graceful shutdown |

### Event Flow

```
┌─────────────────────────────────────────────────────────┐
│                      EVENT FLOW                         │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   User types message                                    │
│        │                                                │
│        ▼                                                │
│   ┌────────────────────┐                                │
│   │ UserPromptSubmit   │  ← Add context (git status)    │
│   └────────────────────┘                                │
│        │                                                │
│        ▼                                                │
│   Claude decides to run tool (e.g., Edit)               │
│        │                                                │
│        ▼                                                │
│   ┌────────────────────┐                                │
│   │ PreToolUse         │  ← Security check              │
│   └────────────────────┘                                │
│        │                                                │
│        ▼ (if allowed)                                   │
│   Tool executes                                         │
│        │                                                │
│        ▼                                                │
│   ┌────────────────────┐                                │
│   │ PostToolUse        │  ← Auto-format                 │
│   └────────────────────┘                                │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Shell Scripts vs AI Agents: When to Use What

Not everything needs AI. Choose the right tool:

| Task Type | Best Tool | Why | Example |
|-----------|-----------|-----|---------|
| **Deterministic** | Bash script | Fast, predictable, no tokens | Create branch, fetch PR comments |
| **Pattern-based** | Bash + regex | Reliable for known patterns | Check for secrets, validate format |
| **Interpretation needed** | AI Agent | Judgment required | Code review, architecture decisions |
| **Context-dependent** | AI Agent | Needs understanding | "Does this match requirements?" |

**Rule of thumb**: If you can write a regex or a simple conditional for it, use a bash script. If it requires "understanding" or "judgment", use an agent.

**Example — PR workflow**:
```bash
# Deterministic (bash): create branch, push, open PR
git checkout -b feature/xyz
git push -u origin feature/xyz
gh pr create --title "..." --body "..."

# Interpretation (agent): review code quality
# → Use code-review subagent
```

**Why this matters**: Bash scripts are instant, free (no tokens), and 100% predictable. Reserve AI for tasks that genuinely need intelligence.

> Inspired by [Nick Tune's Coding Agent Development Workflows](https://medium.com/nick-tune-tech-strategy-blog/coding-agent-development-workflows-af52e6f912aa)

## 7.2 Creating Hooks

### Hook Registration (settings.json)

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash|Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/hooks/security-check.sh",
            "timeout": 5000
          }
        ]
      }
    ]
  }
}
```

### Configuration Fields

| Field | Description |
|-------|-------------|
| `matcher` | Regex pattern for which tools trigger hook |
| `type` | Always `"command"` |
| `command` | Path to hook script |
| `timeout` | Max execution time (ms) |

### Hook Input (stdin JSON)

Hooks receive JSON on stdin:

```json
{
  "tool_name": "Bash",
  "tool_input": {
    "command": "git status"
  },
  "session_id": "abc123",
  "cwd": "/project"
}
```

### Hook Output

Hooks can return JSON on stdout:

```json
{
  "systemMessage": "Message shown to Claude",
  "hookSpecificOutput": {
    "additionalContext": "Extra information"
  }
}
```

### Exit Codes

| Code | Meaning | Result |
|------|---------|--------|
| `0` | Success | Allow operation |
| `2` | Block | Prevent operation |
| Other | Error | Log and continue |

## 7.3 Hook Templates

### Template 1: PreToolUse (Security Blocker)

```bash
#!/bin/bash
# .claude/hooks/security-blocker.sh
# Blocks dangerous commands

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')

# List of dangerous patterns
DANGEROUS_PATTERNS=(
    "rm -rf /"
    "rm -rf ~"
    "rm -rf *"
    "sudo rm"
    "git push --force origin main"
    "git push -f origin main"
    "npm publish"
    "> /dev/sda"
)

# Check if command matches any dangerous pattern
for pattern in "${DANGEROUS_PATTERNS[@]}"; do
    if [[ "$COMMAND" == *"$pattern"* ]]; then
        echo "BLOCKED: Dangerous command detected: $pattern" >&2
        exit 2
    fi
done

exit 0
```

### Template 2: PostToolUse (Auto-Formatter)

```bash
#!/bin/bash
# .claude/hooks/auto-format.sh
# Auto-formats code after edits

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')

# Only run for Edit/Write operations
if [[ "$TOOL_NAME" != "Edit" && "$TOOL_NAME" != "Write" ]]; then
    exit 0
fi

# Get the file path
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""')

# Skip if no file path
if [[ -z "$FILE_PATH" ]]; then
    exit 0
fi

# Run Prettier on supported files
if [[ "$FILE_PATH" =~ \.(ts|tsx|js|jsx|json|md|css|scss)$ ]]; then
    npx prettier --write "$FILE_PATH" 2>/dev/null
fi

exit 0
```

### Template 3: UserPromptSubmit (Context Enricher)

```bash
#!/bin/bash
# .claude/hooks/git-context.sh
# Adds git context to every prompt

# Get git information
BRANCH=$(git branch --show-current 2>/dev/null || echo "not a git repo")
LAST_COMMIT=$(git log -1 --format='%h %s' 2>/dev/null || echo "no commits")
STAGED=$(git diff --cached --stat 2>/dev/null | tail -1 || echo "none")
UNSTAGED=$(git diff --stat 2>/dev/null | tail -1 || echo "none")

# Output JSON with context
cat << EOF
{
  "hookSpecificOutput": {
    "additionalContext": "[Git] Branch: $BRANCH | Last: $LAST_COMMIT | Staged: $STAGED | Unstaged: $UNSTAGED"
  }
}
EOF

exit 0
```

### Template 4: Notification (Sound Alerts)

```bash
#!/bin/bash
# .claude/hooks/notification.sh
# Plays sounds on notifications (macOS)

INPUT=$(cat)
TITLE=$(echo "$INPUT" | jq -r '.title // ""')
BODY=$(echo "$INPUT" | jq -r '.body // ""')

# Determine sound based on content
if [[ "$TITLE" == *"error"* ]] || [[ "$BODY" == *"failed"* ]]; then
    SOUND="/System/Library/Sounds/Basso.aiff"
elif [[ "$TITLE" == *"complete"* ]] || [[ "$BODY" == *"success"* ]]; then
    SOUND="/System/Library/Sounds/Hero.aiff"
else
    SOUND="/System/Library/Sounds/Pop.aiff"
fi

# Play sound (macOS)
afplay "$SOUND" 2>/dev/null &

exit 0
```

### Windows Hook Templates

Windows users can create hooks using PowerShell (.ps1) or batch files (.cmd).

> **Note**: Windows hooks should use the full PowerShell invocation with `-ExecutionPolicy Bypass` to avoid execution policy restrictions.

#### Template W1: PreToolUse Security Check (PowerShell)

Create `.claude/hooks/security-check.ps1`:

```powershell
# security-check.ps1
# Blocks dangerous commands

$inputJson = [Console]::In.ReadToEnd() | ConvertFrom-Json
$command = $inputJson.tool_input.command

# List of dangerous patterns
$dangerousPatterns = @(
    "rm -rf /",
    "rm -rf ~",
    "Remove-Item -Recurse -Force C:\",
    "git push --force origin main",
    "git push -f origin main",
    "npm publish"
)

foreach ($pattern in $dangerousPatterns) {
    if ($command -like "*$pattern*") {
        Write-Error "BLOCKED: Dangerous command detected: $pattern"
        exit 2
    }
}

exit 0
```

#### Template W2: PostToolUse Auto-Formatter (PowerShell)

Create `.claude/hooks/auto-format.ps1`:

```powershell
# auto-format.ps1
# Auto-formats code after edits

$inputJson = [Console]::In.ReadToEnd() | ConvertFrom-Json
$toolName = $inputJson.tool_name

if ($toolName -ne "Edit" -and $toolName -ne "Write") {
    exit 0
}

$filePath = $inputJson.tool_input.file_path

if (-not $filePath) {
    exit 0
}

if ($filePath -match '\.(ts|tsx|js|jsx|json|md|css|scss)$') {
    npx prettier --write $filePath 2>$null
}

exit 0
```

#### Template W3: Context Enricher (Batch File)

Create `.claude/hooks/git-context.cmd`:

```batch
@echo off
setlocal enabledelayedexpansion

for /f "tokens=*" %%i in ('git branch --show-current 2^>nul') do set BRANCH=%%i
if "%BRANCH%"=="" set BRANCH=not a git repo

for /f "tokens=*" %%i in ('git log -1 --format^="%%h %%s" 2^>nul') do set LAST_COMMIT=%%i
if "%LAST_COMMIT%"=="" set LAST_COMMIT=no commits

echo {"hookSpecificOutput":{"additionalContext":"[Git] Branch: %BRANCH% | Last: %LAST_COMMIT%"}}
exit /b 0
```

#### Template W4: Notification (Windows)

Create `.claude/hooks/notification.ps1`:

```powershell
# notification.ps1
# Shows Windows toast notifications and plays sounds

$inputJson = [Console]::In.ReadToEnd() | ConvertFrom-Json
$title = $inputJson.title
$body = $inputJson.body

# Determine sound based on content
if ($title -match "error" -or $body -match "failed") {
    [System.Media.SystemSounds]::Hand.Play()
} elseif ($title -match "complete" -or $body -match "success") {
    [System.Media.SystemSounds]::Asterisk.Play()
} else {
    [System.Media.SystemSounds]::Beep.Play()
}

# Optional: Show Windows Toast Notification (requires BurntToast module)
# Install-Module -Name BurntToast
# New-BurntToastNotification -Text $title, $body

exit 0
```

#### Windows settings.json for Hooks

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash|Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "powershell -ExecutionPolicy Bypass -File .claude/hooks/security-check.ps1",
            "timeout": 5000
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "powershell -ExecutionPolicy Bypass -File .claude/hooks/auto-format.ps1",
            "timeout": 10000
          }
        ]
      }
    ]
  }
}
```

## 7.4 Security Hooks

Security hooks are critical for protecting your system.

### Recommended Security Rules

```bash
#!/bin/bash
# .claude/hooks/comprehensive-security.sh

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')

# === CRITICAL BLOCKS (Exit 2) ===

# Filesystem destruction
[[ "$COMMAND" =~ rm.*-rf.*[/~] ]] && { echo "BLOCKED: Recursive delete of root/home" >&2; exit 2; }

# Disk operations
[[ "$COMMAND" =~ ">/dev/sd" ]] && { echo "BLOCKED: Direct disk write" >&2; exit 2; }
[[ "$COMMAND" =~ "dd if=" ]] && { echo "BLOCKED: dd command" >&2; exit 2; }

# Git force operations on protected branches
[[ "$COMMAND" =~ "git push".*"-f".*"(main|master)" ]] && { echo "BLOCKED: Force push to main" >&2; exit 2; }
[[ "$COMMAND" =~ "git push --force".*"(main|master)" ]] && { echo "BLOCKED: Force push to main" >&2; exit 2; }

# Package publishing
[[ "$COMMAND" =~ "npm publish" ]] && { echo "BLOCKED: npm publish" >&2; exit 2; }

# Privileged operations
[[ "$COMMAND" =~ ^sudo ]] && { echo "BLOCKED: sudo command" >&2; exit 2; }

# === WARNINGS (Exit 0 but log) ===

[[ "$COMMAND" =~ "rm -rf" ]] && echo "WARNING: Recursive delete detected" >&2

exit 0
```

### Testing Security Hooks

Before deploying, test your hooks:

```bash
# Test with a blocked command
echo '{"tool_name":"Bash","tool_input":{"command":"rm -rf /"}}' | .claude/hooks/security-blocker.sh
echo "Exit code: $?"  # Should be 2

# Test with a safe command
echo '{"tool_name":"Bash","tool_input":{"command":"git status"}}' | .claude/hooks/security-blocker.sh
echo "Exit code: $?"  # Should be 0
```

## 7.5 Hook Examples

### Example 1: Activity Logger

```bash
#!/bin/bash
# .claude/hooks/activity-logger.sh
# Logs all tool usage to JSONL file

INPUT=$(cat)
LOG_DIR="$HOME/.claude/logs"
LOG_FILE="$LOG_DIR/activity-$(date +%Y-%m-%d).jsonl"

# Create log directory
mkdir -p "$LOG_DIR"

# Clean up old logs (keep 7 days)
find "$LOG_DIR" -name "activity-*.jsonl" -mtime +7 -delete

# Extract tool info
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id')

# Create log entry
LOG_ENTRY=$(jq -n \
  --arg timestamp "$TIMESTAMP" \
  --arg tool "$TOOL_NAME" \
  --arg session "$SESSION_ID" \
  '{timestamp: $timestamp, tool: $tool, session: $session}')

# Append to log
echo "$LOG_ENTRY" >> "$LOG_FILE"

exit 0
```

### Example 2: Linting Gate

```bash
#!/bin/bash
# .claude/hooks/lint-gate.sh
# Runs linter after code changes

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')

# Only check after Edit/Write
if [[ "$TOOL_NAME" != "Edit" && "$TOOL_NAME" != "Write" ]]; then
    exit 0
fi

FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""')

# Only lint TypeScript/JavaScript
if [[ ! "$FILE_PATH" =~ \.(ts|tsx|js|jsx)$ ]]; then
    exit 0
fi

# Run ESLint
LINT_OUTPUT=$(npx eslint "$FILE_PATH" 2>&1)
LINT_EXIT=$?

if [[ $LINT_EXIT -ne 0 ]]; then
    cat << EOF
{
  "systemMessage": "Lint errors found in $FILE_PATH:\n$LINT_OUTPUT"
}
EOF
fi

exit 0
```

---

# 8. MCP Servers

_Quick jump:_ [What is MCP](#81-what-is-mcp) · [Available Servers](#82-available-servers) · [Configuration](#83-configuration) · [Server Selection Guide](#84-server-selection-guide)

---

**Reading time**: 15 minutes
**Skill level**: Week 2-3
**Goal**: Extend Claude Code with external tools

## 8.1 What is MCP

MCP (Model Context Protocol) is a standard for connecting AI models to external tools and data sources.

### Why MCP?

| Without MCP | With MCP |
|-------------|----------|
| Limited to built-in tools | Extensible tool ecosystem |
| Claude guesses about external data | Claude queries real data |
| Generic code understanding | Deep semantic analysis |

### How It Works

```
┌─────────────────────────────────────────────────────────┐
│                    MCP ARCHITECTURE                     │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   ┌─────────────┐                                       │
│   │ Claude Code │                                       │
│   └──────┬──────┘                                       │
│          │                                              │
│          ▼                                              │
│   ┌─────────────────────────────────────────────┐       │
│   │               MCP Protocol                  │       │
│   └──────────────────────┬──────────────────────┘       │
│                          │                              │
│          ┌───────────────┼───────────────┐              │
│          ▼               ▼               ▼              │
│   ┌───────────┐   ┌───────────┐   ┌───────────┐         │
│   │  Serena   │   │ Context7  │   │ Postgres  │         │
│   │(Semantic) │   │  (Docs)   │   │(Database) │         │
│   └───────────┘   └───────────┘   └───────────┘         │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

## 8.2 Available Servers

<details>
<summary><b>MCP Server Catalog (click to expand)</b></summary>

### Serena (Semantic Code Analysis)

**Purpose**: Deep code understanding through semantic analysis, indexing, and persistent memory.

**Why Serena matters**: Claude Code has no built-in indexation (unlike Cursor). Serena fills this gap by indexing your codebase for faster, smarter searches. It also provides **session memory** — context that persists across conversations.

**Key Features**:

| Feature | Description |
|---------|-------------|
| **Indexation** | Pre-indexes your codebase for efficient symbol lookup |
| **Project Memory** | Stores context in `.serena/memories/` between sessions |
| **Onboarding** | Auto-analyzes project structure on first run |

**Tools**:

| Tool | Description |
|------|-------------|
| `find_symbol` | Find functions, classes, methods by name |
| `get_symbols_overview` | Get file structure overview |
| `search_for_pattern` | Regex search across codebase |
| `find_referencing_symbols` | Find all usages of a symbol |
| `replace_symbol_body` | Replace function/class body |
| `write_memory` | Save context for future sessions |
| `read_memory` | Retrieve saved context |
| `list_memories` | List all stored memories |

**Session Memory Workflow**:

```
# Start of session
list_memories() → See what context exists
read_memory("auth_architecture") → Load relevant context

# During work
write_memory("api_refactor_plan", "...") → Save decisions for later

# End of session
write_memory("session_summary", "...") → Persist progress
```

**Setup**:

```bash
# Pre-index your project (recommended for large codebases)
uvx --from git+https://github.com/oraios/serena serena project index
```

**Use when**:
- Navigating large codebases (>10k lines)
- Need context to persist across sessions
- Understanding symbol relationships
- Refactoring across files

> **Source**: [Serena GitHub](https://github.com/oraios/serena)

### mgrep (Semantic Search Alternative)

**Purpose**: Natural language semantic search across code, docs, PDFs, and images.

**Why consider mgrep**: While Serena focuses on symbol-level analysis, mgrep excels at **intent-based search** — finding code by describing what it does rather than exact patterns. Their benchmarks show ~2x fewer tokens used compared to grep-based workflows.

**Key Features**:

| Feature | Description |
|---------|-------------|
| **Semantic search** | Find code by natural language description |
| **Background indexing** | `mgrep watch` indexes respecting `.gitignore` |
| **Multi-format** | Search code, PDFs, images, text |
| **Web integration** | `--web` flag for web search fallback |

**Example**:

```bash
# Traditional grep (exact match required)
grep -r "authenticate.*user" .

# mgrep (intent-based)
mgrep "code that handles user authentication"
```

**Use when**:
- Onboarding to unfamiliar codebases
- Exploring code by intent, not exact patterns
- Searching across mixed content (code + docs)

> **Note**: I haven't tested mgrep personally. Consider it an alternative worth exploring.
> **Source**: [mgrep GitHub](https://github.com/mixedbread-ai/mgrep)

### Context7 (Documentation Lookup)

**Purpose**: Access official library documentation.

**Tools**:

| Tool | Description |
|------|-------------|
| `resolve-library-id` | Find library documentation |
| `query-docs` | Query specific documentation |

**Use when**:
- Learning new libraries
- Finding correct API usage
- Checking official patterns

### Sequential Thinking (Structured Reasoning)

**Purpose**: Multi-step analysis with explicit reasoning.

**Tools**:

| Tool | Description |
|------|-------------|
| `sequentialthinking` | Step-by-step reasoning |

**Use when**:
- Complex debugging
- Architectural analysis
- System design decisions

### Postgres (Database Queries)

**Purpose**: Direct database access for queries.

**Tools**:

| Tool | Description |
|------|-------------|
| `query` | Execute SQL queries |

**Use when**:
- Investigating data issues
- Understanding schema
- Debugging data problems

### Playwright (Browser Automation)

**Purpose**: Browser testing and automation.

**Tools**:

| Tool | Description |
|------|-------------|
| `navigate` | Go to URL |
| `click` | Click element |
| `fill` | Fill form field |
| `screenshot` | Capture screenshot |

**Use when**:
- E2E testing
- Visual validation
- Browser debugging

</details>

## 8.3 Configuration

### mcp.json Location

```
~/.claude/mcp.json      # Global MCP configuration
/project/.claude/mcp.json  # Project-specific (overrides)
```

### Example Configuration

```json
{
  "servers": {
    "serena": {
      "command": "npx",
      "args": ["serena-mcp"],
      "env": {
        "PROJECT_PATH": "${workspaceFolder}"
      }
    },
    "context7": {
      "command": "npx",
      "args": ["@context7/mcp-server"]
    },
    "postgres": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "${env:DATABASE_URL}"
      }
    }
  }
}
```

### Configuration Fields

| Field | Description |
|-------|-------------|
| `command` | Executable to run |
| `args` | Command arguments |
| `env` | Environment variables |
| `cwd` | Working directory |

### Variable Substitution

| Variable | Expands To |
|----------|------------|
| `${workspaceFolder}` | Current project path |
| `${env:VAR_NAME}` | Environment variable |

## 8.4 Server Selection Guide

### Decision Tree

```
What do you need?
│
├─ Deep code understanding?
│  └─ Use Serena
│
├─ Library documentation?
│  └─ Use Context7
│
├─ Complex reasoning?
│  └─ Use Sequential Thinking
│
├─ Database queries?
│  └─ Use Postgres
│
├─ Browser testing?
│  └─ Use Playwright
│
└─ General task?
   └─ Use built-in tools
```

### Server Comparison

| Need | Best Server | Why |
|------|-------------|-----|
| "Find all usages of this function" | Serena | Semantic symbol analysis |
| "Remember this for next session" | Serena | Persistent memory |
| "Find code that handles payments" | mgrep | Intent-based semantic search |
| "How does React useEffect work?" | Context7 | Official docs |
| "Why is this failing?" | Sequential | Structured debugging |
| "What's in the users table?" | Postgres | Direct query |
| "Test the login flow" | Playwright | Browser automation |

### Combining Servers

Servers can work together:

```
1. Context7 → Get official pattern for auth
2. Serena → Find existing auth code
3. Sequential → Analyze how to integrate
4. Playwright → Test the implementation
```

---

# 9. Advanced Patterns

_Quick jump:_ [The Trinity](#91-the-trinity) · [Composition Patterns](#92-composition-patterns) · [CI/CD Integration](#93-cicd-integration) · [IDE Integration](#94-ide-integration) · [Tight Feedback Loops](#95-tight-feedback-loops)

---

## 📌 Section 9 TL;DR (3 minutes)

**What you'll learn**: Production-grade workflows that combine multiple Claude Code features.

### Pattern Categories:

**🎯 The Trinity (9.1)** — Ultimate workflow: Plan Mode → Ultrathink → Sequential MCP
- When: Architecture decisions, complex refactoring, critical systems
- Why: Maximum reasoning power + safe exploration

**🔄 Integration Patterns (9.2-9.4)**
- Composition: Agents + Skills + Hooks working together
- CI/CD: GitHub Actions, automated reviews, quality gates
- IDE: VS Code + Claude Code = seamless flow

**⚡ Productivity Patterns (9.5-9.8)**
- Tight feedback loops: Test-driven with instant validation
- Todo as mirrors: Keep context aligned with reality
- Vibe coding: Skeleton → iterate → production

**🎨 Quality Patterns (9.9-9.11)**
- Batch operations: Process multiple files efficiently
- Continuous improvement: Refine over multiple sessions
- Common pitfalls: Learn from mistakes (Do/Don't lists)

### When to Use This Section:
- ✅ You're productive with basics and want mastery
- ✅ You're setting up team workflows or CI/CD
- ✅ You hit limits of simple "ask Claude" approach
- ❌ You're still learning basics (finish Sections 1-8 first)

---

**Reading time**: 20 minutes
**Skill level**: Month 1+
**Goal**: Master power-user techniques

## 9.1 The Trinity

The most powerful Claude Code pattern combines three techniques:

```
┌─────────────────────────────────────────────────────────┐
│                      THE TRINITY                        │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   ┌─────────────┐                                       │
│   │ Plan Mode   │  Safe exploration without changes     │
│   └──────┬──────┘                                       │
│          │                                              │
│          ▼                                              │
│   ┌─────────────┐                                       │
│   │ Ultrathink  │  Deep analysis with extended thinking │
│   └──────┬──────┘                                       │
│          │                                              │
│          ▼                                              │
│   ┌─────────────────────┐                               │
│   │ Sequential Thinking │  Structured multi-step reason │
│   └─────────────────────┘                               │
│                                                         │
│   Combined: Maximum understanding before action         │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### When to Use the Trinity

| Situation | Use Trinity? |
|-----------|--------------|
| Fixing a typo | ❌ Overkill |
| Adding a feature | Maybe |
| Debugging complex issue | ✅ Yes |
| Architectural decision | ✅ Yes |
| Legacy system modernization | ✅ Yes |

### Ultrathink Levels

| Flag | Thinking Depth | Token Usage | Best For |
|------|----------------|-------------|----------|
| `--think` | Standard | ~4K | Multi-component analysis |
| `--think-hard` | Deep | ~10K | Architectural decisions |
| `--ultrathink` | Maximum | ~32K | Critical redesign |

#### Inline Thinking Keywords

You can also trigger extended thinking by adding keywords directly in your prompt:

```bash
# Minimal boost - standard analysis
claude -p "Think. Outline a plan to refactor the auth module."

# Medium boost - deeper consideration
claude -p "Think hard. Draft a migration plan from REST to gRPC."

# Strong boost - thorough analysis
claude -p "Think harder. Evaluate trade-offs for our caching strategy."

# Maximum boost - comprehensive reasoning
claude -p "Ultrathink. Propose a step-by-step strategy to fix flaky payment tests and add guardrails."
```

**How it works:**
- **think** → Claude spends more time planning before responding
- **think hard/harder** → Progressively deeper analysis with more consideration of alternatives
- **ultrathink** → Maximum pre-answer reasoning about implications, edge cases, and trade-offs

**Higher levels increase latency and token usage** - use the smallest level that works for your task.

### Example: Using the Trinity

```
You: /plan

Let's analyze this legacy authentication system before we touch anything.
Use --ultrathink to understand all the implications.

[Claude enters Plan Mode and does deep analysis]

Claude: I've analyzed the auth system. Here's what I found:
- 47 files depend on the current auth module
- 3 critical security issues
- Migration path needs 4 phases

Ready to implement?

You: /execute
Let's start with phase 1
```

## 9.2 Composition Patterns

### Multi-Agent Delegation

Launch multiple agents for different aspects:

```
You: For this feature, I need:
1. Backend architect to design the API
2. Security reviewer to audit the design
3. Test engineer to plan the tests

Run these in parallel.
```

Claude will coordinate:
- Backend architect designs API
- Security reviewer audits (in parallel)
- Test engineer plans tests (in parallel)

### Skill Stacking

Combine multiple skills for complex tasks:

```yaml
# code-reviewer.md
skills:
  - security-guardian
  - performance-patterns
  - accessibility-checker
```

The reviewer now has all three knowledge domains.

### The "Rev the Engine" Pattern

For quality work, use multiple rounds of critique:

```
You: Write the function, then critique it, then improve it.
Do this 3 times.

Round 1: [Initial implementation]
Critique: [What's wrong]
Improvement: [Better version]

Round 2: [Improved implementation]
Critique: [What's still wrong]
Improvement: [Even better version]

Round 3: [Final implementation]
Final check: [Verification]
```

### The "Stack Maximum" Pattern

For critical work, combine everything:

```
1. Plan Mode + Ultrathink → Deep exploration
2. Multiple Agents → Specialized analysis
3. Sequential Thinking → Structured reasoning
4. Rev the Engine → Iterative improvement
5. Code Review Agent → Final validation
```

## 9.3 CI/CD Integration

### Headless Mode

Run Claude Code without interactive prompts:

```bash
# Basic headless execution
claude --headless "Run the tests and report results"

# With timeout
claude --headless --timeout 300 "Build the project"

# With specific model
claude --headless --model sonnet "Analyze code quality"
```

### Git Hooks Integration

> **Windows Note**: Git hooks run in Git Bash on Windows, so the bash syntax below works. Alternatively, you can create `.cmd` or `.ps1` versions and reference them from a wrapper script.

**Pre-commit hook**:

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Run Claude Code for commit message validation
COMMIT_MSG=$(cat "$1")
claude --headless "Is this commit message good? '$COMMIT_MSG'. Reply YES or NO with reason."
```

**Pre-push hook**:

```bash
#!/bin/bash
# .git/hooks/pre-push

# Security check before push
claude --headless "Scan staged files for secrets and security issues. Exit 1 if found."
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
    echo "Security issues found. Push blocked."
    exit 1
fi
```

### GitHub Actions Integration

```yaml
# .github/workflows/claude-review.yml
name: Claude Code Review

on:
  pull_request:
    types: [opened, synchronize]

jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install Claude Code
        run: npm install -g @anthropic-ai/claude-code

      - name: Run Review
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
        run: |
          claude --headless "Review the changes in this PR. \
            Focus on security, performance, and code quality. \
            Output as markdown."
```

### Verify Gate Pattern

Before creating a PR, ensure all local checks pass. This prevents wasted CI cycles and review time.

**The pattern**:

```
Build ✓ → Lint ✓ → Test ✓ → Type-check ✓ → THEN create PR
```

**Implementation as a command** (`.claude/commands/complete-task.md`):

```markdown
# Complete Task

Run the full verification gate before creating a PR:

1. **Build**: Run `pnpm build` - must succeed
2. **Lint**: Run `pnpm lint` - must have zero errors
3. **Test**: Run `pnpm test` - all tests must pass
4. **Type-check**: Run `pnpm typecheck` - no type errors

If ANY step fails:
- Stop immediately
- Report what failed and why
- Suggest fixes
- Do NOT proceed to PR creation

If ALL steps pass:
- Create the PR with `gh pr create`
- Wait for CI with `gh pr checks --watch`
- If CI fails, fetch feedback and auto-fix
- Loop until mergeable or blocked
```

**Autonomous retry loop**:

```
┌─────────────────────────────────────────┐
│         VERIFY GATE + AUTO-FIX          │
├─────────────────────────────────────────┤
│                                         │
│   Local checks (build/lint/test)        │
│        │                                │
│        ▼ FAIL?                          │
│   ┌─────────┐                           │
│   │ Auto-fix│ ──► Re-run checks         │
│   └─────────┘                           │
│        │                                │
│        ▼ PASS                           │
│   Create PR                             │
│        │                                │
│        ▼                                │
│   Wait for CI (gh pr checks --watch)    │
│        │                                │
│        ▼ FAIL?                          │
│   ┌─────────────────────┐               │
│   │ Fetch CI feedback   │               │
│   │ (CodeRabbit, etc.)  │               │
│   └─────────────────────┘               │
│        │                                │
│        ▼                                │
│   Auto-fix + push + loop                │
│        │                                │
│        ▼                                │
│   PR mergeable OR blocked (ask human)   │
│                                         │
└─────────────────────────────────────────┘
```

**Fetching CI feedback** (GitHub GraphQL):

```bash
# Get PR review status and comments
gh api graphql -f query='
  query($pr: Int!) {
    repository(owner: "OWNER", name: "REPO") {
      pullRequest(number: $pr) {
        reviewDecision
        reviewThreads(first: 100) {
          nodes {
            isResolved
            comments(first: 1) {
              nodes { body }
            }
          }
        }
      }
    }
  }' -F pr=$PR_NUMBER
```

> Inspired by [Nick Tune's Coding Agent Development Workflows](https://medium.com/nick-tune-tech-strategy-blog/coding-agent-development-workflows-af52e6f912aa)

### Release Notes Generation

Automate release notes and changelog generation using Claude Code.

**Why automate release notes?**
- Consistent format across releases
- Captures technical details from commits
- Translates technical changes to user-facing language
- Saves 30-60 minutes per release

**Pattern**: Git commits → Claude analysis → User-friendly release notes

#### Approach 1: Command-Based

Create `.claude/commands/release-notes.md`:

```markdown
# Generate Release Notes

Analyze git commits since last release and generate release notes.

## Process

1. **Get commits since last tag**:
   ```bash
   git log $(git describe --tags --abbrev=0)..HEAD --oneline
   ```

2. **Read full commit details**:
   - Include commit messages
   - Include file changes
   - Include PR numbers if present

3. **Categorize changes**:
   - **✨ Features** - New functionality
   - **🐛 Bug Fixes** - Issue resolutions
   - **⚡ Performance** - Speed/efficiency improvements
   - **🔒 Security** - Security patches
   - **📝 Documentation** - Doc updates
   - **🔧 Maintenance** - Refactoring, dependencies
   - **⚠️ Breaking Changes** - API changes (highlight prominently)

4. **Generate three versions**:

   **A. CHANGELOG.md format** (technical, for developers):
   ```markdown
   ## [Version] - YYYY-MM-DD

   ### Added
   - Feature description with PR reference

   ### Fixed
   - Bug fix description

   ### Changed
   - Breaking change with migration guide
   ```

   **B. GitHub Release Notes** (balanced, technical + context):
   ```markdown
   ## What's New

   Brief summary of the release

   ### ✨ New Features
   - User-facing feature description

   ### 🐛 Bug Fixes
   - Issue resolution description

   ### ⚠️ Breaking Changes
   - Migration instructions

   **Full Changelog**: v1.0.0...v1.1.0
   ```

   **C. User Announcement** (non-technical, benefits-focused):
   ```markdown
   We're excited to announce [Version]!

   **Highlights**:
   - What users can now do
   - How it helps them
   - When to use it

   [Link to full release notes]
   ```

5. **Output files**:
   - Prepend to `CHANGELOG.md`
   - Save to `release-notes-[version].md`
   - Copy "User Announcement" to clipboard for Slack/blog

## Verification

- Check for missed breaking changes
- Verify all PR references are valid
- Ensure migration guides are clear
```

#### Approach 2: CI/CD Automation

Add to `.github/workflows/release.yml`:

```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0  # Full history for changelog

      - name: Generate Release Notes
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: |
          # Get version from tag
          VERSION=${GITHUB_REF#refs/tags/}

          # Generate with Claude
          claude --headless "Generate release notes for $VERSION. \
            Analyze commits since last tag. \
            Output in GitHub Release format. \
            Save to release-notes.md"

          # Create GitHub Release
          gh release create $VERSION \
            --title "Release $VERSION" \
            --notes-file release-notes.md

      - name: Update CHANGELOG.md
        run: |
          # Prepend to CHANGELOG
          cat release-notes.md CHANGELOG.md > CHANGELOG.tmp
          mv CHANGELOG.tmp CHANGELOG.md

          # Commit back
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add CHANGELOG.md
          git commit -m "docs: update changelog for $VERSION"
          git push
```

#### Approach 3: Interactive Workflow

For more control, use an interactive session:

```bash
# 1. Start Claude Code
claude

# 2. Request release notes
You: "Generate release notes for v2.0.0"

# 3. Claude will:
# - Run git log to get commits
# - Ask clarifying questions:
#   - "Is this a major/minor/patch release?"
#   - "Any breaking changes users should know?"
#   - "Target audience for announcement?"

# 4. Review and refine
You: "Add more detail to the authentication feature"

# 5. Finalize
You: "Save these notes and update CHANGELOG.md"
```

#### Best Practices

**Before generation:**
- ✅ Ensure commits follow conventional commits format
- ✅ All PRs have been merged
- ✅ Version number decided (semver)

**During generation:**
- ✅ Review for accuracy (Claude might miss context)
- ✅ Add migration guides for breaking changes
- ✅ Include upgrade instructions if needed

**After generation:**
- ✅ Cross-reference with closed issues/PRs
- ✅ Test upgrade path on a staging project
- ✅ Share draft with team before publishing

#### Example Output

Given these commits:
```
feat: add user avatar upload (PR #123)
fix: resolve login timeout issue (PR #124)
perf: optimize database queries by 40% (PR #125)
BREAKING: change API endpoint from /api/v1 to /v2 (PR #126)
```

Claude generates:

**CHANGELOG.md** (technical):
```markdown
## [2.0.0] - 2025-01-10

### Added
- User avatar upload functionality (#123)

### Fixed
- Login timeout issue affecting mobile users (#124)

### Performance
- Optimized database queries, reducing load time by 40% (#125)

### Breaking Changes
- **API Endpoints**: Migrated from `/api/v1/*` to `/v2/*`
  - Update client code: replace `/api/v1/` with `/v2/`
  - Old endpoints will return 410 Gone after 2025-02-01
  - Migration guide: docs/migration-v2.md (#126)
```

**GitHub Release** (balanced):
```markdown
## What's New in v2.0.0

This release brings performance improvements, bug fixes, and a new avatar feature.

### ✨ New Features
- **Avatar Upload**: Users can now upload custom profile pictures

### 🐛 Bug Fixes
- Fixed login timeout issue that affected some mobile users

### ⚡ Performance
- Database queries are now 40% faster

### ⚠️ Breaking Changes
- **API Endpoint Migration**: All endpoints have moved from `/api/v1` to `/v2`
  - **Action Required**: Update your API client code
  - **Timeline**: Old endpoints will stop working on February 1, 2025
  - **Migration Guide**: [See docs/migration-v2.md](./docs/migration-v2.md)

**Full Changelog**: v1.9.0...v2.0.0
```

**User Announcement** (non-technical):
```markdown
📢 Version 2.0 is here!

We've made your experience faster and more personal:

✨ **Customize Your Profile** - Upload your own avatar
⚡ **Lightning Fast** - Pages load 40% faster
🐛 **More Reliable** - Fixed the login timeout issue

**For Developers**: This is a breaking release. See our migration guide for API changes.

[Read full release notes →]
```

#### Common Issues

**"Release notes are too technical"**
- Solution: Specify audience in prompt: "Generate for non-technical users"

**"Claude missed a breaking change"**
- Solution: Explicitly list breaking changes in prompt
- Better: Use "BREAKING:" prefix in commit messages

**"Generated notes are generic"**
- Solution: Provide more context: "This release focuses on mobile performance"

**"Commits are messy/unclear"**
- Solution: Clean up commit history before generation (interactive rebase)
- Better: Enforce commit message format with git hooks

## 9.4 IDE Integration

### VS Code Integration

Claude Code integrates with VS Code:

1. **Install Extension**: Search "Claude Code" in Extensions
2. **Configure**: Set API key in settings
3. **Use**:
   - `Ctrl+Shift+P` → "Claude Code: Start Session"
   - Select text → Right-click → "Ask Claude"

### JetBrains Integration

Works with IntelliJ, WebStorm, PyCharm:

1. **Install Plugin**: Settings → Plugins → "Claude Code"
2. **Configure**: Tools → Claude Code → Set API key
3. **Use**:
   - `Ctrl+Shift+A` → "Claude Code"
   - Tool window for persistent session

### Terminal Integration

For terminal-native workflow:

#### macOS/Linux (Bash/Zsh)

```bash
# Add to .bashrc or .zshrc
alias cc='claude'
alias ccp='claude --plan'
alias cce='claude --execute'

# Quick code question
cq() {
    claude --headless "$*"
}
```

Usage:
```bash
cq "What does this regex do: ^[a-z]+$"
```

#### Windows (PowerShell)

```powershell
# Add to $PROFILE (run: notepad $PROFILE to edit)
function cc { claude $args }
function ccp { claude --plan $args }
function cce { claude --execute $args }

function cq {
    param([Parameter(ValueFromRemainingArguments)]$question)
    claude --headless ($question -join ' ')
}
```

To find your profile location: `echo $PROFILE`

Common locations:
- `C:\Users\YourName\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`
- `C:\Users\YourName\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

If the file doesn't exist, create it:
```powershell
New-Item -Path $PROFILE -Type File -Force
```

## 9.5 Tight Feedback Loops

**Reading time**: 5 minutes
**Skill level**: Week 1+

Tight feedback loops accelerate learning and catch issues early. Design your workflow to validate changes immediately.

### The Feedback Loop Pyramid

```
                    ┌─────────────┐
                    │   Deploy    │  ← Hours/Days
                    │   Tests     │
                    ├─────────────┤
                    │    CI/CD    │  ← Minutes
                    │   Pipeline  │
                    ├─────────────┤
                    │   Local     │  ← Seconds
                    │   Tests     │
                    ├─────────────┤
                    │  TypeCheck  │  ← Immediate
                    │    Lint     │
                    └─────────────┘
```

### Implementing Tight Loops

#### Level 1: Immediate (IDE/Editor)
```bash
# Watch mode for instant feedback
pnpm tsc --watch
pnpm lint --watch
```

#### Level 2: On-Save (Git Hooks)
```bash
# Pre-commit hook
#!/bin/bash
pnpm lint-staged && pnpm tsc --noEmit
```

#### Level 3: On-Commit (CI)
```yaml
# GitHub Action for PR checks
- run: pnpm lint && pnpm tsc && pnpm test
```

### Claude Code Integration

Use hooks for automatic validation:

```json
// settings.json
{
  "hooks": {
    "PostToolUse": [{
      "matcher": "Edit|Write",
      "hooks": ["./scripts/validate.sh"]
    }]
  }
}
```

**validate.sh:**
```bash
#!/bin/bash
# Run after every file change
FILE=$(echo "$TOOL_INPUT" | jq -r '.file_path // .file')
if [[ "$FILE" == *.ts || "$FILE" == *.tsx ]]; then
    npx tsc --noEmit "$FILE" 2>&1 | head -5
fi
```

### Feedback Loop Checklist

| Loop | Trigger | Response Time | What It Catches |
|------|---------|---------------|-----------------|
| Lint | On type | <1s | Style, imports |
| TypeCheck | On save | 1-3s | Type errors |
| Unit tests | On save | 5-15s | Logic errors |
| Integration | On commit | 1-5min | API contracts |
| E2E | On PR | 5-15min | User flows |

💡 **Tip**: Faster loops catch more bugs. Invest in making your test suite fast.

## 9.6 Todo as Instruction Mirrors

**Reading time**: 5 minutes
**Skill level**: Week 1+

TodoWrite isn't just tracking—it's an instruction mechanism. Well-crafted todos guide Claude's execution.

### The Mirror Principle

What you write as a todo becomes Claude's instruction:

```
❌ Vague Todo → Vague Execution
"Fix the bug"

✅ Specific Todo → Precise Execution
"Fix null pointer in getUserById when user not found - return null instead of throwing"
```

### Todo as Specification

```markdown
## Effective Todo Pattern

- [ ] **What**: Create user validation function
- [ ] **Where**: src/lib/validation.ts
- [ ] **How**: Use Zod schema with email, password rules
- [ ] **Verify**: Test with edge cases (empty, invalid format)
```

### Todo Granularity Guide

| Task Complexity | Todo Granularity | Example |
|-----------------|------------------|---------|
| Simple fix | 1-2 todos | "Fix typo in header component" |
| Feature | 3-5 todos | Auth flow steps |
| Epic | 10+ todos | Full feature with tests |

### Instruction Embedding

Embed constraints directly in todos:

```markdown
## Bad
- [ ] Add error handling

## Good
- [ ] Add error handling: try/catch around API calls,
      log errors with context, return user-friendly messages,
      use existing ErrorBoundary component
```

### Todo Templates

**Bug Fix:**
```markdown
- [ ] Reproduce: [steps to reproduce]
- [ ] Root cause: [investigation findings]
- [ ] Fix: [specific change needed]
- [ ] Verify: [test command or manual check]
```

**Feature:**
```markdown
- [ ] Design: [what components/functions needed]
- [ ] Implement: [core logic]
- [ ] Tests: [test coverage expectations]
- [ ] Docs: [if public API]
```

## 9.7 Output Styles

**Reading time**: 5 minutes
**Skill level**: Week 1+

Control how Claude responds to match your workflow preferences.

### Output Style Spectrum

```
← Minimal                                      Verbose →
───────────────────────────────────────────────────────
Code only | Code + comments | Explanations | Tutorial
```

### Style Directives

Add to CLAUDE.md or prompt:

**Minimal (Expert Mode):**
```markdown
Output code only. No explanations unless asked.
Assume I understand the codebase.
```

**Balanced:**
```markdown
Explain significant decisions. Comment complex logic.
Skip obvious explanations.
```

**Verbose (Learning Mode):**
```markdown
Explain each step. Include alternatives considered.
Link to documentation for concepts used.
```

### Context-Aware Styles

```markdown
## In CLAUDE.md

### Output Preferences
- **Code reviews**: Detailed, cite specific lines
- **Bug fixes**: Minimal, show diff only
- **New features**: Balanced, explain architecture decisions
- **Refactoring**: Minimal, trust my review
```

### Format Control

**For code:**
```markdown
Format code output as:
- Full file with changes marked: // CHANGED
- Diff format for reviews
- Inline for small changes
```

**For explanations:**
```markdown
Explain using:
- Bullet points for lists
- Tables for comparisons
- Diagrams for architecture
```

### Output Templates

**Bug Fix Output:**
```markdown
**Root Cause**: [one line]
**Fix**: [code block]
**Test**: [verification command]
```

**Feature Output:**
```markdown
**Files Changed**: [list]
**Key Decisions**: [bullet points]
**Next Steps**: [if any]
```

## 9.8 Vibe Coding & Skeleton Projects

**Reading time**: 5 minutes
**Skill level**: Month 1

### Vibe Coding

"Vibe Coding" is rapid prototyping through natural conversation—exploring ideas before committing to implementation.

#### When to Vibe Code

- **Early exploration**: Testing if an approach works
- **Proof of concept**: Quick validation before full implementation
- **Learning**: Understanding a new library or pattern

#### Vibe Coding Session

```markdown
User: Let's explore how we could add real-time updates to the dashboard.
      Don't write code yet, just brainstorm approaches.

Claude: Here are three approaches we could consider:

1. **WebSockets**: Full duplex, lowest latency
   - Pro: Real-time push
   - Con: Connection management complexity

2. **Server-Sent Events (SSE)**: One-way server push
   - Pro: Simple, native browser support
   - Con: One direction only

3. **Polling**: Periodic HTTP requests
   - Pro: Simplest implementation
   - Con: Not truly real-time, more server load

User: Let's vibe on option 2. Show me a minimal SSE setup.

Claude: [Provides minimal example for exploration]
```

#### Vibe Coding Rules

1. **No production code**: This is exploration only
2. **Throw away freely**: No attachment to vibe code
3. **Focus on learning**: Understand the approach
4. **Signal clearly**: "This is vibe code, not for production"

### Skeleton Projects

Skeleton projects are minimal, working templates that establish patterns before full implementation.

#### Skeleton Structure

```
project/
├── src/
│   ├── index.ts           # Entry point (working)
│   ├── config.ts          # Config structure (minimal)
│   ├── types.ts           # Core types (defined)
│   └── features/
│       └── example/       # One working example
│           ├── route.ts
│           ├── service.ts
│           └── repo.ts
├── tests/
│   └── example.test.ts    # One working test
└── package.json           # Dependencies defined
```

#### Skeleton Principles

1. **It must run**: `pnpm dev` works from day 1
2. **One complete vertical**: Full stack for one feature
3. **Patterns, not features**: Shows HOW, not WHAT
4. **Minimal dependencies**: Only what's needed

#### Creating a Skeleton

```markdown
User: Create a skeleton for our new microservice. Include:
      - Express setup
      - One complete route (health check)
      - Database connection pattern
      - Test setup
      - Docker configuration

Claude: [Creates minimal, working skeleton with these elements]
```

#### Skeleton Expansion

```
Skeleton (Day 1)     →    MVP (Week 1)    →    Full (Month 1)
────────────────────────────────────────────────────────────
1 route              →    5 routes        →    20 routes
1 test               →    20 tests        →    100+ tests
Basic config         →    Env-based       →    Full config
Local DB             →    Docker DB       →    Production DB
```

## 9.9 Batch Operations Pattern

**Reading time**: 5 minutes
**Skill level**: Week 1+

Batch operations improve efficiency and reduce context usage when making similar changes across files.

### When to Batch

| Scenario | Batch? | Why |
|----------|--------|-----|
| Same change in 5+ files | ✅ Yes | Efficiency |
| Related changes in 3 files | ✅ Yes | Coherence |
| Unrelated fixes | ❌ No | Risk of errors |
| Complex refactoring | ⚠️ Maybe | Depends on pattern |

### Batch Patterns

#### 1. Import Updates
```markdown
User: Update all files in src/components to use the new Button import:
      - Old: import { Button } from "~/ui/button"
      - New: import { Button } from "~/components/ui/button"
```

#### 2. API Migration
```markdown
User: Migrate all API calls from v1 to v2:
      - Change: /api/v1/* → /api/v2/*
      - Update response handling for new format
      - Files: src/services/*.ts
```

#### 3. Pattern Application
```markdown
User: Add error boundaries to all page components:
      - Wrap each page export with ErrorBoundary
      - Use consistent error fallback
      - Files: src/pages/**/*.tsx
```

### Batch Execution Strategy

```
1. Identify scope   → List all affected files
2. Define pattern   → Exact change needed
3. Create template  → One example implementation
4. Batch apply      → Apply to all files
5. Verify all       → Run tests, typecheck
```

### Batch with Claude

```markdown
## Effective Batch Request

"Apply this change pattern to all matching files:

**Pattern**: Add 'use client' directive to components using hooks
**Scope**: src/components/**/*.tsx
**Rule**: If file contains useState, useEffect, or useContext
**Change**: Add 'use client' as first line

List affected files first, then make changes."
```

## 9.10 Continuous Improvement Mindset

The goal isn't just to use AI for coding — it's to **continuously improve the workflow** so AI produces better results with less intervention.

### The Key Question

After every manual intervention, ask yourself:

> "How can I improve the process so this error or manual fix can be avoided next time?"

### Improvement Pipeline

```
Error or manual intervention detected
        │
        ▼
Can a linting rule catch it?
        │
    YES ─┴─ NO
     │      │
     ▼      ▼
Add lint   Can it go in conventions/docs?
rule            │
            YES ─┴─ NO
             │      │
             ▼      ▼
        Add to    Accept as
      CLAUDE.md   edge case
       or ADRs
```

### Practical Examples

| Problem | Solution | Where to Add |
|---------|----------|--------------|
| Agent forgets to run tests | Add to workflow command | `.claude/commands/complete-task.md` |
| Code review catches style issue | Add ESLint rule | `.eslintrc.js` |
| Same architecture mistake repeated | Document decision | `docs/conventions/architecture.md` |
| Agent uses wrong import pattern | Add example | `CLAUDE.md` |

### The Mindset Shift

Traditional: *"I write code, AI helps"*

AI-native: *"I improve the workflow and context so AI writes better code"*

> "Software engineering might be more workflow + context engineering."
> — Nick Tune

This is the meta-skill: instead of fixing code, **fix the system that produces the code**.

> Inspired by [Nick Tune's Coding Agent Development Workflows](https://medium.com/nick-tune-tech-strategy-blog/coding-agent-development-workflows-af52e6f912aa)

## 9.11 Common Pitfalls & Best Practices

Learn from common mistakes to avoid frustration and maximize productivity.

### Security Pitfalls

**❌ Don't:**

- Use `--dangerously-skip-permissions` on production systems or sensitive codebases
- Hard-code secrets in commands, config files, or CLAUDE.md
- Grant overly broad permissions like `Bash(*)` without restrictions
- Run Claude Code with elevated privileges (sudo/Administrator) unnecessarily
- Commit `.claude/settings.local.json` to version control (contains API keys)
- Share session IDs or logs that may contain sensitive information
- Disable security hooks during normal development

**✅ Do:**

- Store secrets in environment variables or secure vaults
- Start from minimal permissions and expand gradually as needed
- Audit regularly with `claude config list` to review active permissions
- Isolate risky operations in containers, VMs, or separate environments
- Use `.gitignore` to exclude sensitive configuration files
- Review all diffs before accepting changes, especially in security-critical code
- Implement PreToolUse hooks to catch accidental secret exposure
- Use Plan Mode for exploring unfamiliar or sensitive codebases

**Example Security Hook:**

```bash
#!/bin/bash
# .claude/hooks/PreToolUse.sh - Block secrets in commits

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool.name')

if [[ "$TOOL_NAME" == "Bash" ]]; then
    COMMAND=$(echo "$INPUT" | jq -r '.tool.input.command')

    # Block git commits with potential secrets
    if [[ "$COMMAND" == *"git commit"* ]] || [[ "$COMMAND" == *"git add"* ]]; then
        # Check for common secret patterns
        if git diff --cached | grep -E "(password|secret|api_key|token).*=.*['\"]"; then
            echo "❌ Potential secret detected in staged files" >&2
            exit 2  # Block the operation
        fi
    fi
fi

exit 0  # Allow
```

### Performance Pitfalls

**❌ Don't:**

- Load entire monorepo when you only need one package
- Max out thinking/turn budgets for simple tasks (wastes time and money)
- Ignore session cleanup - old sessions accumulate and slow down Claude Code
- Use `--ultrathink` for trivial edits like typo fixes
- Keep context at 90%+ for extended periods
- Load large binary files or generated code into context
- Run expensive MCP operations in tight loops

**✅ Do:**

- Use `--add-dir` for focused context on specific directories
- Right-size thinking levels to task complexity:
  - Simple edits: No flags
  - Medium analysis: `--think`
  - Complex architecture: `--think-hard`
  - Critical redesign: `--ultrathink`
- Set `cleanupPeriodDays` in config to prune old sessions automatically
- Use `/compact` proactively when context reaches 70%
- Exclude irrelevant directories with `.claudeignore`
- Monitor cost with `/status` and adjust model/thinking levels accordingly
- Cache expensive computations in memory with Serena MCP

**Context Management Strategy:**

| Context Level | Action | Why |
|--------------|--------|-----|
| 0-50% | Work freely | Optimal performance |
| 50-70% | Be selective | Start monitoring |
| 70-85% | `/compact` now | Prevent degradation |
| 85-95% | `/compact` or `/clear` | Significant slowdown |
| 95%+ | `/clear` required | Risk of errors |

### Workflow Pitfalls

**❌ Don't:**

- Skip project context (`CLAUDE.md`) - leads to repeated corrections
- Use vague prompts like "fix this" or "check my code"
- Ignore errors in logs or dismiss warnings
- Automate workflows without testing in safe environments first
- Accept changes blindly without reviewing diffs
- Work without version control or backups
- Mix multiple unrelated tasks in one session
- Forget to commit after completing tasks

**✅ Do:**

- Maintain and update `CLAUDE.md` regularly with:
  - Tech stack and versions
  - Coding conventions and patterns
  - Architecture decisions
  - Common gotchas specific to your project
- Be specific and goal-oriented in prompts using WHAT/WHERE/HOW/VERIFY format
- Monitor via logs or OpenTelemetry when appropriate
- Test automation in dev/staging environments first
- Always review agent outputs before accepting
- Use git branches for experimental changes
- Break complex tasks into focused sessions
- Commit frequently with descriptive messages

**Effective Prompt Format:**

```markdown
## Task Template

**WHAT**: [Concrete deliverable - e.g., "Add email validation to signup form"]
**WHERE**: [File paths - e.g., "src/components/SignupForm.tsx"]
**HOW**: [Constraints/approach - e.g., "Use Zod schema, show inline errors"]
**VERIFY**: [Success criteria - e.g., "Empty email shows error, invalid format shows error, valid email allows submit"]

## Example

WHAT: Add input validation to the login form
WHERE: src/components/LoginForm.tsx, src/schemas/auth.ts
HOW: Use Zod schema validation, display errors inline below inputs
VERIFY:
- Empty email shows "Email required"
- Invalid email format shows "Invalid email"
- Empty password shows "Password required"
- Valid inputs clear errors and allow submission
```

### Collaboration Pitfalls

**❌ Don't:**

- Commit personal API keys or local settings to shared repos
- Override team conventions in personal `.claude/` without discussion
- Use non-standard agents/skills without team alignment
- Modify shared hooks without testing across team
- Skip documentation for custom commands/agents
- Use different Claude Code versions across team without coordinating

**✅ Do:**

- Use `.gitignore` for `.claude/settings.local.json` and personal configs
- Document team-wide conventions in project `CLAUDE.md` (committed)
- Share useful agents/skills via team repository or wiki
- Test hooks in isolation before committing
- Maintain README for `.claude/agents/` and `.claude/commands/`
- Coordinate Claude Code updates and test compatibility
- Use consistent naming conventions for custom components
- Share useful prompts and patterns in team knowledge base

**Recommended .gitignore:**

```gitignore
# Claude Code - Personal
.claude/settings.local.json
.claude/CLAUDE.md
.claude/.serena/

# Claude Code - Team (committed)
# .claude/agents/
# .claude/commands/
# .claude/hooks/
# .claude/settings.json

# Environment
.env.local
.env.*.local
```

### Cost Optimization Pitfalls

**❌ Don't:**

- Use Opus for simple tasks that Sonnet can handle
- Leave `--ultrathink` on by default
- Ignore the cost metrics in `/status`
- Use MCP servers that make external API calls excessively
- Load entire codebase for focused tasks
- Re-analyze unchanged code repeatedly

**✅ Do:**

- Use OpusPlan mode: Opus for planning, Sonnet for execution
- Match model to task complexity:
  - Haiku: Code review, simple fixes
  - Sonnet: Most development tasks
  - Opus: Architecture, complex debugging
- Monitor cost with `/status` regularly
- Set budget alerts if using API directly
- Use Serena memory to avoid re-analyzing code
- Leverage context caching with `/compact`
- Batch similar operations together

**Cost-Effective Model Selection:**

| Task Type | Recommended Model | Reasoning |
|-----------|------------------|-----------|
| Typo fixes | Haiku | Simple, fast, cheap |
| Feature implementation | Sonnet | Best balance |
| Code review | Haiku/Sonnet | Depends on depth |
| Architecture design | Opus (plan) → Sonnet (execute) | OpusPlan mode |
| Complex debugging | Opus with `--think` | Worth the cost |
| Batch operations | Sonnet | Efficient at scale |

### Learning & Adoption Pitfalls

**❌ Don't:**

- Try to learn everything at once - overwhelming and inefficient
- Skip the basics and jump to advanced features
- Expect perfection from AI - it's a tool, not magic
- Blame Claude for errors without reviewing your prompts
- Work in isolation without checking community resources
- Give up after first frustration

**✅ Do:**

- Follow progressive learning path:
  1. Week 1: Basic commands, context management
  2. Week 2: CLAUDE.md, permissions
  3. Week 3: Agents and commands
  4. Month 2+: MCP servers, advanced patterns
- Start with simple, low-risk tasks
- Iterate on prompts based on results
- Review this guide and community resources regularly
- Join Claude Code communities (Discord, GitHub discussions)
- Share learnings and ask questions
- Celebrate small wins and track productivity gains

**Learning Checklist:**

```
□ Week 1: Installation & Basic Usage
  □ Install Claude Code successfully
  □ Complete first task (simple edit)
  □ Understand context management (use /compact)
  □ Learn permission modes (try Plan Mode)

□ Week 2: Configuration & Memory
  □ Create project CLAUDE.md
  □ Set up .gitignore correctly
  □ Configure permissions in settings.local.json
  □ Use @file references effectively

□ Week 3-4: Customization
  □ Create first custom agent
  □ Create first custom command
  □ Set up at least one hook
  □ Explore one MCP server (suggest: Context7)

□ Month 2+: Advanced Patterns
  □ Implement Trinity pattern (Git + TodoWrite + Agent)
  □ Set up CI/CD integration
  □ Configure OpusPlan mode
  □ Build team workflow patterns
```

---

## 9.12 Git Best Practices & Workflows

Effective git workflows with Claude Code for professional development.

### Commit Message Best Practices

Claude Code generates commit messages automatically. Guide it with clear context.

**Default behavior:**
```bash
# After changes, Claude creates commits like:
git commit -m "feat: add user authentication middleware

- Implement JWT validation
- Add session management
- Create auth error handling

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
```

**Customize commit style in CLAUDE.md:**

```markdown
## Git Commit Conventions

Follow Conventional Commits format:
- feat: New features
- fix: Bug fixes
- docs: Documentation changes
- refactor: Code restructuring
- test: Test additions/changes
- chore: Maintenance tasks

Keep first line under 72 characters.
Include ticket number: [PROJ-123]
```

**Example with guidance:**

```markdown
You: "Implement login endpoint"

Claude: Creates commit:
git commit -m "feat: implement user login endpoint [AUTH-42]

- Add POST /api/auth/login route
- Validate credentials with bcrypt
- Generate JWT tokens
- Return user profile on success

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
```

### Git Amend Workflow

**When to amend:**
- Fix typos in recent commit
- Add forgotten files to last commit
- Improve commit message
- **Only for unpushed commits**

**Safe amend pattern:**

```bash
# Check if commit is unpushed
git status
# Output: "Your branch is ahead of 'origin/main' by 1 commit"

# Amend the commit
You: "Add the missing test file to the last commit"

Claude:
git add tests/auth.test.ts
git commit --amend --no-edit
```

**❌ Never amend pushed commits** (requires force push, breaks team history)

**✅ For pushed commits, create new commit:**

```bash
You: "Fix typo in authentication function"

Claude:
# Creates new commit instead of amending
git commit -m "fix: correct typo in authenticateUser function"
```

### Branch Management

**Feature branch pattern:**

```markdown
## CLAUDE.md Git Workflow

Always work on feature branches:
1. Create branch from main: git checkout -b feature/name
2. Make changes and commit regularly
3. Push to remote: git push -u origin feature/name
4. Create pull request when ready
5. Never commit directly to main/master
```

**Branch naming conventions:**

```
feature/user-authentication
fix/login-validation-bug
refactor/api-endpoints
docs/update-readme
chore/dependency-updates
```

**Claude Code with branches:**

```bash
# Start new feature
You: "Create a new branch for adding search functionality"

Claude:
git checkout -b feature/search-functionality

# Work on feature...
# ...

# When complete
You: "Create pull request for search feature"

Claude:
git push -u origin feature/search-functionality
# Opens PR creation in browser
```

### Rewind vs Revert

**`/rewind` (local undo):**
- Undoes Claude's recent changes in current session
- Does NOT create git commits
- Works only for uncommitted changes
- Use when: Claude made a mistake, you want to try different approach

**Example:**

```bash
You: "Add email validation to login form"
Claude: [Makes changes]
You: [Reviews diff] "This breaks the existing flow"
/rewind
# Changes are undone, back to previous state
You: "Add email validation but preserve existing flow"
```

**`git revert` (committed changes):**
- Creates new commit that undoes previous commit
- Safe for pushed commits (preserves history)
- Use when: Need to undo committed changes

**Example:**

```bash
You: "Revert the authentication changes from the last commit"

Claude:
git revert HEAD
# Creates new commit: "Revert 'feat: add authentication'"
```

**Decision tree:**

```
Changes not committed yet? → Use /rewind
Changes committed but not pushed? → Use git reset (careful!)
Changes committed and pushed? → Use git revert
```

### Git Worktrees for Parallel Development

**What are worktrees?**

Git worktrees create multiple working directories from the same repository, each checked out to a different branch.

**Traditional workflow problem:**

```bash
# Working on feature A
git checkout feature-a
# 2 hours of work...

# Urgent hotfix needed
git stash              # Save current work
git checkout main
git checkout -b hotfix
# Fix the bug...
git checkout feature-a
git stash pop          # Resume work
```

**Worktree solution:**

```bash
# One-time setup
git worktree add ../myproject-hotfix hotfix
git worktree add ../myproject-feature-a feature-a

# Now work in parallel
cd ../myproject-hotfix    # Terminal 1
claude                    # Fix the bug

cd ../myproject-feature-a # Terminal 2
claude                    # Continue feature work
```

**When to use worktrees:**

✅ **Use worktrees when:**
- Working on multiple features simultaneously
- Need to test different approaches in parallel
- Reviewing code while developing
- Running long CI/CD builds while coding
- Maintaining multiple versions (v1 support + v2 development)

❌ **Don't use worktrees when:**
- Simple branch switching is sufficient
- Disk space is limited (each worktree = full working directory)
- Team is unfamiliar with worktrees (adds complexity)

**Quick setup with Claude:**

```bash
# Use the /git-worktree command (see examples/commands/git-worktree.md)
You: "/git-worktree feature/new-api"

Claude:
# Checks for .worktrees/ or worktrees/ directory
# Verifies .gitignore has worktree directory excluded
# Creates worktree: git worktree add .worktrees/feature/new-api -b feature/new-api
# Installs dependencies (npm/yarn/pnpm auto-detected)
# Runs baseline tests
# Reports: "Worktree ready at /path/to/.worktrees/feature/new-api"
```

**Worktree management:**

```bash
# List all worktrees
git worktree list

# Remove worktree (after merging feature)
git worktree remove .worktrees/feature/new-api

# Cleanup stale worktree references
git worktree prune
```

**Claude Code context in worktrees:**

Each worktree maintains **independent Claude Code context**:

```bash
# Terminal 1 - Worktree A
cd .worktrees/feature-a
claude
You: "Implement user authentication"
# Claude indexes feature-a worktree

# Terminal 2 - Worktree B (simultaneous)
cd .worktrees/feature-b
claude
You: "Add payment integration"
# Claude indexes feature-b worktree (separate context)
```

**Memory files with worktrees:**

- **Global memory** (`~/.claude/CLAUDE.md`): Shared across all worktrees
- **Project memory** (repo root `CLAUDE.md`): Committed, shared
- **Worktree-local memory** (`.claude/CLAUDE.md` in worktree): Specific to that worktree

**Recommended structure:**

```
~/projects/
├── myproject/              # Main worktree (main branch)
│   ├── CLAUDE.md          # Project conventions (committed)
│   └── .claude/
├── myproject-develop/      # develop branch worktree
│   └── .claude/           # Develop-specific config
├── myproject-feature-a/    # feature-a branch worktree
│   └── .claude/           # Feature A context
└── myproject-hotfix/       # hotfix branch worktree
    └── .claude/           # Hotfix context
```

**Best practices:**

1. **Name worktrees clearly:**
   ```bash
   # Bad
   git worktree add ../temp feature-x

   # Good
   git worktree add ../myproject-feature-x feature-x
   ```

2. **Add to .gitignore:**
   ```gitignore
   # Worktree directories
   .worktrees/
   worktrees/
   ```

3. **Clean up merged branches:**
   ```bash
   git worktree remove myproject-feature-x
   git branch -d feature-x  # Delete local branch after merge
   git push origin --delete feature-x  # Delete remote branch
   ```

4. **Use consistent location:**
   - `.worktrees/` (hidden, in project root)
   - `worktrees/` (visible, in project root)
   - `../myproject-*` (sibling directories)

5. **Don't commit worktree contents:**
   - Always ensure worktree directories are in `.gitignore`
   - The `/git-worktree` command verifies this automatically

**Advanced: Parallel testing pattern:**

```bash
# Test feature A while working on feature B
cd .worktrees/feature-a
npm test -- --watch &      # Run tests in background

cd .worktrees/feature-b
claude                      # Continue development
You: "Add new API endpoint"
# Tests for feature A still running in parallel
```

**Worktree troubleshooting:**

**Problem:** Worktree creation fails with "already checked out"

```bash
# Solution: You can't check out the same branch in multiple worktrees
git worktree list  # See which branches are checked out
# Use a different branch or remove the existing worktree first
```

**Problem:** Disk space issues

```bash
# Each worktree is a full working directory
# Solution: Clean up unused worktrees regularly
git worktree prune
```

**Problem:** Can't delete worktree directory

```bash
# Solution: Use git worktree remove, not rm -rf
git worktree remove --force .worktrees/old-feature
```

**Resources:**
- [Git Worktree Documentation](https://git-scm.com/docs/git-worktree)
- Example command: [`examples/commands/git-worktree.md`](../examples/commands/git-worktree.md)

---

## 9.13 Cost Optimization Strategies

Practical techniques to minimize API costs while maximizing productivity.

### Model Selection Matrix

Choose the right model for each task to balance cost and capability.

| Task Type | Model | Cost | When to Use |
|-----------|-------|------|-------------|
| **Typo fixes** | Haiku | $ | Simple edits, obvious changes |
| **Code review** | Haiku | $ | Linting, style checks, simple review |
| **Unit tests** | Haiku | $ | Straightforward test generation |
| **Feature implementation** | Sonnet | $$ | Most development work |
| **Refactoring** | Sonnet | $$ | Code restructuring |
| **Bug investigation** | Sonnet | $$ | Moderate debugging |
| **Architecture design** | Opus | $$$ | System design, critical decisions |
| **Complex debugging** | Opus | $$$ | Multi-layered issues |
| **Critical reviews** | Opus | $$$ | Security audits, production code |

**OpusPlan mode (recommended):**
- **Planning**: Opus for high-level thinking
- **Execution**: Sonnet for implementation
- **Best of both worlds**: Strategic thinking + cost-effective execution

```bash
# Activate OpusPlan mode
/model opusplan

# Enter Plan Mode (Opus for planning)
Shift+Tab × 2

You: "Design a caching layer for the API"
# Opus creates detailed architectural plan

# Exit Plan Mode (Sonnet for execution)
Shift+Tab

You: "Implement the caching layer following the plan"
# Sonnet executes the plan at lower cost
```

### Token-Saving Techniques

**1. Selective context loading:**

```bash
# ❌ Load entire monorepo (wastes tokens)
cd monorepo
claude

# ✅ Load only needed directory
cd monorepo
claude --add-dir packages/api
```

**2. Use .claudeignore:**

```gitignore
# .claudeignore - Exclude from context

# Dependencies
node_modules/
vendor/
.venv/

# Generated files
dist/
build/
*.min.js
*.bundle.js

# Large data
*.sql
*.csv
*.json.gz

# IDE files
.vscode/
.idea/

# Logs
*.log
logs/
```

**3. Compact proactively:**

```bash
# ❌ Wait until 90% context
/status  # Context: 92% - Too late, degraded performance

# ✅ Compact at 70%
/status  # Context: 72%
/compact  # Frees up context, maintains performance
```

**4. Agent specialization:**

```markdown
---
name: test-writer
description: Generate unit tests (use for test generation only)
model: haiku
---

Generate comprehensive unit tests with edge cases.
```

**Benefits:**
- Haiku costs less than Sonnet
- Focused context (tests only)
- Faster execution

**5. Batch similar operations:**

```bash
# ❌ Individual sessions for each fix
claude -p "Fix typo in auth.ts"
claude -p "Fix typo in user.ts"
claude -p "Fix typo in api.ts"

# ✅ Batch in single session
claude
You: "Fix typos in auth.ts, user.ts, and api.ts"
# Single context load, multiple fixes
```

### Cost Tracking

**Monitor cost with `/status`:**

```bash
/status

# Output:
Model: Sonnet | Ctx: 45.2k | Cost: $1.23 | Ctx(u): 42.0%
```

**Set budget alerts (API usage):**

```python
# If using Anthropic API directly
import anthropic

client = anthropic.Anthropic()

# Track spending
response = client.messages.create(
    model="claude-sonnet-4-5",
    max_tokens=1024,
    messages=[...],
    metadata={
        "user_id": "user_123",
        "project": "api_development"
    }
)

# Log cost per request
cost = calculate_cost(response.usage)
if cost > BUDGET_THRESHOLD:
    alert_team(f"Budget threshold exceeded: ${cost}")
```

**Session cost limits:**

```markdown
## CLAUDE.md - Cost Awareness

**Budget-conscious mode:**
- Use Haiku for reviews and simple tasks
- Reserve Sonnet for feature work
- Use Opus only for critical decisions
- Compact context at 70% to avoid waste
- Close sessions after task completion
```

### Economic Workflows

**Pattern 1: Haiku for tests, Sonnet for implementation**

```bash
# Terminal 1: Test generation (Haiku)
claude --model haiku
You: "Generate tests for the authentication module"

# Terminal 2: Implementation (Sonnet)
claude --model sonnet
You: "Implement the authentication module"
```

**Pattern 2: Progressive model escalation**

```bash
# Start with Haiku
claude --model haiku
You: "Review this code for obvious issues"

# If complex issues found, escalate to Sonnet
/model sonnet
You: "Deep analysis of the race condition"

# If architectural issue, escalate to Opus
/model opus
You: "Redesign the concurrency model"
```

**Pattern 3: Context reuse**

```bash
# Build context once, reuse for multiple tasks
claude
You: "Analyze the authentication flow"
# Context built: ~20k tokens

# Same session - context already loaded
You: "Now add 2FA to the authentication flow"
# No context rebuild needed

You: "Generate tests for the 2FA feature"
# Still same context

# Commit when done
You: "Create commit for 2FA implementation"
```

### Token Calculation Reference

**Input tokens:**
- Source code loaded into context
- Conversation history
- Memory files (CLAUDE.md)
- Agent/skill instructions

**Output tokens:**
- Claude's responses
- Generated code
- Explanations

**Rough estimates:**
- 1 token ≈ 0.75 words (English)
- 1 token ≈ 4 characters
- Average function: 50-200 tokens
- Average file (500 LOC): 2,000-5,000 tokens

**Example calculation:**

```
Context loaded:
- 10 files × 500 LOC × 4 tokens/LOC = 20,000 tokens
- Conversation history: 5,000 tokens
- CLAUDE.md: 1,000 tokens
Total input: 26,000 tokens

Claude response:
- Generated code: 500 LOC × 4 = 2,000 tokens
- Explanation: 500 tokens
Total output: 2,500 tokens

Total cost per request: (26,000 + 2,500) tokens × model price
```

**Sonnet pricing (approximate):**
- Input: $3 per million tokens
- Output: $15 per million tokens

**Session cost:**
```
Input: 26,000 × $3 / 1,000,000 = $0.078
Output: 2,500 × $15 / 1,000,000 = $0.0375
Total: ~$0.12 per interaction
```

### Cost Optimization Checklist

```markdown
Daily practices:
□ Use /status to monitor context and cost
□ Compact at 70% context usage
□ Close sessions after task completion
□ Use .claudeignore to exclude unnecessary files

Model selection:
□ Default to Sonnet for most work
□ Use Haiku for reviews and simple fixes
□ Reserve Opus for architecture and critical debugging
□ Try OpusPlan mode for strategic work

Context management:
□ Load only needed directories (--add-dir)
□ Batch similar tasks in single session
□ Reuse context for multiple related tasks
□ Create specialized agents with focused context

Team practices:
□ Share cost-effective patterns in team wiki
□ Track spending per project
□ Set budget alerts for high-cost operations
□ Review cost metrics in retrospectives
```

### Advanced: Cost-Aware CI/CD

```yaml
# .github/workflows/claude-review.yml
name: Claude Code Review

on: [pull_request]

jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      # Use Haiku for cost-effective reviews
      - name: Run Claude review
        run: |
          claude --model haiku \
                 -p "Review changes for security and style issues" \
                 --add-dir src/ \
                 --output-format json > review.json

      # Only escalate to Sonnet if issues found
      - name: Deep analysis (if needed)
        if: ${{ contains(steps.*.outputs.*, 'CRITICAL') }}
        run: |
          claude --model sonnet \
                 -p "Detailed analysis of critical issues found" \
                 --add-dir src/
```

**Cost comparison:**

```
Haiku review (per PR): ~$0.02
Sonnet review (per PR): ~$0.10
Opus review (per PR): ~$0.50

With 100 PRs/month:
- Haiku: $2/month
- Sonnet: $10/month
- Opus: $50/month

Smart escalation (Haiku → Sonnet for 10% of PRs):
- Base cost: $2 (Haiku for all)
- Escalation: $1 (Sonnet for 10%)
- Total: $3/month (vs $10 or $50)
```

### Cost vs Productivity Trade-offs

**Don't be penny-wise, pound-foolish:**

❌ **False economy:**
- Spending 2 hours manually debugging to save $1 in API costs
- Using Haiku for complex tasks, generating incorrect code
- Over-compacting context, losing valuable history

✅ **Smart optimization:**
- Use right model for the task (time saved >> cost)
- Invest in good prompts and memory files (reduce iterations)
- Automate with agents (consistent, efficient)

**ROI calculation:**

```
Your hourly rate: $50/hour
Claude Sonnet request: $0.10

Time saved per request: 15 minutes (0.25 hours)
Value of time saved: $50 × 0.25 = $12.50
ROI: ($12.50 - $0.10) / $0.10 = 12,400% ROI

Conclusion: Focus on productivity, not penny-pinching.
```

**When to optimize aggressively:**
- High-volume operations (>1000 requests/day)
- Automated pipelines running 24/7
- Large teams (cost scales with users)
- Budget-constrained projects

**When productivity matters more:**
- Critical bug fixes
- Time-sensitive features
- Learning and experimentation
- Complex architectural decisions

---

## 🎯 Section 9 Recap: Pattern Mastery Checklist

Before moving to Section 10 (Reference), verify you understand:

**Core Patterns**:
- [ ] **Trinity Pattern**: Plan Mode → Ultrathink → Sequential MCP for critical work
- [ ] **Composition**: Agents + Skills + Hooks working together seamlessly
- [ ] **CI/CD Integration**: Automated reviews and quality gates in pipelines
- [ ] **IDE Integration**: VS Code + Claude Code = seamless development flow

**Productivity Patterns**:
- [ ] **Tight Feedback Loops**: Test-driven workflows with instant validation
- [ ] **Todo as Instruction Mirrors**: Keep context aligned with reality
- [ ] **Vibe Coding**: Skeleton → iterate → production-ready
- [ ] **Batch Operations**: Process multiple files efficiently

**Quality Awareness**:
- [ ] **Common Pitfalls**: Understand security, performance, workflow mistakes
- [ ] **Continuous Improvement**: Refine over multiple sessions with learning mindset
- [ ] **Best Practices**: Do/Don't patterns for professional work

### What's Next?

**Section 10 is your command reference** — bookmark it for quick lookups during daily work.

You've mastered the concepts and patterns. Now Section 10 gives you the technical reference for efficient execution.

---

# 10. Reference

_Quick jump:_ [Commands Table](#101-commands-table) · [Keyboard Shortcuts](#102-keyboard-shortcuts) · [Configuration Reference](#103-configuration-reference) · [Troubleshooting](#104-troubleshooting) · [Cheatsheet](#105-cheatsheet) · [Daily Workflow](#106-daily-workflow--checklists)

---

## 📌 Section 10 TL;DR (1 minute)

**What's inside**: Complete command reference, troubleshooting guides, and daily checklists.

### Quick Navigation by Need:

| I need to... | Go to |
|--------------|-------|
| Look up a command | [10.1 Commands Table](#101-commands-table) |
| Find keyboard shortcut | [10.2 Keyboard Shortcuts](#102-keyboard-shortcuts) |
| Configure settings | [10.3 Configuration Reference](#103-configuration-reference) |
| Fix an error | [10.4 Troubleshooting](#104-troubleshooting) |
| Quick daily reference | [10.5 Cheatsheet](#105-cheatsheet) |
| Set up workflow | [10.6 Daily Workflow](#106-daily-workflow--checklists) |

### Most Common Lookups:
- **Context full?** → [10.4.1 Context Issues](#context-issues)
- **MCP not working?** → [10.4.4 MCP Troubleshooting](#mcp-issues)
- **Need clean reinstall?** → [10.4.3 Full Reinstall](#full-clean-reinstall-procedures)

**Usage tip**: Bookmark this section — you'll reference it often.

---

**Purpose**: Quick lookup for all Claude Code information

## 10.1 Commands Table

### Built-in Commands

| Command | Action | Category |
|---------|--------|----------|
| `/help` | Show all available commands | Navigation |
| `/clear` | Clear conversation history | Session |
| `/compact` | Summarize and compress context | Context |
| `/status` | Show session info (context, cost) | Info |
| `/plan` | Enter Plan Mode | Mode |
| `/execute` | Exit Plan Mode | Mode |
| `/rewind` | Undo recent changes | Edit |
| `/exit` | Exit Claude Code | Session |
| `Ctrl+D` | Exit Claude Code | Session |

### Quick Actions

| Action | Shortcut |
|--------|----------|
| Run shell command | `!command` |
| Reference file | `@filename` |
| Cancel operation | `Ctrl+C` |
| Retry last | `Ctrl+R` |
| Dismiss suggestion | `Esc` |

## 10.2 Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Enter` | Send message |
| `Shift+Enter` | New line in message |
| `Ctrl+C` | Cancel current operation |
| `Ctrl+D` | Exit Claude Code |
| `Ctrl+R` | Retry last operation |
| `Ctrl+L` | Clear screen (keeps context) |
| `Tab` | Autocomplete file paths |
| `↑` / `↓` | Navigate command history |
| `Esc` | Dismiss current suggestion |

## 10.3 Configuration Reference

### CLAUDE.md Locations

| Location | Scope | Committed |
|----------|-------|-----------|
| `~/.claude/CLAUDE.md` | All projects | N/A |
| `/project/CLAUDE.md` | This project | ✅ Yes |
| `/project/.claude/CLAUDE.md` | Personal | ❌ No |

### Settings Files

| File | Purpose | Committed |
|------|---------|-----------|
| `settings.json` | Hook configuration | ✅ Yes |
| `settings.local.json` | Permission overrides | ❌ No |

### Permission Patterns

| Pattern | Matches |
|---------|---------|
| `Bash(git *)` | Any git command |
| `Bash(npm test)` | Exactly npm test |
| `Edit` | All file edits |
| `Write` | All file writes |
| `WebSearch` | Web search |
| `mcp__serena__*` | All Serena tools |

### CLI Flags Reference

Complete reference for all Claude Code command-line flags.

| Flag | Description | Example |
|------|-------------|---------|
| `-p, --print` | Print response and exit (non-interactive) | `claude -p "analyze app.ts"` |
| `--output-format` | Output format (text/json/stream-json) | `claude --output-format json` |
| `--input-format` | Input format (text/stream-json) | `claude --input-format stream-json` |
| `--replay-user-messages` | Re-emit user messages in stream | `claude --replay-user-messages` |
| `--allowedTools` | Whitelist specific tools | `claude --allowedTools "Edit,Read,Bash(git:*)"` |
| `--disallowedTools` | Blacklist specific tools | `claude --disallowedTools "WebFetch"` |
| `--mcp-config` | Load MCP servers from JSON file | `claude --mcp-config ./mcp.json` |
| `--strict-mcp-config` | Only use MCP servers from config | `claude --strict-mcp-config` |
| `--append-system-prompt` | Add to system prompt | `claude --append-system-prompt "Use TypeScript"` |
| `--permission-mode` | Permission mode (default/auto/plan) | `claude --permission-mode plan` |
| `--model` | Model selection | `claude --model sonnet` |
| `--add-dir` | Add additional directories to context | `claude --add-dir ../shared ../utils` |
| `--continue` | Continue last conversation | `claude --continue` |
| `-r, --resume` | Resume session by ID | `claude --resume abc123` |
| `--dangerously-skip-permissions` | Skip all permission prompts | `claude --dangerously-skip-permissions` |
| `--debug` | Enable debug mode | `claude --debug` |
| `--verbose` | Verbose output | `claude --verbose` |
| `--mcp-debug` | Debug MCP server connections | `claude --mcp-debug` |
| `--version` | Show version | `claude --version` |

**Common Combinations:**

```bash
# CI/CD mode - non-interactive with auto-accept
claude -p "fix linting errors" --dangerously-skip-permissions

# JSON output for scripting
claude -p "analyze code quality" --output-format json

# Economic analysis with Haiku
claude -p "review this file" --model haiku

# Focused context (performance)
claude --add-dir ./src/components

# Plan mode for safety
claude --permission-mode plan

# Multi-directory project
claude --add-dir ../shared-lib ../utils ../config
```

**Safety Guidelines:**

| Flag | Risk Level | Use When |
|------|-----------|----------|
| `--dangerously-skip-permissions` | 🔴 High | Only in CI/CD, never on production |
| `--allowedTools` | 🟢 Safe | Restricting tool access |
| `--disallowedTools` | 🟢 Safe | Blocking specific tools |
| `--permission-mode plan` | 🟢 Safe | Read-only exploration |
| `--debug` | 🟡 Medium | Troubleshooting (verbose logs) |

## 10.4 Troubleshooting

| Symptom | Cause | Solution |
|---------|-------|----------|
| "Context too long" | Used 100% context | `/clear` or `/compact` |
| Slow responses | High context usage | `/compact` |
| "Permission denied" | Security settings | Check `settings.local.json` |
| Hook not running | Registration error | Check `settings.json` matcher |
| MCP tool not found | Server not running | Check `mcp.json` config |
| Agent not found | File naming | Check `.claude/agents/` |
| Command not found | Path error | Check `.claude/commands/` |

### Context Recovery

| Context Level | Recommended Action |
|---------------|-------------------|
| 0-50% | Continue normally |
| 50-75% | Be more specific in queries |
| 75-90% | Use `/compact` |
| 90%+ | Use `/clear` |

### Common Errors

**"Tool execution failed"**
- Check tool permissions in `settings.local.json`
- Verify command syntax
- Check for missing dependencies

**"Agent not available"**
- Verify agent file exists in `.claude/agents/`
- Check YAML frontmatter syntax
- Restart Claude Code session

**"Hook blocked operation"**
- Check hook exit code (2 = blocked)
- Review hook error message
- Adjust hook rules if needed

### MCP Server Issues

**Common MCP Errors and Solutions**

#### Error 1: Tool Name Validation Failed

```
API Error 400: "tools.11.custom.name: String should match pattern '^[a-zA-Z0-9_-]{1,64}'"
```

**Cause**: MCP server name contains invalid characters.

**Solution**:
- Server names must only contain: letters, numbers, underscores, hyphens
- Maximum 64 characters
- No special characters or spaces

**Example:**
```bash
# ❌ Wrong
claude mcp add my-server@v1 -- npx server

# ✅ Correct
claude mcp add my-server-v1 -- npx server
```

#### Error 2: MCP Server Not Found

```
MCP server 'my-server' not found
```

**Cause**: Server not properly registered or wrong scope.

**Solution**:
1. Check scope settings (local/user/project)
   ```bash
   claude mcp list  # Verify server is listed
   ```
2. Ensure you're in the correct directory for local scope
3. Restart Claude Code session
4. Re-add server if needed:
   ```bash
   claude mcp add my-server -s user -- npx @my/server
   ```

#### Error 3: Windows Path Issues

```
Error: Cannot find module 'C:UsersusernameDocuments'
```

**Cause**: Backslashes in Windows paths not properly escaped.

**Solution**:
```bash
# ❌ Wrong
claude mcp add fs -- npx -y @modelcontextprotocol/server-filesystem C:\Users\username\Documents

# ✅ Correct - Use forward slashes
claude mcp add fs -- npx -y @modelcontextprotocol/server-filesystem C:/Users/username/Documents

# ✅ Correct - Escape backslashes
claude mcp add fs -- npx -y @modelcontextprotocol/server-filesystem "C:\\Users\\username\\Documents"
```

#### MCP Debugging Techniques

**Enable Debug Mode:**
```bash
# Debug all MCP connections
claude --mcp-debug

# View MCP status inside Claude Code
/mcp
```

**View Log Files:**
```bash
# macOS
tail -f ~/Library/Logs/Claude/mcp*.log

# Linux
tail -f ~/.local/share/claude/logs/mcp*.log

# Windows (PowerShell)
Get-Content "$env:APPDATA\Claude\logs\mcp*.log" -Wait -Tail 50
```

**Manual Server Test:**
```bash
# Test if server works standalone
npx -y @modelcontextprotocol/server-filesystem ~/Documents

# Expected: Server should start and output JSON-RPC messages
# If it crashes immediately, check server logs
```

**Quick Diagnostic Commands:**
```bash
# List all configured servers
claude mcp list

# Test specific server
claude --mcp-debug -p "List available tools"

# Remove and re-add server
claude mcp remove my-server
claude mcp add my-server -s user -- npx @my/server
```

**Connection Failed: Common Causes**

| Error | Cause | Solution |
|-------|-------|----------|
| `ECONNREFUSED` | Server not running | Check `mcp.json` command is correct |
| `Timeout after 30s` | Slow initialization | Increase timeout or check server logs |
| `Module not found` | Missing dependencies | Run `npm install` in server directory |
| `Permission denied` | File access | Check file permissions on server executable |
| `ENOENT` | Server binary not found | Verify npx/npm is in PATH |
| `Invalid JSON` | Server output malformed | Check server version compatibility |

**Serena MCP specific issues:**

```bash
# Index not found
serena list-memories
# If empty, re-index:
# In your project, ask Claude: "Index this project with Serena"

# Session not persisting
# Check mcp.json has correct data directory:
{
  "mcpServers": {
    "serena": {
      "command": "npx",
      "args": ["-y", "@serenaai/serena-mcp"],
      "env": {
        "SERENA_DATA_DIR": "/absolute/path/to/.serena"
      }
    }
  }
}
```

**Context7 MCP issues:**

```bash
# Documentation not found
# Ensure you're searching for official libraries:
# ✅ "React useState documentation"
# ❌ "my-custom-lib documentation" (not in Context7)

# Slow lookups
# Context7 fetches from official docs - network dependent
# Check your internet connection
```

**Sequential Thinking MCP issues:**

```bash
# "Sequential not responding"
# Sequential uses significant compute - expect 10-30s responses
# Not an error, just be patient

# Quality seems off
# Sequential works best with specific, well-defined problems
# ✅ "Debug why user authentication fails on mobile"
# ❌ "Make the app better"
```

### Permission Issues

**Pattern matching problems:**

```json
// ❌ Wrong - too specific
{
  "allowedTools": ["Bash(npm test)"]
}
// This ONLY allows exactly "npm test"

// ✅ Right - use wildcards
{
  "allowedTools": ["Bash(npm *)"]
}
// This allows any npm command
```

**Common permission patterns:**

```json
{
  "allowedTools": [
    "Bash(git *)",           // All git commands
    "Bash(npm *)",           // All npm commands
    "Bash(pytest *)",        // All pytest commands
    "Edit",                  // All file edits
    "Write",                 // All file writes
    "Read",                  // All file reads
    "mcp__serena__*",        // All Serena tools
    "mcp__context7__*",      // All Context7 tools
    "Task"                   // Allow agent delegation
  ]
}
```

### Timeout Issues

**Claude stops responding mid-task:**

Possible causes:

1. **Network interruption** - Check your internet connection
2. **API rate limit** - Wait 1-2 minutes and retry
3. **Context exhausted** - Use `/compact` or `/clear`
4. **Long-running operation** - Some MCP operations take 30s+

**Workaround for long operations:**

```bash
# Instead of:
"Analyze all 500 files in the codebase"

# Break into chunks:
"Analyze files in /src/components/ first"
"Now analyze /src/utils/"
"Finally analyze /src/services/"
```

### Installation Issues

**Windows-specific problems:**

```powershell
# npm global install fails
# Run PowerShell as Administrator
npm install -g @anthropic-ai/claude-code

# PATH not updated
# Manually add to PATH:
$env:Path += ";$env:APPDATA\npm"

# Permission errors
# Check antivirus isn't blocking Node.js
```

**macOS-specific problems:**

```bash
# "Command not found" after install
# Check shell config loaded:
source ~/.zshrc  # or ~/.bashrc

# Permission denied on /usr/local
# Don't use sudo with npm
# Fix permissions:
sudo chown -R $(whoami) /usr/local

# curl install blocked
# Check firewall/VPN settings
```

**Linux-specific problems:**

```bash
# npm not found
# Install Node.js first:
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Global install permission issues
# Configure npm to use home directory:
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### One-Shot Health Check Scripts

Copy-paste diagnostic scripts for instant troubleshooting.

**Windows PowerShell:**

```powershell
Write-Host "`n=== Claude Code Health Check ===" -ForegroundColor Cyan
Write-Host "`n--- Node & npm ---"
node --version
npm --version

Write-Host "`n--- Claude Installation ---"
where.exe claude
if ($?) { Write-Host "✓ Claude found in PATH" -ForegroundColor Green }
else { Write-Host "✗ Claude not in PATH" -ForegroundColor Red }

Write-Host "`n--- Running Claude Doctor ---"
try {
    claude doctor
    Write-Host "✓ Claude doctor completed" -ForegroundColor Green
} catch {
    Write-Host "✗ Claude doctor failed: $_" -ForegroundColor Red
}

Write-Host "`n--- API Key Status ---"
if ($env:ANTHROPIC_API_KEY) {
    Write-Host "✓ ANTHROPIC_API_KEY is set" -ForegroundColor Green
} else {
    Write-Host "✗ ANTHROPIC_API_KEY not set" -ForegroundColor Red
}

Write-Host "`n--- MCP Servers ---"
claude mcp list

Write-Host "`n--- Config Location ---"
$configPath = "$env:USERPROFILE\.claude.json"
if (Test-Path $configPath) {
    Write-Host "✓ Config found at: $configPath" -ForegroundColor Green
} else {
    Write-Host "⚠ No config file at: $configPath" -ForegroundColor Yellow
}

Write-Host "`n=== Health Check Complete ===" -ForegroundColor Cyan
```

**macOS/Linux Bash/Zsh:**

```bash
#!/bin/bash
echo -e "\n=== Claude Code Health Check ==="
echo -e "\n--- Node & npm ---"
node --version
npm --version

echo -e "\n--- Claude Installation ---"
which claude
if [ $? -eq 0 ]; then
    echo "✓ Claude found in PATH"
else
    echo "✗ Claude not in PATH"
fi

echo -e "\n--- Running Claude Doctor ---"
if claude doctor; then
    echo "✓ Claude doctor completed"
else
    echo "✗ Claude doctor failed"
fi

echo -e "\n--- API Key Status ---"
if [ -n "$ANTHROPIC_API_KEY" ]; then
    echo "✓ ANTHROPIC_API_KEY is set"
else
    echo "✗ ANTHROPIC_API_KEY not set"
fi

echo -e "\n--- MCP Servers ---"
claude mcp list

echo -e "\n--- Config Location ---"
if [ -f ~/.claude.json ]; then
    echo "✓ Config found at: ~/.claude.json"
else
    echo "⚠ No config file at: ~/.claude.json"
fi

echo -e "\n=== Health Check Complete ==="
```

**Usage:**
```bash
# Windows: Save as check-claude.ps1 and run
.\check-claude.ps1

# macOS/Linux: Save as check-claude.sh and run
chmod +x check-claude.sh
./check-claude.sh
```

### Full Clean Reinstall Procedures

Nuclear option for corrupted installations. Use when all else fails.

**Windows PowerShell Clean Reinstall:**

```powershell
# ⚠️ Warning: This will delete all Claude Code data and configuration
# Backup your CLAUDE.md files and settings first!

Write-Host "Starting Claude Code clean reinstall..." -ForegroundColor Yellow

# 1. Uninstall
Write-Host "`n[1/5] Uninstalling Claude Code..."
npm uninstall -g @anthropic-ai/claude-code

# 2. Remove shims and binaries
Write-Host "[2/5] Removing npm shims and binaries..."
Remove-Item -Path "$env:APPDATA\npm\claude*" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:APPDATA\npm\node_modules\@anthropic-ai\claude-code" -Recurse -Force -ErrorAction SilentlyContinue

# 3. Delete cache and local data
Write-Host "[3/5] Deleting cache and local data..."
Remove-Item -Path "$env:USERPROFILE\.claude\downloads\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:USERPROFILE\.claude\local" -Recurse -Force -ErrorAction SilentlyContinue

# 4. Backup and remove config (optional - comment out to keep config)
Write-Host "[4/5] Backing up config..."
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
Copy-Item "$env:USERPROFILE\.claude.json" "$env:USERPROFILE\.claude.json.backup-$timestamp" -ErrorAction SilentlyContinue
# Uncomment next line to remove config:
# Remove-Item -Path "$env:USERPROFILE\.claude.json" -Force -ErrorAction SilentlyContinue

# 5. Reinstall
Write-Host "[5/5] Reinstalling Claude Code..."
npm install -g @anthropic-ai/claude-code

Write-Host "`n✓ Clean reinstall complete!" -ForegroundColor Green
Write-Host "Run 'claude --version' to verify installation"
```

**macOS/Linux Clean Reinstall:**

```bash
#!/bin/bash
# ⚠️ Warning: This will delete all Claude Code data and configuration
# Backup your CLAUDE.md files and settings first!

echo "Starting Claude Code clean reinstall..."

# 1. Uninstall
echo -e "\n[1/5] Uninstalling Claude Code..."
npm uninstall -g @anthropic-ai/claude-code

# 2. Remove global bin files
echo "[2/5] Removing npm global files..."
rm -f "$(npm config get prefix)/bin/claude"
rm -rf "$(npm config get prefix)/lib/node_modules/@anthropic-ai/claude-code"

# 3. Delete cache and local data
echo "[3/5] Deleting cache and local data..."
rm -rf ~/.claude/downloads/*
rm -rf ~/.claude/local

# 4. Backup and remove config (optional)
echo "[4/5] Backing up config..."
timestamp=$(date +%Y%m%d-%H%M%S)
cp ~/.claude.json ~/.claude.json.backup-$timestamp 2>/dev/null || true
# Uncomment next line to remove config:
# rm -f ~/.claude.json

# 5. Reinstall
echo "[5/5] Reinstalling Claude Code..."
npm install -g @anthropic-ai/claude-code

echo -e "\n✓ Clean reinstall complete!"
echo "Run 'claude --version' to verify installation"
```

**When to use clean reinstall:**
- Mysterious errors that persist after normal troubleshooting
- Corrupted configuration files
- Breaking changes after Claude Code updates
- Migration to new machine (export/import workflow)

**What gets deleted:**
- ✓ Claude Code binary and npm packages
- ✓ Downloaded models and cache
- ✓ Local session data
- ⚠️ Config file (optional - backed up by default)

**What survives:**
- ✓ Project-level `.claude/` folders
- ✓ Project `CLAUDE.md` files
- ✓ Custom agents, skills, commands, hooks (in projects)
- ✓ MCP server configurations (in `mcp.json`)

## 10.5 Cheatsheet

### One-Page Quick Reference

```
╔══════════════════════════════════════════════════════════╗
║                 CLAUDE CODE CHEATSHEET                   ║
╠══════════════════════════════════════════════════════════╣
║                                                          ║
║  ESSENTIAL COMMANDS                                      ║
║  ─────────────────                                       ║
║  /help      Show commands     /clear    Fresh start      ║
║  /status    Session info      /compact  Save context     ║
║  /plan      Safe mode         /rewind   Undo changes     ║
║  /exit      Quit              Ctrl+C    Cancel           ║
║                                                          ║
║  QUICK ACTIONS                                           ║
║  ─────────────                                           ║
║  !command   Run shell         @file     Reference file   ║
║  Ctrl+R     Retry             ↑/↓       History          ║
║                                                          ║
║  CONTEXT MANAGEMENT                                      ║
║  ──────────────────                                      ║
║  🟢 0-50%   Work freely                                  ║
║  🟡 50-75%  Be selective                                 ║
║  🔴 75-90%  /compact now                                 ║
║  ⚫ 90%+    /clear required                              ║
║                                                          ║
║  PERMISSION MODES                                        ║
║  ────────────────                                         ║
║  Default     Ask before changes                           ║
║  Auto-accept Execute without asking                       ║
║  Plan Mode   Read-only exploration                        ║
║                                                           ║
║  CONFIGURATION                                            ║
║  ─────────────                                            ║
║  ~/.claude/CLAUDE.md         Global settings              ║
║  /project/CLAUDE.md          Project settings             ║
║  .claude/settings.json       Hooks config                 ║
║  .claude/settings.local.json Permission overrides         ║
║                                                           ║
║  .claude/ FOLDER                                          ║
║  ───────────────                                          ║
║  agents/    Custom agents     commands/  Slash commands   ║
║  hooks/     Event scripts     rules/     Auto-load rules  ║
║  skills/    Knowledge modules                             ║
║                                                           ║
║  ULTRATHINK LEVELS                                        ║
║  ─────────────────                                        ║
║  --think        ~4K tokens    Standard analysis           ║
║  --think-hard   ~10K tokens   Deep analysis               ║
║  --ultrathink   ~32K tokens   Maximum depth               ║
║                                                           ║
║  MCP SERVERS                                              ║
║  ───────────                                              ║
║  Serena       Semantic code analysis                      ║
║  Context7     Library documentation                       ║
║  Sequential   Structured reasoning                        ║
║  Postgres     Database queries                            ║
║  Playwright   Browser automation                          ║
║                                                           ║
║  HOOKS (events)                                           ║
║  ──────────────                                           ║
║  PreToolUse       Before tool (security)                  ║
║  PostToolUse      After tool (format, log)                ║
║  UserPromptSubmit On message (enrich context)             ║
║                                                           ║
║  WORKFLOW                                                 ║
║  ────────                                                 ║
║  Describe → Analyze → Review → Accept/Reject → Verify     ║
║                                                           ║
║  BEST PRACTICE: Always read the diff before accepting!    ║
║                                                           ║
╚══════════════════════════════════════════════════════════╝
```

## 10.6 Daily Workflow & Checklists

### Daily Workflow Pattern

```
┌─────────────────────────────────────────────────────────────┐
│                    DAILY WORKFLOW                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  MORNING (Setup)                                            │
│  ───────────────                                            │
│  □ Git pull latest changes                                  │
│  □ Review context with /status                              │
│  □ Load project memory (/sc:load if using Serena)           │
│  □ Review yesterday's progress                              │
│                                                             │
│  WORK SESSION                                               │
│  ────────────                                               │
│  □ Define task clearly before starting                      │
│  □ Use TodoWrite for multi-step work                        │
│  □ Commit after each completed task                         │
│  □ /compact when context >70%                               │
│  □ Take breaks every 90 minutes                             │
│                                                             │
│  END OF DAY                                                 │
│  ──────────                                                 │
│  □ Commit all work in progress                              │
│  □ Save session (/sc:save)                                  │
│  □ Note blockers or next steps                              │
│  □ Push to remote                                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Task-Specific Checklists

#### Bug Fix Checklist
```
□ Reproduce the bug (confirm it exists)
□ Identify root cause (not just symptoms)
□ Write failing test (captures the bug)
□ Implement fix
□ Verify test passes
□ Check for regressions
□ Update documentation if needed
□ Commit with descriptive message
```

#### Feature Implementation Checklist
```
□ Requirements clear? (Ask if not)
□ Design approach documented
□ Break into small tasks (TodoWrite)
□ Implement core functionality first
□ Add tests alongside code
□ Handle error cases
□ Update types/interfaces
□ Run full test suite
□ Code review (self or peer)
□ Documentation updated
```

#### Code Review Checklist
```
□ Code compiles without errors
□ Tests pass (new and existing)
□ No security vulnerabilities
□ Performance implications considered
□ Error handling adequate
□ Code style consistent
□ No commented-out code
□ No debug statements left
□ Documentation updated
```

#### Refactoring Checklist
```
□ Tests exist before refactoring
□ All tests pass before starting
□ Small, incremental changes
□ Run tests after each change
□ No behavior changes (unless intended)
□ Remove dead code
□ Update imports and references
□ Final test run passes
```

### Prompt Quality Checklist

Use this before sending complex requests:

```
□ WHAT: Clear deliverable described?
□ WHERE: File paths/locations specified?
□ HOW: Constraints/approach mentioned?
□ WHY: Context for decision-making?
□ VERIFY: Success criteria defined?
```

**Example applying checklist:**

```
❌ Vague: "Add user authentication"

✅ Complete:
"Add JWT authentication to the /api/login endpoint.
- WHERE: src/api/auth/login.ts
- HOW: Use jsonwebtoken library (already in deps),
       bcrypt for password comparison
- CONSTRAINTS: Token expires in 24h, include userId and role
- VERIFY: Test with wrong password, expired token, invalid token"
```

---

# Appendix: Templates Collection

## A.1 Agent Template

```markdown
---
name: your-agent-name
description: Use this agent when [specific trigger]
model: sonnet
tools: Read, Write, Edit, Bash, Grep, Glob
skills: []
---

# Agent Name

## Role Definition
You are an expert in [domain].

## Activation Triggers
Use this agent when:
- [Trigger 1]
- [Trigger 2]

## Methodology
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Output Format
[Expected deliverables]

## Examples
[Concrete usage examples]
```

## A.2 Skill Template

```markdown
---
name: skill-name
description: Expert guidance for [domain]
allowed-tools: Read, Grep, Bash
context: fork
agent: specialist
---

# Skill Name

## Expertise Areas
- [Area 1]
- [Area 2]

## Methodology
1. [Step 1]
2. [Step 2]

## Checklists
- [ ] [Check 1]
- [ ] [Check 2]

## Examples
[Good and bad patterns]
```

## A.3 Command Template

```markdown
# Command Name

## Purpose
[What this command does]

## Process
1. **Step 1**: [Instructions]
2. **Step 2**: [Instructions]

## Arguments
$ARGUMENTS usage: [How to handle]

## Output Format
[Expected output]
```

## A.4 Hook Templates

### PreToolUse (Security)

```bash
#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')

# Block dangerous patterns
[[ "$COMMAND" =~ "dangerous-pattern" ]] && { echo "BLOCKED" >&2; exit 2; }

exit 0
```

### PostToolUse (Formatting)

```bash
#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""')

# Auto-format
[[ "$FILE_PATH" =~ \.(ts|tsx)$ ]] && npx prettier --write "$FILE_PATH" 2>/dev/null

exit 0
```

### UserPromptSubmit (Context)

```bash
#!/bin/bash
CONTEXT="[Custom context here]"
cat << EOF
{"hookSpecificOutput":{"additionalContext":"$CONTEXT"}}
EOF
exit 0
```

## A.5 settings.json Template

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [{"type": "command", "command": ".claude/hooks/security.sh", "timeout": 5000}]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [{"type": "command", "command": ".claude/hooks/format.sh"}]
      }
    ],
    "UserPromptSubmit": [
      {
        "matcher": "",
        "hooks": [{"type": "command", "command": ".claude/hooks/context.sh"}]
      }
    ]
  }
}
```

## A.6 settings.local.json Template

```json
{
  "permissions": {
    "allow": [
      "Bash(git *)",
      "Bash(npm test)",
      "Bash(pnpm *)",
      "Edit",
      "Write"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(sudo *)"
    ],
    "ask": [
      "Bash(npm publish)",
      "Bash(git push --force)"
    ]
  }
}
```

## A.7 CLAUDE.md Template

```markdown
# Project Name

## Tech Stack
- [Technology 1]
- [Technology 2]

## Code Conventions
- [Convention 1]
- [Convention 2]

## Architecture
- [Pattern 1]
- [Pattern 2]

## Commands
- `npm run dev` - Start development
- `npm test` - Run tests
```

## A.8 Prompt Templates

### Feature Request Prompt
```markdown
## Feature: [Name]

**Deliverable**: [Concrete output]
**Location**: [File paths]

**Requirements**:
1. [Requirement 1]
2. [Requirement 2]

**Constraints**:
- Must use [existing pattern/library]
- Must handle [edge case]

**Acceptance Criteria**:
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Verification**: [Commands to verify]
```

### Bug Fix Prompt
```markdown
## Bug: [Brief description]

**Observed**: [What happens]
**Expected**: [What should happen]
**Reproduce**: [Steps or file:line reference]

**Suspected Cause**: [If known]

**Files to Check**:
- [file1.ts]
- [file2.ts]

**Fix Should**:
- [ ] Resolve the issue
- [ ] Not break existing tests
- [ ] Include test for this case
```

### Refactoring Prompt
```markdown
## Refactor: [Component/Function name]

**Current State**: [What's wrong]
**Target State**: [What we want]
**Scope**: [Files affected]

**Approach**:
1. [Step 1]
2. [Step 2]

**Constraints**:
- No behavior change
- Keep API surface same
- [Other constraints]

**Verify**: [Test commands]
```

### Code Review Prompt
```markdown
## Review: [PR/Files description]

**Focus Areas**:
- [ ] Security vulnerabilities
- [ ] Performance concerns
- [ ] Code style compliance
- [ ] Test coverage

**Context**: [Why these changes]

**Questions**:
1. [Specific question about approach]
2. [Specific question about implementation]
```

### Architecture Discussion Prompt
```markdown
## Architecture: [Topic]

**Current State**:
[Describe current architecture]

**Problem**:
[What's not working or missing]

**Options Considered**:
1. **Option A**: [Description]
   - Pro: [...]
   - Con: [...]
2. **Option B**: [Description]
   - Pro: [...]
   - Con: [...]

**Constraints**:
- [Constraint 1]
- [Constraint 2]

**Questions**:
1. [What you need Claude to analyze]
```

## A.9 Success Metrics & Maturity Model

### Claude Code Maturity Model

| Level | Name | Characteristics | Typical Timeline |
|-------|------|-----------------|------------------|
| 1 | **Beginner** | Uses basic commands, accepts all changes, minimal config | Day 1-7 |
| 2 | **Competent** | Reviews diffs, uses /compact, basic CLAUDE.md | Week 1-2 |
| 3 | **Proficient** | Creates agents, uses hooks, Plan Mode mastery | Week 2-4 |
| 4 | **Advanced** | MCP servers, multi-agent workflows, full automation | Month 1-2 |
| 5 | **Expert** | Custom tooling, CI/CD integration, team patterns | Month 2+ |

### Success Metrics by Area

#### Productivity Metrics
| Metric | Beginner | Proficient | Expert |
|--------|----------|------------|--------|
| Tasks completed/day | 2-3 | 5-7 | 10+ |
| Context resets/day | 3+ | 1-2 | 0-1 |
| Rejected changes | <30% | <10% | <5% |
| Time to first commit | >1h | 30min | <15min |

#### Quality Metrics
| Metric | Target | Measure |
|--------|--------|---------|
| Test coverage | >80% | Coverage reports |
| Type errors | 0 | `tsc --noEmit` |
| Lint violations | 0 | Linter output |
| Security issues | 0 | Security scan |

#### Efficiency Metrics
| Metric | Baseline | Optimized |
|--------|----------|-----------|
| Context usage | ~90% | <70% |
| Parallel operations | None | 3-5 simultaneous |
| Agent delegation | Never | When appropriate |
| Hook automation | None | Full automation |

### Self-Assessment Checklist

#### Day 1 Proficiency
```
□ Can start Claude Code session
□ Know essential commands (/help, /clear, /status)
□ Understand permission prompts
□ Can describe tasks clearly
□ Know how to cancel operations (Ctrl+C)
```

#### Week 1 Proficiency
```
□ Use /compact to manage context
□ Review diffs before accepting
□ Have basic CLAUDE.md setup
□ Understand Plan Mode purpose
□ Can use file references (@filename)
```

#### Month 1 Proficiency
```
□ Created at least 1 custom agent
□ Use hooks for automation
□ Understand MCP server selection
□ Can manage multi-step tasks
□ Use appropriate think levels
```

### Improvement Tracking

```markdown
## Weekly Retrospective Template

**Week of**: [Date]

**Accomplishments**:
- [Major task completed]
- [Skill learned]

**Challenges**:
- [What was difficult]
- [Where Claude struggled]

**Improvements Made**:
- [Config change]
- [New pattern adopted]

**Next Week Goals**:
- [ ] [Improvement 1]
- [ ] [Improvement 2]

**Claude Usage Stats**:
- Sessions: [count]
- Avg context at reset: [%]
- Commands created: [count]
- Agents created: [count]
```

---

## A.10 Emergency Hotfix Checklist

When you need to fix production issues quickly and safely.

### Pre-Hotfix Phase (2-5 minutes)

```markdown
## Emergency Hotfix Protocol

**Incident**: [Brief description]
**Impact**: [User/system impact]
**Priority**: 🔴 Critical / 🟠 High / 🟡 Medium

### Step 1: Assess & Isolate
□ Verify the issue is reproducible
□ Check error logs/monitoring for root cause indicators
□ Estimate blast radius (how many users affected)
□ Create incident channel/ticket

### Step 2: Environment Setup
□ Create hotfix branch: `git checkout -b hotfix/[issue-name]`
□ Pull latest production: `git pull origin main`
□ Verify local environment matches production
□ Document current state (git commit hash, deployment time)

### Step 3: Context Preparation
□ Open Claude Code in project root
□ Set explicit scope: "Working on hotfix for [issue]"
□ Use Plan Mode first: `/plan` (safer for critical changes)
□ Load relevant error logs/stack traces
```

### Hotfix Development (5-15 minutes)

```markdown
### Step 4: Fix Implementation
□ Use Claude to locate issue: "Find where [error] occurs"
□ Review proposed fix carefully (critical code path)
□ Prefer minimal changes (smaller diff = lower risk)
□ Add defensive checks if time permits

### Step 5: Immediate Verification
□ Run affected test suite: `npm test [related tests]`
□ Manual smoke test of fixed functionality
□ Test edge cases that triggered the issue
□ Verify no regression in related features
```

### Post-Fix Phase (5-10 minutes)

```markdown
### Step 6: Commit & Deploy
□ Create focused commit: `git add [changed files]`
□ Write clear commit message:
   "hotfix: [verb] [what was broken]

   - Root cause: [brief explanation]
   - Fix: [what changed]
   - Tested: [how verified]

   Fixes #[incident-number]"

□ Push hotfix branch: `git push origin hotfix/[issue-name]`
□ Create PR with "HOTFIX" label
□ Tag reviewer(s) for immediate review
□ Include before/after behavior in PR description

### Step 7: Deploy & Monitor
□ Deploy to staging first if possible (even for hotfixes)
□ Monitor staging for 2-3 minutes
□ Deploy to production
□ Watch error rates/logs for 5-10 minutes
□ Verify issue is resolved in production
□ Update incident channel/ticket

### Step 8: Post-Mortem (Schedule later)
□ Document root cause analysis
□ Identify why this wasn't caught earlier
□ Add tests/monitoring to prevent recurrence
□ Update CLAUDE.md with lessons learned
□ Schedule team discussion if systemic issue
```

### Hotfix Anti-Patterns

| ❌ Don't | ✅ Do |
|---------|------|
| Skip tests "to save time" | Run at minimum the affected tests |
| Make "while we're here" improvements | Fix ONLY the immediate issue |
| Deploy without code review | Get at least one approval (async if urgent) |
| Forget to monitor after deploy | Watch for 10+ minutes post-deploy |
| Skip documentation | Update incident log immediately |
| Work on main branch | Always use hotfix branch |

### Time-Based Decision Matrix

| Time Available | Approach |
|----------------|----------|
| **< 5 min** | Rollback to previous version, fix properly later |
| **5-15 min** | Minimal fix, comprehensive testing later |
| **15-30 min** | Proper fix with tests, still monitor closely |
| **> 30 min** | Not a hotfix, follow normal development process |

### Claude Code Hotfix Commands

```markdown
# Use Plan Mode for safety
/plan

# Ask Claude to assess
"Analyze this error log and suggest the safest minimal fix"

# Get focused context
"Read only the [affected module], not the entire codebase"

# Verify fix
"What are the potential side effects of this change?"

# Generate tests
"Create a test that would have caught this bug"
```

### Communication Template

```markdown
## Hotfix Status Update

**Status**: [In Progress / Deployed / Monitoring]
**Issue**: [One-line description]
**Fix**: [One-line solution]
**ETA**: [Timeframe]
**Risk**: Low/Medium/High
**Monitoring**: [What we're watching]

**Next Steps**:
- [ ] [Action 1]
- [ ] [Action 2]
```

## A.11 Git Archaeology Pattern

Use Claude Code to understand legacy code through git history analysis.

### Why Git Archaeology?

Understanding **why** code exists is often more valuable than understanding **what** it does.

| Question | Traditional Approach | Git Archaeology Approach |
|----------|---------------------|-------------------------|
| Why this weird workaround? | Guess or ask someone | Check commit that added it |
| Why was this refactored? | Search Slack/docs | Read PR description |
| When did this bug appear? | Binary search testing | `git bisect` with Claude |
| Who knows this code? | Check Slack or guess | See commit authors |

### Pattern 1: Understanding Mysterious Code

**Scenario**: You found confusing code and want to know why it exists.

```markdown
# Step 1: Find the commit
You: "Run git blame on [file:line] to find when this code was added"

# Step 2: Get commit context
You: "Show me the full commit with git show [commit-hash]"

# Step 3: Find related discussion
You: "Search for the PR or issue related to this commit"

# Step 4: Summarize
You: "Explain why this code exists based on the commit history"
```

**Example**:

```
You: Why does user.ts:45 have this strange null check?

Claude: Let me investigate...
- Runs: git blame src/user.ts
- Finds commit: abc123 "fix: handle legacy user objects"
- Reads commit message: "Older user records don't have email field"
- Conclusion: It's a backward compatibility fix from 2023 migration
```

### Pattern 2: Tracking Feature Evolution

**Scenario**: Understand how a feature evolved over time.

```markdown
# Get all commits related to a feature
You: "Find all commits that mention 'authentication' in the last 6 months"

Claude runs:
git log --grep="authentication" --since="6 months ago" --oneline

# Analyze the evolution
You: "Summarize how authentication changed over these commits"

Claude provides timeline:
- Jan: Initial OAuth implementation
- Feb: Added 2FA support
- Mar: Migrated to JWT
- Apr: Added session refresh
```

### Pattern 3: Finding When Bugs Were Introduced

**Scenario**: A bug exists now but didn't before. Find when it appeared.

```markdown
# Manual approach
You: "Help me use git bisect to find when [bug] was introduced"

Claude guides you:
1. git bisect start
2. git bisect bad [current commit]
3. git bisect good [known good commit]
4. Claude tests each bisect step
5. Identifies the breaking commit

# Automated with Claude
You: "Write a script to test if [bug] exists, then use git bisect run"

Claude creates:
- Test script that exits 0 (good) or 1 (bad)
- Runs git bisect automatically
- Reports the exact commit that introduced the bug
```

### Pattern 4: Finding Domain Experts

**Scenario**: Who should review this code?

```markdown
You: "Who has worked on [file/directory] most?"

Claude runs:
git shortlog -sn -- [path]

Result:
42  Alice Johnson
18  Bob Smith
5   Carol White

Interpretation: Alice is the domain expert
```

### Pattern 5: Understanding Deleted Code

**Scenario**: Code was deleted but you want to understand what it did.

```markdown
# Find when code was deleted
You: "Search git history for when [function name] was removed"

Claude runs:
git log -c -S'[function name]' --all

# Restore and analyze
You: "Show me what [function name] did before it was deleted"

Claude:
1. Finds the deletion commit
2. Shows commit^ (before deletion)
3. Extracts and explains the old implementation
4. Explains why it was removed (from commit message)
```

### Pattern 6: Comparing Implementations

**Scenario**: The code changed drastically. Why?

```markdown
You: "Compare how [feature] was implemented in:
- Current version
- Version from 6 months ago"

Claude:
1. git show HEAD:[file]
2. git show HEAD~6mo:[file]
3. Highlights key differences
4. Explains evolution reasoning from commit messages
```

### Claude-Optimized Git Commands

```bash
# Most useful for archaeology

# Find commits by content
git log -S'[search term]' --oneline

# Find commits by message
git log --grep='[pattern]' --oneline

# See file history with diffs
git log -p [file]

# Who wrote which lines
git blame [file]

# Find when a file was deleted
git log --all --full-history -- [file]

# See commit with context
git show [commit-hash]

# List all files changed in commit
git diff-tree --no-commit-id --name-only -r [commit]

# See commits that touched a line range
git log -L [start],[end]:[file]
```

### Archaeology Prompt Template

```markdown
## Git Archaeology Request

**Goal**: [Understand why X exists / Find when Y broke / Find expert for Z]

**Starting Point**:
- File: [path]
- Line: [line number or function name]
- Current behavior: [what you see]

**Questions**:
1. When was this code introduced?
2. Why was it introduced (commit message, PR discussion)?
3. Has it changed since? If so, why?
4. Who are the authors/experts?

**Output Needed**:
- Timeline of changes
- Original intent (from commits/PRs)
- Current maintainers
```

### Real-World Examples

**Example 1: Understanding a Workaround**

```
Developer: "Why is there a setTimeout() in the login flow?"

Claude investigates:
- git blame → Commit in 2022 by Bob
- git show [commit] → "fix: wait for analytics to load"
- Finds related issue #543 → "Login fails if analytics blocked"
- Conclusion: It's a workaround for a race condition

Recommendation: "This may be obsolete if we're using modern analytics now"
```

**Example 2: Finding Breaking Change**

```
Developer: "Tests started failing sometime this week"

Claude runs:
- git bisect with test suite
- Identifies commit: "refactor: simplify validation logic"
- git show [commit] → Changed how empty strings are validated
- Fix: Update tests to match new validation behavior
```

**Example 3: Removing Dead Code**

```
Developer: "Can we delete this old Payment class?"

Claude checks:
- git log → Last modified 2 years ago
- git grep "Payment" → No references found
- git log --grep="Payment" → See migration commit "Moved to Stripe API"
- Conclusion: Safe to delete, no longer used
```

### Archaeology Anti-Patterns

| ❌ Don't | ✅ Do |
|---------|------|
| Ignore commit messages | Read full context with `git show` |
| Assume old code is wrong | Understand the constraints that led to it |
| Delete code without checking history | Verify why it was added before removing |
| Skip checking for related PRs | Search for issue numbers in commits |

---

## Further Reading

### Nick Tune: Coding Agent Development Workflows

**Article**: [Coding Agent Development Workflows](https://medium.com/nick-tune-tech-strategy-blog/coding-agent-development-workflows-af52e6f912aa) by Nick Tune

Nick Tune's article explores a more **autonomous, pipeline-driven approach** to AI-assisted development. His workflow aims for fully autonomous task completion: the agent starts from a ticket and delivers a mergeable PR with minimal human intervention.

**Key concepts from his approach**:

| Concept | Description |
|---------|-------------|
| **Task Completion Pipeline** | Orchestrated flow: local checks → code review → PR → CI → auto-fix → loop until mergeable |
| **Single Source of Truth** | All conventions in `/docs/`, referenced by every tool (Claude, CodeRabbit, SonarQube) |
| **Shell vs AI Decision** | Deterministic tasks = bash scripts; interpretation needed = AI agents |
| **Verify Gate** | Build/lint/test must pass locally BEFORE PR creation |
| **Continuous Improvement** | Every manual intervention = opportunity to improve the workflow |

**His approach vs this guide**:

| Aspect | This Guide | Nick Tune's Approach |
|--------|------------|---------------------|
| **Focus** | Learning Claude Code comprehensively | Optimizing autonomous workflows |
| **Audience** | Beginners to advanced | Advanced practitioners |
| **Philosophy** | Master the tool, then customize | Automate aggressively from day one |
| **Workflow** | Interactive, human-in-the-loop | Autonomous, human-at-the-end |
| **Tooling** | Claude Code-centric | Multi-tool orchestration (CodeRabbit, SonarQube, GitHub GraphQL) |

**When to adopt his patterns**:

- You're comfortable with Claude Code basics
- You want near-autonomous PR generation
- You have CI/CD infrastructure (GitHub Actions, CodeRabbit, etc.)
- You're working on a project where you can invest in workflow setup

**Recommended reading order**:
1. This guide (master fundamentals)
2. Nick Tune's article (advanced automation)

### DeepSeek Integration

Use DeepSeek's Claude-compatible API as a cost-effective alternative to Anthropic's models.

#### Overview

DeepSeek offers Claude-compatible API endpoints, allowing you to use Claude Code with DeepSeek's models at significantly reduced costs. This is particularly useful for:

- High-volume development work
- Learning and experimentation
- Budget-constrained projects
- Non-critical tasks where slight quality trade-offs are acceptable

#### Setup

**Prerequisites:**
- Claude Code installed: `npm install -g @anthropic-ai/claude-code`
- DeepSeek API key from [platform.deepseek.com](https://platform.deepseek.com)

**1. Get DeepSeek API Key:**

Visit [platform.deepseek.com](https://platform.deepseek.com), create an account, and generate an API key.

**2. Configure Environment Variables:**

```bash
# Set DeepSeek as your LLM provider
export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
export ANTHROPIC_AUTH_TOKEN=YOUR_DEEPSEEK_API_KEY
export ANTHROPIC_MODEL=deepseek-chat
export ANTHROPIC_SMALL_FAST_MODEL=deepseek-chat
```

**Windows PowerShell:**
```powershell
$env:ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
$env:ANTHROPIC_AUTH_TOKEN="YOUR_DEEPSEEK_API_KEY"
$env:ANTHROPIC_MODEL="deepseek-chat"
$env:ANTHROPIC_SMALL_FAST_MODEL="deepseek-chat"
```

**3. Persist Configuration (Optional):**

**macOS/Linux** - Add to `~/.zshrc` or `~/.bashrc`:
```bash
echo 'export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic' >> ~/.zshrc
echo 'export ANTHROPIC_AUTH_TOKEN=YOUR_DEEPSEEK_API_KEY' >> ~/.zshrc
echo 'export ANTHROPIC_MODEL=deepseek-chat' >> ~/.zshrc
echo 'export ANTHROPIC_SMALL_FAST_MODEL=deepseek-chat' >> ~/.zshrc
source ~/.zshrc
```

**Windows** - Set permanent environment variables:
```powershell
[System.Environment]::SetEnvironmentVariable('ANTHROPIC_BASE_URL', 'https://api.deepseek.com/anthropic', 'User')
[System.Environment]::SetEnvironmentVariable('ANTHROPIC_AUTH_TOKEN', 'YOUR_DEEPSEEK_API_KEY', 'User')
[System.Environment]::SetEnvironmentVariable('ANTHROPIC_MODEL', 'deepseek-chat', 'User')
[System.Environment]::SetEnvironmentVariable('ANTHROPIC_SMALL_FAST_MODEL', 'deepseek-chat', 'User')
```

**4. Launch Claude Code:**

```bash
claude
```

Claude Code will now use DeepSeek's API instead of Anthropic's.

#### Cost Comparison

| Provider | Model | Input Cost (per 1M tokens) | Output Cost (per 1M tokens) | Total (avg) |
|----------|-------|---------------------------|-----------------------------|-------------|
| **Anthropic** | Claude Sonnet 4 | $3.00 | $15.00 | ~$9.00 |
| **DeepSeek** | deepseek-chat | $0.14 | $0.28 | ~$0.21 |
| **Savings** | - | **95% reduction** | **98% reduction** | **~98% savings** |

**Example cost for 10M tokens:**
- Anthropic Sonnet: ~$90
- DeepSeek: ~$2.10
- **Savings: $87.90**

#### Use Cases

**✅ Good fit for DeepSeek:**
- Learning and experimentation
- Code reviews and analysis
- Documentation generation
- Refactoring and code cleanup
- Simple feature implementation
- High-volume development work
- Personal projects with budget constraints

**⚠️ Use Anthropic for:**
- Complex architectural decisions
- Mission-critical production code
- Advanced reasoning tasks (--ultrathink scenarios)
- Tasks requiring latest Claude capabilities
- When quality is more important than cost

#### Limitations & Trade-offs

**Performance Differences:**
- DeepSeek models may have different reasoning capabilities than Claude
- Some advanced features may not work identically
- Response quality may vary, especially for complex tasks
- Context window and capabilities differ from Claude models

**Compatibility:**
- Most Claude Code features work normally
- MCP servers function as expected
- Agents, skills, and hooks work without modification
- Some model-specific features may behave differently

**Recommendations:**
- Test DeepSeek with your specific use cases before committing
- Compare output quality for your domain
- Use for development; consider Anthropic for production decisions
- Monitor quality and switch back if needed

#### Switching Between Providers

You can easily switch between Anthropic and DeepSeek:

**Create shell aliases (macOS/Linux):**

```bash
# Add to ~/.zshrc or ~/.bashrc
alias claude-anthropic='unset ANTHROPIC_BASE_URL && claude'
alias claude-deepseek='export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic && claude'
```

**PowerShell functions (Windows):**

```powershell
# Add to $PROFILE
function claude-anthropic {
    $env:ANTHROPIC_BASE_URL = $null
    claude
}

function claude-deepseek {
    $env:ANTHROPIC_BASE_URL = "https://api.deepseek.com/anthropic"
    claude
}
```

**Usage:**
```bash
# Use Anthropic (default)
claude-anthropic

# Use DeepSeek
claude-deepseek
```

#### Project-Specific Configuration

Use different providers for different projects:

**Option 1: Environment file**

Create `.env` in project root:
```bash
# .env - Use DeepSeek for this project
ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
ANTHROPIC_AUTH_TOKEN=YOUR_DEEPSEEK_API_KEY
ANTHROPIC_MODEL=deepseek-chat
```

Load before running Claude:
```bash
source .env && claude
```

**Option 2: Shell wrapper script**

Create `claude-dev.sh`:
```bash
#!/bin/bash
export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
export ANTHROPIC_AUTH_TOKEN=$DEEPSEEK_API_KEY
export ANTHROPIC_MODEL=deepseek-chat
claude "$@"
```

Usage:
```bash
chmod +x claude-dev.sh
./claude-dev.sh
```

#### Resources

- **DeepSeek API Documentation**: [api-docs.deepseek.com/guides/anthropic_api](https://api-docs.deepseek.com/guides/anthropic_api)
- **DeepSeek Platform**: [platform.deepseek.com](https://platform.deepseek.com)
- **DeepSeek Pricing**: [platform.deepseek.com/pricing](https://platform.deepseek.com/pricing)
- **Claude Code Compatibility**: Works with Claude Code 1.0+

> **Note**: DeepSeek is a third-party provider. This guide does not endorse any specific provider. Evaluate based on your needs, budget, and quality requirements.

### Community Resources

The Claude Code ecosystem is growing rapidly. Here are curated resources to continue learning:

#### Awesome Lists

| Repository | Focus | Last Updated |
|------------|-------|--------------|
| [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) | Commands, workflows, IDE integrations | Apr 2025 |
| [awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) | Custom skills collection | Oct 2025 |
| [awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) | Full-stack & DevOps subagents | Jul 2025 |
| [awesome-claude](https://github.com/alvinunreal/awesome-claude) | General Claude resources (SDKs, tools) | Aug 2025 |
| [awesome-claude-prompts](https://github.com/langgptai/awesome-claude-prompts) | Prompt templates for various use cases | 2023 |

#### Frameworks

| Framework | Description | Link |
|-----------|-------------|------|
| **SuperClaude** | Advanced configuration framework with 30+ commands (`/sc:*`), cognitive personas, and MCP integration | [GitHub](https://github.com/SuperClaude-Org/SuperClaude_Framework) |

SuperClaude transforms Claude Code into a structured development platform through behavioral instruction injection. Key features:
- 30+ specialized commands for common dev tasks
- Smart personas for different contexts
- MCP server integration
- Task management and session persistence

#### Learning Sites

| Site | Description |
|------|-------------|
| [Claudelog.com](https://claudelog.com/) | Tips, patterns, tutorials, and best practices |
| [Official Docs](https://docs.anthropic.com/en/docs/claude-code) | Anthropic's official Claude Code documentation |

> **Tip**: These resources evolve quickly. Star repos you find useful to track updates.

### Tools

#### Audit Your Setup

Use the included audit prompt to analyze your current Claude Code configuration:

**File**: [`claude-setup-audit-prompt.md`](./claude-setup-audit-prompt.md)

**What it does**:
1. Scans your global (`~/.claude/`) and project (`.claude/`) configuration
2. Compares against best practices from this guide
3. Generates a prioritized report with actionable recommendations
4. Provides ready-to-use templates tailored to your tech stack

**How to use**:
1. Copy the prompt from the file
2. Run `claude --ultrathink` in your project directory
3. Paste the prompt and review findings
4. Choose which recommendations to implement

**Example output**:

| Priority | Element | Status | Action |
|----------|---------|--------|--------|
| 🔴 High | Project CLAUDE.md | ❌ | Create with tech stack + conventions |
| 🟡 Medium | Security hooks | ⚠️ | Add PreToolUse for secrets check |
| 🟢 Low | MCP Serena | ❌ | Configure for large codebase |

The audit covers: Memory files, folder structure, agents, hooks, MCP servers, context management, and CI/CD integration patterns.

---

## Appendix A: File Locations Reference

Quick reference for where Claude Code stores files and configuration.

### Windows

| Component | Location |
|-----------|----------|
| **npm global bin** | `C:\Users\<username>\AppData\Roaming\npm` |
| **Node.js install** | `C:\Program Files\nodejs` |
| **Claude data directory** | `C:\Users\<username>\.claude\` |
| **Claude config file** | `C:\Users\<username>\.claude.json` |
| **Log files** | `%APPDATA%\Claude\logs\` |
| **MCP config** | `C:\Users\<username>\.claude\mcp.json` |
| **Session data** | `C:\Users\<username>\.claude\local\` |
| **Downloads/cache** | `C:\Users\<username>\.claude\downloads\` |

**Quick Access (PowerShell):**
```powershell
# Open Claude data directory
explorer "$env:USERPROFILE\.claude"

# Open config file
notepad "$env:USERPROFILE\.claude.json"

# View logs
Get-Content "$env:APPDATA\Claude\logs\mcp*.log" -Wait -Tail 50
```

### macOS

| Component | Location |
|-----------|----------|
| **npm global bin** | `/usr/local/bin` or `$(npm config get prefix)/bin` |
| **Node.js install** | `/usr/local/bin/node` (Homebrew) or `/opt/homebrew/bin/node` (M1/M2) |
| **Claude data directory** | `~/.claude/` |
| **Claude config file** | `~/.claude.json` |
| **Log files** | `~/Library/Logs/Claude/` |
| **MCP config** | `~/.claude/mcp.json` |
| **Session data** | `~/.claude/local/` |
| **Downloads/cache** | `~/.claude/downloads/` |

**Quick Access:**
```bash
# Open Claude data directory
open ~/.claude

# Edit config file
code ~/.claude.json  # VS Code
# or
nano ~/.claude.json  # Terminal editor

# View logs
tail -f ~/Library/Logs/Claude/mcp*.log
```

### Linux

| Component | Location |
|-----------|----------|
| **npm global bin** | `/usr/local/bin` or `~/.npm-global/bin` |
| **Node.js install** | `/usr/bin/node` |
| **Claude data directory** | `~/.claude/` |
| **Claude config file** | `~/.claude.json` |
| **Log files** | `~/.local/share/claude/logs/` or `~/.cache/claude/logs/` |
| **MCP config** | `~/.claude/mcp.json` |
| **Session data** | `~/.claude/local/` |
| **Downloads/cache** | `~/.claude/downloads/` |

**Quick Access:**
```bash
# Open Claude data directory
cd ~/.claude

# Edit config file
nano ~/.claude.json
# or
vim ~/.claude.json

# View logs
tail -f ~/.local/share/claude/logs/mcp*.log
```

### Project-Level Files

These are the same across all platforms:

| File/Directory | Location | Purpose | Commit to Git? |
|----------------|----------|---------|----------------|
| `CLAUDE.md` | Project root | Project memory (team) | ✅ Yes |
| `.claude/CLAUDE.md` | Project root | Personal memory | ❌ No |
| `.claude/settings.json` | Project root | Hook configuration | ✅ Yes |
| `.claude/settings.local.json` | Project root | Personal permissions | ❌ No |
| `.claude/agents/` | Project root | Custom agents | ✅ Yes (team) |
| `.claude/commands/` | Project root | Custom commands | ✅ Yes (team) |
| `.claude/hooks/` | Project root | Event hooks | ✅ Yes (team) |
| `.claude/skills/` | Project root | Knowledge modules | ✅ Yes (team) |
| `.claude/rules/` | Project root | Auto-load rules | ✅ Yes (team) |
| `.claude/.serena/` | Project root | Serena MCP index | ❌ No |

### Environment Variables

Set these in your shell profile (`~/.zshrc`, `~/.bashrc`, or Windows System Properties):

| Variable | Purpose | Example |
|----------|---------|---------|
| `ANTHROPIC_API_KEY` | API authentication | `sk-ant-api03-...` |
| `ANTHROPIC_BASE_URL` | Alternative API endpoint | `https://api.deepseek.com/anthropic` |
| `ANTHROPIC_MODEL` | Default model | `claude-sonnet-4-20250514` |
| `ANTHROPIC_SMALL_FAST_MODEL` | Fast model for simple tasks | `claude-haiku-4-20250514` |
| `BASH_DEFAULT_TIMEOUT_MS` | Bash command timeout | `60000` |
| `ANTHROPIC_AUTH_TOKEN` | Alternative auth (DeepSeek) | Your DeepSeek API key |

### Finding Your Paths

**Can't find npm global bin?**
```bash
# Universal command
npm config get prefix

# Should output something like:
# macOS/Linux: /usr/local or ~/.npm-global
# Windows: C:\Users\<username>\AppData\Roaming\npm
```

**Can't find Claude executable?**
```bash
# macOS/Linux
which claude

# Windows (PowerShell)
where.exe claude

# Windows (CMD)
where claude
```

**Can't find log files?**
```bash
# Run Claude with debug and check output
claude --debug 2>&1 | grep -i "log"
```

### Recommended .gitignore

Add these to your project's `.gitignore`:

```gitignore
# Claude Code - Personal/Local
.claude/settings.local.json
.claude/CLAUDE.md
.claude/.serena/
.claude/local/

# Claude Code - Team (DO commit these)
# .claude/agents/
# .claude/commands/
# .claude/hooks/
# .claude/skills/
# .claude/settings.json

# API Keys
.env
.env.local
.env.*.local
*.key

# OS Files
.DS_Store
Thumbs.db
```

---

## About This Guide

**End of Guide**

---

**Author**: [Florian BRUNIAUX](https://github.com/FlorianBruniaux) | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr)

**Written with**: Claude (Anthropic) - This guide was collaboratively written with Claude Code, demonstrating the tool's capabilities for technical documentation.

**Inspired by**:
- [Claudelog.com](https://claudelog.com/) - An excellent resource for Claude Code tips, patterns, and advanced techniques that served as a major reference for this guide.
- [Nick Tune's Coding Agent Development Workflows](https://medium.com/nick-tune-tech-strategy-blog/coding-agent-development-workflows-af52e6f912aa) - Advanced workflow patterns integrated in sections 3.1, 7.1, 9.3, and 9.10.

**License**: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) - Feel free to use, adapt, and share with attribution.

**Contributions**: Issues and PRs welcome.

**Last updated**: January 2026 | **Version**: 2.0
