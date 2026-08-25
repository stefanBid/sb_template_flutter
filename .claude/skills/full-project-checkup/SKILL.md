---
name: full-project-checkup
description: Run the dependency-check, docs-update, and lint-check skills in sequence and produce a combined summary. Trigger phrases (Italian or English) - "checkup completo", "checkup del progetto", "controllo completo", "full checkup".
---

# Full Project Checkup

**Trigger**: "checkup completo", "checkup del progetto", "controllo completo", "full checkup", or clear equivalent.

Runs three sub-workflows in sequence, each completed fully before the next — invoke each as its own skill:

1. `dependency-check` skill (`.claude/skills/dependency-check/SKILL.md`)
2. `docs-update` skill (`.claude/skills/docs-update/SKILL.md`)
3. `lint-check` skill (`.claude/skills/lint-check/SKILL.md`)

## Final summary

```
### Dependencies
- Packages updated (safe updates applied)
- Packages with breaking changes (listed for manual review)

### Documentation
- Sections updated in README.md

### Lint
- Warnings/hints auto-fixed
- Blocking errors requiring manual intervention
```
