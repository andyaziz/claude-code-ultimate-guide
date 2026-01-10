# Create Pull Request

Analyze changes, detect scope issues, and create a well-structured PR following project conventions.

## Process

1. **Analyze Changes**: Calculate complexity score from files, commits, and directories
2. **Detect Scope Issues**: Warn if PR is too large or mixes unrelated changes
3. **Suggest Split**: If needed, group commits by scope and propose separate PRs
4. **Collect Info**: Ask for type, target branch, draft status, labels
5. **Generate Content**: Create TLDR + description + checklist
6. **Create PR**: Execute `gh pr create` with proper formatting
7. **Remind Follow-up**: Display post-PR checklist (SonarQube, Claude Review)

## Complexity Score

Calculate PR complexity to detect if split is needed:

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Code files | x2 | `*.ts, *.tsx` (excluding tests) |
| Test files | x0.5 | `*.test.ts, *.spec.ts` |
| Config files | x1 | `*.json, *.yml, *.md` |
| Directories | x3 | Distinct `src/*` directories |
| Commits | x1 | Number of commits |

**Thresholds**: 0-15 ✅ Normal | 16-25 ⚠️ Large | 26+ 🔴 Split recommended

## Scope Coherence

| Pattern | Verdict |
|---------|---------|
| Single scope | ✅ OK |
| Related scopes (sessions + calendar) | ✅ OK |
| Unrelated scopes (payments + auth) | 🔴 Split |
| feat + fix same scope | ✅ OK |
| feat + fix different scopes | 🔴 Split |

## Split Suggestion Format

When split is recommended, display:

```
🔴 Scope trop large (score: 32)

Commits par scope :
├── payments (5 commits, 8 fichiers)
│   ├── feat(payments): add Stripe checkout
│   └── fix(payments): handle currency
│
└── notifications (3 commits, 6 fichiers)
    └── feat(notifications): add email templates

💡 Suggestion :
1. PR #1 : feature/payments-stripe → Commits payments
2. PR #2 : feature/notifications → Commits notifications

Options :
[A] Continuer avec une seule PR (non recommandé)
[B] Découper (semi-auto - commandes git fournies)
[C] Voir détail fichiers
```

**Semi-auto split** provides copy-paste commands:
```bash
git checkout develop
git checkout -b feature/payments-stripe
git cherry-pick abc1234 def5678
git push -u origin feature/payments-stripe
```

## Questions to Ask

1. **Type**: feature | fix | tech | docs | security
2. **Target Branch**: Show recent branches (develop, main, others)
3. **Draft**: Yes (WIP) | No (ready for review)
4. **Labels**: Based on type + optional (breaking-change, security)

## PR Title Format

```
<type>(<scope>): <description>
```

Examples:
- `feat(payments): add Stripe checkout integration`
- `fix(sessions): resolve timezone calculation bug`

## PR Body Template

```markdown
## TLDR
<!-- 2 lines max - Executive summary -->

---

## Type
{Feature | Fix | Tech | Docs | Security}

## Description
{Context and changes}

## Technical Changes
{List of main modifications}

## Tests
- [ ] Unit tests added/passing
- [ ] Manual testing completed

## Checklist
- [ ] Code follows conventions
- [ ] No console.log left
- [ ] Types OK (`pnpm typecheck`)

---

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Available Labels

| Label | Color | Use When |
|-------|-------|----------|
| `feature` | 🟢 | New functionality |
| `fix` | 🔴 | Bug fix |
| `tech` | 🔵 | Refactoring, tech debt |
| `docs` | 📘 | Documentation only |
| `security` | 🟣 | Security fix |
| `breaking-change` | ⚫ | Breaking changes |
| `WIP` | 🟡 | Work in progress (draft) |

## Commands to Execute

```bash
# 1. Get base branch (usually develop)
BASE_BRANCH="develop"

# 2. Calculate complexity score
CODE=$(git diff --name-only $BASE_BRANCH..HEAD | grep -E '\.(ts|tsx)$' | grep -v test | wc -l)
TESTS=$(git diff --name-only $BASE_BRANCH..HEAD | grep -E '\.test\.|\.spec\.' | wc -l)
DIRS=$(git diff --name-only $BASE_BRANCH..HEAD | cut -d'/' -f1-2 | sort -u | wc -l)
COMMITS=$(git rev-list --count $BASE_BRANCH..HEAD)
SCORE=$((CODE * 2 + TESTS / 2 + DIRS * 3 + COMMITS))

# 3. Get scopes from commits
git log --oneline $BASE_BRANCH..HEAD --format="%s" | sed -n 's/^\w*(\([^)]*\)).*/\1/p' | sort | uniq -c

# 4. Recent branches for selection
git branch --sort=-committerdate --format='%(refname:short)' | head -5

# 5. Create PR
gh pr create \
  --title "<type>(<scope>): <description>" \
  --body "$BODY" \
  --base $BASE_BRANCH \
  --label "<label>" \
  --draft  # if WIP
```

## Post-PR Output

After PR creation, ALWAYS display:

```
✅ PR créée : https://github.com/org/repo/pull/XXX

📋 Prochaines étapes automatiques :
   • SonarQube analysera la qualité du code (bugs, vulnérabilités, code smells)
   • Claude Code Review fournira un feedback IA sur votre PR

⏳ Pensez à surveiller ces analyses dans les prochaines minutes.
   Si des problèmes sont détectés, corrigez-les avant de demander une review humaine.
```

## Edge Cases

| Situation | Behavior |
|-----------|----------|
| No scope in commits | Analyze by directories |
| Non-conventional commits | Warn + ask type manually |
| No commits (same as base) | Error: "Aucun changement" |
| Single commit | Use commit message as title |
| Merge commits | Ignore (`--no-merges`) |

## Usage

```
/pr
/pr --base main
/pr --draft
```

Target: $ARGUMENTS (optional: --base, --draft)
