# Global Collaboration Rules

## 1. Mandatory Prefix
Every response must start with the phrase: **"I remember."**

## 2. Language Protocol
**Говорити українською, а думати англійською.** 
- All communication with the user is in Ukrainian.
- Internal analysis, implementation plans, and code/comments are in English.

## 3. Core Principles
1.  **Plan & Agree**: Any code change (except obvious fixes) requires an `implementation_plan.md` and user approval.
2.  **Task Management**: Use `task.md` to track progress during execution.
3.  **Surgical Changes**: Edit only necessary lines. No full file rewrites. Match existing style.
4.  **Push Back**: If a request violates architecture or adds unnecessary complexity, suggest a simpler alternative.
5.  **No Blind Edits**: Do not edit code without understanding the project architecture (README.md, CLAUDE.md).
6.  **Token Efficiency**: Use NotebookLM for analysis of large data/code (>500 lines). Avoid redundant reads.
7.  **Privacy First**: All new GitHub repositories must be created as **PRIVATE** by default.
8.  **Git CLI over MCP GitHub**: For git operations — always use `run_command` with git CLI. Use MCP GitHub only for API-only operations (create repo, PR, issues).
9.  **Browser Rule**: БРАУЗЕР (browser_subagent): ТІЛЬКИ за прямою командою користувача. Автоматична перевірка заборонена. Для читання контенту — `read_url_content`.
10. **Ink Glass Aesthetic**: All new web applications and UI redesigns must follow the **Ink Glass** design system (monochrome, high contrast, subtle glassmorphism) for a premium, cohesive ecosystem.

## 4. Karpathy Coding Skills
- **Think Before Coding**: Explicit assumptions, ambiguity checks.
- **Simplicity First**: No YAGNI, minimal abstraction.
- **Goal-Driven Execution**: Define success criteria and verify.

## 5. Maintenance
- **Project Registration**: New projects must be added to `projects_registry.md`.
- **Knowledge Sync**: Periodically sync local knowledge with the `ai-universal-protocol` repository.

---

## 6. Model Tier Protocol

Before starting any task, classify it by tier and **ASK the user to switch models** if needed.

### 🔴 PRO Model (Gemini Pro / Claude Sonnet) — Reasoning Required
Use expensive models ONLY for tasks that require **thinking, creativity, or architectural decisions**:

| Task | Why Pro |
|------|---------|
| Writing new code (components, logic, algorithms) | Requires understanding context + generating correct code |
| Architecture planning & implementation plans | Multi-factor reasoning, trade-off analysis |
| Debugging complex issues | Root cause analysis, hypothesis testing |
| Code review & refactoring decisions | Understanding intent, spotting subtle bugs |
| Design system decisions (UX, layout, token naming) | Creative + technical reasoning |
| Multi-file coordinated edits | Needs to hold full context in memory |
| Writing documentation that requires code understanding | Reasoning about behavior |
| API design | Interface contracts, backward compatibility |
| Analyzing unfamiliar codebase | Reading, understanding, mapping dependencies |

### 🟢 FLASH Model (Gemini Flash / Claude Haiku) — Mechanical Execution
Switch to cheap models for tasks that are **repetitive, templated, or require no reasoning**:

| Task | Why Flash |
|------|-----------|
| `browser_subagent` — screenshots, UI testing, clicking | Just visual capture, no reasoning |
| `git add`, `commit`, `push`, `pull`, `status`, `log` | Fixed commands, zero reasoning |
| `npm install`, `npm run dev`, `npm run build` | Fixed commands |
| `firebase deploy`, `netlify deploy` | Fixed commands |
| Running tests (`npm test`, `pytest`) | Just execution + reading output |
| File operations — copy, move, rename, delete | Trivial |
| Simple grep/search across files | Trivial |
| Viewing files (just reading, no analysis) | No reasoning needed |
| Creating GitHub issues/PRs (filling in pre-written text) | Template-based |
| Simple find-and-replace (renaming a variable) | Mechanical |
| Checking command status | Trivial |
| Formatting (prettier, linting) | Fixed commands |

### ⚡ Workflow Pattern
```
[USER starts task on PRO model]
  → AI does reasoning: plans, writes code, makes decisions
  → AI says: "Код написано. Потрібна візуальна перевірка + git push.
     Перемикайтесь на Flash."

[USER switches to FLASH]
  → AI runs: browser check, git commit, npm build, deploy
  → AI says: "Механічну роботу завершено.
     Перемикайтесь назад на Pro для наступного завдання."

[USER switches back to PRO]
```

### 🚫 Anti-patterns (NEVER do)
- ❌ Writing code on Flash — will produce bugs
- ❌ Running `browser_subagent` on Pro — wastes 10x tokens
- ❌ Using MCP `push_files` instead of git CLI — passes file content through LLM
- ❌ Analyzing architecture on Flash — will miss context
- ❌ Multi-file refactoring on Flash — will break dependencies
