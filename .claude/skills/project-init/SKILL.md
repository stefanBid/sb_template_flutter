---
name: project-init
description: Initialise this Flutter template for a new project — collects username/rules/project name/app context, resets version and CHANGELOG, renames the project across pubspec.yaml/main.dart/Android/iOS, and refreshes CLAUDE.md against the actual lib/ state. Trigger phrases (Italian or English) - "Inizializziamo il progetto", "inizializza il progetto", "reset del progetto".
---

# Project Initialisation

These workflows were previously separate Copilot prompt files; they are now native Claude Code workflows. Trigger phrases may be Italian or English equivalents. Use the `AskUserQuestion` tool wherever user input is required — do not proceed past a required question until answered.

**Trigger**: "Inizializziamo il progetto", "inizializza il progetto", "reset del progetto", or clear equivalent.

## Step 1 — Collect info

Ask, in a single `AskUserQuestion` call:

1. **Username** — Still "Signore della UI"? If not, what name to use instead?
2. **Global rules** — Re-read the "Assistant identity & response language" and other global sections of CLAUDE.md. Any rules to add/change/remove vs the template version? ("no changes" if none.)
3. **Project name** — e.g. `MyApp`, `RecipeBook`, `FitnessTracker`.
4. **App context** — 2–4 sentences: what the app does, who it's for. Stored as permanent context for future UI/UX/technical suggestions.

Do not proceed until all four are answered.

## Step 2 — Apply configuration changes

- **Username**: if changed, replace the "Assistant identity & response language" section in CLAUDE.md — the identifier line and every occurrence of "Signore della UI" / "Signore delle UI".
- **Global rules**: add any new rules to the appropriate section of CLAUDE.md, without deleting existing ones unless explicitly requested.
- **App context**: replace the `## App context` section content at the top of CLAUDE.md with the text provided.
- **Version reset**: set `pubspec.yaml` `version:` to `1.0.0+1`. Reset the version badge in `README.md` to `1.0.0` if present.
- **CHANGELOG reset**: if `CHANGELOG.md` exists with content, clear the `[Unreleased]` section first, then run `dart run cider release 1.0.0` so the file starts clean from `1.0.0` with today's date — no history carried over. If it doesn't exist, cider creates it automatically on first use.
- **Rename the project** — read each file first to find the exact string to replace:

| File | Field | Value |
|---|---|---|
| `pubspec.yaml` | `name:` | snake_case of the name (e.g. `recipe_book`) |
| `lib/main.dart` | `title:` inside `MaterialApp.router` | The name as-is (e.g. `'RecipeBook'`) |
| `android/app/src/main/AndroidManifest.xml` | `android:label` | The name as-is |
| `ios/Runner/Info.plist` | `CFBundleName` and `CFBundleDisplayName` | The name as-is |

## Step 3 — Analyse `lib/` and refresh CLAUDE.md

Analyse the entire `lib/` directory (`helpers/`, `layouts/`, `models/`, `screens/`, `services/`, `widgets/`) down to every sub-level and check whether the relevant sections of CLAUDE.md (Design System, Helpers, Navigation, Screens, Widgets) are still accurate:

- New widgets in `lib/widgets/` not documented here?
- New helpers/tokens in `lib/helpers/` missing from the Design System sections?
- New screens with patterns not covered by the Screens section?
- Obsolete entries mentioned here but no longer present in code?
- Does the project deviate from the stack/conventions described above?

Update CLAUDE.md to add/remove sections based on the actual state of `lib/`. Do not delete general rules or design tokens still valid. Report any relevant discrepancy briefly before applying changes, then proceed.

## Step 4 — Final report

Concise report in Italian: username set, project name set, renamed/updated files, CLAUDE.md sections changed, any inconsistency needing user intervention.
