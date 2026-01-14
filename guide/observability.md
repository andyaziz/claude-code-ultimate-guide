# Session Observability & Monitoring

> Track Claude Code usage, estimate costs, and identify patterns across your development sessions.

## Table of Contents

1. [Why Monitor Sessions](#why-monitor-sessions)
2. [Setting Up Session Logging](#setting-up-session-logging)
3. [Analyzing Session Data](#analyzing-session-data)
4. [Cost Tracking](#cost-tracking)
5. [Patterns & Best Practices](#patterns--best-practices)
6. [Limitations](#limitations)

---

## Why Monitor Sessions

Claude Code usage can accumulate quickly, especially in active development. Monitoring helps you:

- **Understand costs**: Estimate API spend before invoices arrive
- **Identify patterns**: See which tools you use most, which files get edited repeatedly
- **Optimize workflow**: Find inefficiencies (e.g., repeatedly reading the same large file)
- **Track projects**: Compare usage across different codebases
- **Team visibility**: Aggregate usage for team budgeting (when combining logs)

---

## Setting Up Session Logging

### 1. Install the Logger Hook

Copy the session logger to your hooks directory:

```bash
# Create hooks directory if needed
mkdir -p ~/.claude/hooks

# Copy the logger (from this repo's examples)
cp examples/hooks/bash/session-logger.sh ~/.claude/hooks/
chmod +x ~/.claude/hooks/session-logger.sh
```

### 2. Register in Settings

Add to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "type": "command",
        "command": "~/.claude/hooks/session-logger.sh"
      }
    ]
  }
}
```

### 3. Verify Installation

Run a few Claude Code commands, then check logs:

```bash
ls ~/.claude/logs/
# Should see: activity-2026-01-14.jsonl

# View recent entries
tail -5 ~/.claude/logs/activity-$(date +%Y-%m-%d).jsonl | jq .
```

### Configuration Options

| Environment Variable | Default | Description |
|---------------------|---------|-------------|
| `CLAUDE_LOG_DIR` | `~/.claude/logs` | Where to store logs |
| `CLAUDE_LOG_TOKENS` | `true` | Enable token estimation |
| `CLAUDE_SESSION_ID` | auto-generated | Custom session identifier |

---

## Analyzing Session Data

### Using session-stats.sh

```bash
# Copy the script
cp examples/scripts/session-stats.sh ~/.local/bin/
chmod +x ~/.local/bin/session-stats.sh

# Today's summary
session-stats.sh

# Last 7 days
session-stats.sh --range week

# Specific date
session-stats.sh --date 2026-01-14

# Filter by project
session-stats.sh --project my-app

# Machine-readable output
session-stats.sh --json
```

### Sample Output

```
═══════════════════════════════════════════════════════════
        Claude Code Session Statistics - today
═══════════════════════════════════════════════════════════

Summary
  Total operations:  127
  Sessions:          3

Token Usage
  Input tokens:      45,230
  Output tokens:     12,450
  Total tokens:      57,680

Estimated Cost (Sonnet rates)
  Input:   $0.1357
  Output:  $0.1868
  Total:   $0.3225

Tools Used
  Edit: 45
  Read: 38
  Bash: 24
  Grep: 12
  Write: 8

Projects
  my-app: 89
  other-project: 38
```

### Log Format

Each log entry is a JSON object:

```json
{
  "timestamp": "2026-01-14T15:30:00Z",
  "session_id": "1705234567-12345",
  "tool": "Edit",
  "file": "src/components/Button.tsx",
  "project": "my-app",
  "tokens": {
    "input": 350,
    "output": 120,
    "total": 470
  }
}
```

---

## Cost Tracking

### Token Estimation Method

The logger estimates tokens using a simple heuristic: **~4 characters per token**. This is approximate and tends to slightly overestimate.

### Cost Rates

Default rates are for Claude Sonnet. Adjust via environment variables:

```bash
# Sonnet rates (default)
export CLAUDE_RATE_INPUT=0.003   # $3/1M tokens
export CLAUDE_RATE_OUTPUT=0.015  # $15/1M tokens

# Opus rates (if using Opus)
export CLAUDE_RATE_INPUT=0.015   # $15/1M tokens
export CLAUDE_RATE_OUTPUT=0.075  # $75/1M tokens

# Haiku rates
export CLAUDE_RATE_INPUT=0.00025 # $0.25/1M tokens
export CLAUDE_RATE_OUTPUT=0.00125 # $1.25/1M tokens
```

### Budget Alerts (Manual Pattern)

Add to your shell profile for daily budget warnings:

```bash
# ~/.zshrc or ~/.bashrc
claude_budget_check() {
  local cost=$(session-stats.sh --json 2>/dev/null | jq -r '.summary.estimated_cost.total // 0')
  local threshold=5.00  # $5 daily budget

  if (( $(echo "$cost > $threshold" | bc -l) )); then
    echo "⚠️  Claude Code daily spend: \$$cost (threshold: \$$threshold)"
  fi
}

# Run on shell start
claude_budget_check
```

---

## Patterns & Best Practices

### 1. Weekly Review

Set a calendar reminder to review weekly stats:

```bash
session-stats.sh --range week
```

Look for:
- Unusually high token usage days
- Repeated operations on same files (inefficiency signal)
- Project distribution (where time is spent)

### 2. Per-Project Tracking

Use `CLAUDE_SESSION_ID` to tag sessions by project:

```bash
export CLAUDE_SESSION_ID="project-myapp-$(date +%s)"
claude
```

### 3. Team Aggregation

For team-wide tracking, sync logs to shared storage:

```bash
# Example: sync to S3 daily
aws s3 sync ~/.claude/logs/ s3://company-claude-logs/$(whoami)/
```

Then aggregate with:

```bash
# Download all team logs
aws s3 sync s3://company-claude-logs/ /tmp/team-logs/

# Combine and analyze
cat /tmp/team-logs/*/activity-$(date +%Y-%m-%d).jsonl | \
  jq -s 'group_by(.project) | map({project: .[0].project, total_tokens: [.[].tokens.total] | add})'
```

### 4. Log Rotation

Logs accumulate over time. Add cleanup to cron:

```bash
# Clean logs older than 30 days
find ~/.claude/logs -name "*.jsonl" -mtime +30 -delete
```

---

## Limitations

### What This Monitoring CANNOT Do

| Limitation | Reason |
|------------|--------|
| **Exact token counts** | Claude Code CLI doesn't expose API token metrics |
| **TTFT (Time to First Token)** | Hook runs after tool completes, not during streaming |
| **Real-time streaming metrics** | No hook event during response generation |
| **Actual API costs** | Token estimates are heuristic, not from billing |
| **Model selection** | Log doesn't capture which model was used per request |
| **Context window usage** | No visibility into current context percentage |

### Accuracy Notes

- **Token estimates**: ~15-25% variance from actual billing
- **Cost estimates**: Use as directional guidance, not accounting
- **Session boundaries**: Sessions are approximated by ID, not exact API sessions

### What You CAN Trust

- **Tool usage counts**: Exact count of each tool invocation
- **File access patterns**: Which files were touched
- **Relative comparisons**: Day-to-day/project-to-project trends
- **Operation timing**: When tools were used (timestamp)

---

## Related Resources

- [Session Logger Hook](../examples/hooks/bash/session-logger.sh)
- [Stats Analysis Script](../examples/scripts/session-stats.sh)
- [Data Privacy Guide](./data-privacy.md) - What data leaves your machine
- [Cost Optimization](./ultimate-guide.md#cost-optimization) - Tips to reduce spend
