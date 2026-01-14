# Data Privacy & Retention Guide

> **Critical**: Everything you share with Claude Code is sent to Anthropic servers. This guide explains what data leaves your machine and how to protect sensitive information.

## TL;DR - Retention Summary

| Configuration | Retention Period | Training | How to Enable |
|---------------|------------------|----------|---------------|
| **Default** | 5 years | Yes | (default state) |
| **Opt-out** | 30 days | No | [claude.ai/settings](https://claude.ai/settings/data-privacy-controls) |
| **Enterprise (ZDR)** | 0 days | No | Enterprise contract |

**Immediate action**: [Disable training data usage](https://claude.ai/settings/data-privacy-controls) to reduce retention from 5 years to 30 days.

---

## 1. Understanding the Data Flow

### What Leaves Your Machine

When you use Claude Code, the following data is sent to Anthropic:

```
┌─────────────────────────────────────────────────────────────┐
│                    YOUR LOCAL MACHINE                       │
├─────────────────────────────────────────────────────────────┤
│  • Prompts you type                                         │
│  • Files Claude reads (including .env if not excluded!)     │
│  • MCP server results (SQL queries, API responses)          │
│  • Bash command outputs                                     │
│  • Error messages and stack traces                          │
└───────────────────────┬─────────────────────────────────────┘
                        │
                        ▼ HTTPS
┌─────────────────────────────────────────────────────────────┐
│                    ANTHROPIC API                            │
├─────────────────────────────────────────────────────────────┤
│  • Processes your request                                   │
│  • Stores conversation based on retention policy            │
│  • May use data for model training (if not opted out)       │
└─────────────────────────────────────────────────────────────┘
```

### What This Means in Practice

| Scenario | Data Sent to Anthropic |
|----------|------------------------|
| You ask Claude to read `src/app.ts` | Full file contents |
| You run `git status` via Claude | Command output |
| MCP executes `SELECT * FROM users` | Query results with user data |
| Claude reads `.env` file | API keys, passwords, secrets |
| Error occurs in your code | Full stack trace with paths |

---

## 2. Anthropic Retention Policies

### Tier 1: Default (Training Enabled)

- **Retention**: 5 years
- **Usage**: Model improvement, training data
- **Applies to**: Free, Pro, Max plans without opt-out

### Tier 2: Training Disabled (Opt-Out)

- **Retention**: 30 days
- **Usage**: Safety monitoring, abuse prevention only
- **How to enable**:
  1. Go to https://claude.ai/settings/data-privacy-controls
  2. Disable "Allow model training on your conversations"
  3. Changes apply immediately

### Tier 3: Enterprise API (Zero Data Retention)

- **Retention**: 0 days (real-time processing only)
- **Usage**: None - data not stored
- **Requires**: Enterprise contract with Anthropic
- **Use cases**: HIPAA, GDPR, PCI-DSS compliance, government contracts

---

## 3. Known Risks

### Risk 1: Automatic File Reading

Claude Code reads files to understand context. By default, this includes:

- `.env` and `.env.local` files (API keys, passwords)
- `credentials.json`, `secrets.yaml` (service accounts)
- SSH keys if in workspace scope
- Database connection strings

**Mitigation**: Configure `excludePatterns` (see Section 4).

### Risk 2: MCP Database Access

When you configure database MCP servers (Neon, Supabase, PlanetScale):

```
Your Query: "Show me recent orders"
            ↓
MCP Executes: SELECT * FROM orders LIMIT 100
            ↓
Results Sent: 100 rows with customer names, emails, addresses
            ↓
Stored at Anthropic: According to your retention tier
```

**Mitigation**: Never connect production databases. Use dev/staging with anonymized data.

### Risk 3: Shell Command Output

Bash commands and their output are included in context:

```bash
# This output goes to Anthropic:
$ env | grep API
OPENAI_API_KEY=sk-abc123...
STRIPE_SECRET_KEY=sk_live_...
```

**Mitigation**: Use hooks to filter sensitive command outputs.

### Risk 4: Documented Community Incidents

| Incident | Source |
|----------|--------|
| Claude reads `.env` by default | r/ClaudeAI, GitHub issues |
| DROP TABLE attempts on poorly configured MCP | r/ClaudeAI |
| Credentials exposed via environment variables | GitHub issues |
| Prompt injection via malicious MCP servers | r/programming |

---

## 4. Protective Measures

### Immediate Actions

#### 4.1 Opt-Out of Training

1. Visit https://claude.ai/settings/data-privacy-controls
2. Toggle OFF "Allow model training"
3. Retention reduces from 5 years to 30 days

#### 4.2 Configure File Exclusions

In `.claude/settings.json`:

```json
{
  "excludePatterns": [
    ".env",
    ".env.*",
    "**/.env",
    "**/.env.*",
    "**/credentials*",
    "**/secrets*",
    "**/*.pem",
    "**/*.key",
    "**/service-account*.json"
  ]
}
```

Or create `.claudeignore` in project root:

```gitignore
# Secrets
.env
.env.*
*.pem
*.key
credentials.json
secrets/

# Sensitive configs
**/config/production.*
```

#### 4.3 Use Security Hooks

Create `.claude/hooks/PreToolUse.sh`:

```bash
#!/bin/bash
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool.name')

if [[ "$TOOL_NAME" == "Read" ]]; then
    FILE_PATH=$(echo "$INPUT" | jq -r '.tool.input.file_path')

    # Block reading sensitive files
    if [[ "$FILE_PATH" =~ \.env|credentials|secrets|\.pem|\.key ]]; then
        echo "BLOCKED: Attempted to read sensitive file: $FILE_PATH" >&2
        exit 2  # Block the operation
    fi
fi
```

### MCP Best Practices

| Rule | Rationale |
|------|-----------|
| **Never connect production databases** | All query results sent to Anthropic |
| **Use read-only database users** | Prevents DROP/DELETE/UPDATE accidents |
| **Anonymize development data** | Reduces PII exposure risk |
| **Create minimal test datasets** | Less data = less risk |
| **Audit MCP server sources** | Third-party MCPs may have vulnerabilities |

### For Teams

| Environment | Recommendation |
|-------------|----------------|
| **Development** | Opt-out + exclusions + anonymized data |
| **Staging** | Consider Enterprise API if handling real data |
| **Production** | NEVER connect Claude Code directly |

---

## 5. Comparison with Other Tools

| Feature | Claude Code + MCP | Cursor | GitHub Copilot |
|---------|-------------------|--------|----------------|
| Data scope sent | Full SQL results, files | Code snippets | Code snippets |
| Production DB access | Yes (via MCP) | Limited | Not designed for |
| Default retention | 5 years | Variable | 30 days |
| Training by default | Yes | Opt-in | Opt-in |

**Key difference**: MCP creates a unique attack surface because MCP servers are separate processes with independent network/filesystem access.

---

## 6. Enterprise Considerations

### When to Use Enterprise API (ZDR)

- Handling PII (names, emails, addresses)
- Regulated industries (HIPAA, GDPR, PCI-DSS)
- Client data processing
- Government contracts
- Financial services

### Evaluation Checklist

- [ ] Data classification policy exists for your organization
- [ ] API tier matches data sensitivity requirements
- [ ] Team trained on privacy controls
- [ ] Incident response plan for potential data exposure
- [ ] Legal/compliance review completed

---

## 7. Quick Reference

### Links

| Resource | URL |
|----------|-----|
| Privacy settings | https://claude.ai/settings/data-privacy-controls |
| Anthropic usage policy | https://www.anthropic.com/policies |
| Enterprise information | https://www.anthropic.com/enterprise |
| Terms of service | https://www.anthropic.com/legal/consumer-terms |

### Commands

```bash
# Check current Claude config
claude /config

# Verify exclusions are loaded
claude /status

# Run privacy audit
./examples/scripts/audit-scan.sh
```

### Quick Checklist

- [ ] Training opt-out enabled at claude.ai/settings
- [ ] `.env*` files in excludePatterns or .claudeignore
- [ ] No production database connections via MCP
- [ ] Security hooks installed for sensitive file access
- [ ] Team aware of data flow to Anthropic

---

## Changelog

- 2026-01: Initial version - documenting retention policies and protective measures
