---
name: version-bump
description: Bump the app version using cider — parses semver/build, asks whether this ships to a store to decide the build-number increment, proposes a CHANGELOG entry for approval, then applies pubspec.yaml/CHANGELOG.md/README badge updates. Trigger - "aggiornami il progetto alla versione X.Y.Z" or a clear equivalent containing a version number.
---

# Version Bump

**Trigger**: "aggiornami il progetto alla versione X.Y.Z" or clear equivalent containing a version number.

**Build number guard**: if the user includes a build number (e.g. `2.0.0+5`), do **not** apply it. Reply in Italian: "Il numero di build (`+N`) è gestito automaticamente dal processo di CI/CD sincronizzato con gli store. Modificarlo manualmente potrebbe rompere la pubblicazione. Procederò ad aggiornare solo la versione `X.Y.Z`." Then continue using only `X.Y.Z`.

## About cider

This project uses [cider](https://pub.dev/packages/cider) (`dev_dependency`) for version bumps and `CHANGELOG.md` entries (Keep a Changelog format):

| Command | Effect |
|---|---|
| `dart run cider version` | Print current version |
| `dart run cider bump patch/minor/major` | Bump accordingly |
| `dart run cider log added/changed/fixed "..."` | Add entry under `[Unreleased]` |
| `dart run cider release [X.Y.Z]` | Promote `[Unreleased]` to `[X.Y.Z]` with today's date |

If `CHANGELOG.md` doesn't exist, cider creates it on first use.

## Step 1 — Read current state

Read in parallel: `pubspec.yaml` (current version, e.g. `1.0.0+1`), `README.md` (version badge), `CHANGELOG.md` (existing entries). Confirm with `dart run cider version`.

Parse `SEMVER` (part before `+`) and `BUILD` (integer after `+`, `0` if absent). New version = the one the user provided.

Ask (via `AskUserQuestion`): "Will this version be published to the App Store / Google Play?" — Yes → `NEW_BUILD = BUILD + 1`; No → `NEW_BUILD = BUILD` unchanged. Full new version string = `NEW_VERSION+NEW_BUILD`.

## Step 2 — Detect changes

Run `git log --oneline -20` and `git status --short`. Group detected changes: Added / Changed / Fixed / Dependencies / Configuration.

## Step 3 — Present for approval

Show the proposed CHANGELOG entry before writing anything:

```
## [X.Y.Z] — YYYY-MM-DD

### Added
- …

### Changed
- …

### Fixed
- …
```

Ask if correct/complete, any entries to add/remove/rephrase. **Wait for explicit approval before Step 4.**

## Step 4 — Apply all changes

1. For each approved change, run `dart run cider log added/changed/fixed "..."`.
2. Determine bump type (same major+minor → patch; same major diff minor → minor; diff major → major) and run `dart run cider bump <type>`, then `dart run cider release X.Y.Z` (promotes `[Unreleased]` in CHANGELOG, sets `pubspec.yaml` version).
3. Manually set the `+BUILD` suffix in `pubspec.yaml` (cider doesn't manage it): `version: X.Y.Z+NEW_BUILD`.
4. Update the version badge in `README.md` (add one after the project title if none exists): `![Version](https://img.shields.io/badge/version-X.Y.Z-blue)`.

## Step 5 — Confirm (Italian)

New version applied, files updated, CHANGELOG entry written.
