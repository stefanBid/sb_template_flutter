---
name: lint-check
description: Run dart fix, dart format, and flutter analyze against this project's lint rules (prefer_const_constructors, prefer_const_literals_to_create_immutables, never // ignore), auto-fix what's safe, and report blocking errors. Trigger phrases (Italian or English) - "check del progetto", "verifica la qualità del codice", "il progetto è pulito?", "fai un lint check", part of the full-project-checkup skill.
---

# Lint / Code Quality Check

**Trigger**: "check del progetto", "verifica la qualità del codice", "il progetto è pulito?", "fai un lint check", or part of Full Project Checkup.

## Linter context

On top of `package:flutter_lints/flutter.yaml`, this project enforces:

```yaml
rules:
  prefer_const_constructors: true
  prefer_const_literals_to_create_immutables: true
```

Every fix must comply with these plus Flutter/Dart best practices. **Never silence an issue with `// ignore` or `// ignore_for_file`** — fix in code, don't hide it.

## Auto-fix rules

- **`const` add where missing**: constructor calls and list/map/set literals that can be compile-time constants. Move `const` to the outermost eligible ancestor (don't repeat it on children already covered by a parent `const`).
- **`const` remove where unnecessary**: expressions that can't be compile-time constants (reference non-const variables or context-dependent values).
- **`print` statements**: remove any `print(...)` call anywhere. Replace any `debugPrint(...)` not inside `AppLogger` with the matching `AppLogger.debug/warn/error` call. Never wrap in manual `if (kDebugMode)`. Import `app_logger.dart` with a relative path if missing.
- **Unused imports/variables**: remove anything the analyser flags as unused.
- **Other info/hint diagnostics**: fix per Flutter best practices — never silence.

## Step 1 — Dart fix

Run `dart fix --dry-run`; if it finds fixable items, apply with `dart fix --apply`. Record how many fixes applied (or "none").

## Step 2 — Dart format

Run `dart format --output=none --set-exit-if-changed .`; if non-zero exit, run `dart format .`. Record which files were reformatted (or "none").

## Step 3 — Flutter analyze

Run `flutter analyze` and categorise every diagnostic:

- **Category A — Auto-fixable** (`warning •`, `info •`, `hint •`): fix all per the rules above, then re-run `flutter analyze` to confirm resolution.
- **Category B — Errors** (`error •`): blocking, do not auto-fix. List file path, line number, error code, description for manual review.

## Step 4 — Report (Italian)

```
## Risultato check qualità

### ✅ Fix applicati automaticamente
- dart fix: X fix applicati
- dart format: X file riformattati

### ❌ Errori (intervento richiesto)
- path/to/file.dart:42 — error_code: Descrizione

### ⚠️ Warning (da valutare)
- path/to/file.dart:15 — warning_code: Descrizione

### ℹ️ Info / hint
- N hint trovati (elenca solo se > 0)

### 🎯 Stato finale
Progetto pulito / Progetto con X errori da risolvere
```

If no errors and no warnings: "Il progetto è pulito. Nessun intervento manuale richiesto."
