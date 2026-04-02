---
agent: agent
description: 'Bump the project to a new version: update pubspec.yaml, README badge and CHANGELOG.'
---

# Workflow — Version Bump

> **Trigger phrase**: "aggiornami il progetto alla versione X.Y.Z" or any clearly equivalent phrase containing a version number.

> **Required mode: Agent.**
> If you do not have access to file system tools (you are in Ask Mode / Chat Mode), reply **only** with:
> "To bump the version I need to be in **Agent** mode. Please re-send the request in Agent mode."
> Then stop. Do not attempt the workflow.

---

## About cider

This project uses [cider](https://pub.dev/packages/cider) (`dev_dependency`) as the versioning tool. Cider manages both `pubspec.yaml` version bumps and `CHANGELOG.md` entries following the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format.

Key commands used in this workflow:
| Command | Effect |
|---|---|
| `dart run cider version` | Print the current version |
| `dart run cider bump patch` | Bump patch (1.0.0 → 1.0.1) |
| `dart run cider bump minor` | Bump minor (1.0.0 → 1.1.0) |
| `dart run cider bump major` | Bump major (1.0.0 → 2.0.0) |
| `dart run cider log added "..."` | Add an entry under `### Added` in `[Unreleased]` |
| `dart run cider log changed "..."` | Add an entry under `### Changed` |
| `dart run cider log fixed "..."` | Add an entry under `### Fixed` |
| `dart run cider release [X.Y.Z]` | Promote `[Unreleased]` to the given version with today's date |

If `CHANGELOG.md` does not exist yet, cider will create it automatically on first use.

---

## Step 1 — Read current state

Read in parallel:
- `pubspec.yaml` — extract current version string (e.g. `1.0.0+1`)
- `README.md` — locate the version badge
- `CHANGELOG.md` — read existing entries if the file exists

Run to confirm the current version:
```
dart run cider version
```

Parse the current version into its parts:
- `SEMVER` = the part before `+` (e.g. `1.0.0`)
- `BUILD` = the integer after `+` (e.g. `1`)

The **new version** is the one provided by the user in the trigger phrase (e.g. `1.0.6`).
The **new build number** = `BUILD + 1`.
The **full new version string** = `NEW_VERSION+NEW_BUILD` (e.g. `1.0.6+2`).

---

## Step 2 — Detect changes

Run the following commands to gather change information:

```
git log --oneline -20
git status --short
```

Compile a list of detected changes grouped by type:
- **Added** — new screens, widgets, helpers, routes
- **Changed** — existing components updated or refactored
- **Fixed** — bugs resolved
- **Dependencies** — packages added, removed or updated
- **Configuration** — changes to pubspec, build files, CI, etc.

---

## Step 3 — Present changes for approval

Show the user the detected changes and the proposed CHANGELOG entry **before writing anything**:

```
## [X.Y.Z] — YYYY-MM-DD

### Added
- …

### Changed
- …

### Fixed
- …
```

Ask the user:
- Are these changes correct and complete?
- Are there any entries to add, remove or rephrase?

**Wait for explicit approval before proceeding to Step 4.**

---

## Step 4 — Apply all changes

Once the user confirms, apply all changes using cider:

### 4a. Populate the Unreleased section in CHANGELOG.md

For each approved change, run the corresponding cider log command:

```
dart run cider log added "Description of the addition"
dart run cider log changed "Description of the change"
dart run cider log fixed "Description of the fix"
```

### 4b. Bump the version in `pubspec.yaml` and release CHANGELOG

Determine the bump type from the difference between old and new version:
- Same major, same minor → `patch`
- Same major, different minor → `minor`
- Different major → `major`

Run the appropriate bump command:
```
dart run cider bump patch   # or minor / major
```

Then immediately release with the exact target version provided by the user:
```
dart run cider release X.Y.Z
```

> This promotes the `[Unreleased]` section to `[X.Y.Z] — YYYY-MM-DD` in `CHANGELOG.md` and sets the version in `pubspec.yaml`.

Finally, manually set the build number in `pubspec.yaml` by replacing the version line (cider does not manage the `+BUILD` suffix):
```
version: X.Y.Z+NEW_BUILD
```

### 4c. Update the version badge in `README.md`

Find the version badge and update it to reflect the new version. If no badge exists, add one after the project title:

```markdown
![Version](https://img.shields.io/badge/version-X.Y.Z-blue)
```

---

## Step 5 — Confirm to the user

Provide a concise confirmation in Italian:
- New version applied
- Files updated
- CHANGELOG entry written
