# Andrej Karpathy Coding Skills

Derived from Karpathy's observations on LLM coding pitfalls, these principles aim to maximize AI efficiency and code quality.

## Core Principles

### 1. Think Before Coding
**Don't assume. Don't hide confusion. Surface tradeoffs.**
- **Explicit Assumptions**: State what you assume before writing a single line.
- **Ambiguity Check**: If a request can be interpreted in multiple ways, ask for clarification.
- **Push Back**: If the user's request leads to unnecessary complexity, suggest a simpler alternative.
- **Stop on Confusion**: Do not "guess" when logic is unclear.

### 2. Simplicity First
**Minimum code that solves the problem. Nothing speculative.**
- **No YAGNI**: Don't add features the user might need later.
- **Single-use simplicity**: Avoid complex abstractions for code that is only used once.
- **Minimal Abstraction**: Use the simplest possible tool for the job.
- **Refactor for Brevity**: If you can do in 50 lines what you did in 200, rewrite it.

### 3. Surgical Changes
**Touch only what you must. Clean up only your own mess.**
- **Targeted Edits**: Only change lines directly related to the task.
- **Respect Context**: Do not change comments, formatting, or adjacent code that you didn't create.
- **Match Style**: Strictly adhere to the existing codebase's style and patterns.
- **Orphan Cleanup**: Only remove code/imports that *your* changes made obsolete.

### 4. Goal-Driven Execution
**Define success criteria. Loop until verified.**
- **Verifiable Goals**: Transform "Fix this" into "Write a failing test, then make it pass."
- **Execution Plan**: For multi-step tasks, list the steps and how each will be verified.
- **Success Loops**: Loop through implementation and verification until the criteria are met.

## Implementation Guide
- **Always plan and agree** before execution.
- **Include reminders** in every turn to maintain focus.
- **Review diffs** against these principles before submitting.
