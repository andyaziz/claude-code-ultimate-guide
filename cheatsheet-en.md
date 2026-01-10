# Claude Code Cheatsheet

**1 printable page** - Daily essentials for maximum productivity

**Author**: Florian BRUNIAUX | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr)

**Written with**: Claude (Anthropic)

**Version**: 2.0 | **Last Updated**: January 2025

---

## Essential Commands

| Command | Action |
|---------|--------|
| `/help` | Contextual help |
| `/clear` | Reset conversation |
| `/compact` | Free up context |
| `/context` | View token usage |
| `/status` | Session state |
| `/exit` | Quit (or Ctrl+D) |

---

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Shift+Tab` | Cycle permission modes |
| `Esc` × 2 | Rewind (undo) |
| `Ctrl+C` | Interrupt |
| `Tab` | Autocomplete |
| `Shift+Enter` | New line |
| `Ctrl+D` | Exit |

---

## File References

```
@path/to/file.ts    → Reference a file
@agent-name         → Call an agent
!shell-command      → Run shell command
```

| IDE | Shortcut |
|-----|----------|
| VS Code | `Alt+K` |
| JetBrains | `Cmd+Option+K` |

---

## Permission Modes

| Mode | Editing | Execution |
|------|---------|-----------|
| Default | Asks | Asks |
| Auto-accept | Auto | Asks |
| Plan Mode | ❌ | ❌ |

**Shift+Tab** to switch modes

---

## Memory & Settings (2 levels)

| Level | macOS/Linux | Windows | Scope | Git |
|-------|-------------|---------|-------|-----|
| **Project** | `.claude/` | `.claude\` | Team | ✅ |
| **Personal** | `~/.claude/` | `%USERPROFILE%\.claude\` | You (all projects) | ❌ |

**Priority**: Project overrides Personal

| File | Where | Usage |
|------|-------|-------|
| `CLAUDE.md` | Project root | Team memory (instructions) |
| `settings.json` | `.claude/` | Team settings (hooks) |
| `settings.local.json` | `.claude/` | Your setting overrides |
| `CLAUDE.md` | `~/.claude/` (Win: `%USERPROFILE%\.claude\`) | Personal memory |

---

## .claude/ Folder Structure

```
.claude/
├── CLAUDE.md           # Local memory (gitignored)
├── settings.json       # Hooks (committed)
├── settings.local.json # Permissions (not committed)
├── agents/             # Custom agents
├── commands/           # Slash commands
├── hooks/              # Event scripts
├── rules/              # Auto-loaded rules
└── skills/             # Knowledge modules
```

---

## Typical Workflow

```
1. Start session      → claude
2. Check context      → /status
3. Plan Mode          → Shift+Tab × 2 (for complex tasks)
4. Describe task      → Clear, specific prompt
5. Review changes     → Always read the diff!
6. Accept/Reject      → y/n
7. Verify             → Run tests
8. Commit             → When task complete
9. /compact           → When context >70%
```

---

## Context Management (CRITICAL)

### Statusline

```
Model: Sonnet | Ctx: 89.5k | Cost: $2.11 | Ctx(u): 56.0%
```
**Watch `Ctx(u):`** → >70% = `/compact`, >85% = `/clear`

### Actions by Symptom

| Sign | Action |
|------|--------|
| Short responses | `/compact` |
| Frequent forgetting | `/clear` |
| >70% context | `/compact` |
| Task complete | `/clear` |

### Context Recovery Commands

| Command | Usage |
|---------|-------|
| `/compact` | Summarize and free context |
| `/clear` | Fresh start |
| `/resume` | Resume previous session |
| `/rewind` | Undo recent changes |

---

## Plan Mode & Think Levels

| Feature | Activation | Usage |
|---------|------------|-------|
| **Plan Mode** | `Shift+Tab × 2` or `/plan` | Explore without modifying |
| **OpusPlan** | `/model opusplan` | Opus for planning, Sonnet for execution |
| **Think** | `--think` flag | Standard analysis (~4K tokens) |
| **Think Hard** | `--think-hard` flag | Deep analysis (~10K tokens) |
| **Ultrathink** | `--ultrathink` flag | Maximum depth (~32K tokens) |

**OpusPlan workflow**: `/model opusplan` → `Shift+Tab × 2` (plan with Opus) → `Shift+Tab` (execute with Sonnet)

**Required for**: features >3 files, architecture, complex debugging

---

## MCP Servers

| Server | Purpose |
|--------|---------|
| **Serena** | Indexation + session memory + symbol search |
| **mgrep** | Semantic search by intent (alternative) |
| **Context7** | Library documentation |
| **Sequential** | Structured reasoning |
| **Playwright** | Browser automation |
| **Postgres** | Database queries |

**Serena memory**: `write_memory()` / `read_memory()` / `list_memories()`

Check status: `/mcp`

---

## Creating Custom Components

### Agent (`.claude/agents/my-agent.md`)
```yaml
---
name: my-agent
description: Use when [trigger]
model: sonnet
tools: Read, Write, Edit, Bash
---
# Instructions here
```

### Command (`.claude/commands/my-command.md`)
```markdown
# Command Name
Instructions for what to do...
$ARGUMENTS - user provided args
```

### Hook (macOS/Linux: `.sh` | Windows: `.ps1`)

**Bash** (macOS/Linux):
```bash
#!/bin/bash
INPUT=$(cat)
# Process JSON input
exit 0  # 0=continue, 2=block
```

**PowerShell** (Windows):
```powershell
$input = [Console]::In.ReadToEnd() | ConvertFrom-Json
# Process JSON input
exit 0  # 0=continue, 2=block
```

---

## Anti-patterns

| ❌ Don't | ✅ Do |
|----------|-------|
| Vague prompts | Specify file + line |
| Accept without reading | Read every diff |
| Ignore warnings | Use `/compact` |
| Skip permissions | Never in production |
| Giant context loads | Load only what's needed |
| Negative constraints only | Provide alternatives |

---

## Quick Prompting Formula

```
WHAT: [Concrete deliverable]
WHERE: [File paths]
HOW: [Constraints, approach]
VERIFY: [Success criteria]
```

**Example:**
```
Add input validation to the login form.
WHERE: src/components/LoginForm.tsx
HOW: Use Zod schema, show inline errors
VERIFY: Empty email shows error, invalid format shows error
```

---

## CLI Flags Quick Reference

| Flag | Usage |
|------|-------|
| `-p "query"` | Non-interactive mode |
| `--model sonnet` | Change model |
| `--add-dir ../lib` | Add directory |
| `--permission-mode plan` | Plan mode |
| `--dangerously-skip-permissions` | Auto-accept (⚠️ use carefully) |
| `--debug` | Debug output |
| `--mcp-debug` | Debug MCP servers |
| `--allowedTools "Edit,Read"` | Whitelist tools |
| `--disallowedTools "WebFetch"` | Blacklist tools |

---

## Debug Commands

```bash
claude --version     # Version
claude doctor        # Diagnostic
claude --debug       # Verbose mode
claude --mcp-debug   # Debug MCPs
/mcp                 # MCP status (inside Claude)
```

---

## CI/CD Mode (Headless)

```bash
# Non-interactive execution
claude -p "analyze this file" src/api.ts

# JSON output
claude -p "review" --output-format json

# Economic model
claude -p "lint" --model haiku

# With auto-accept
claude -p "fix typos" --dangerously-skip-permissions
```

---

## The Golden Rules

1. **Always review diffs** before accepting
2. **Use `/compact`** before context gets critical (>70%)
3. **Be specific** in requests (WHAT, WHERE, HOW, VERIFY)
4. **Plan Mode first** for complex/risky tasks
5. **Create CLAUDE.md** for every project
6. **Commit frequently** after each completed task

---

## Quick Decision Tree

```
Simple task       → Just ask Claude
Complex task      → TodoWrite to plan first
Risky change      → Plan Mode first
Repeating task    → Create agent or command
Context full      → /compact or /clear
Need docs         → Use Context7 MCP
Deep analysis     → Use --think or --ultrathink
```

---

## Common Issues Quick Fix

| Problem | Solution |
|---------|----------|
| "Command not found" | Check PATH, reinstall npm global |
| Context too high (>70%) | `/compact` immediately |
| Slow responses | `/compact` or `/clear` |
| MCP not working | `claude mcp list`, check config |
| Permission denied | Check `settings.local.json` |
| Hook blocking | Check hook exit code, review logic |

**Health Check Script** (save & run):
```bash
# macOS/Linux
which claude && claude doctor && claude mcp list

# Windows PowerShell
where.exe claude; claude doctor; claude mcp list
```

---

## Cost Optimization

| Model | Use For | Cost |
|-------|---------|------|
| Haiku | Simple fixes, reviews | $ |
| Sonnet | Most development | $$ |
| Opus | Architecture, complex bugs | $$$ |
| OpusPlan | Plan (Opus) + Execute (Sonnet) | $$ |

**Tip**: Use `--add-dir` to load only needed directories (saves tokens)

---

## Resources

- **Official docs**: [docs.anthropic.com/claude-code](https://docs.anthropic.com/en/docs/claude-code)
- **Advanced guide**: [Claudelog.com](https://claudelog.com/) - Tips & patterns
- **Full guide**: `english-ultimate-claude-code-guide.md` (this repo)
- **Project memory**: Create `CLAUDE.md` at project root
- **DeepSeek (cost-effective)**: Configure via `ANTHROPIC_BASE_URL`

---

**Author**: Florian BRUNIAUX | [@Méthode Aristote](https://methode-aristote.fr) | Written with Claude

*Last updated: January 2025 | Version 2.0*
