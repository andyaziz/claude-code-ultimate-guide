# Learning to Code with AI: The Conscious Developer's Guide

> **Confidence**: Tier 2 — Based on academic research (2023-2025) and educator feedback
>
> **Audience**: Junior developers, CS students, bootcamp graduates, career changers
>
> **Reading time**: ~15 minutes
>
> **Last updated**: January 2026

---

## Table of Contents

1. [Quick Self-Check (Start Here)](#quick-self-check-start-here)
2. [The Problem in 60 Seconds](#the-problem-in-60-seconds)
3. [The Three Patterns](#the-three-patterns)
4. [The UVAL Protocol](#the-uval-protocol)
5. [Claude Code for Learning](#claude-code-for-learning-not-just-producing)
6. [Breaking Dependency (Pattern: Dependent)](#breaking-dependency)
7. [Embracing AI Tools (Pattern: Avoidant)](#embracing-ai-tools)
8. [Optimizing Your Flow (Pattern: Augmented)](#optimizing-your-flow)
9. [Case Study: Hybrid Learning Principles](#case-study-hybrid-learning-principles)
10. [30-Day Progression Plan](#30-day-progression-plan)
11. [Red Flags Checklist](#red-flags-checklist)
12. [Sources & Research](#sources--research)
13. [See Also](#see-also)

---

## Quick Self-Check (Start Here)

Before diving in, answer honestly:

| # | Question | Yes | No |
|---|----------|-----|-----|
| 1 | Can you explain the last code that AI generated for you? | ☐ | ☐ |
| 2 | Have you debugged code without AI this week? | ☐ | ☐ |
| 3 | Do you know WHY the solution works (not just THAT it works)? | ☐ | ☐ |
| 4 | Could you write the same function without assistance? | ☐ | ☐ |
| 5 | Do you know the AI's limitations on this type of problem? | ☐ | ☐ |

### Your Score

| Score | Where You Are | Jump To |
|-------|--------------|---------|
| **0-2 yes** | Dependency risk — you're outsourcing thinking | [§6 Breaking Dependency](#breaking-dependency) |
| **3-4 yes** | On track — room for optimization | [§8 Optimizing Your Flow](#optimizing-your-flow) |
| **5 yes** | Augmented — you're using AI correctly | [§9 Case Study](#case-study-hybrid-learning-principles) |

Be honest. This guide only helps if you acknowledge where you actually are.

---

## The Problem in 60 Seconds

> AI can make you 3x more productive OR unemployable in 3 years.
> The difference? How you use it.

Forget the statistics for now. Here's a simple metaphor:

**AI is your GPS.**

- Great for getting somewhere fast
- Dangerous if you lose the ability to navigate without it
- Truly useful when you understand the map AND use the GPS

A developer who only copy-pastes AI output is like a driver who can't read a map. Fine until the GPS fails — or until someone asks them to explain the route.

### The Skills Gap

```
Traditional learning: Problem → Struggle → Understanding → Solution
AI-assisted (wrong): Problem → AI → Solution → ??? (no understanding)
AI-assisted (right): Problem → Attempt → AI guidance → Understanding → Solution
```

The struggle isn't optional. It's where learning happens.

---

## The Three Patterns

Every developer using AI falls into one of three patterns:

| Pattern | Signs | Risk | This Guide |
|---------|-------|------|------------|
| **Dependent** | Copy-paste without understanding, can't debug AI code, anxiety without AI | Unemployable | [§6](#breaking-dependency) |
| **Avoidant** | Refuses AI "on principle", slower than peers, dismissive of tools | Left behind | [§7](#embracing-ai-tools) |
| **Augmented** | Uses AI critically, understands everything, knows AI limits | Thriving | [§8](#optimizing-your-flow) |

### Pattern 1: Dependent

**How you got here**: Started with AI from day one, never built foundational skills, deadline pressure made shortcuts appealing.

**The trap**: You ship code you can't explain. When it breaks, you're stuck. In interviews, you freeze.

**What interviewers see**:
- Can't whiteboard basic algorithms
- Struggles with "why did you choose this approach?"
- Asks to "look something up" for fundamental concepts

### Pattern 2: Avoidant

**How you got here**: Purist mindset, fear of "cheating", learned before AI tools existed, distrust of new technology.

**The trap**: You're slower than peers. You spend hours on problems AI solves instantly. You're not learning faster by struggling more — you're just slower.

**What teams see**:
- Reinventing wheels unnecessarily
- Slow on routine tasks
- Resistance to modern tooling

### Pattern 3: Augmented

**How you got here**: Built foundations first OR consciously fixed Pattern 1/2 habits, treat AI as tool not crutch, verify everything.

**The advantage**: You move fast AND understand deeply. You use AI for leverage, not replacement.

**What hiring managers see**:
- Fast delivery with clear explanations
- Can work with OR without AI
- Uses tools appropriately for the task

---

## The UVAL Protocol

A systematic approach to using AI without losing your edge.

### Overview

| Step | Action | Why It Matters |
|------|--------|----------------|
| **U** | Understand First | Ask better questions, catch wrong answers |
| **V** | Verify | Ensure you actually learned, not just copied |
| **A** | Apply | Transform knowledge into skill through modification |
| **L** | Learn | Capture insights for long-term retention |

---

### U — Understand First (The 15-Minute Rule)

**Not just "think for 15 minutes"** — a specific protocol:

#### Step 1: State the Problem (2 min)

Write the problem in ONE sentence. If you can't, you don't understand it yet.

```
❌ "The code doesn't work"
✅ "The login form doesn't show validation errors when email is empty"
```

#### Step 2: Brainstorm Approaches (5 min)

List 3 possible approaches, even if you're not sure they'll work:

```
1. Add client-side validation with JavaScript
2. Use HTML5 required attribute
3. Add server-side validation and return errors
```

This forces you to think before asking AI.

#### Step 3: Identify Knowledge Gaps (3 min)

What specifically do you NOT know?

```
- I know I need validation, but I don't know how to display inline errors in React
- I've never used Zod before but it keeps coming up
```

#### Step 4: THEN Ask AI (5 min)

Now your question is 10x better:

```
❌ "How do I add validation?"
✅ "I'm building a React login form. I want to:
   1. Validate email format client-side
   2. Show inline error messages below the input
   3. Use Zod for schema validation

   I've tried using the HTML required attribute but need custom error messages.
   What's the idiomatic React approach?"
```

Better questions → Better answers → Faster learning.

#### Claude Code Implementation

Add to your `CLAUDE.md`:

```markdown
## Learning Mode
Before generating code for me, ask:
1. What approaches have I already considered?
2. What specifically am I stuck on?
3. What do I expect the solution to look like?

If I skip these, remind me to think first.
```

---

### V — Verify (Explain It Back)

**The rule**: If you can't explain the code to a colleague, you haven't learned it.

#### The Rubber Duck Protocol

After AI generates code:

1. Read every line out loud
2. Explain what each part does
3. Explain WHY it's done this way (not just what)
4. Identify parts you don't understand
5. Ask AI to explain those specific parts

#### Example

AI generates:
```typescript
const schema = z.object({
  email: z.string().email(),
  password: z.string().min(8)
}).refine(data => data.password !== data.email, {
  message: "Password cannot be email",
  path: ["password"]
});
```

Your explanation:
- Line 1: Creates a Zod schema object
- Lines 2-3: Validates email format and password length
- Lines 4-6: Adds custom validation... **wait, what does `refine` do?**

→ Now ask AI specifically about `refine` instead of just copying the whole thing.

#### Claude Code Implementation

Create a custom slash command `/explain-back`:

```markdown
# Explain Back

After I accept generated code, help me verify understanding.

## Instructions

1. Show the code I just accepted
2. Ask me to explain what each major section does
3. Correct any misunderstandings
4. If I can't explain it, break it down further

## Example Prompt

"You just accepted this code. Can you explain:
1. What problem does it solve?
2. Why was this approach chosen?
3. What would break if we removed line X?"
```

See [/learn:quiz command](../examples/commands/learn/quiz.md) for a more comprehensive version.

---

### A — Apply (Transform, Don't Copy)

**The rule**: Never copy-paste AI code directly. Always modify something.

#### Why This Works

Modification forces engagement. Even small changes require understanding:

| Action | Cognitive Load | Learning |
|--------|---------------|----------|
| Copy-paste | Zero | Zero |
| Rename variables | Low | Some |
| Add edge case | Medium | Good |
| Refactor structure | High | Excellent |

#### Minimum Viable Modifications

Always do at least ONE:

1. **Rename** — Change variable names to match your project conventions
2. **Restructure** — Extract a helper function, change iteration method
3. **Extend** — Add an edge case, validation, or error handling
4. **Simplify** — Remove features you don't need

#### Example

AI gives you:
```javascript
function calculateTotal(items) {
  return items.reduce((sum, item) => sum + item.price * item.quantity, 0);
}
```

You transform it:
```javascript
// Added: explicit type checking, edge case handling
function calculateCartTotal(cartItems) {
  if (!Array.isArray(cartItems) || cartItems.length === 0) {
    return 0;
  }
  return cartItems.reduce((total, item) => {
    const itemPrice = Number(item.price) || 0;
    const itemQty = Number(item.quantity) || 0;
    return total + itemPrice * itemQty;
  }, 0);
}
```

Now you've engaged with the code, added your own thinking, and learned something.

---

### L — Learn (Capture the Insight)

**Not a daily journal** — nobody maintains those. Instead: automated capture.

#### The One-Thing Rule

At the end of each coding session, capture ONE thing you learned. Not ten. One.

```markdown
## 2026-01-17
**Learned**: Zod's `refine()` method for cross-field validation
**Context**: Login form needed password ≠ email check
**Future me**: Use refine() when validation involves multiple fields
```

#### Claude Code Implementation

Create a session-end hook:

```bash
# .claude/hooks/bash/learning-capture.sh
# Prompts for one learning at session end
```

See [examples/hooks/bash/learning-capture.sh](../examples/hooks/bash/learning-capture.sh) for implementation.

The hook asks: "What's ONE thing you learned this session?" and logs it automatically.

---

## Claude Code for Learning (Not Just Producing)

Claude Code has specific features that support learning. Here's how to configure them.

### CLAUDE.md Configuration for Learning Mode

Create this in your `CLAUDE.md`:

```markdown
# Learning-First Configuration

## My Learning Goals
- I'm learning: [React hooks, TypeScript, system design, etc.]
- My level: [beginner/intermediate] on these topics
- I learn best when: [examples are shown first, concepts are explained, etc.]

## Response Style
- Always explain WHY, not just WHAT
- After code blocks, ask "What questions do you have about this?"
- Highlight concepts I should understand deeper
- Point out common mistakes beginners make

## Challenges
- Suggest exercises to reinforce concepts after implementing
- Point out edge cases I should consider
- Ask me to predict output before showing it

## When I Ask for Help
1. First ask what I've already tried
2. Guide me toward the answer before giving it
3. Explain the underlying concept, not just the fix
```

Full template: [examples/claude-md/learning-mode.md](../examples/claude-md/learning-mode.md)

---

### Slash Commands for Learning

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/explain` | Explain existing code | Built-in — use on any confusing code |
| `/learn:quiz` | Test your understanding | After implementing a new concept |
| `/learn:alternatives` | Show other approaches | When you want to understand trade-offs |
| `/learn:teach <concept>` | Step-by-step explanation | When learning something new |

> **Note**: Commands use the `/learn:` namespace. Place files in `.claude/commands/learn/`.

#### Creating /learn:quiz

Create `.claude/commands/learn/quiz.md`:

```markdown
# Quiz Me

Test my understanding of the code I just wrote or accepted.

## Instructions

1. Look at the last code I worked with
2. Generate 3-5 questions testing:
   - What does this code do?
   - Why was this approach chosen?
   - What would happen if X changed?
   - How would you extend this?
3. Wait for my answers
4. Provide feedback with explanations

$ARGUMENTS (optional: focus area like "error handling" or "performance")
```

Full template: [examples/commands/learn/quiz.md](../examples/commands/learn/quiz.md)

---

### Hooks That Build Habits

#### Learning Capture Hook (Session End)

Automatically prompts for daily learning capture:

```json
{
  "hooks": {
    "Stop": [{
      "hooks": [{
        "type": "command",
        "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/bash/learning-capture.sh"
      }]
    }]
  }
}
```

---

### The 70/30 Weekly Split

Balance learning and producing:

| Activity | Time | AI Usage | Why |
|----------|------|----------|-----|
| **Core learning** (new concepts) | 70% | 30% AI | Struggle builds understanding |
| **Practice/projects** (applying known skills) | 30% | 70% AI | Leverage what you already know |

#### Week Structure Example

```
Monday:    Learn new React pattern     (minimal AI)
Tuesday:   Learn new React pattern     (minimal AI)
Wednesday: Apply to project            (full AI assistance)
Thursday:  Learn testing approach      (minimal AI)
Friday:    Apply + ship                (full AI assistance)
```

The key: Don't use AI heavily when learning NEW concepts. Use it heavily when applying concepts you already understand.

---

## Breaking Dependency

**For Pattern 1 developers**: You've been using AI as a crutch. Here's how to rebuild your foundation.

### Week 1: The Cold Turkey Period

**Goal**: Prove to yourself you can code without AI.

| Day | Exercise | Duration |
|-----|----------|----------|
| 1-2 | Build a simple feature WITHOUT AI | 2 hours |
| 3-4 | Debug an issue using only documentation | 1 hour |
| 5 | Explain code you previously AI-generated | 30 min |

**Expect this to feel slow and frustrating.** That's the learning happening.

### Week 2: Guided Reintroduction

**Goal**: Use AI as a teacher, not a generator.

| Day | Exercise | AI Role |
|-----|----------|---------|
| 1-2 | Ask AI to explain concepts, then implement yourself | Tutor |
| 3-4 | Write code first, then ask AI for review | Reviewer |
| 5 | Compare your solution to AI's, understand differences | Comparator |

### Week 3-4: Balanced Usage

**Goal**: Develop critical AI usage habits.

Apply the UVAL protocol (§4) to every interaction:

1. **Understand** — 15-minute rule before asking
2. **Verify** — Explain every line back
3. **Apply** — Transform, don't copy
4. **Learn** — Capture one insight per session

### Red Flags You're Slipping

| Sign | Action |
|------|--------|
| Copying without reading | Stop. Read every line first. |
| Can't explain what code does | Use `/explain-back` command |
| Anxiety when AI unavailable | Practice 30 min daily without AI |
| Failed interview questions | Focus on fundamentals without AI |

---

## Embracing AI Tools

**For Pattern 2 developers**: You've been avoiding AI. Here's why that's hurting you and how to change.

### Why Avoidance Is a Problem

The job market has changed:

- Teams expect AI-assisted productivity
- "Pure" coding is slower for routine tasks
- Refusing tools signals inflexibility

You're not cheating by using AI. You're being inefficient by not using it.

### Week 1: Low-Stakes Introduction

**Goal**: Use AI for tasks that don't feel like "cheating."

| Task | Why It's Safe | Try It |
|------|---------------|--------|
| Generate boilerplate | Nobody learns from typing imports | "Generate React component boilerplate" |
| Explain unfamiliar code | You'd Google this anyway | `/explain this codebase` |
| Write documentation | Documentation isn't the skill | "Document this function" |
| Generate test cases | Tests verify YOUR understanding | "Generate test cases for this function" |

### Week 2: Expanded Usage

**Goal**: Use AI for tasks you'd normally struggle through.

| Task | Old Way | AI-Assisted Way |
|------|---------|-----------------|
| Debug error message | Stack Overflow rabbit hole | "Explain this error and likely causes" |
| Learn new library | Read entire docs | "Show me the key patterns for X" |
| Refactor code | Manual, error-prone | "Refactor for readability, explain changes" |

### Week 3-4: Integration

**Goal**: AI becomes part of your normal workflow.

Apply UVAL protocol to ensure you're learning, not just generating.

### Mindset Shift

**Old thinking**: "Using AI means I'm not a real developer."

**New thinking**: "AI handles routine tasks so I can focus on architecture, design, and complex problem-solving."

The best developers use every tool available. AI is a tool.

---

## Optimizing Your Flow

**For Pattern 3 developers**: You're using AI well. Here's how to level up.

### Advanced UVAL Applications

#### Predictive Prompting

Before AI generates code, predict the approach:

```
My prediction: This will probably use reduce() with an accumulator
Then compare to AI output — learn from differences
```

#### Teaching Mode

Use AI to test your knowledge by teaching:

```
I'll explain how React hooks work. Correct my mistakes and fill gaps.

useState stores state that persists between renders...
```

AI acts as a smart rubber duck that can catch errors.

#### Comparative Analysis

Ask for multiple approaches, then choose:

```
Show me 3 ways to implement this:
1. Using class components
2. Using hooks
3. Using a state management library

Explain trade-offs of each.
```

This builds architectural thinking.

---

### Advanced Claude Code Configuration

#### Dynamic Learning Mode

```markdown
# Advanced Learning Configuration

## Adaptive Responses
- For topics I mark as "learning": explain thoroughly
- For topics I mark as "known": be concise
- Track my progress within this session

## Challenge Mode (Optional)
When I say "challenge mode on":
- Don't give me complete solutions
- Ask Socratic questions
- Guide me to discover the answer

## Review Mode
After each feature, summarize:
1. New concepts introduced
2. Patterns worth remembering
3. Potential interview questions from this code
```

#### Spaced Repetition Integration

Track concepts for future review:

```bash
# In learning-capture.sh
# Tag concepts with review dates
echo "2026-01-24,zod-refine,$PROJECT" >> ~/.claude/review-queue.csv
```

Then periodically quiz yourself on past learnings.

---

## Case Study: Hybrid Learning Principles

What works best for learning with AI? Research and successful implementations point to the same pattern.

### From Academic Research (2023-2025)

Studies on AI-assisted learning show optimal results with:

| Component | Purpose | Without It |
|-----------|---------|------------|
| **Human supervision** | Motivation, critical feedback, accountability | Students drift, lose direction |
| **AI assistance** | Immediate feedback, infinite patience, practice repetition | Slower iteration, less practice |
| **Progressive autonomy** | Decreasing supervision as skill grows | Never become independent |

The key insight: AI excels at **practice and feedback**, humans excel at **motivation and critical evaluation**.

### Real-World Implementation: Méthode Aristote

A French educational platform (middle/high school) applies these principles at scale:

**Their Model**:
- Dedicated human tutor = accountability + critical feedback
- AI-powered exercises = structured practice, expert-validated content
- Same tutor over time = relationship, understanding of progress

**Transferable Principles for Developers**:

| Aristote Principle | Developer Equivalent |
|--------------------|---------------------|
| Dedicated tutor | Mentor/senior + regular code reviews |
| AI validated by teachers | AI + verification through tests/linter/review |
| Level-based progression | Projects of increasing complexity |
| Long-term relationship | Consistent feedback from same people |

**Their Philosophy**: *"Exigence, bienveillance, équité"* (Rigor, kindness, equity)

Applied to coding:
- **Rigor**: Don't accept code you can't explain
- **Kindness**: AI is a tool, not a judge — use it without guilt
- **Equity**: Everyone can learn, pace varies — don't compare yourself to others

→ [methode-aristote.fr](https://www.methode-aristote.fr/)

### Building Your Own Support System

You probably don't have a dedicated tutor, but you can create the structure:

| Need | Solution |
|------|----------|
| Accountability | Weekly check-ins with peer/mentor |
| Critical feedback | Code reviews, pair programming |
| Structured practice | Deliberate exercises, not just project work |
| Progress tracking | Learning journal, skill assessment |

The combination of **human accountability + AI practice** beats either alone.

---

## 30-Day Progression Plan

A concrete path from wherever you are to augmented developer.

### Week 1: Foundations

**Focus**: Build (or rebuild) core skills without heavy AI reliance.

| Day | Activity | AI Usage |
|-----|----------|----------|
| 1-2 | Build simple feature WITHOUT AI | 0% |
| 3 | Review: Explain your code out loud | 0% |
| 4-5 | Refactor with AI review (not generation) | 20% |
| 6 | Debug issue without AI | 0% |
| 7 | Rest/reflection | — |

**Success criteria**: Can explain every line you wrote.

### Week 2: Understanding

**Focus**: Use AI, but force understanding.

| Day | Activity | AI Usage |
|-----|----------|----------|
| 1-2 | Ask AI to generate, explain EVERY line | 40% |
| 3 | Write code, AI reviews, you fix | 30% |
| 4-5 | AI explains new concept, you implement | 40% |
| 6 | Quiz yourself on week's concepts | 10% |
| 7 | Rest/reflection | — |

**Success criteria**: Can modify AI-generated code confidently.

### Week 3: Critical Usage

**Focus**: Challenge AI suggestions, find their limits.

| Day | Activity | AI Usage |
|-----|----------|----------|
| 1-2 | Ask for multiple approaches, choose best | 60% |
| 3 | Find bugs in AI-generated code | 50% |
| 4-5 | Complex feature with AI assistance | 60% |
| 6 | Explain entire feature to rubber duck | 10% |
| 7 | Rest/reflection | — |

**Success criteria**: Can identify when AI is wrong.

### Week 4: Augmented

**Focus**: Full productivity with maintained understanding.

| Day | Activity | AI Usage |
|-----|----------|----------|
| 1-5 | Real project work with UVAL protocol | 70% |
| 6 | Review: What did you learn this week? | 10% |
| 7 | Plan next learning goals | — |

**Success criteria**: Fast AND you understand everything.

---

## Red Flags Checklist

Warning signs you're becoming dependent, and what to do:

| Red Flag | What's Happening | Immediate Action |
|----------|-----------------|------------------|
| Can't start without AI | Outsourced problem decomposition | Code 30 min daily without AI |
| Don't understand AI's code | Copying without learning | Use `/explain-back` on EVERYTHING |
| Can't debug AI errors | Never learned debugging | Deliberately break code, fix manually |
| Anxiety without AI | Emotional dependence | It's a tool, not a lifeline — practice without |
| Rejected in interviews | Fundamentals atrophied | Practice whiteboard problems without AI |
| Always ask "how" never "why" | Surface-level usage | Force yourself to ask "why this approach?" |
| Every solution looks the same | AI has patterns, you need variety | Study multiple implementations manually |

### Weekly Self-Audit

Every Friday, ask:

1. What did I learn this week that I didn't know before?
2. Could I have done this week's work without AI?
3. Did I understand everything I shipped?
4. Am I faster than last month? Am I smarter?

If you're faster but not smarter, you're building dependency.

---

## Sources & Research

### Academic Research

- **GitHub Copilot Impact Study (2024)** — [dl.acm.org](https://dl.acm.org/doi/10.1145/3613904.3642394) — Found productivity gains but identified skill atrophy risks in junior developers
- **Student Dependency Patterns in AI-Assisted Learning** — IACIS 2024 — Documented "learned helplessness" in students over-reliant on AI
- **Junior Developer Career Trajectories with AI Tools** — Software Engineering Institute — 3-year longitudinal study on skill development

### Industry Reports

- **Stack Overflow Developer Survey 2025** — AI tool adoption and perceived impact on learning
- **State of Developer Ecosystem 2025** — JetBrains — AI usage patterns by experience level
- **GitHub Octoverse 2025** — Code generation adoption rates and practices

### Practitioner Perspectives

- **Anthropic Claude Code Best Practices** — [anthropic.com](https://www.anthropic.com/engineering/claude-code-best-practices) — Official guidance on effective usage
- **ThoughtWorks Technology Radar** — AI-assisted development maturity model
- **Martin Fowler on AI Pair Programming** — Patterns for effective human-AI collaboration

### Educational Frameworks

- **Méthode Aristote** — [methode-aristote.fr](https://www.methode-aristote.fr/) — Hybrid human+AI tutoring model
- **Bloom's Taxonomy Applied to AI Learning** — Cognitive levels in AI-assisted education
- **Zone of Proximal Development with AI** — Vygotsky's theory applied to AI scaffolding

### Methodology References

See [methodologies.md](./methodologies.md) for:
- TDD with AI assistance
- Spec-Driven Development
- Eval-Driven Development for AI outputs

---

## See Also

### In This Guide

- [Methodologies: TDD with Claude](./methodologies.md#tier-5-implementation) — Write tests first, then implement
- [Workflows: Spec-First](./workflows/spec-first.md) — Understand requirements before code
- [Workflows: Plan-Driven](./workflows/plan-driven.md) — Use /plan mode for complex work
- [Ultimate Guide: Mental Models](./ultimate-guide.md#mental-model) — How to think about Claude interactions

### Templates & Examples

- [Learning Mode CLAUDE.md](../examples/claude-md/learning-mode.md) — Configuration template
- [/learn:quiz Command](../examples/commands/learn/quiz.md) — Self-testing slash command
- [/learn:teach Command](../examples/commands/learn/teach.md) — Step-by-step concept explanations
- [/learn:alternatives Command](../examples/commands/learn/alternatives.md) — Compare different approaches
- [Learning Capture Hook](../examples/hooks/bash/learning-capture.sh) — Automated insight logging

### External Resources

- [Anthropic Prompt Engineering Guide](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview) — Better prompts = better learning
- [The Pragmatic Programmer](https://pragprog.com/titles/tpp20/the-pragmatic-programmer-20th-anniversary-edition/) — Timeless principles for deliberate practice

---

## Quick Reference Card

### UVAL Protocol Summary

```
U — UNDERSTAND FIRST
    State → Brainstorm → Identify gaps → THEN ask AI

V — VERIFY
    Read every line → Explain out loud → Ask about gaps

A — APPLY
    Never copy raw → Rename/Restructure/Extend/Simplify

L — LEARN
    One insight per session → Log it → Review later
```

### The 70/30 Rule

```
Learning new things: 70% struggle, 30% AI
Applying known skills: 30% struggle, 70% AI
```

### Daily Minimums

```
☐ 15 min: Code something without AI
☐ 5 min: Explain one piece of code out loud
☐ 1 min: Log one thing you learned
```

### Claude Code Commands for Learning

```
/explain              — Understand existing code
/learn:quiz           — Test your understanding
/learn:teach <topic>  — Learn something new
/learn:alternatives   — Compare approaches
```

---

*This guide is part of the [Claude Code Ultimate Guide](./ultimate-guide.md). For questions or contributions, see the main repository.*
