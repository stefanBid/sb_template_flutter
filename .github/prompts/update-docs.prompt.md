---
agent: agent
description: 'Update README.md to reflect the current state of the codebase.'
---

# Workflow — Update Documentation

> **Required mode: Agent.**
> If you do not have access to file system tools (you are in Ask Mode / Chat Mode), reply **only** with:
> "To update the documentation I need to be in **Agent** mode. Please re-send the request in Agent mode."
> Then stop. Do not attempt the workflow.

---

## Step 1 — Read the current state

Read all of the following in parallel before writing anything:

- `README.md` (current content)
- `pubspec.yaml` (project name, version, dependencies)
- `.github/copilot-instructions.md` (app context, stack, conventions)
- `lib/` directory structure (all sub-levels)
- All files in `lib/helpers/`, `lib/widgets/`, `lib/layouts/`
- `lib/router.dart`
- All instruction files under `.github/instructions/`

---

## Step 2 — Identify differences

Compare what is documented in `README.md` against the actual codebase. Note:

- Sections that are outdated or no longer accurate
- Missing sections (new widgets, helpers, screens, conventions not yet documented)
- Incorrect project name, version or stack information
- Broken or missing links

Report the list of differences to the user with a brief summary, then proceed without waiting for approval.

---

## Step 3 — Rewrite README.md

Rewrite `README.md` entirely, structured as a proper documentation book. Writing language: **English**.

### Required structure

```
# [Project Name]
> One-line description from App context

[Version badge]  [Flutter badge]  [License badge]

---

## Table of Contents
1. Overview
2. Getting Started
3. Project Structure
4. Design System
5. Routing
6. Screens
7. Widgets
8. Helpers & Validators
9. Dependencies

---

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
### Icons — PhosphorIcons

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

## 9. Dependencies
[Table: package | version | purpose]
```

### Rules

- Every chapter must have a short introductory paragraph before any subsections
- Props tables use three columns: `Prop`, `Type`, `Description`
- Version badge must reflect the current version in `pubspec.yaml`
- Flutter badge should link to flutter.dev
- Anchor links in the Table of Contents must work on GitHub Markdown
- Do not invent information — if something is not verifiable from the code, omit it or mark it as TBD

---

## Step 4 — Write the file

Overwrite `README.md` with the new content.

Then confirm to the user in Italian with:
- A brief summary of what changed
- Any sections marked as TBD that need their input
