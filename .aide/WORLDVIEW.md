# Project Worldview (WORLDVIEW.md)

## Purpose

- `WORLDVIEW.md` defines this project's worldview: shared meaning, ontology, axioms, epistemic guidance, and evaluation outputs that Agents and Developers use to reason consistently about the project.
- Agents consume this file when interpreting project terms, classifying artifacts, evaluating claims for truth, and resolving ambiguity in specs, code, summaries, and Agent-to-Developer replies.
- Developers consume this file to align human and Agent vocabulary so that decisions, reviews, and handoffs use the same words for the same things.

## Scope

- `WORLDVIEW.md` defines what project concepts mean, what entities exist, how they relate, which stable invariants hold, and how project claims are evaluated.
- `WORLDVIEW.md` does not define operational actions, workflow routing, approval gates, task procedures, or tool permissions — those belong in `.aide/RULES.md`.
- `WORLDVIEW.md` does not define session loading discipline, Agent behavior, or platform-specific configuration — those belong in `AGENTS.md` and platform entry points.

<!-- AIDE:WORLDVIEW:START -->
## AIDE

### Domain Boundary

- **Purpose:** Define the Target project, people, runtime entities, and platform vocabulary every AIDE project's charter, audit, and skill content rely on.
- **In scope:** Target project, Developer, Agent, Main Agent, Harness, IDE, LLM Model, LLM Provider, Agent Charter, `AGENTS.md`, `.aide/WORLDVIEW.md`, `.aide/RULES.md`.
- **Out of scope:** Project-specific domains, application-domain entities, skill-specific terminology that belongs to other skills.

### Terminology

- **AIDE:** AI-assisted Development Environment; the framework for optimizing LLM coding environments through structured instructions, rules, and skills.
- **Developer:** The human conducting and driving the session.
- **Agent:** An autonomous software system capable of perceiving its environment, reasoning, and taking self-directed actions to achieve a specific goal. An Agent is composed of an LLM Model and a Harness.
- **Main Agent:** The default Agent provided by a Harness.
- **Harness:** Software such as Claude Code, Gemini CLI, Codex CLI, or GitHub Copilot CLI that manages how an LLM Model interacts with project files, tools, and instructions.
- **IDE:** A graphical development environment, such as Visual Studio Code or Zed, that can host extensions for Harness access.
- **LLM Model:** The foundational model executing reasoning tasks, such as Claude, GPT, or Gemini.
- **LLM Provider:** The service or company hosting LLM Models, such as Anthropic, OpenAI, or Google.
- **Target project:** A project that installs and operates under the AIDE Agent Charter. Its charter is a standalone root `AGENTS.md` plus optional `.aide/` augmentation; the project owns the charter files, while AIDE (shell) and AISD skills own their managed marker regions inside them.
- **Agent Charter:** The persistent foundation governing an Agent's behavior in a Target project: a standalone root `AGENTS.md` that is complete on its own, optionally augmented by `.aide/WORLDVIEW.md` and `.aide/RULES.md`. `AGENTS.md` alone remains a valid, complete charter; augmentation deepens meaning and rules but is never required.
- **`AGENTS.md`:** The required, standalone session-and-loading-discipline file every Harness reads first, using exact-uppercase `AGENTS.md`. Carries the Core Operating Rules baseline so it works with no other files, and owns the first-turn load choreography and imports for the optional `.aide/` augmentation.
- **`.aide/WORLDVIEW.md`:** Optional project-meaning augmentation. Defines what concepts mean and how claims are evaluated; does not define operational actions. Independently readable; its absence is healthy and never invalidates `AGENTS.md`.
- **`.aide/RULES.md`:** Optional action-constraint augmentation. Owns the fuller operating ruleset, workflow gates, and approval rules; consumes `.aide/WORLDVIEW.md` terms without redefining them. Independently readable; its absence is healthy and never invalidates `AGENTS.md`.

### Ontology

- **Class: People:** Developer.
- **Class: Runtime:** Agent, Main Agent, Harness, LLM Model, LLM Provider, IDE.
- **Class: Charter Files:** `AGENTS.md` (required, standalone), `.aide/WORLDVIEW.md` (optional), `.aide/RULES.md` (optional).
- A Developer works through a Harness.
- A Harness runs an LLM Model supplied by an LLM Provider.
- An Agent is composed of a Harness plus an LLM Model.
- The Main Agent is the default Agent for a Harness.
- The Agent Charter is a standalone root `AGENTS.md` plus any available `.aide/WORLDVIEW.md` and `.aide/RULES.md` augmentation, loaded `AGENTS.md` first, then worldview, then rules; `AGENTS.md` alone is a complete charter.
- A Target project owns its charter files; AIDE owns the charter shell and AISD skills own their managed marker regions inside the augmentation files.

### Axioms

- Do not abbreviate `Harness` to lowercase `harness` in formal prose.
- Do not use `Agent` as a substitute for a feature, tool, workflow, or skill.
- `AGENTS.md` owns first-turn load choreography for `.aide/WORLDVIEW.md` and `.aide/RULES.md`; platform wrappers import `@AGENTS.md` only.
- The optional `.aide/` augmentation loads worldview before rules; on any conflict between the augmentation and the standalone baseline, `AGENTS.md` governs.
- Absence or unreadability of `.aide/` or either augmentation file is healthy for standalone operation, not a runtime failure.

### Epistemology

- Raw input from a Developer, Agent, tool, or file is an assertion until checked against project context.
- Project rules outrank inferred convention.
- Missing information remains unknown; do not treat absence as false or as permission to invent a value.
- Unknown is not true.
- Confidence is not authority.
- Conflict must be explicit.
- Undefined concepts remain undefined until approved.
- Derived values require defined derivation rules and supported inputs.

### Evaluation Outputs

- **supported:** Evidence in project context supports the statement.
- **missing:** Required evidence or context is absent.
- **unknown:** Evidence exists but cannot be interpreted confidently.
- **conflicted:** Project sources or instructions disagree in a material way.
- **not applicable:** The concept or rule does not apply to the current scope.
<!-- AIDE:WORLDVIEW:END -->

## Emacs Configuration

### Domain Boundary

- **Purpose:** Define how this configuration tree packages, loads, and validates Emacs features across Emacs releases.
- **In scope:** Feature module, bootstrap module, hard and soft dependency, elpa directory, personal override, startup smoke test, upstream and fork remotes.
- **Out of scope:** The internal behavior of third-party Emacs packages, and Emacs Lisp language semantics.

### Terminology

- **Feature module:** A `lisp/init-*.el` file configuring one feature, language, or subsystem, ending in `(provide 'init-FEATURE)` matching its filename.
- **Bootstrap module:** One of `init-benchmarking`, `init-utils`, `init-site-lisp`, `init-elpa`, `init-exec-path`, required by `init.el` before any feature module.
- **Personal override:** `lisp/init-preload-local.el` (loaded early) or `lisp/init-local.el` (loaded last), both optional via `(require ... nil t)`.
- **Hard dependency:** A package installed with `require-package`, which signals an error when installation fails.
- **Soft dependency:** A package installed with `maybe-require-package`, which returns nil when installation fails.
- **Startup smoke test:** `./test-startup.sh`, a batch-mode load of `init.el` plus `after-init-hook`; the project's only automated validation.
- **Elpa directory:** A version-partitioned `elpa-X.Y/` package tree, gitignored, keeping bytecode from crossing Emacs versions.
- **Upstream and fork:** `trunk` is `purcell/emacs.d`; `origin` is `markjeee/emacs.d`.

### Ontology

- **Class: Modules:** bootstrap module, feature module, personal override.
- **Class: Dependencies:** hard dependency, soft dependency.
- **Class: Validation:** startup smoke test, CI matrix.
- `init.el` requires bootstrap modules in a fixed order, then feature modules.
- A feature module installs hard and soft dependencies and provides one feature symbol.
- `custom.el` loads after all feature modules and can override any of them.
- A personal override belongs to the fork, not to upstream.

### Axioms

- Module load order in `init.el` is significant; a `require` placed before its dependency fails startup.
- A soft dependency may be absent at runtime; code following `maybe-require-package` must handle nil.
- Package archives are partitioned into `elpa-X.Y/` so bytecode never crosses Emacs versions.
- The configuration must start on every Emacs version in the CI matrix, degrading features rather than erroring.
- `custom.el` and `lisp/init-local.el` are personal surfaces; upstream merges must not depend on their contents.

### Epistemology

- A claim that the configuration starts is supported only when `./test-startup.sh` exits 0 on the target Emacs version.
- A claim about the supported Emacs range is supported by the `minver` check in `init.el` and the matrix in `.github/workflows/test.yml`, not by README or charter prose.
- A claim that a package is available is unknown until its `require-package` or `maybe-require-package` call is read.
- When prose and code disagree about this configuration, the code governs and the prose is treated as drift.

### Evaluation Outputs

- **supported:** `./test-startup.sh` exits 0 and the change matches the module conventions recorded in `AGENTS.md`.
- **missing:** No smoke-test run exists for the change.
- **unknown:** Behavior depends on a soft dependency that may not be installed.
- **conflicted:** README, `AGENTS.md`, and code disagree about the supported Emacs range or module inventory.

## Management Instructions

> [!IMPORTANT]
> `WORLDVIEW.md` is the authoritative source for project-wide meaning. Agents MUST adopt its terms, domains, ontology, relations, axioms, epistemic guidance, and evaluation outputs in artifacts, summaries, and code comments.

### Source-Trust Principles

- Project rules outrank inferred convention.
- Explicit Developer direction governs current-session intent unless it conflicts with repository rules or safety constraints.
- Source files outrank stale summaries of those files.
- Documentation supports interpretation, but it does not override explicit rules or active workflow instructions.

### Epistemic Principles

- Raw input from any party, tool, or file is an assertion until checked against project context.
- Missing information remains unknown; do not treat absence as false or as permission to invent a value.
- Unknown is not true.
- Confidence is not authority.
- Conflict must be explicit.
- Undefined concepts remain undefined until approved.
- Derived values require defined derivation rules and supported inputs.

### Evaluation Outputs

- **supported:** Evidence in project context supports the statement.
- **missing:** Required evidence or context is absent.
- **unknown:** Evidence exists but cannot be interpreted confidently.
- **conflicted:** Project sources or instructions disagree in a material way.
- **not applicable:** The concept or rule does not apply to the current scope.

### Worldview Shape

- Use domain-first organization: Purpose, Scope, one H2 per project domain, then Management Instructions.
- Inside each domain, use the six required H3 subsections in this exact order: Domain Boundary, Terminology, Ontology, Axioms, Epistemology, Evaluation Outputs.
- Each subsection MUST start with at least two concrete entries. Do not ship empty H3 stubs or filler bullets.
- Keep Domain Boundary entries to concise Purpose, In scope, and Out of scope bullets.

### Statement Format

- Prefer one concise statement per bullet over explanatory paragraphs.
- Keep each worldview statement to no more than 80 words.
- Optional clause IDs such as `WV-001` MAY be used for traceability when a statement is referenced from other artifacts; they are NOT required on every entry.
- Use `Clarification:` text only when it adds real disambiguation.

### Adding Statements

- Add worldview statements only for recurring project-wide concepts, artifact classes, workflow states, relations, epistemic guidance, or invariants.
- Prefer stable statements that are used across at least two specs, skills, components, or docs.
- Clarify with the Developer before adding a new project-wide concept, authority rule, or evaluation output.

### Updating Statements

- Prioritize stability; do not rename established concepts without an explicit Developer direction or formal specification.
- Refine statements when usage evolves, ambiguity appears, or a project invariant needs tightening.
- Keep this file ideally under 300 lines and absolutely under 500 lines; consolidate or remove stale statements when it approaches the ideal limit.

### Agent Duty

- When an Agent encounters ambiguous or conflicting project meaning, consult `WORLDVIEW.md`. The AIDE Operating Rules in `.aide/RULES.md` codify this duty under `Context Discipline`.
- If a new concept emerges during spec, implementation, or closeout work, clarify with the Developer and propose a `WORLDVIEW.md` update before treating the concept as established.
- When citing the platform/runtime environment in worldview prose, use the exact term `Harness`.
