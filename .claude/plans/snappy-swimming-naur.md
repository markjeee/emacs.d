# AIDE Bootstrap Plan: purcell/emacs.d

## Context

This project has a rich `CLAUDE.md` with project context, architecture, and style guidance. The AIDE bootstrap migrates this content into the standard AIDE file structure so it's available across platforms and follows the three-layer model.

## Bootstrap Plan

| File | Action |
|------|--------|
| `AGENTS.md` | **Create** — migrate all CLAUDE.md content into 12 standard sections |
| `CLAUDE.md` | **Migrate** — replace with `@AGENTS.md` import |
| `RULES.md` | **Create** — empty placeholder |
| `SKILLS.md` | **Create** — register aide + aide-operator skills |
| Directory structure | **N/A** — minimal setup, no directories |

## File Contents

### 1. AGENTS.md (new)

All 12 sections populated from existing CLAUDE.md content + project exploration:

- **Project** — name (purcell/emacs.d), description, stack (Elisp/package.el/MELPA), upstream/fork remotes
- **Project Structure** — annotated directory tree
- **Commands** — `./test-startup.sh` (only test), no build/lint
- **Key Files** — table of 10 key files, loading sequence, key subsystems, package management
- **Environment** — Emacs 27.1+, `$EMACS` env var, `*is-a-mac*` platform detection
- **Code Style** — spaces-only, lexical-binding, `sanityinc/` prefix, `maybe-require-package`, version guards, diminish
- **Testing** — smoke test command, CI matrix (27.1–30.1 + snapshot)
- **Workflow** — aide-operator reference + Levels of Coding Control table (template default)
- **Content Placement** — routing table (template default)
- **Agent Architecture** — main session only, no sub-agents
- **Gotchas** — 10 items including: no build step, version-specific elpa dirs, gitignored files, load order, CI skips .md, `trunk` vs `origin`, no use-package
- **Additional Context** — `@RULES.md`, `@SKILLS.md` imports + auto-loaded skills block

### 2. CLAUDE.md (rewrite)

Replace entire file with:
```
@AGENTS.md
```

### 3. RULES.md (new)

Empty placeholder with HTML comment.

### 4. SKILLS.md (new)

Table format registering aide and aide-operator with user-level `~/.claude/skills/` paths.

## Verification

1. All 4 files exist at repo root
2. AGENTS.md has all 12 standard sections
3. CLAUDE.md contains only the import directive
4. Cross-references resolve: CLAUDE.md → AGENTS.md → RULES.md + SKILLS.md
5. `./test-startup.sh` still passes (markdown changes don't affect Emacs, but good practice)
6. Suggest starting a new Claude Code session to confirm context loads correctly
