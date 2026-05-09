# Ink Glass Design System

**Ink Glass** is the premium monochrome design system established for the TeacherUA-pixel ecosystem. It combines the clean, high-contrast aesthetic of e-ink displays with the depth and tactility of advanced glassmorphism.

## Core Philosophy
1.  **Monochrome First**: Avoid vibrant colors. Use a palette of paper-whites, ink-blacks, and slate-greys.
2.  **Glassmorphism 2.0**: Depth is created through `backdrop-filter: blur`, subtle `inner-shadows`, and monochrome borders (`1px solid var(--glass-border)`).
3.  **High Contrast**: Typography and interactive elements must be clearly legible, using deep blacks (`#000` or `var(--ink-black)`) on light backgrounds.
4.  **Minimalist Animations**: Smooth, short transitions (`240ms var(--ease)`) for state changes.

## Global Tokens (CSS Variables)
```css
:root {
  /* Ink Palette */
  --ink-black:    #0f172a;
  --paper-white:  #ffffff;
  --ink-slate:    #334155;
  --ink-light:    #f1f5f9;
  --ink-muted:    #64748b;
  
  /* Glass Effects */
  --glass-bg:     rgba(255, 255, 255, 0.75);
  --glass-border: rgba(15, 23, 42, 0.08);
  --glass-blur:   blur(24px);
  --glass-shadow: rgba(15, 23, 42, 0.12);
}
```

## Component Standards
- **Cards**: Use `.glass3d` with a subtle inner highlight and external shadow.
- **Buttons**:
    - `btn-filled`: Solid `var(--ink-black)` with `var(--paper-white)` text.
    - `btn-text`: Transparent with `var(--ink-black)` text and subtle hover.
- **Navigation**: Bottom bars should be glassmorphic with minimal icons.
- **Checkboxes**: Square with `8px` radius, turning solid ink-black when active.

## Usage in Projects
Projects following the Ink Glass standard should reference this guide in their `CLAUDE.md` or `.antigravityrules`.
