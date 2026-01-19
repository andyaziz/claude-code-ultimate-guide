# Iterative Refinement

> **Confidence**: Tier 2 — Validated pattern observed across many Claude Code users.

Prompt, observe, reprompt until satisfied. The core loop of effective AI-assisted development.

---

## Table of Contents

1. [TL;DR](#tldr)
2. [The Loop](#the-loop)
3. [Feedback Patterns](#feedback-patterns)
4. [Autonomous Loops](#autonomous-loops)
5. [Integration with Claude Code](#integration-with-claude-code)
6. [Script Generation Workflow](#script-generation-workflow)
7. [Iteration Strategies](#iteration-strategies)
8. [Anti-Patterns](#anti-patterns)
9. [See Also](#see-also)

---

## TL;DR

```
1. Initial prompt with clear goal
2. Claude produces output
3. Evaluate against criteria
4. Specific feedback: "Change X because Y"
5. Repeat until done
```

Key insight: **Specific feedback > vague feedback**

---

## The Loop

### Step 1: Initial Prompt

Start with clear intent and constraints:

```
Create a React component for a user profile card.
- Show avatar, name, bio
- Include edit button
- Use Tailwind CSS
- Mobile-responsive
```

### Step 2: Evaluate Output

Claude produces code. Evaluate:
- Does it meet requirements?
- What's missing?
- What's wrong?
- What could be better?

### Step 3: Specific Feedback

Provide targeted corrections:

```
Good start. Changes needed:
1. Avatar should be circular, not square
2. Edit button should only show for own profile (add isOwner prop)
3. Bio should truncate after 3 lines with "Show more"
```

### Step 4: Repeat

Continue until satisfied:

```
Better. One more thing:
- Add loading skeleton state for when data is fetching
```

---

## Feedback Patterns

### Effective Feedback

| Pattern | Example |
|---------|---------|
| **Specific location** | "Line 23: change `===` to `==`" |
| **Clear action** | "Add error boundary around the form" |
| **Reason given** | "Remove the console.log because it leaks user data" |
| **Priority marked** | "Critical: fix the SQL injection. Nice-to-have: add pagination." |

### Ineffective Feedback

| Anti-Pattern | Why It Fails | Better Alternative |
|--------------|--------------|-------------------|
| "Make it better" | No direction | "Improve readability by extracting the validation logic" |
| "This is wrong" | No specifics | "The date format should be ISO 8601, not Unix timestamp" |
| "I don't like it" | Subjective | "Use functional components instead of class components" |
| "Fix the bugs" | Too vague | "Fix: 1) null check on line 12, 2) off-by-one in loop" |

---

## Autonomous Loops

Claude can self-iterate with clear completion criteria.

### The Ralph Wiggum Pattern

Named after the self-improvement loop pattern:

```
Keep improving the code quality until:
1. All tests pass
2. No TypeScript errors
3. ESLint shows zero warnings

After each iteration, run the checks and fix any issues.
Stop when all criteria are met.
```

### Completion Criteria Examples

```
Iterate until:
- Response time < 100ms for 95th percentile
- Test coverage > 80%
- All accessibility checks pass
- Bundle size < 200KB
```

### Iteration Limits

Always set limits to prevent infinite loops:

```
Improve the algorithm performance.
Maximum 5 iterations.
Stop early if improvement < 5% between iterations.
```

---

## Integration with Claude Code

### With TodoWrite

Track refinement iterations:

```
TodoWrite:
- [x] Initial implementation
- [x] Fix: handle empty arrays
- [x] Fix: add input validation
- [ ] Optimization: memoize expensive calculations
```

### With Hooks

Auto-validate after each change:

```yaml
# .claude/hooks.yaml
post_edit:
  - command: "npm run lint && npm test"
    on_failure: "report"
```

Claude sees failures and can self-correct.

### With /compact

When context grows during iterations:

```
/compact

Continue refining the search algorithm.
We've made good progress, focus on the remaining issues.
```

### Checkpointing

After significant progress:

```
Good progress. Let's checkpoint:
- Commit what we have
- List remaining issues
- Continue with the next priority
```

---

## Script Generation Workflow

Script and automation generation delivers the highest ROI for iterative refinement—70-90% time savings in practitioner reports. Scripts are self-contained, testable in isolation, and yield immediate value.

### The 3-7 Iteration Pattern

Most production-ready scripts emerge after 3-7 iterations:

| Iteration | Focus | Prompt Pattern |
|-----------|-------|----------------|
| 1 | Basic functionality | "Create a script that [goal]" |
| 2-3 | Constraints + edge cases | "Add [constraint]. Handle [edge case]." |
| 4-5 | Hardening | "Add error handling, logging, input validation" |
| 6-7 | Polish | "Optimize for [metric]. Add usage docs." |

### Example: Kubernetes Pod Manager (PowerShell)

**Iteration 1 — Basic**
```
Create a PowerShell function to list pods in a Kubernetes namespace.
```

**Iteration 2 — Add filtering**
```
Add: filter by label selector and pod status.
Show: pod name, status, age, restarts.
```

**Iteration 3 — Add actions**
```
Add: ability to delete pods matching filter.
Require: confirmation before deletion.
```

**Iteration 4 — Error handling**
```
Handle: kubectl not found, invalid namespace, permission denied.
Add: verbose logging with -Verbose flag.
```

**Iteration 5 — Production ready**
```
Add: dry-run mode, output to JSON for piping, help documentation.
Ensure: works on Windows, Linux, macOS.
```

### Common Pitfalls

| Pitfall | Example | Mitigation |
|---------|---------|------------|
| Hallucinated commands | `apt-get` on macOS | Specify OS: "Ubuntu 22.04 only" |
| Security gaps | No input validation | Always request: "validate all user inputs" |
| Over-engineering | Adds unnecessary libs | Request: "minimal dependencies, stdlib preferred" |
| Context drift | Forgets requirements after iteration 5 | Checkpoint prompt: "Recap current requirements before next change" |
| Platform assumptions | Assumes bash features in sh | Specify: "POSIX-compliant" or "bash 4+" |

### Script Iteration Template

```
Current script: [paste or reference]

Iteration goal: [specific improvement]

Constraints:
- Must preserve: [existing behavior to keep]
- Must not: [things to avoid]
- Target environment: [OS, shell, runtime]

Success criteria: [how to verify this iteration works]
```

---

## Iteration Strategies

### Breadth-First

Fix all issues at same level before going deeper:

```
First pass: Fix all type errors
Second pass: Fix all lint warnings
Third pass: Improve test coverage
Fourth pass: Optimize performance
```

### Depth-First

Complete one area fully before moving on:

```
1. Perfect the authentication flow (all aspects)
2. Then move to user management
3. Then move to settings
```

### Priority-Based

Address by importance:

```
Iterate in this order:
1. Security issues (critical)
2. Data integrity bugs (high)
3. UX problems (medium)
4. Code style (low)
```

---

## Anti-Patterns

### Moving Target

```
# Wrong
"Actually, let's change the approach entirely..."
(Repeated 5 times)

# Right
Commit to an approach, iterate within it.
If approach is wrong, explicitly restart.
```

### Perfectionism Loop

```
# Wrong
Keep improving forever

# Right
Set clear "good enough" criteria:
- Tests pass
- Handles main use cases
- No critical issues
→ Ship it, improve later
```

### Lost Context

```
# Wrong
After 50 iterations, forget what the goal was

# Right
Periodically restate the goal:
"Reminder: we're building a rate limiter.
Current state: basic implementation works.
Next: add Redis backend."
```

---

## Example Session

### Initial Request
```
Create a debounce function in TypeScript.
```

### Iteration 1
```
Looks good. Add:
- Generic type support for any function signature
- Option to execute on leading edge
```

### Iteration 2
```
Better. Issues:
- The return type should preserve the original function's return type
- Add cancellation support
```

### Iteration 3
```
Almost there. Final polish:
- Add JSDoc comments
- Export the types separately
- Add unit tests
```

### Completion
```
Perfect. Commit this as "feat: add debounce utility with full TypeScript support"
```

---

## See Also

- [exploration-workflow.md](./exploration-workflow.md) — Explore alternatives before iterating
- [tdd-with-claude.md](./tdd-with-claude.md) — TDD is iterative refinement with tests
- [plan-driven.md](./plan-driven.md) — Plan before iterating
- [../methodologies.md](../methodologies.md) — Iterative Loops methodology
