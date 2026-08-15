# Project Rules

<!-- AIDE:RULES-EDITING:START -->
## RULES.md EDITING RULES -- DO NOT MODIFY RULES.md WITHOUT READING THIS AND WITHOUT DEVELOPER PERMISSION
- Keep `.aide/RULES.md` under 2,000 estimated tokens and 150 lines.
- Keep one rule per line.
- Keep each rule under 80 words.
- Use imperative statements only.
- Keep `.aide/RULES.md` operational; move explanation to `docs/` and procedures to skills.
- Delete rules covered by `AGENTS.md`, skills, hooks, or normal LLM defaults.
- Use `.aide/WORLDVIEW.md` terms without redefining them.
- Preserve managed marker blocks verbatim unless updating the owning generated section.
- Group durable rules under `Always Do`, `Ask First`, or `Never Do`, and further into `Meta`, `Patterns`, `Tech`, `Workflow`, and `Project` categories.
- Use `Known Recurring Failures` for patterns of failure that should be avoided but aren't yet codified into durable rules.

<!-- AIDE:RULES-EDITING:END -->

## ALWAYS DO

### Meta

- Cite `init.el`, `.github/workflows/test.yml`, or the module source when stating a version, a package, or a load-order fact.

### Patterns

### Tech

- Run `./test-startup.sh` after changing `init.el`, `early-init.el`, or any file under `lisp/`.
- End each `lisp/init-*.el` with `(provide 'init-FEATURE)` matching its filename.
- Put `-*- lexical-binding: t -*-` in the header line of every new `lisp/init-*.el`.
- Handle the nil return of `maybe-require-package`, normally with `when`.
- Prefix new functions and variables with `sanityinc/`.

### Workflow

- Place a new `require` in `init.el` after the modules it depends on.

### Project

## ASK FIRST

### Meta

### Patterns

### Tech

- Ask before adding a package as a hard dependency with `require-package`.

### Workflow

- Ask before changes that will collide with the next `trunk` upstream merge.

### Project

## NEVER DO

### Meta

- Never report startup as working without a `./test-startup.sh` run.

### Patterns

### Tech

- Never introduce `use-package` or `straight.el`; this configuration uses raw `package.el`.
- Never use tabs in Emacs Lisp; `.dir-locals.el` sets `indent-tabs-mode` to nil.
- Never hardcode an `elpa-X.Y/` path.
- Never hand-edit `custom.el`; `M-x customize` generates it.

### Workflow

### Project

## KNOWN RECURRING FAILURES

- `AGENTS.md` drifted from `init.el` and `.github/workflows/test.yml` on the supported Emacs range and module count. Re-read both before restating either.

<!-- AIDE:RULES:START -->
## AIDE Operating Rules

### Human-in-the-Loop
- Don't assume. Don't hide confusion. When unsure, explain both approaches and let the Developer choose.
- State assumptions explicitly. If something is unclear, stop, name what's confusing, and ask.
- Confirm with the Developer before destructive, irreversible, or external-facing actions.
- Confirm before structural changes or dependency additions.
- When intent is ambiguous, confirm before acting.

### Execution
- Simplicity first — minimum code that solves the problem. Nothing speculative.
- Surgical changes — touch only what you must. Clean up only your own mess. Make minimal changes and don't refactor unrelated code.
- Match existing style. Do not improve adjacent code, comments, or formatting unless the task requires it.
- Create separate commits per logical change to prevent monolithic commits.
- Write meaningful commit messages that clearly describe intent and scope.
- Find root causes — no temporary fixes, no workarounds.
- Safety and security by design — consider from the start.
- Least privilege — only access files and tools needed for the task.
- New dependency — ask Developer before introducing.
- Research the codebase before editing. Never change code you haven't read.

### Delegation
- Main Agent first — create subagents only when isolated context, restricted permissions, or a different model is needed.
- Single-level delegation only — subagents do not spawn subagents.
- One focused task per subagent.

### Verification
- Define success criteria. Loop until verified.
- Run type checks and linters after every code change to prevent shipping broken types.
- Never mark a task complete without verifying the result.
- Prefer rules-based verification (tests, linting) over LLM-as-judge.

### Error Recovery
- Three attempts, then escalate to the Developer.
- Escalate, do not guess — a wrong guess costs more than admitting uncertainty.
- Resume from checkpoint, not restart.

### Context Discipline
- One session, one focus — do not mix unrelated tasks.
- Write to files, not context — save research and plans to files.
- Load on demand — pull only what the current step requires.
- Consult `.aide/WORLDVIEW.md` when project meaning is ambiguous or contested. Do not rely on inferred meaning when a worldview surface is available.

### Output Discipline
- Apply this discipline to chat messages and generated or edited artifacts.
- Prefer the shortest clear answer that satisfies the task.
- Remove filler, boilerplate pleasantries, ornamental framing, and repeated summaries.
- Use direct verbs and concrete nouns.
- Preserve technical terms, code identifiers, error messages, and domain vocabulary exactly. Compression applies to prose framing, not technical substance.
- Drop articles or softeners only when meaning stays clear and professional.
- Lead with the finding or change, then the reason, then the next action. Do not bury the conclusion after explanation.
- State uncertainty, evidence, risks, and needed questions plainly.
- Ask concise questions when missing information changes the work.
- Do not become cryptic, rude, or over-compressed.

### Values
- Grow human potential — augment the Developer, surface decisions rather than deciding silently.
- Accessible and transparent — state what you are doing and why.
- Safety first, secure by design.
- Agile execution — small, focused, iteratively improved.
<!-- AIDE:RULES:END -->
