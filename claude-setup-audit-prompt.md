# Audit Your Claude Code Setup

> A self-contained prompt to analyze your Claude Code configuration against best practices.

**Author**: [Florian BRUNIAUX](https://github.com/FlorianBruniaux) | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr)

**Reference**: [The Ultimate Claude Code Guide](https://github.com/FlorianBruniaux/claude-code-ultimate-guide/blob/main/english-ultimate-claude-code-guide.md)

---

## 1. What This Does

This prompt instructs Claude to perform a comprehensive audit of your Claude Code setup by:

1. **Scanning** your global and project configuration files (read-only)
2. **Evaluating** each element against best practices from the guide
3. **Generating** a prioritized report with actionable recommendations
4. **Providing** ready-to-use templates tailored to your tech stack

**Important**: Claude will NOT make any changes without your explicit approval.

---

## 2. Who This Is For

| Level | What You'll Get |
|-------|-----------------|
| **Beginner** | Discover what you're missing and get starter templates |
| **Intermediate** | Identify optimization opportunities and advanced patterns |
| **Power User** | Validate your setup and find edge cases to polish |

**Prerequisites**:
- Claude Code installed and working
- A project directory to analyze (or just global config)

**Time**: ~5-10 minutes depending on setup complexity

---

## 3. How to Use It

### Step 1: Copy the Prompt

Copy everything inside the code block in [Section 4](#4-the-prompt) below.

### Step 2: Run Claude Code

```bash
cd your-project-directory
claude --ultrathink
```

> **Note**: `--ultrathink` enables maximum analysis depth (~32K tokens). You can also use `--think` for lighter analysis.

### Step 3: Paste and Execute

Paste the prompt and press Enter. Claude will begin the audit.

### Step 4: Review Results

Claude will present findings and ask for validation before making any changes.

### Platform Note

| Platform | Global Config Path |
|----------|-------------------|
| **macOS/Linux** | `~/.claude/` |
| **Windows** | `%USERPROFILE%\.claude\` |

---

## 4. The Prompt

```markdown
# Audit My Claude Code Setup

## Context

Perform a comprehensive audit of my Claude Code configuration against best practices from "The Ultimate Claude Code Guide":
https://github.com/FlorianBruniaux/claude-code-ultimate-guide/blob/main/english-ultimate-claude-code-guide.md

## Instructions

### Phase 1: Discovery (Read-Only)

**IMPORTANT**: Only READ files. Do NOT modify anything.

#### 1.1 Detect Tech Stack (MANDATORY)

First, identify the project's technology stack by reading:
- `package.json` (Node.js/JavaScript/TypeScript)
- `requirements.txt` or `pyproject.toml` (Python)
- `go.mod` (Go)
- `Cargo.toml` (Rust)
- `composer.json` (PHP)
- `Gemfile` (Ruby)
- `pom.xml` or `build.gradle` (Java)

Store the detected stack for template customization later.

#### 1.2 Scan Configuration Files

**Global configuration** (`~/.claude/` or `%USERPROFILE%\.claude\` on Windows):
- `CLAUDE.md` (global memory)
- `settings.json` (global settings)
- `mcp.json` (MCP servers)
- `.claude.json` (permissions, allowedTools)

**Project configuration** (current directory):
- `./CLAUDE.md` (project memory - root level)
- `./.claude/CLAUDE.md` (local memory - gitignored)
- `./.claude/settings.json` (hooks configuration)
- `./.claude/settings.local.json` (local permissions)
- `./.claude/agents/` (custom agents)
- `./.claude/commands/` (custom commands)
- `./.claude/skills/` (knowledge modules)
- `./.claude/hooks/` (hook scripts)
- `./.claude/rules/` (auto-loaded rules)

**Project context**:
- Documentation folder: `docs/`, `docs/conventions/`, `documentation/`
- Test configuration: presence of test framework config

#### 1.3 Error Handling Rules

| Scenario | Behavior |
|----------|----------|
| File doesn't exist | Mark as ❌ Missing in report |
| File exists but empty | Mark as ⚠️ Empty (different from missing) |
| JSON parse error | Mark as ⚠️ Malformed, note the error |
| Permission denied | Note in report, skip file |
| Monorepo detected | Analyze root config, note per-package opportunities |

### Phase 2: Evaluate & Report

#### 2.1 Evaluation Checklist

For each category, evaluate against these criteria:

**Memory Files (Guide Section 3.1)**
- [ ] Global CLAUDE.md exists with personal preferences
- [ ] Project CLAUDE.md exists with team conventions
- [ ] Memory files are concise (not essays)
- [ ] Includes concrete examples
- [ ] References external docs instead of duplicating

**Single Source of Truth (Guide Section 3.1)**
- [ ] Conventions documented in `/docs/conventions/` or similar
- [ ] CLAUDE.md references these docs with `@path`
- [ ] Same conventions used across tools (CodeRabbit, SonarQube, etc.)

**Folder Structure (Guide Section 3.2)**
- [ ] `.claude/` folder properly organized
- [ ] Appropriate gitignore (settings.local.json, local CLAUDE.md)

**Context Management (Guide Section 2.2)**
- [ ] Awareness of context zones (green/yellow/red)
- [ ] Sanity markers strategy documented
- [ ] Context poisoning prevention considered

**Plan Mode Usage (Guide Section 2.3)**
- [ ] Plan mode mentioned for complex/risky tasks
- [ ] Auto Plan Mode configured if needed

**Agents (Guide Section 4)**
- [ ] Custom agents for repetitive specialized tasks
- [ ] Agents have clear descriptions (Tool SEO principle)
- [ ] Appropriate model selection per agent (haiku/sonnet/opus)

**Skills (Guide Section 5)**
- [ ] Reusable knowledge modules for complex domains
- [ ] Properly structured with frontmatter

**Commands (Guide Section 6)**
- [ ] Custom commands for frequent workflows
- [ ] Use $ARGUMENTS for flexibility

**Hooks (Guide Section 7)**
- [ ] Security hooks (PreToolUse) for sensitive operations
- [ ] Auto-formatting hooks (PostToolUse) if needed
- [ ] Context enrichment (UserPromptSubmit) if useful

**MCP Servers (Guide Section 8)**
- [ ] Serena configured if large codebase (indexation + memory)
- [ ] Context7 configured if using external libraries
- [ ] Other relevant MCPs for the project needs

**Think Levels & Trinity (Guide Section 9.1)**
- [ ] Understanding of --think / --think-hard / --ultrathink
- [ ] Trinity pattern documented for complex workflows

**CI/CD Integration (Guide Section 9.3)**
- [ ] Verify Gate pattern implemented (build → lint → test → typecheck)
- [ ] Autonomous retry loop considered

**Continuous Improvement (Guide Section 9.10)**
- [ ] Meta-rules for fixing system, not just code
- [ ] Learning from repeated issues

**Cost Awareness (Guide Section 2.2)**
- [ ] Understanding of pricing model (Sonnet/Opus/Haiku costs)
- [ ] Using /compact proactively to manage costs
- [ ] Being specific in queries to reduce token usage
- [ ] Tracking costs via Anthropic Console

**Migration Patterns (Guide Section 1.6)**
- [ ] Understanding differences vs Copilot/Cursor
- [ ] Hybrid workflow defined (when to use which tool)
- [ ] Successfully transitioned from previous AI tools

**Release Notes Automation (Guide Section 9.3)**
- [ ] Using Claude for changelog generation
- [ ] Automated release notes in CI/CD
- [ ] User-facing vs technical release notes

**Emergency Procedures (Guide Appendix A.10)**
- [ ] Hotfix checklist available for production issues
- [ ] Plan Mode usage during critical fixes
- [ ] Post-mortem process documented

**Git Archaeology (Guide Appendix A.11)**
- [ ] Using git blame/log for code understanding
- [ ] Finding domain experts via git history
- [ ] Understanding code evolution patterns

#### 2.2 Calculate Health Score

**Formula**: `Score = (earned_points / max_points) × 100`

| Priority | Points per ✅ | Weight Rationale |
|----------|--------------|------------------|
| 🔴 High | 3 points | Fundamentals, security, major productivity |
| 🟡 Medium | 2 points | Best practices, recommended patterns |
| 🟢 Low | 1 point | Polish, optimization, nice-to-have |

**Priority Assignment Rules**:
- 🔴 **High**: Missing CLAUDE.md (any), no security hooks, no permissions config, no context management awareness
- 🟡 **Medium**: No custom agents for repeated tasks, incomplete MCP setup, missing Single Source of Truth, no CI integration
- 🟢 **Low**: Tool SEO optimization, optional skills, advanced patterns like Trinity

#### 2.3 Generate Report

**Executive Summary** (5-10 lines):
- Health Score: X/100 (with color indicator)
- Top 3 Quick Wins (< 5 min each)
- Top 3 Important Gaps
- Detected tech stack

**Quick Wins Section**:
List 3-5 high-impact actions that take less than 5 minutes:
```
⚡ Quick Win 1: [action] → [impact]
⚡ Quick Win 2: [action] → [impact]
⚡ Quick Win 3: [action] → [impact]
```

**Findings Table** (4 columns):

| Priority | Element | Status | Action |
|----------|---------|--------|--------|
| 🔴 | ... | ❌/⚠️/✅ | ... |

**Detailed Findings** (expandable per item):
For each ❌ or ⚠️ item, provide:
```
### [Element Name]
**Current State**: [what exists or doesn't]
**Why It Matters**: [impact on workflow]
**Guide Reference**: [Section X.X](https://github.com/FlorianBruniaux/claude-code-ultimate-guide/blob/main/english-ultimate-claude-code-guide.md#section-anchor)
```

**Suggested Templates**:
For each High/Medium priority gap, provide a STACK-SPECIFIC template:
```
### Template: [Element Name]

**File**: `path/to/file`
**Stack**: [detected stack]

**Suggested content**:
\`\`\`
[template content customized for the detected tech stack]
\`\`\`
```

### Phase 3: Await Validation

**CRITICAL**: Do NOT create or modify any files without explicit approval.

After presenting the report, ask:

"Which of these suggestions would you like me to implement?

Options:
- `all` - Implement all templates
- `high` - Only 🔴 High priority items
- `1, 3, 5` - Specific items by number
- `none` - Just keep the report for reference

Please specify your choice:"

Wait for explicit user response before taking any action.

## Output Format

Structure your response exactly as:

1. **Executive Summary** (health score, quick wins, gaps, stack)
2. **Quick Wins** (3-5 immediate actions)
3. **Findings Table** (4-column overview)
4. **Detailed Findings** (expanded per item)
5. **Suggested Templates** (stack-specific, ready to use)
6. **Validation Request** (ask before implementing)
```

---

## 5. What to Expect

Here's an example of what the audit report looks like:

### Example Executive Summary

```
## Executive Summary

**Health Score**: 45/100 🟡

**Detected Stack**: TypeScript + Next.js + Prisma

**Quick Wins** (< 5 min each):
⚡ Create project CLAUDE.md → Immediate context for Claude
⚡ Add .claude/ to .gitignore patterns → Prevent accidental commits
⚡ Enable Context7 MCP → Better library documentation

**Top 3 Gaps**:
1. 🔴 No project CLAUDE.md - Claude lacks project context
2. 🔴 No security hooks - Sensitive operations unprotected
3. 🟡 No custom agents - Repetitive tasks done manually
```

### Example Findings Table

| Priority | Element | Status | Action |
|----------|---------|--------|--------|
| 🔴 High | Project CLAUDE.md | ❌ Missing | Create with stack conventions |
| 🔴 High | Security hooks | ❌ Missing | Add PreToolUse for secrets |
| 🟡 Medium | Custom agents | ❌ Missing | Create for code review, testing |
| 🟡 Medium | MCP Serena | ⚠️ Partial | Add memory configuration |
| 🟢 Low | Tool SEO | ⚠️ Partial | Improve agent descriptions |

---

## 6. Understanding Results

### Glossary

| Term | Definition |
|------|------------|
| **Memory Files** | CLAUDE.md files that provide persistent context to Claude across sessions |
| **Single Source of Truth** | Pattern where conventions are documented once and referenced everywhere |
| **Tool SEO** | Writing agent/command descriptions so Claude selects the right tool automatically |
| **MCP Servers** | Model Context Protocol - external tools that extend Claude's capabilities |
| **Serena** | MCP server for codebase indexation and session memory persistence |
| **Context7** | MCP server for official library documentation lookup |
| **Hooks** | Scripts that run automatically on Claude events (PreToolUse, PostToolUse, etc.) |
| **PreToolUse** | Hook that runs BEFORE Claude executes a tool - great for security checks |
| **PostToolUse** | Hook that runs AFTER Claude executes a tool - great for formatting |
| **Plan Mode** | Read-only exploration mode for safe analysis before making changes |
| **Think Levels** | `--think`, `--think-hard`, `--ultrathink` - different analysis depths |
| **Trinity Pattern** | Combining Plan Mode + Think Levels + MCP for complex tasks |
| **Verify Gate** | CI/CD pattern: build → lint → test → typecheck before merge |
| **Context Zones** | Green (0-50%), Yellow (50-70%), Red (70%+) - context usage thresholds |

### Priority Levels Explained

| Level | Meaning | Examples |
|-------|---------|----------|
| 🔴 **High** | Missing fundamentals, security risks, major productivity loss | No CLAUDE.md, no security hooks |
| 🟡 **Medium** | Recommended best practices, significant improvements | No agents, incomplete MCP |
| 🟢 **Low** | Nice-to-have optimizations, polish | Tool SEO, advanced patterns |

### Status Icons

| Icon | Meaning |
|------|---------|
| ✅ | Good - meets best practices |
| ⚠️ | Partial - exists but needs improvement |
| ❌ | Missing - doesn't exist or broken |

---

## 7. Common Issues

### "Claude didn't find my files"

**Cause**: Wrong working directory or platform path differences.

**Fix**:
- Ensure you run `claude` from your project root
- On Windows, paths use `%USERPROFILE%\.claude\` not `~/.claude/`

### "Health score seems wrong"

**Cause**: The weighted formula may not match your priorities.

**Fix**: Focus on the specific findings rather than the score. The score is indicative, not absolute.

### "Templates don't match my stack"

**Cause**: Stack detection failed or project uses uncommon setup.

**Fix**: Tell Claude your stack explicitly: "My project uses [X]. Regenerate templates for this stack."

### "Too many recommendations"

**Cause**: First-time audit on a project without Claude Code configuration.

**Fix**:
1. Start with Quick Wins only
2. Implement High priority items first
3. Add Medium/Low items incrementally

### "Claude made changes without asking"

**Cause**: This shouldn't happen if using the prompt correctly.

**Fix**:
- Ensure you copied the entire prompt including Phase 3
- Use Plan Mode (`Shift+Tab` twice) for extra safety
- Report this as a bug if it persists

---

## 8. Related Resources

- [The Ultimate Claude Code Guide](./english-ultimate-claude-code-guide.md) - Full reference
- [Cheatsheet](./cheatsheet-en.md) - Quick daily reference
- [Claude Code Official Docs](https://docs.anthropic.com/en/docs/claude-code) - Anthropic documentation

---

*Last updated: January 2026 | Version 2.0*
