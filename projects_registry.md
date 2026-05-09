# Project Registry

Registry of private projects for the TeacherUA-pixel account.

## Active Projects

1. **ai-universal-protocol**
   - Role: Global settings and AI-DNA. Central source of truth for all projects.
   - Path: `ai-protocol-sync/`
   - GitHub: https://github.com/TeacherUA-pixel/ai-universal-protocol

2. **privat24-bonds-parser**
   - Role: Analysis and visualization of OVDP bonds. Includes full CSV export with market metrics, efficiency ratios, arbitrage signals, reinvestment potential, and payment schedules per lot.
   - Stack: Vite, React, Firebase, Playwright.

3. **flowgorithm-web**
   - Role: Visual programming and localization.
   - Stack: JavaScript, i18n.

4. **quick-feedback-classroom** (also `quick-feedback-extension`)
   - Role: Chrome extension for quick feedback in Google Classroom.
   - Stack: Chrome Extension Manifest V3, JavaScript, HTML, CSS.

5. **stem-project-architect-gem**
   - Role: Architect for STEM-based educational projects. System prompt is in English (token-optimized); bot always communicates in Ukrainian. Includes age-based task adaptation, myth-detection, and formative assessment logic.
   - Stack: AI-driven (Gemini Gem system instruction).

6. **bond-ladder-ua**
   - Role: Visualization of the Ukrainian government bond ladder (OVDP).
   - Stack: Vite, React, Tailwind CSS (Design matching Liquid Glass).

7. **vita-stem-project**
   - Role: Educational inquiry-based 4-lesson project for high school students. Inquiry-driven simulations, 10-point scoring, 12 topics across 3 sub-projects.
   - Stack: HTML5, CSS3, JavaScript, Gemini API, Google Sites.

8. **openscreen**
   - Role: High-performance screen recorder/editor.
   - Features: 100Hz cursor telemetry, configurable FPS (24/30/60), persistent settings, charcoal grey UI (#18181b).
   - Stack: JavaScript/TypeScript, Electron.

9. **liquid-glass-classroom** (formerly `classroom-parallel-grouper`)
   - Role: Chrome extension for organizing Google Classroom course cards into collapsible groups by grade/parallel level.
   - Features: Premium Glassmorphic UI, DOM-independent card detection, persistent settings via Chrome storage.
   - Stack: Chrome Extension Manifest V3, JavaScript, HTML, CSS.

10. **shopping-list-pwa**
    - Role: Family shopping list with offline support.
    - Status: Refactored into modular components and hooks for maximum token efficiency.
    - Stack: Vite, React, Zustand, Firestore, Ink Glass Design System.

11. **micro-scalper-bot**
    - Role: Python-based grid trading bot for crypto.
    - Features: Async logic, SQLite database, Telegram notifications.
    - Stack: Python, CCXT, Asyncio, SQLite.

12. **page-to-pdf-extension**
    - Role: Chrome extension for high-fidelity web page to PDF conversion.
    - Stack: Manifest V3, JavaScript, CSS.

13. **claw-code-parity**
    - Role: Tooling for maintaining parity between Claude and other model outputs during multi-model development.
    - Stack: Node.js/Python scripts.

## Protocol for New Projects
- Each new project must contain an `.antigravityrules` file referencing `ai-universal-protocol`.
- New projects must be added to this registry immediately with stack and role descriptions.
