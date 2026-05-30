# Matt Pocock's Agent Skills: Engineering & Productivity Standard

This document outlines the integration of Matt Pocock's agent skills into the universal AI engineering standard (AI-DNA). These skills establish a rigorous, feedback-driven process to prevent "vibe coding" and maintain clean codebase architecture.

## 1. Core Architectural Terminology
Every agent suggestion regarding refactoring or architecture must use this vocabulary consistently:

- **Module:** Any code unit with an interface and an implementation (function, class, package, tier-spanning slice).
- **Interface:** Everything a caller must know to use the module correctly (types, invariants, ordering constraints, error modes, configuration).
- **Implementation:** The internal code of a module.
- **Depth:** Leverage at the interface level. A module is **deep** when a large amount of behavior sits behind a simple interface. A module is **shallow** when the interface is as complex as the implementation.
- **Seam:** The location where an interface lives, allowing behavior to be altered without editing the caller in place.
- **Adapter:** A concrete implementation satisfying an interface at a seam.
- **Leverage:** The utility callers get from module depth (high capability, minimal interface learning curve).
- **Locality:** The benefit of concentrating bug fixes, changes, and knowledge inside a single deep module rather than spreading them across callers.

## 2. Universal Principles
- **The Deletion Test:** If a module is deleted, and the overall system complexity vanishes, it was a pass-through (shallow) module. If complexity reappears across multiple callers, the module was earning its keep.
- **Interface as Test Surface:** Tests and callers must cross the same seam. If you need to test private implementation details, the module is the wrong shape.
- **One Adapter = Hypothetical Seam; Two Adapters = Real Seam:** Never introduce an interface/seam unless there are at least two concrete adapters that vary.

## 3. Key Agent Skills & Workflows
The agent is trained to execute these command-based workflows:

### A. Alignment & Terminology
- **`/grill-with-docs` / `/grill-me`:** A relentless, one-question-at-a-time interview to stress-test plans before coding. It automatically updates `CONTEXT.md` (ubiquitous language glossary) and creates Architecture Decision Records (ADRs) under `docs/adr/` inline as decisions crystallize.

### B. Code Quality & Feedback Loops
- **`/tdd`:** Executes a strict Test-Driven Development loop:
  1. Write a failing test first.
  2. Implement the minimal code to pass (Green).
  3. Refactor.
- **`/diagnose`:** A highly disciplined debugging loop: Reproduce $\to$ Minimize $\to$ Hypothesize $\to$ Instrument $\to$ Fix $\to$ Regression-Test.

### C. Architecture & Refactoring
- **`/improve-codebase-architecture`:** Organic exploration to locate shallow modules and leakages. It generates an interactive HTML report with Mermaid before/after diagrams to visualize the proposed deepening.

### D. Specifications & Tasks
- **`/to-prd`:** Captures conversation context and synthesizes it into a complete Product Requirements Document.
- **`/to-issues`:** Breaks down PRDs or implementation plans into modular, tracer-bullet vertical slices as independent tracking tickets (GitHub/Linear or Local Markdown files).

## 4. Integration with AI-DNA
These skills directly support the **CORE PROTOCOL: AI-DNA**:
1. **No Vibe Coding:** `/tdd` and `/diagnose` provide concrete validation, adhering to Karpathy-style coding.
2. **Planning Mode:** `/grill-with-docs` acts as the pre-onboarding validator before any `implementation_plan.md` is signed off.
3. **Domain Vocabulary:** Informs the agent of the project's specific business vocabulary using the `CONTEXT.md` format.
