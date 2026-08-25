---
name: dependency-check
description: Check pubspec.yaml dependencies against flutter pub outdated, auto-apply safe (same-major) version bumps, and report packages needing manual review for breaking changes. Trigger phrases (Italian or English) - "controlla le dipendenze", "check dependencies", part of the full-project-checkup skill.
---

# Dependency Check & Update

**Trigger**: part of Full Project Checkup, or asked directly ("controlla le dipendenze", "check dependencies").

1. Read `pubspec.yaml` for declared dependencies/dev_dependencies and version constraints.
2. Run `flutter pub outdated`. For each outdated package note Current / Upgradable / Resolvable / Latest.
3. Categorise:
   - **Safe to update automatically** — resolvable version has the **same major** version (minor/patch bump only).
   - **Needs attention** — resolvable/latest version has a **different major** version (possible breaking changes).
4. Apply safe updates: edit the version constraint directly in `pubspec.yaml` for each safe direct dependency (e.g. `^2.1.0` → `^2.3.0`) — mandatory, don't skip. Then run `flutter pub get` once. Never use `flutter pub upgrade` as a substitute for editing `pubspec.yaml` (it only touches `pubspec.lock`).
5. Report in Italian:

```
### Aggiornamenti applicati automaticamente
| Pacchetto | Versione precedente | Versione aggiornata |

### Aggiornamenti che richiedono la tua attenzione
| Pacchetto | Versione attuale | Ultima versione | Note |
```

For each package needing attention, include its pub.dev changelog URL: `https://pub.dev/packages/[package_name]/changelog`. If nothing is outdated, say so clearly.
