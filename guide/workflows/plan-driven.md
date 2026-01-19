# Plan-Driven Development

> **Confidence**: Tier 1 — Based on Claude Code's native /plan mode functionality.

Use `/plan` mode for anything non-trivial. Claude explores the codebase (read-only), then proposes an implementation plan for your approval.

---

## Table of Contents

1. [TL;DR](#tldr)
2. [The /plan Workflow](#the-plan-workflow)
3. [When to Use](#when-to-use)
4. [Plan File Structure](#plan-file-structure)
5. [Integration with Other Workflows](#integration-with-other-workflows)
6. [Tips](#tips)
7. [See Also](#see-also)

---

## TL;DR

```
1. /plan (or ask complex question)
2. Claude explores codebase (read-only)
3. Claude writes plan to .claude/plans/
4. You review and approve
5. Claude executes
```

---

## The /plan Workflow

### Step 1: Enter Plan Mode

Either use the slash command:
```
/plan
```

Or ask a complex question that triggers plan mode automatically:
```
How should I refactor the authentication system to support OAuth?
```

### Step 2: Claude Explores

In plan mode, Claude:
- Reads relevant files
- Searches for patterns
- Understands existing architecture
- CANNOT make any changes

### Step 3: Claude Writes Plan

Claude creates a plan file at `.claude/plans/[name].md`:

```markdown
# Plan: Refactor Authentication for OAuth

## Summary
Add OAuth support while maintaining existing email/password auth.

## Files to Modify
- src/auth/providers/index.ts (add OAuth provider)
- src/auth/middleware.ts (handle OAuth tokens)
- src/config/auth.ts (OAuth config)

## Files to Create
- src/auth/providers/oauth.ts
- src/auth/providers/google.ts

## Implementation Steps
1. Create OAuth provider interface
2. Implement Google OAuth provider
3. Update middleware to detect token type
4. Add OAuth routes
5. Update config schema

## Risks
- Breaking existing sessions during migration
- Token format differences between providers
```

### Step 4: You Review

Review the plan for:
- Completeness (all requirements covered)
- Correctness (right approach for your codebase)
- Scope (not over-engineering)

### Step 5: Approve and Execute

```
Looks good. Proceed with the plan.
```

Or request changes:
```
Modify the plan: also add support for GitHub OAuth, not just Google.
```

---

## When to Use

### Use Plan Mode

| Scenario | Why |
|----------|-----|
| Multi-file changes | See all affected files upfront |
| Architecture changes | Validate approach before coding |
| New features | Ensure complete implementation |
| Unfamiliar codebase | Let Claude explore first |
| Risky operations | Review before execution |

### Skip Plan Mode

| Scenario | Why |
|----------|-----|
| Single-line fixes | Obvious, low risk |
| Typo corrections | No planning needed |
| Simple questions | Exploration, not implementation |
| Adding comments | Trivial change |

---

## Plan File Structure

Plans are stored in `.claude/plans/` with auto-generated names.

### Typical Plan Sections

```markdown
# Plan: [Title]

## Summary
[1-2 sentence overview]

## Context
[Why this change is needed]

## Files to Modify
[List of existing files that will change]

## Files to Create
[List of new files]

## Files to Delete
[List of files to remove, if any]

## Implementation Steps
[Ordered list of steps]

## Testing Strategy
[How to verify the changes]

## Risks & Mitigations
[What could go wrong and how to handle it]

## Open Questions
[Things to clarify before proceeding]
```

---

## Integration with Other Workflows

### Plan + TDD

```
/plan

I need to implement a rate limiter.
Plan the test cases first, then the implementation.
```

Claude plans both tests and implementation in proper TDD order.

### Plan + Spec-First

```
/plan

Review the Payment Processing spec in CLAUDE.md.
Create an implementation plan that satisfies all acceptance criteria.
```

### Plan + TodoWrite

After plan approval, Claude can break down into todos:

```
Approved. Create a todo list from this plan and start implementing.
```

---

## Tips

### Be Specific About Scope

```
# Too vague
/plan
Improve the API

# Better
/plan
Add pagination to the /users endpoint with cursor-based navigation.
Maintain backwards compatibility with existing clients.
```

### Request Plan Modifications

```
The plan looks good but:
- Add error handling for network failures
- Skip the caching optimization for now
- Include rollback procedure
```

### Use for Architecture Decisions

```
/plan

I'm considering two approaches for state management:
A) Redux Toolkit
B) Zustand

Explore the codebase and recommend which fits better.
```

### Save Plans for Documentation

Plans in `.claude/plans/` serve as decision documentation:
- Why certain approaches were chosen
- What files were expected to change
- Implementation order rationale

---

## See Also

- [exploration-workflow.md](./exploration-workflow.md) — Explore alternatives before planning
- [../ultimate-guide.md](../ultimate-guide.md) — Section 2.3 Plan Mode
- [tdd-with-claude.md](./tdd-with-claude.md) — Combine with TDD
- [spec-first.md](./spec-first.md) — Combine with Spec-First
- [iterative-refinement.md](./iterative-refinement.md) — Post-plan iteration
