# Claude Code Hooks

Hooks are scripts that execute automatically on Claude Code events. They enable automation, block dangerous operations, and enrich context.

## Available Hooks

| Hook | Event | Purpose | Platform |
|------|-------|---------|----------|
| [dangerous-actions-blocker.sh](./bash/dangerous-actions-blocker.sh) | PreToolUse | Block dangerous commands/edits | Bash |
| [security-check.sh](./bash/security-check.sh) | PreToolUse | Block secrets in commands | Bash |
| [claudemd-scanner.sh](./bash/claudemd-scanner.sh) | SessionStart | Detect CLAUDE.md injection attacks | Bash |
| [output-secrets-scanner.sh](./bash/output-secrets-scanner.sh) | PostToolUse | Detect secrets in tool outputs | Bash |
| [auto-format.sh](./bash/auto-format.sh) | PostToolUse | Auto-format after edits | Bash |
| [notification.sh](./bash/notification.sh) | Notification | Contextual macOS sound alerts | Bash (macOS) |
| [security-check.ps1](./powershell/security-check.ps1) | PreToolUse | Block secrets in commands | PowerShell |
| [auto-format.ps1](./powershell/auto-format.ps1) | PostToolUse | Auto-format after edits | PowerShell |

## Hook Events

| Event | When | Typical Use Cases |
|-------|------|-------------------|
| `PreToolUse` | Before a tool executes | Validation, blocking dangerous operations |
| `PostToolUse` | After a tool executes | Formatting, logging, cleanup |
| `UserPromptSubmit` | When user sends a message | Context enrichment, preprocessing |
| `Notification` | When Claude sends a notification | Sound alerts, external notifications |
| `SessionStart` | At session start | Initialization, environment setup |
| `SessionEnd` | At session end | Cleanup, session summary |
| `Stop` | User interrupts operation | State saving, graceful shutdown |

## Advanced Guardrails (NEW in v3.3.0)

Advanced protection patterns inspired by production LLM systems.

### prompt-injection-detector.sh

**Event**: `PreToolUse`

Detects and blocks prompt injection attempts before they reach Claude:

**Detected Patterns**:
- Role override: "ignore previous instructions", "you are now", "pretend to be"
- Jailbreak attempts: "DAN mode", "developer mode", "no restrictions"
- Delimiter injection: `</system>`, `[INST]`, `<<SYS>>`
- Authority impersonation: "anthropic employee", "authorized to bypass"
- Base64-encoded payloads (decoded and scanned)
- Context manipulation: false claims about previous messages

**Configuration**:
```json
{
  "hooks": {
    "PreToolUse": [{
      "hooks": [{
        "type": "command",
        "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/prompt-injection-detector.sh",
        "timeout": 5000
      }]
    }]
  }
}
```

### output-validator.sh

**Event**: `PostToolUse`

Heuristic validation of Claude's outputs (no LLM call, pure bash):

**Validation Checks**:
- Placeholder paths: `/path/to/`, `/your/project/`
- Placeholder content: `TODO:`, `your-api-key`, `example.com`
- Potential secrets in output (regex patterns)
- Uncertainty indicators (multiple "I'm not sure", "probably")
- Incomplete implementations: `NotImplementedError`, `throw new Error`
- Unverified reference claims

**Behavior**: Warns via `systemMessage`, does not block. For deeper validation, use the `output-evaluator` agent.

### session-logger.sh

**Event**: `PostToolUse`

Logs all Claude operations to JSONL files for monitoring and cost tracking:

**Log Location**: `~/.claude/logs/activity-YYYY-MM-DD.jsonl`

**Logged Data**:
- Timestamp, session ID, tool name
- File paths and commands (truncated)
- Project name
- Token estimates (input/output)

**Analysis**: Use `session-stats.sh` script to analyze logs.

**Environment Variables**:
| Variable | Default | Description |
|----------|---------|-------------|
| `CLAUDE_LOG_DIR` | `~/.claude/logs` | Log directory |
| `CLAUDE_LOG_TOKENS` | `true` | Enable token estimation |
| `CLAUDE_SESSION_ID` | auto | Custom session ID |

See [Observability Guide](../../guide/observability.md) for full documentation.

### pre-commit-evaluator.sh

**Type**: Git pre-commit hook (not Claude hook)

LLM-as-a-Judge evaluation before every commit. **Opt-in only** due to API costs.

**Installation**:
```bash
cp pre-commit-evaluator.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
export CLAUDE_PRECOMMIT_EVAL=1  # Enable evaluation
```

**Cost**: ~$0.01-0.05 per commit (Haiku model)

**Bypass**: `git commit --no-verify` or `CLAUDE_SKIP_EVAL=1 git commit`

---

## Security Hooks

### dangerous-actions-blocker.sh

**Event**: `PreToolUse` (Bash, Edit, Write)

Comprehensive protection against dangerous operations:

**Bash - Blocked Commands**:
- System destruction: `rm -rf /`, `rm -rf ~`, `sudo rm`
- Disk operations: `dd if=`, `mkfs`, `> /dev/sda`
- Fork bombs: `:(){:|:&};:`
- Database drops: `DROP DATABASE`, `DROP TABLE`
- Force pushes: `git push --force main/master`
- Package publishing: `npm publish`, `pnpm publish`
- Secret patterns: `password=`, `api_key=`, `token=`

**Edit/Write - Protected Files**:
- Environment: `.env`, `.env.local`, `.env.production`
- Credentials: `credentials.json`, `serviceAccountKey.json`
- SSH keys: `id_rsa`, `id_ed25519`, `id_ecdsa`
- Config: `.npmrc`, `.pypirc`, `secrets.yml`

**Edit/Write - Allowed Paths**:
- `$CLAUDE_PROJECT_DIR` (current project)
- `~/.claude/` (Claude config)
- `/tmp/` (temporary files)
- Additional paths via `$ALLOWED_PATHS` environment variable

**Exit Codes**:
```bash
exit 0  # Allow operation
exit 2  # Block (stderr message shown to Claude)
```

**Configuration**:
```bash
# Add custom allowed paths (colon-separated)
export ALLOWED_PATHS="/custom/path:/another/path"
```

### security-check.sh

**Event**: `PreToolUse` (Bash)

Focused on detecting secrets in commands:
- Password patterns
- API keys (common formats like `sk-xxx`, `pk-xxx`)
- AWS credentials
- Private keys
- Hardcoded tokens

### claudemd-scanner.sh

**Event**: `SessionStart`

Scans CLAUDE.md files at session start for potential prompt injection attacks:

**Detected Patterns**:
- "ignore previous instructions" variants
- Shell injection: `curl | bash`, `wget | sh`, `eval(`
- Base64 encoded content (potential obfuscation)
- Hidden instructions in HTML comments
- Suspicious long lines (>500 chars)
- Non-ASCII characters near sensitive keywords (homoglyph attacks)

**Files Scanned**:
- `CLAUDE.md` (project root)
- `.claude/CLAUDE.md` (local override)
- Any `.md` files in `.claude/` directory

**Why This Matters**: When you clone an unfamiliar repository, a malicious CLAUDE.md could inject instructions that compromise your system. This hook warns you before Claude processes potentially dangerous instructions.

**Configuration**:
```json
{
  "hooks": {
    "SessionStart": [{
      "hooks": [{
        "type": "command",
        "command": ".claude/hooks/claudemd-scanner.sh",
        "timeout": 5000
      }]
    }]
  }
}
```

### output-secrets-scanner.sh

**Event**: `PostToolUse`

Complements `security-check.sh` by scanning tool **outputs** (not inputs) for leaked secrets.

**Detected Patterns**:
- API Keys: OpenAI, Anthropic, AWS, GCP, Azure, Stripe, Twilio, SendGrid
- Tokens: GitHub, GitLab, NPM, PyPI, JWT
- Private Keys: RSA, EC, DSA, OpenSSH, PGP
- Database URLs with embedded passwords
- Generic `api_key=`, `secret=`, `password=` patterns

**Why This Matters**: Claude might read a `.env` file and include credentials in its response or a commit. This hook catches secrets before they leak.

**Configuration**:
```json
{
  "hooks": {
    "PostToolUse": [{
      "hooks": [{
        "type": "command",
        "command": ".claude/hooks/output-secrets-scanner.sh",
        "timeout": 5000
      }]
    }]
  }
}
```

## Productivity Hooks

### auto-format.sh / auto-format.ps1

**Event**: `PostToolUse` (Edit, Write)

Automatically format files after editing:

| Extension | Formatter |
|-----------|-----------|
| `.ts`, `.tsx`, `.js`, `.jsx` | Prettier |
| `.json`, `.css`, `.scss`, `.md` | Prettier |
| `.prisma` | `prisma format` |
| `.py` | Black / autopep8 |
| `.go` | `go fmt` |

**Silent Operation**: No output, failures ignored to avoid blocking Claude.

**Requirements**: Install formatters in your project:
```bash
# Node.js projects
npm install -D prettier

# Python projects
pip install black

# Go projects (built-in)
go fmt
```

### notification.sh

**Event**: `Notification` (macOS only)

Contextual sound alerts based on notification content:

| Context | Sound | Triggered By |
|---------|-------|--------------|
| Success | Hero.aiff | "completed", "done", "success" |
| Error | Basso.aiff | "error", "failed", "problem" |
| Waiting | Submarine.aiff | "waiting", "permission", "input" |
| Warning | Sosumi.aiff | "warning", "attention", "alert" |
| Default | Ping.aiff | Other notifications |

**Features**:
- Non-blocking (plays in background)
- Native macOS notifications
- Automatic context detection via keywords
- Multi-language support (English/French)

**Requirements**: macOS with `afplay` and `osascript` (built-in)

## Configuration

Hooks are configured in `.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash|Edit|Write",
        "hooks": [{
          "type": "command",
          "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/dangerous-actions-blocker.sh",
          "timeout": 5000
        }]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [{
          "type": "command",
          "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/auto-format.sh",
          "timeout": 10000
        }]
      }
    ],
    "Notification": [
      {
        "hooks": [{
          "type": "command",
          "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/notification.sh",
          "timeout": 5000
        }]
      }
    ]
  }
}
```

**Matcher Patterns**:
- `".*"` - Match all tools
- `"Bash"` - Match only Bash tool
- `"Edit|Write"` - Match Edit OR Write tools
- `"Bash|Edit|Write"` - Match multiple tools

## Creating Custom Hooks

### Basic Template

```bash
#!/bin/bash
# Hook: [EventType] - Description
# Exit 0 = success/allow, Exit 2 = block (PreToolUse only)

set -e

# Read JSON from stdin
INPUT=$(cat)

# Extract data
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
TOOL_INPUT=$(echo "$INPUT" | jq -r '.tool_input // empty')

# Your logic here...

# Return optional JSON
cat << EOF
{
  "systemMessage": "Message displayed to Claude",
  "hookSpecificOutput": {
    "additionalContext": "Extra context added"
  }
}
EOF

exit 0
```

### Environment Variables

Available in hook scripts:

| Variable | Description |
|----------|-------------|
| `CLAUDE_PROJECT_DIR` | Current project path |
| `CLAUDE_FILE_PATHS` | Files passed with `-f` flag |
| `CLAUDE_TOOL_INPUT` | Tool input as JSON |
| `HOME` | User home directory |

### Best Practices

1. **Short Timeout**: Max 5-10s to avoid blocking Claude
2. **Fail Gracefully**: Use `|| true` for non-critical operations
3. **Minimal Logging**: Avoid stdout except structured JSON
4. **Require jq**: Parse JSON with `jq` for reliability
5. **Test Thoroughly**: Test with various inputs before deploying
6. **Document Behavior**: Clear comments on what hook does
7. **Handle Errors**: Proper error messages for debugging

### Example: Git Context Enrichment

Create `git-context.sh` (UserPromptSubmit event):

```bash
#!/bin/bash
# Hook: UserPromptSubmit - Add Git context to prompts

set -e

INPUT=$(cat)

# Get Git information
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
LAST_COMMIT=$(git log -1 --oneline 2>/dev/null || echo "none")
UNCOMMITTED=$(git status --short 2>/dev/null | wc -l | tr -d ' ')
STAGED=$(git diff --cached --name-only 2>/dev/null | wc -l | tr -d ' ')

# Return enriched context
cat << EOF
{
  "systemMessage": "[Git] Branch: $BRANCH | Last: $LAST_COMMIT | Uncommitted: $UNCOMMITTED files | Staged: $STAGED files"
}
EOF

exit 0
```

Register in settings:
```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [{
          "type": "command",
          "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/git-context.sh",
          "timeout": 3000
        }]
      }
    ]
  }
}
```

## Installation

### Project-Level (Shared with Team)

1. Create hooks directory:
```bash
mkdir -p .claude/hooks
```

2. Copy hook from examples:
```bash
cp /path/to/examples/hooks/bash/dangerous-actions-blocker.sh .claude/hooks/
chmod +x .claude/hooks/*.sh
```

3. Configure in `.claude/settings.json` (see Configuration section above)

4. Commit to repository:
```bash
git add .claude/hooks/ .claude/settings.json
git commit -m "Add Claude Code hooks"
```

### Personal/Global (Your Machine Only)

1. Create global hooks directory:
```bash
mkdir -p ~/.claude/hooks
```

2. Copy hook:
```bash
cp /path/to/examples/hooks/bash/notification.sh ~/.claude/hooks/
chmod +x ~/.claude/hooks/*.sh
```

3. Configure in `~/.claude/settings.json`

**Priority**: Project hooks override global hooks.

## Platform-Specific Notes

### macOS / Linux (Bash)

- Use `.sh` extension
- Requires `chmod +x` for execution
- Path separator: `/`
- Home directory: `~` or `$HOME`

### Windows (PowerShell)

- Use `.ps1` extension
- May require execution policy: `Set-ExecutionPolicy RemoteSigned`
- Path separator: `\`
- Home directory: `$env:USERPROFILE`

## Troubleshooting

### Hook Not Executing

**Cause**: Not registered in settings.json or wrong path

**Fix**: Verify configuration and use absolute paths or `$CLAUDE_PROJECT_DIR`

### Permission Denied

**Cause**: Hook not executable

**Fix**:
```bash
chmod +x .claude/hooks/*.sh
```

### Hook Blocks Everything

**Cause**: Exit code 2 without conditions

**Fix**: Check logic, ensure `exit 0` is default case

### Timeout Errors

**Cause**: Hook takes too long (>timeout value)

**Fix**: Optimize hook performance or increase timeout in settings

### jq Not Found

**Cause**: `jq` not installed

**Fix**: Install jq:
```bash
# macOS
brew install jq

# Ubuntu/Debian
sudo apt-get install jq

# Windows
choco install jq
```

## Advanced Examples

### Activity Logger

Log all Claude operations to JSONL file:

```bash
#!/bin/bash
# PostToolUse - Log all activities

set -e

INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name')
LOG_FILE="$HOME/.claude/logs/activity-$(date +%Y-%m-%d).jsonl"

mkdir -p "$(dirname "$LOG_FILE")"

# Create log entry
cat << EOF >> "$LOG_FILE"
{"timestamp":"$(date -u +%Y-%m-%dT%H:%M:%SZ)","tool":"$TOOL","session":"$CLAUDE_SESSION_ID"}
EOF

exit 0
```

### Database Migration Detector

Alert when migrations are created:

```bash
#!/bin/bash
# PostToolUse - Detect database migrations

set -e

INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name')

if [[ "$TOOL" == "Write" ]]; then
    FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path')

    if [[ "$FILE" == *"/migrations/"* ]]; then
        cat << EOF
{
  "systemMessage": "⚠️ Database migration created: $FILE\n\nReminder:\n1. Review migration carefully\n2. Test on dev database first\n3. Run 'prisma migrate deploy' after merge"
}
EOF
    fi
fi

exit 0
```

## Security Considerations

1. **Never Store Secrets in Hooks**: Use environment variables
2. **Validate Input**: Always sanitize data from stdin
3. **Limit Hook Scope**: Use specific matchers, not `".*"`
4. **Review Blocked Operations**: Log when hooks block actions
5. **Test in Isolation**: Test hooks outside Claude first
6. **Version Control**: Commit hooks to repository for team sharing

## Resources

- [Main Guide - Section 7: Hooks](../../guide/ultimate-guide.md#7-hooks)
- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Hook Event Reference](../../guide/ultimate-guide.md#71-hook-events)

---

*See the [main guide](../../guide/ultimate-guide.md) for detailed explanations and advanced patterns.*
