---
name: docs-update
description: Rewrite README.md in English against the actual codebase state — overview, getting started, project structure, design system, routing, screens, widgets, helpers, AI tooling, deployment, dependencies. Trigger phrases (Italian or English) - "aggiorna la documentazione", "update docs", part of the full-project-checkup skill.
---

# Documentation Update (README.md)

**Trigger**: part of Full Project Checkup, or asked directly ("aggiorna la documentazione", "update docs").

## Step 1 — Read current state (in parallel)

`README.md`, `pubspec.yaml`, `CLAUDE.md`, the `lib/` directory tree, all files in `lib/helpers/`, `lib/widgets/`, `lib/layouts/`, and `lib/router.dart`.

## Step 2 — Identify differences

Compare `README.md` against the actual codebase: outdated sections, missing sections (new widgets/helpers/screens/conventions), incorrect project name/version/stack info, broken links. Report a brief summary, then proceed without waiting for approval.

## Step 3 — Rewrite README.md (English)

Required structure:

```
# [Project Name]
> One-line description from App context

[Version badge]  [Flutter badge]  [License badge]

## Table of Contents
1. Overview
2. Getting Started
3. Project Structure
4. Design System
5. Routing
6. Screens
7. Widgets
8. Helpers & Validators
9. AI Tooling — CLAUDE.md & Workflows
10. Deployment
11. Dependencies
12. Migration Notes & Known Toolchain Transitions

## 1. Overview
[Expanded app context, purpose, audience, visual tone]

## 2. Getting Started
### Prerequisites
### Installation
### Project Initialisation

## 3. Project Structure
[Annotated directory tree of lib/]

## 4. Design System
### Colours — AppColors
### Typography — AppTypography
### Spacing & Radius — AppDesign
### Icons — Material Icons

## 5. Routing
### AppRouter
### Adding a new route (3-step workflow)

## 6. Screens
### Conventions
### Available screens
[One subsection per feature folder found in lib/screens/]

## 7. Widgets
### Placement rules
[One subsection per widget found in lib/widgets/, with props table]

## 8. Helpers & Validators
[One subsection per file found in lib/helpers/]

## 9. AI Tooling — CLAUDE.md & Workflows

> Mandatory section — always present.

Explain that this repo ships with a single `CLAUDE.md` at the project root containing: global rules, app context, design system reference, and pointers to the agent workflow skills (Project Initialisation, Full Project Checkup, Dependency Check, Documentation Update, Lint Check, Version Bump). List each workflow with its trigger phrase and a one-line description, as a table:

| Workflow | Trigger | What it does |
|---|---|---|

## 10. Deployment

> Mandatory section — always present.

### iOS
#### Test distribution (TestFlight)
1. Bump version/build with the Version Bump workflow
2. `flutter build ipa --release`
3. Open `build/ios/archive/Runner.xcarchive` in Xcode Organizer
4. Distribute → App Store Connect → TestFlight
5. Invite internal/external testers from App Store Connect

#### Production release (App Store)
1. Ensure version and build number are correct
2. `flutter build ipa --release`
3. Upload via Xcode Organizer → Distribute → App Store Connect
4. Complete metadata, screenshots, review info
5. Submit for review

### Android
#### Test distribution (Internal Testing / Firebase App Distribution)
1. Bump version/build with the Version Bump workflow
2. `flutter build appbundle --release` (preferred) or `flutter build apk --release`
3. Google Play → Internal Testing track → upload `.aab`
4. Firebase App Distribution (alternative) → upload `.apk`, invite testers

#### Production release (Google Play)
1. Ensure `versionName`/`versionCode` correct in `pubspec.yaml`
2. Sign the bundle (`key.properties` + `android/app/build.gradle` keystore block)
3. `flutter build appbundle --release`
4. Upload to Google Play Console → Production track
5. Complete store listing, content rating, submit for review

### Signing & secrets
- Never commit keystore files or `key.properties`
- Add them to `.gitignore` before the first commit
- Store secrets in env vars or a secrets manager (e.g. GitHub Secrets for CI)

## 11. Dependencies
[Table: package | version | purpose]

## 12. Migration Notes & Known Toolchain Transitions
[Carry forward verbatim from the current README — see below, do not regenerate]
```

Rules: every chapter has a short intro paragraph; props tables use `Prop`/`Type`/`Description`; version badge reflects `pubspec.yaml`; ToC anchors must work on GitHub Markdown; never invent unverifiable info (mark TBD instead); sections 9, 10 and 12 are always mandatory.

### Section 12 — Migration Notes & Known Toolchain Transitions

This section is a living log, not generated content — **copy its existing entries verbatim** from the current `README.md` into the rewritten one, unless the user explicitly asks to add, update, or remove an entry in the same request. Each entry documents a toolchain/dependency transition the project hit and how it was handled (e.g. an AGP/Gradle/Kotlin version wall, a breaking dependency major bump requiring a workaround) — useful both as project history and as a heads-up for template users who hit the same wall later. Never invent entries; never silently drop one during a rewrite.

## Step 4 — Write the file

Overwrite `README.md`. Confirm in Italian: brief summary of changes + any TBD sections needing user input.
