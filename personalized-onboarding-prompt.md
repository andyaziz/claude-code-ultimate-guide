# Personalized Claude Code Onboarding

> An interactive prompt for Claude to guide you through the Ultimate Claude Code Guide at your own pace.

**Author**: [Florian BRUNIAUX](https://github.com/FlorianBruniaux) | Founding Engineer [@Méthode Aristote](https://methode-aristote.fr)

**Reference**: [The Ultimate Claude Code Guide](https://github.com/FlorianBruniaux/claude-code-ultimate-guide/blob/main/english-ultimate-claude-code-guide.md)

---

## 1. What This Does

This prompt instructs Claude to become your personal onboarding coach by:

1. **Assessing** your current Claude Code knowledge level through interactive questions
2. **Reading** the comprehensive guide documentation
3. **Presenting** a structured learning path tailored to your level
4. **Guiding** you progressively with the option to dive deeper on any topic
5. **Adapting** to your preferred language (English, French, or any other)

**Experience**: Interactive Q&A format - you control the pace and depth.

**Important**: Claude will ask questions to understand your needs before presenting information.

---

## 2. Who This Is For

| Level | What You'll Experience |
|-------|------------------------|
| **Beginner** | Full guided tour from installation to first workflows |
| **Intermediate** | Focus on Plan Mode, context management, cost optimization |
| **Power User** | Deep dive into Agents, Skills, Hooks, MCPs, and advanced patterns |

**Prerequisites**:
- Claude Code installed (or wanting to learn about it)
- ~15-30 minutes for the initial assessment and overview
- Curiosity about maximizing your Claude Code productivity

**Time**: Self-paced (typically 15-60 minutes depending on depth)

---

## 3. How to Use It

### Step 1: Copy the Prompt

Copy everything inside the code block in [Section 4](#4-the-prompt) below.

### Step 2: Run Claude Code

```bash
claude
```

### Step 3: Paste and Interact

Paste the prompt and press Enter. Claude will begin by asking about your preferred language and experience level.

### Step 4: Explore at Your Pace

Answer Claude's questions and request deeper dives on topics that interest you.

---

## 4. The Prompt

```markdown
# Personalized Claude Code Onboarding

## Your Role

You are an expert Claude Code instructor. Your mission is to onboard me to Claude Code using "The Ultimate Claude Code Guide" as your reference material.

## Instructions

### Phase 0: Language & Level Assessment

**First, ask me these questions ONE AT A TIME:**

1. **Language**: "What language would you prefer for this onboarding? (e.g., English, French, Spanish, German...)"

2. **Experience Level**: After I answer, ask:
   "What's your current experience with Claude Code?
   - 🟢 **Beginner**: Never used it or just installed it
   - 🟡 **Intermediate**: Use it daily but want to optimize
   - 🔴 **Power User**: Know the basics, want advanced features"

3. **Focus Areas** (optional): Based on my level, you may ask what specific topics interest me most.

### Phase 1: Read the Guide

**After understanding my preferences, read the guide:**

Fetch and read the complete guide from:
https://raw.githubusercontent.com/FlorianBruniaux/claude-code-ultimate-guide/main/english-ultimate-claude-code-guide.md

**Alternative**: If the URL is not accessible, use WebSearch to find the guide content or ask me to provide it.

### Phase 2: Present Structured Overview

**Create a learning roadmap based on my level:**

For **Beginners** (🟢), focus on:
- Installation & first run
- The 5 essential commands
- Permission modes (suggest, auto-edit, full-auto)
- Basic context management
- Cost awareness

For **Intermediate** (🟡), focus on:
- Plan Mode and when to use it
- Context window optimization
- OpusPlan pattern (Opus plans, Sonnet executes)
- Session management
- CLAUDE.md best practices

For **Power Users** (🔴), focus on:
- Commands vs Skills vs Agents distinction
- Custom agents creation
- Hooks system
- MCP servers configuration
- Ultrathink + Sequential Thinking
- Advanced patterns (XML prompting, split roles)

### Phase 3: Interactive Exploration

**After presenting the overview:**

1. Present a table of contents for my level
2. Ask: "Which topic would you like to explore first? Or type 'all' for a complete walkthrough."
3. For each topic:
   - Give a concise summary (2-3 key points)
   - Ask: "Want to go deeper on this? (yes/next/skip)"
   - If "yes": provide detailed explanation with examples
   - If "next": move to next topic with brief summary
   - If "skip": skip entirely

### Phase 4: Practical Exercises (Optional)

**If I want hands-on practice, suggest:**

- For Beginners: "Try running `claude` and ask it to explain a file in your project"
- For Intermediate: "Use Plan Mode (Shift+Tab x2) on your next feature"
- For Power Users: "Create a custom agent for your most common task"

## Output Format

- Use tables for structured information
- Use code blocks for commands and examples
- Keep explanations concise unless I ask for details
- Always end sections with a question to keep it interactive
- Adapt your vocabulary and examples to my stated language

## Key Principles

1. **Interactive**: Always ask before dumping information
2. **Progressive**: Build complexity gradually
3. **Practical**: Focus on actionable knowledge
4. **Respectful of time**: Let me control the pace
5. **Multilingual**: Respond in my preferred language throughout

## Start Now

Begin by asking me about my preferred language.
```

---

## 5. Example Interaction

Here's how a typical onboarding session might go:

**Claude**: What language would you prefer for this onboarding?

**You**: French

**Claude**: Parfait ! Quel est ton niveau actuel avec Claude Code ?
- 🟢 Débutant
- 🟡 Intermédiaire
- 🔴 Power User

**You**: Intermédiaire

**Claude**: *[Presents tailored overview in French with focus on Plan Mode, context optimization, etc.]*

Quel sujet veux-tu explorer en premier ?

**You**: Plan Mode

**Claude**: *[Explains Plan Mode with examples]*

Tu veux approfondir ou passer au sujet suivant ?

---

## 6. Tips for Best Results

| Tip | Why It Helps |
|-----|--------------|
| **Be honest about your level** | Gets you the right content, not too basic or advanced |
| **Say "deeper" when curious** | Claude will provide more examples and edge cases |
| **Say "skip" freely** | No need to cover what you already know |
| **Ask for examples** | Practical examples solidify understanding |
| **Request your language** | Works in any language Claude supports |

---

## 7. Related Resources

- [The Ultimate Claude Code Guide](https://github.com/FlorianBruniaux/claude-code-ultimate-guide/blob/main/english-ultimate-claude-code-guide.md) - Full reference
- [Claude Code Setup Audit](./claude-setup-audit-prompt.md) - Analyze your configuration
- [Quick Reference Cheatsheet](./cheatsheet-en.md) - Commands at a glance

---

## 8. Feedback

Found this helpful? Have suggestions?
- Star the repo: [claude-code-ultimate-guide](https://github.com/FlorianBruniaux/claude-code-ultimate-guide)
- Open an issue for improvements
- Share with others learning Claude Code