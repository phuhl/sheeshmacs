# Emacs Markdown Hang Analysis

## Problem
Emacs hangs at 100% CPU when a markdown (.md) file is open and changed by an outside program.

## Root Cause

### Trigger
`magit-auto-revert-mode` is on by default (via `magit`). When an external program writes to the `.md` file, Emacs reverts the buffer, flushing font-lock and forcing full-buffer refontification chunk-by-chunk.

### Actual Culprit
Custom `markdown--fix-markup-display` function (in `sheesh-emacs.org`) is registered via `jit-lock-register` in every `markdown-mode` buffer. For each fontification chunk:

1. It calls `markdown--fix-code-block-delimiters` which **ignores the `beg/end` region** and scans the **entire visible window** every time.
2. It iterates character-by-character over the chunk for strikethrough fixes.
3. It iterates line-by-line (and character-by-character inside tables) over the chunk.

If the buffer is large and the window shows many lines, total work becomes `O(chunks × window_lines)`, causing an apparent infinite hang.

### Secondary Issue
`markdown--reveal-at-point` (in `post-command-hook`) re-fontifies the previous line on every cursor move, compounding overhead.

## Location of Custom Code
- **File:** `sheesh-emacs.org` (tangled to `sheesh-emacs.el`)
- **Lines:** ~1251–1413
- **Hook:** `markdown-mode-hook`

## Solution Proposals

### A) Quick Fix — Remove `jit-lock-register`
Delete `(jit-lock-register #'markdown--fix-markup-display)` from the `markdown-mode-hook`.
- **Pros:** Immediate relief, simple change.
- **Cons:** Loses custom table-spacing and code-block delimiter formatting.

### B) Surgical Fix — Respect `beg/end` Region
Rewrite `markdown--fix-markup-display` so `markdown--fix-code-block-delimiters` only operates on the `beg..end` region passed by `jit-lock`, not the full visible window.
- **Pros:** Keeps custom formatting, eliminates quadratic blow-up.
- **Cons:** Requires careful rewrite of the custom function.

### C) Disable Auto-Revert
Add `(setq magit-auto-revert-mode nil)` to prevent auto-reverting when files change externally.
- **Pros:** Stops the trigger entirely.
- **Cons:** Must manually revert buffers; affects all file types.

### D) Combo Fix — B + Remove `post-command-hook` Re-Fontification
Fix the `beg/end` bounding AND remove the `(font-lock-fontify-region)` call inside `markdown--reveal-at-point`.
- **Pros:** Most comprehensive fix, keeps formatting, removes extra per-command work.
- **Cons:** Requires modifying two custom functions.

## Recommendation
**Option D** is the cleanest fix if the custom formatting is desired. Otherwise, **Option A** is the safest and quickest.
