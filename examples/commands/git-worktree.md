# Git Worktree Setup

Create isolated git worktrees for feature development without switching branches.

**Core principle:** Systematic directory selection + safety verification = reliable isolation.

## Process

1. **Check Existing Directories**: `.worktrees/` or `worktrees/`
2. **Verify .gitignore**: Ensure worktree dir is ignored
3. **Create Worktree**: `git worktree add`
4. **Install Dependencies**: Auto-detect package manager
5. **Run Baseline Tests**: Verify clean state
6. **Report Location**: Confirm ready

## Directory Selection

### Priority Order

```bash
# 1. Check existing directories
ls -d .worktrees 2>/dev/null     # Preferred (hidden)
ls -d worktrees 2>/dev/null      # Alternative

# 2. Check CLAUDE.md for preference
grep -i "worktree.*director" CLAUDE.md 2>/dev/null

# 3. Ask user if neither exists
```

**If both exist:** `.worktrees/` wins.

## Safety Verification

**For project-local directories:**

```bash
# Check if directory in .gitignore
grep -q "^\.worktrees/$" .gitignore || grep -q "^worktrees/$" .gitignore
```

**If NOT in .gitignore:**
1. Add line to .gitignore
2. Commit the change
3. Proceed with worktree creation

**Why critical:** Prevents accidentally committing worktree contents.

## Creation Steps

```bash
# 1. Detect project name
project=$(basename "$(git rev-parse --show-toplevel)")

# 2. Create worktree with new branch
git worktree add .worktrees/$BRANCH_NAME -b $BRANCH_NAME

# 3. Navigate
cd .worktrees/$BRANCH_NAME
```

## Auto-Detect Setup

```bash
# Node.js
if [ -f package.json ]; then pnpm install; fi

# Rust
if [ -f Cargo.toml ]; then cargo build; fi

# Python
if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
if [ -f pyproject.toml ]; then poetry install; fi

# Go
if [ -f go.mod ]; then go mod download; fi
```

## Baseline Verification

```bash
# Run tests to verify clean state
pnpm test        # Node.js
cargo test       # Rust
pytest           # Python
go test ./...    # Go
```

**If tests fail:** Report failures, ask whether to proceed.
**If tests pass:** Report ready.

## Final Report

```
Worktree ready at <full-path>
Tests passing (<N> tests, 0 failures)
Ready to implement <feature-name>
```

## Quick Reference

| Situation | Action |
|-----------|--------|
| `.worktrees/` exists | Use it (verify .gitignore) |
| `worktrees/` exists | Use it (verify .gitignore) |
| Both exist | Use `.worktrees/` |
| Neither exists | Check CLAUDE.md → Ask user |
| Not in .gitignore | Add + commit immediately |
| Tests fail | Report + ask to proceed |

## Common Mistakes

**Skipping .gitignore verification**
- Worktree contents get tracked, pollute git status

**Assuming directory location**
- Follow priority: existing > CLAUDE.md > ask

**Proceeding with failing tests**
- Can't distinguish new bugs from pre-existing

## Cleanup (After Work Complete)

```bash
# Remove worktree
git worktree remove .worktrees/$BRANCH_NAME

# Or force if uncommitted changes
git worktree remove --force .worktrees/$BRANCH_NAME

# Prune stale worktrees
git worktree prune
```

## Usage

```
/git-worktree feature/auth
/git-worktree fix/session-bug
```

Branch name: $ARGUMENTS