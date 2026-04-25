---
agent: agent
description: 'Run a full project checkup: check dependencies, update docs, and run lint. Use when: "checkup completo", "checkup del progetto", "controllo completo", "full checkup".'
---

# Workflow — Full Project Checkup

> **Trigger phrase**: "checkup completo", "checkup del progetto", "controllo completo", "full checkup" or any clearly equivalent phrase.

> **Required mode: Agent.**
> If you do not have access to file system tools (you are in Ask Mode / Chat Mode), reply **only** with:
> "To run a full checkup I need to be in **Agent** mode. Please re-send the request in Agent mode."
> Then stop.

---

## Overview

This workflow runs three sub-workflows in sequence:

1. **Dependency Check** — check for outdated packages, auto-update safe ones, list breaking changes.
2. **Documentation Update** — update `README.md` to reflect the current state of the codebase.
3. **Lint Check** — auto-fix warnings/hints/info, report blocking errors for manual review.

---

## Step 1 — Dependency Check

Follow every step defined in [check-dependencies.prompt.md](check-dependencies.prompt.md) completely before moving on.

---

## Step 2 — Documentation Update

Follow every step defined in [update-docs.prompt.md](update-docs.prompt.md) completely before moving on.

---

## Step 3 — Lint Check

Follow every step defined in [check-lint.prompt.md](check-lint.prompt.md) completely before moving on.

---

## Final Summary

Once all three steps are complete, produce a single summary report with the following sections:

### Dependencies
- Packages updated (safe updates applied)
- Packages with breaking changes (listed for manual review)

### Documentation
- Sections updated in `README.md`

### Lint
- Warnings/hints auto-fixed
- Blocking errors requiring manual intervention
