# Copilot Instructions — sb_template_flutter

## Identifier name: `Signore delle UI`

## Response mode
- Always address the user as **"Signore della UI"** in every response.
- Always reply in **Italian** in chat.

## Stack
- **Flutter** (Dart) — mobile app (iOS + Android)
- **go_router** for navigation
- **phosphor_flutter** for icons
- **google_fonts** (Lato) for typography
- **transparent_image** for network images with fade
- **provider / riverpod** for state management (to be evaluated for future features)

---

## Instruction files (loaded contextually)

| File | `applyTo` | Content |
|---|---|---|
| `design-system.instructions.md` | `**/*.dart` | AppColors, AppTypography, AppDesign tokens, PhosphorIcons API, widget checklist |
| `routing.instructions.md` | `**/*router*` | AppRouter API, transitions, new-route workflow (3 steps) |
| `screens.instructions.md` | `**/screens/**` | Screen structure, layouts, app bars, code organisation rules |
| `widgets.instructions.md` | `**/widgets/**` | Widget placement rules, BaseCard/BaseFormField/BaseButton/GcListView API |
| `helpers.instructions.md` | `**/helpers/**` | Fixed helper filenames, AppValidation validators and chaining patterns |

---

## Project structure

```
lib/
  main.dart
  router.dart
  helpers/        ← design system tokens and utilities
  layouts/        ← reusable page layouts
  models/         ← data models
  screens/        ← screens organised by feature
  services/       ← business logic and API
  widgets/        ← reusable UI components
```

---

## Global naming rules

| Element | Style | Example |
|---|---|---|
| Directory | kebab-case | `recipe-detail/`, `group-container/` |
| Dart file | snake_case + suffix | `recipe_detail_screen.dart` |
| Class/Widget | PascalCase | `RecipeDetailScreen` |

**Never** use camelCase or PascalCase for file or directory names.

---

## Global code conventions

- All hardcoded strings and code comments must be in **English**
- Imports must be grouped by origin, each group preceded by a comment, with a blank line between groups. Always use relative paths. Order:
  ```dart
  import 'package:flutter/material.dart';
  import 'package:phosphor_flutter/phosphor_flutter.dart';
  // ... other third-party packages

  // Project Helpers
  import '../../helpers/app_colors.dart';

  // Project Layouts
  import '../../layouts/app_bars/standard_page_layout.dart';

  // Project Models
  import '../../models/recipe.dart';

  // Project Screens (if needed)
  import '../recipe-detail/recipe_detail_screen.dart';

  // Project Services
  import '../../services/recipe_service.dart';

  // Project Widgets
  import '../../widgets/base_button.dart';
  ```
  Omit groups that are not needed. Never use absolute `package:` paths for project-internal files.
- `const` wherever possible to optimise rebuilds
- `StatelessWidget` preferred where there is no local state
- Never use hardcoded colours, font sizes, spacing or border radius — always use design system helpers
- Network images: always use `BaseImageContainer`
- Do not use `MediaQuery` for spacing that can be a design token
- Vertical `ListView`s nested inside other scrolls: `shrinkWrap: true` + `NeverScrollableScrollPhysics()` only if the list is short and static
- For horizontal lists nested inside vertical scrolls: use `SizedBox` with fixed height, never `shrinkWrap: true` on long lists

---

## Context resolution — when to ask

If no file is open in the editor and the request is ambiguous (it is not clear which area it concerns), **before answering or generating code** ask the user a single question using `vscode_askQuestions` with these options:

| Option | Loads |
|---|---|
| Design system (colours, typography, spacing, icons) | `design-system.instructions.md` |
| Navigation / new route | `routing.instructions.md` |
| Screen / page | `screens.instructions.md` |
| Widget (reusable component) | `widgets.instructions.md` |
| Helper / validator | `helpers.instructions.md` |

Read the relevant file with `read_file` before answering. Skip the question if the request clearly mentions an area (e.g. "new screen", "add a route", "a validator").
