# CLAUDE.md — sb_template_flutter

## App context

This is a Flutter template app designed to provide a solid and opinionated starting structure for building new mobile applications. It comes with a pre-configured design system, routing setup, reusable widgets, helpers and project organisation so that developers can focus on building features rather than scaffolding. The template is meant to be cloned and initialised for a specific project, progressively replacing placeholder screens and components with real ones while keeping the underlying conventions and tooling intact.

Use this context to give suggestions — UI, UX, architectural or otherwise — that are consistent with a general-purpose, well-structured Flutter starter template.

---

## Assistant identity & response language

- Identifier name: `Signore delle UI`.
- Always address the user as **"Signore della UI"** in every response.
- Always reply in **Italian** in chat.

---

## Stack

- **Flutter** (Dart) — mobile app (iOS + Android)
- **go_router** for navigation
- **Material Icons** (`Icons.*`) for icons — do not use PhosphorIcons or any external icon package
- **google_fonts** (Lato) for typography
- **cached_network_image** for network images with cache and fade
- **flutter_secure_storage** for encrypted key-value storage (iOS Keychain / Android EncryptedSharedPreferences)
- **image_picker** for camera and gallery access
- **provider / riverpod** for state management (to be evaluated for future features)

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

**Widget naming — be generic**: the name must describe **what the widget is**, not where it is used. Bad: `base_name_input`, `base_stat_card`. Good: `base_input`, `base_value_card`. If a name only makes sense in one specific context, it is too specific — generalise it.

---

## Global code conventions

- All hardcoded strings and code comments must be in **English**
- Imports must be grouped by origin, each group preceded by a comment, with a blank line between groups. Always use relative paths. Order:
  ```dart
  import 'package:flutter/material.dart';
  // ... other third-party packages

  // Project Helpers
  import '../../helpers/app_colors.dart';

  // Project Layouts
  import '../../layouts/body/standard_page_layout.dart';

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
- `const` wherever possible to optimise rebuilds. A constructor call **must** be `const` when: (1) the widget has a `const` constructor, and (2) all arguments are compile-time values (string/number literals, `static const` tokens, other `const` constructors). When the parent is already `const`, children drop the keyword — move `const` to the outermost eligible ancestor instead
- `StatelessWidget` preferred where there is no local state
- Never use hardcoded colours, font sizes, spacing or border radius — always use design system helpers
- Network images: always use `BaseImageContainer`
- Do not use `MediaQuery` for spacing that can be a design token
- Vertical `ListView`s nested inside other scrolls: `shrinkWrap: true` + `NeverScrollableScrollPhysics()` only if the list is short and static
- For horizontal lists nested inside vertical scrolls: use `SizedBox` with fixed height, never `shrinkWrap: true` on long lists

---

# Design System — Helpers

Helpers are the single source of truth for the design system. **Every widget or screen MUST use them.** Never hardcode colours, font sizes, spacing or border radius.

---

## AppColors — `lib/helpers/app_colors.dart`

Access: `AppColors.of(context)` for adaptive colours, `AppColors.primary` etc. for static constants.

| Token | Light | Dark | Usage |
|---|---|---|---|
| `background` | `#F5FAFE` | `#0B1E30` | Page background |
| `surface` | `#DAECF8` | `#163350` | Cards, elevated containers |
| `text` | `#0D2137` | `#E8F3FB` | Primary text |
| `muted` | `#6B8DA8` | `#4D7A9E` | Secondary text, placeholders |
| `bottomBar` | `#EAF4FC` | `#0E2840` | Bottom navigation bar |
| `primary` | `#60C9F8` | — | Primary accent (static) |
| `secondary` | `#0A599C` | — | Secondary accent (static) |
| `error` | `#B00020` | — | Errors (static) |
| `success` | `#10B981` | — | Success (static) |
| `warning` | `#F59E0B` | — | Warning (static) |

Accent rule for buttons:
```dart
final accent = AppColors.of(context).isDark ? AppColors.secondary : AppColors.primary;
```

### Which colour and where

| Context | Token |
|---|---|
| Page/screen background | `AppColors.of(context).background` |
| Card, container, input background | `AppColors.of(context).surface` |
| Primary text (titles, body) | `AppColors.of(context).text` |
| Secondary text, placeholder, muted label | `AppColors.of(context).muted` |
| Accent colour for button/active icon | `AppColors.primary` (light) / `AppColors.secondary` (dark) |
| Error message, invalid field border | `AppColors.error` |
| Positive feedback / success | `AppColors.success` |
| Warning feedback | `AppColors.warning` |
| Bottom navigation bar background | `AppColors.of(context).bottomBar` |

---

## AppTypography — `lib/helpers/app_typography.dart`

Access: `AppTypography.of(context).{style}`. Font is **Lato** (Google Fonts).

| Style | Size | Weight | Usage |
|---|---|---|---|
| `heading1` | 28 | bold | Main screen titles |
| `heading2` | 22 | bold | Section titles |
| `heading3` | 18 | semibold | Subtitles |
| `heading4` | 16 | semibold | Card titles, list item titles |
| `body` | 16 | normal | Body text |
| `bodyMedium` | 14 | normal | Inputs, dense UI |
| `bodySecondary` | 16 | normal | Secondary text (colour `muted`) |
| `caption` | 12 | normal | Labels, secondary info |
| `small` | 11 | normal | Badges, tiny labels |

### Which style for which element

| UI element | Style |
|---|---|
| Main screen title | `heading1` |
| Section title on the page | `heading2` |
| Subtitle / group header | `heading3` |
| Card or list item title | `heading4` |
| Body text, descriptions | `body` |
| Input text, compact UI | `bodyMedium` |
| Secondary text / note / hint | `bodySecondary` |
| Labels, metadata, secondary info | `caption` |
| Badges, chip text, tiny labels | `small` |

---

## AppDesign — `lib/helpers/app_design.dart`

Access: `AppDesign.{token}` (all static).

### Border radius — by element type

| Element | Token | Value |
|---|---|---|
| Badges, small chips, tags | `borderRadiusXXs` | 6 |
| Inputs, buttons, small cards | `borderRadiusXs` | 10 |
| Medium cards | `borderRadiusSm` | 20 |
| Large cards, modals, bottom sheets | `borderRadiusMd` | 32 |
| Pill, avatar, full-round elements | `borderRadiusLg` | 48 |
| Top/bottom corners only | `borderRadiusTop/BottomSm/Md/Lg` | — |

### Vertical gap — between elements

| Distance | Token | Value | When |
|---|---|---|---|
| Title ↔ subtitle, label ↔ value | `gapItemXs` | 4 | Tightly coupled elements |
| Image ↔ text, icon ↔ description | `gapItemSm` | 8 | Cohesive group |
| Distinct info groups in the same component | `gapItemMd` | 16 | Distinct info |
| Related sections on the page | `gapSectionXs` | 10 | Close sections |
| Separate sections on the page | `gapSectionSm` | 16 | Standard separation |
| Distinct sections | `gapSectionMd` | 20 | Different blocks |
| Widely separated sections | `gapSectionLg` | 24 | Large separation |

### Horizontal gap — between inline elements

| Distance | Token | Value | When |
|---|---|---|---|
| Icon ↔ label | `gapInlineXs` | 4 | Tightly coupled |
| Related inline elements | `gapInlineSm` | 8 | Close |
| Distinct inline elements | `gapInlineMd` | 16 | Wide spacing |

### Padding — by context

| Context | Token |
|---|---|
| Standard page padding (left/right 20) | `paddingPage` |
| Internal padding small card | `paddingSymmetricSm` (h:8, v:4) |
| Internal padding card / section | `paddingSymmetricMd` (h:16, v:8) |
| Internal padding wide element | `paddingSymmetricLg` (h:20, v:8) |
| Horizontal padding only | `paddingHorizontalSm/Md/Lg` |
| Uniform padding | `paddingXs`(4) `paddingSm`(8) `paddingMd`(16) `paddingLg`(20) `paddingXl`(24) |

---

## Icons — Material Icons

This project uses Flutter's built-in **Material Icons** (`Icons.*`). **Do not import or use `phosphor_flutter` or any other external icon package.**

```dart
// With Icon wrapper:
Icon(Icons.home)
Icon(Icons.mail_outline)
Icon(Icons.arrow_forward)

// As IconData directly (e.g. prefixIcon parameter):
Icons.mail_outline
```

Prefer outlined variants (`_outline`, `_outlined`) for a lighter visual style. Use filled variants for active/selected states only.

---

## Widget delivery checklist

- [ ] No hardcoded colours — all from `AppColors`
- [ ] No hardcoded `fontSize` — all from `AppTypography.of(context)`
- [ ] No hardcoded spacing — all from `AppDesign` gap/padding tokens
- [ ] No hardcoded `BorderRadius.circular(x)` — all from `AppDesign`
- [ ] Network images use `BaseImageContainer`
- [ ] Buttons use `BaseButton` / `BaseIconButton`
- [ ] Inputs use `BaseInput` / `BaseFormField`
- [ ] Icons use `Icons.*` from Material — do not use external icon packages

---

# Helpers — Design system files

Fixed filenames — do not add new files without a real need:

| File | Purpose |
|---|---|
| `app_colors.dart` | Colour tokens |
| `app_design.dart` | Spacing, border radius, padding |
| `app_image.dart` | Image type resolver and widget builder |
| `app_logger.dart` | Debug-only logger (stripped in release) |
| `app_router.dart` | Typed navigation layer |
| `app_storage.dart` | Encrypted key-value storage singleton |
| `app_theme.dart` | MaterialApp theme configuration |
| `app_typography.dart` | Text styles |
| `app_validation.dart` | Form field validators |

---

## AppImage — `lib/helpers/app_image.dart`

Static utility that resolves the source type of an image URL/path and builds the appropriate widget.

```dart
import '../helpers/app_image.dart';

final type = AppImage.getType(url); // → ImageType.network | .asset | .file
final widget = AppImage.buildImage(
  context,
  imageUrl: url,
  type: type,
  fit: BoxFit.cover,
);
```

| `ImageType` | URL prefix | Widget rendered |
|---|---|---|
| `network` | `http://` or `https://` | `CachedNetworkImage` |
| `asset` | starts with `assets/` | `Image.asset` |
| `file` | any other path | `Image.file` |

---

## AppStorage — `lib/helpers/app_storage.dart`

App-wide singleton for encrypted key-value storage backed by `flutter_secure_storage`. Uses Android EncryptedSharedPreferences and iOS Keychain.

```dart
import '../helpers/app_storage.dart';

// String primitives
await AppStorage.instance.write('token', value);
final token = await AppStorage.instance.read('token');
await AppStorage.instance.delete('token');

// JSON objects
await AppStorage.instance.writeObject('user', user, (u) => u.toJson());
final user = await AppStorage.instance.readObject('user', User.fromJson);
```

| Method | Description |
|---|---|
| `read(key)` | Returns stored string or `null` |
| `write(key, value)` | Stores a string value |
| `delete(key)` | Removes the entry |
| `readObject<T>(key, fromJson)` | Deserialises a JSON object or returns `null` |
| `writeObject<T>(key, value, toJson)` | Serialises and stores a JSON object |

---

## AppValidation — `lib/helpers/app_validation.dart`

Static validators for `TextFormField` / `BaseFormField`. Returns `null` if valid, an error string if invalid.

Chain with `??` — first failure wins:

```dart
validator: (v) => AppValidation.notEmpty(v) ?? AppValidation.email(v),
```

### Methods

| Method | Validates |
|---|---|
| `notEmpty(v)` | Field is not null or empty |
| `email(v)` | Valid email format |
| `minLength(v, n)` | At least n characters |
| `maxLength(v, n)` | At most n characters |
| `match(v, other)` | Values match (e.g. confirm password) |
| `numeric(v)` | Digits only |
| `strongPassword(v)` | Has uppercase + lowercase + digit |

All methods accept an optional `message` parameter to override the default error string.

### Common patterns

```dart
// Required only
validator: (v) => AppValidation.notEmpty(v),

// Required + valid email
validator: (v) => AppValidation.notEmpty(v) ?? AppValidation.email(v),

// Strong password
validator: (v) =>
    AppValidation.notEmpty(v) ??
    AppValidation.minLength(v, 8) ??
    AppValidation.strongPassword(v),

// Confirm password
validator: (v) =>
    AppValidation.notEmpty(v) ??
    AppValidation.match(v, passwordController.text),
```

---

## AppLogger — `lib/helpers/app_logger.dart`

Debug-only logger gated behind `kDebugMode`. All output is **automatically stripped in release and profile builds** — never use `print()` or bare `debugPrint()` directly.

```dart
import '../helpers/app_logger.dart';

AppLogger.debug('User loaded', tag: 'HomeScreen');
AppLogger.warn('Token is about to expire');
AppLogger.error('Failed to fetch data', error: e, stackTrace: st);
```

### Methods

| Method | Level | When to use |
|---|---|---|
| `AppLogger.debug(message, {tag})` | `[D]` | General flow information |
| `AppLogger.warn(message, {tag})` | `[W]` | Non-critical anomalies |
| `AppLogger.error(message, {tag, error, stackTrace})` | `[E]` | Exceptions and failures |

- `tag` is optional — use it to identify the calling class or feature (e.g. `tag: 'AuthService'`).
- `error` and `stackTrace` are optional extra fields on `AppLogger.error`.
- Output format: `[D] Tag | message` or `[D] message` when tag is omitted.

### Rules
- **Never use `print()`** anywhere in the project. Always use `AppLogger`.
- **Never use `debugPrint()` directly** — `AppLogger` calls it internally with the `kDebugMode` guard.
- Do not wrap calls in manual `if (kDebugMode)` checks — `AppLogger` handles that internally.

---

# Models — `lib/models/`

## JsonSerializable — `lib/models/json_serializable.dart`

Abstract base class for data models that need JSON serialisation.

```dart
abstract class JsonSerializable {
  Map<String, dynamic> toJson();
}
```

Every model that needs to be persisted (e.g. via `AppStorage.writeObject`) or sent over the network should implement it:

```dart
class User implements JsonSerializable {
  final String id;
  final String name;

  const User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json['id'] as String, name: json['name'] as String);

  @override
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
```

---

# Navigation — AppRouter / go_router

**Never** call `context.go('/path')` directly. Always use typed navigation:

```dart
AppRouter.goTo(context, AppRouter.home);
AppRouter.goTo(context, AppRouter.details, params: DetailParams(detailId: '123'));
AppRouter.goDeep(context, AppRouter.details, params: DetailParams(detailId: '123')); // push
AppRouter.goBack(context);
```

---

## How it works

- `AppTypedRoute<P>` — binds a route to its params type at compile time
- `GenericRouteParams` — base class; implement `toPathParams()` / `toQueryParams()`
- `NoParams` — use when a route has no parameters

---

## Transitions

- Top-level tabs (home/form/profile) → `NoTransitionPage`
- Detail routes → `CustomTransitionPage` with `FadeTransition` (150ms)

```dart
// Tab
GoRoute(
  path: '/home',
  pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
),

// Detail
GoRoute(
  path: '/details/:detailId',
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: DetailsScreen(detailId: state.pathParameters['detailId']!),
      transitionsBuilder: (context, animation, _, child) =>
          FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 150),
    );
  },
),
```

---

## Workflow — Adding a new page/route

Collect these three things before generating code:

1. **Route name** — `camelCase` (e.g. `recipeDetail`). Derive URL in kebab-case automatically (`/recipe-detail`).
2. **Path params** — dynamic URL segments (e.g. `recipeId` → `/recipe-detail/:recipeId`). If none, use `NoParams`.
3. **Query params** — query string params (e.g. `?tab=ingredients`). If none, omit.

### Step 1 — Create the screen

Create `lib/screens/<route-name>/<route_name>_screen.dart`:

```dart
import 'package:flutter/material.dart';
import '../../layouts/body/standard_page_layout.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const StandardPageLayout(
      body: Center(child: Text('RecipeDetailScreen')),
    );
  }
}
```

### Step 2 — Add params class + route constant in `app_router.dart`

```dart
class RecipeDetailParams extends GenericRouteParams {
  final String recipeId;
  const RecipeDetailParams({required this.recipeId});

  @override
  Map<String, String> toPathParams() => {'recipeId': recipeId};
}

// Inside AppRouter class:
static const recipeDetail = AppTypedRoute<RecipeDetailParams>('/recipe-detail/:recipeId');
```

If no params: `static const myRoute = AppTypedRoute<NoParams>('/my-route');`

### Step 3 — Register in `router.dart`

```dart
GoRoute(
  path: '/recipe-detail/:recipeId',
  pageBuilder: (context, state) {
    final params = RecipeDetailParams(
      recipeId: state.pathParameters['recipeId']!,
    );
    return CustomTransitionPage(
      child: RecipeDetailScreen(params: params),
      transitionsBuilder: (context, animation, _, child) =>
          FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 150),
    );
  },
),
```

Consuming code navigates **only** via `AppRouter.goTo` / `AppRouter.goDeep` — never with raw path strings.

---

# Screens — Structure and conventions

## File placement

Each screen lives in its own kebab-case directory under `lib/screens/`:

```
screens/
  recipe-detail/
    recipe_detail_screen.dart   ← main screen file
    widgets/                    ← screen-specific widgets (if any)
      ingredient_chip.dart
```

- Directory: **kebab-case** (`recipe-detail/`)
- File: **snake_case** (`recipe_detail_screen.dart`)
- Class: **PascalCase** (`RecipeDetailScreen`)
- Create `widgets/` sub-directory for any custom widget used only in this screen (even if just one)

---

## Available layouts

### `StandardPageLayout`

Standard scrollable page with optional app bar. Import from `layouts/body/standard_page_layout.dart`.

```dart
StandardPageLayout(
  hasPadding: true,          // default true — applies AppDesign.paddingPage
  appBar: const ClassicAppBar(title: 'Title'),
  body: ...,
)
```

### `AppLayout`

Shell layout with bottom navigation bar. Used via `ShellRoute` — do not instantiate directly.

### `HeroPageLayout`

Full-bleed hero-image page: image fills the top ~35% of the screen, body content sits in a rounded sheet overlapping it, with a `TransparentAppBar` + back button on top. Import from `layouts/body/hero_page_layout.dart`.

```dart
HeroPageLayout(
  imageUrl: 'https://...',
  imageHeight: 280,   // optional, default 280
  onBack: () { ... },  // optional — defaults to AppRouter.goBack(context)
  body: ...,
)
```

Use for detail screens with a prominent header image (e.g. recipe detail, profile detail) instead of `StandardPageLayout`.

### App bars

- `ClassicAppBar(leading, title, actions, bottomContent)` — standard app bar with gradient
- `TransparentAppBar` — overlaid on content (for hero-image screens)

---

## Code organisation inside a screen

### Private helper functions (keep in the same file)

Extract pieces of the `build` method into private functions when they reduce repetition:

```dart
Widget _buildHeader(BuildContext context) { ... }
Widget _buildItemTile(BuildContext context, Item item) { ... }
```

These functions do **not** become separate files.

### When to create a separate widget file

If a UI piece has its own state, many parameters, or is reused — create a separate file.

```
I have a piece of UI to isolate:
├─ Used in 3+ screens?     → lib/widgets/base_widget_name.dart
├─ Used in ≤ 2 screens?    → screens/<name>/widgets/widget_name.dart
├─ Demo screen only?       → define in the same screen file (exception)
└─ Small repetition?       → private _buildXxx() function
```

### Exception — Template/demo screens

In `home_screen.dart`, `form_screen.dart` etc. it is acceptable to have multiple widget classes in the same file. This exception applies **only** to template demo screens.

---

# Widgets — Placement, naming and API

## Placement rules

| Case | Where | Naming |
|---|---|---|
| Used in **≤ 2** screens | `screens/<name>/widgets/` | `widget_name.dart` |
| Used in **3+** screens | `lib/widgets/` (root) | `base_widget_name.dart` |
| Group container / list | `lib/widgets/group-container/` | `gc_widget_name.dart` |

---

## BaseCard

Card with image, title and content. Default size 220×220. Uses `BaseImageContainer` internally.

```dart
BaseCard(
  imageUrl: 'https://...',
  title: 'Title',
  width: 220,
  height: 220,
)
```

---

## BaseImageContainer

Network/asset image with fade-in, filters and error fallback.

```dart
BaseImageContainer(
  imageUrl: 'https://...',
  width: 200,
  height: 200,
  fit: ImageFit.cover,      // ImageFit.cover | .contain
  filter: ImageFilter.none, // ImageFilter.none | .darken
)
```

---

## BaseInput

Styled `TextField`. Use `BaseFormField` inside `Form` widgets.

```dart
BaseInput(
  controller: controller,
  hint: 'Search...',
  fillColor: AppColors.of(context).surface, // optional
)
```

---

## BaseFormField

Styled `TextFormField` for use inside a `Form`.

```dart
BaseFormField(
  controller: controller,
  label: 'Email',
  prefixIcon: Icons.mail_outline, // IconData? — rendered internally with muted colour
  suffixIcon: IconButton(...),               // Widget? — use for buttons (e.g. show-password)
  fillColor: AppColors.of(context).surface,
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next,
  obscureText: false,
  validator: (v) => AppValidation.notEmpty(v) ?? AppValidation.email(v),
)
```

---

## BaseCheckbox

Styled checkbox with optional label. Tapping the entire row toggles the value.

```dart
BaseCheckbox(
  value: _checked,
  onChanged: (val) => setState(() => _checked = val),
  label: 'Agree to terms', // optional
  fullWidth: false,         // optional — expands row to full width
)
```

---

## BaseDropdown

Styled single-select `DropdownButtonFormField` for use inside a `Form`. For multi-select use `BaseMultiselect`.

```dart
BaseDropdown<String>(
  initialValue: _value,
  items: const [
    BaseDropdownOption(value: 'a', label: 'Option A'),
    BaseDropdownOption(value: 'b', label: 'Option B'),
  ],
  label: 'Category',
  hint: 'Select one',
  prefixIcon: Icons.category_outlined,  // optional
  voidSelectionItemLabel: '— None —',    // optional — adds a null option at the top
  disabled: false,
  isLoading: false,
  validator: (v) => AppValidation.notEmpty(v),
  onChanged: (value) { ... },
)
```

---

## BaseMultiselect

Styled multi-select field for use inside a `Form`. Opens an `AlertDialog` with checkboxes; selected values are shown as deletable chips. Uses `BaseDropdownOption<T>` — the same data class as `BaseDropdown`.

```dart
BaseMultiselect<String>(
  items: const [
    BaseDropdownOption(value: 'a', label: 'Option A'),
    BaseDropdownOption(value: 'b', label: 'Option B'),
  ],
  initialValues: _selectedValues,
  label: 'Tags',
  hint: 'Select items',
  prefixIcon: Icons.label_outline, // optional
  disabled: false,
  isLoading: false,
  validator: (v) => v == null || v!.isEmpty ? 'Required' : null,
  onChanged: (values) { ... },
)
```

---

## BaseButton

```dart
BaseButton(
  label: 'Submit',
  icon: Icons.arrow_forward, // optional
  type: BaseButtonType.filled, // filled | outlined | ghost
  color: AppColors.primary,    // optional — overrides accent colour
  pill: false,                 // optional — rounded pill shape
  fullWidth: true,
  isLoading: false,
  onPressed: () { ... },
)
```

Accent colour resolved automatically: `primary` in light mode, `secondary` in dark mode.

---

## BaseIconButton

```dart
BaseIconButton(
  icon: Icons.add,
  type: IconButtonType.filled,  // filled | outlined
  color: AppColors.primary,     // optional — background (filled) or border (outlined) colour
  iconColor: Colors.white,      // optional — icon colour override
  badgeCount: 3,                // optional — red notification badge
  onPressed: () { ... },
)
```

---

## GcListView

Wrapped `ListView.builder`. For horizontal lists, wrap in a `SizedBox` with a fixed height.

```dart
// Vertical
GcListView(
  itemCount: items.length,
  itemBuilder: (context, index) => ...,
)

// Horizontal (fixed height required)
SizedBox(
  height: 240,
  child: GcListView(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (context, index) => ...,
  ),
)
```

---

## GcGridView

```dart
GcGridView(
  dimensions: const GridDimensions(crossAxisCount: 2),
  children: items.map((item) => ItemWidget(item)).toList(),
)
```

---

## BaseValueCard

Card that displays a value and a label. Use for stats, KPIs, counts, or any labeled numeric/text value.

```dart
BaseValueCard(
  value: '4.2K',
  label: 'Followers',
)
```

---

## BaseBadge

Inline label with semantic colour. Uses `borderRadiusXXs` and `small`/`caption` typography via `BadgeStyle`.

```dart
BaseBadge(
  label: 'New',
  icon: Icons.star_border, // optional
  style: BadgeStyle(
    color: AppColors.success,
    foregroundColor: Colors.white,       // optional — text and icon colour
    size: BadgeSize.normal,              // normal (caption) | small
    variant: BadgeVariant.filled,        // filled | outlined
    borderRadius: AppDesign.borderRadiusXXs, // optional override
  ),
)
```

**Colour logic:**
- `color` controls both fill and border colour in both variants
- `filled` → coloured background + matching border
- `outlined` → transparent background + border in `color` colour
- `foregroundColor` → text and icon only (independent from border)

---

## BaseScaffoldMessenger

Static utility for showing styled snack bars. Never use `ScaffoldMessenger.of(context).showSnackBar` directly.

```dart
BaseScaffoldMessenger.show(
  context,
  message: 'Saved successfully!',
  type: SnackBarType.success, // success | error | warning | info (default)
);
```

| `SnackBarType` | Colour | Icon |
|---|---|---|
| `success` | `AppColors.success` | `checkCircle` |
| `error` | `AppColors.error` | `xCircle` |
| `warning` | `AppColors.warning` | `warningCircle` |
| `info` | `primary` / `secondary` (adaptive) | `info` |

Clears previous snack bars automatically before showing the new one. Uses `borderRadiusTopXs` (top corners only).

---

## BaseBottomSheet

Static utility that shows a modal bottom sheet with an optional header. Never call `showModalBottomSheet` directly.

```dart
BaseBottomSheet.show(
  context,
  title: 'Title',        // optional
  subtitle: 'Subtitle',  // optional
  heightFactor: 0.5,     // optional — fraction of screen height (0, 1]
  child: MyContent(),
);

BaseBottomSheet.hide(context); // programmatic close
```

---

## BaseImagePicker

Tappable image preview with placeholder that opens a bottom sheet to select or remove a photo. Stateless — the caller owns the image state.

```dart
BaseImagePicker(
  imageUrl: _imageUrl,   // String? — null shows placeholder icon
  height: 200,           // optional, default 200
  onImageSelected: (XFile? file) => setState(
    () => _imageUrl = file?.path,
  ),
)
```

- `onImageSelected` is called with the selected `XFile` on pick, or `null` when the user removes the image.
- Internally uses `AppImage.buildImage()` to render local (file) images.
- Opens `BaseImageSelectorBottomSheet` on tap.

---

## BaseImageSelectorBottomSheet

Static utility that shows a bottom sheet with gallery / camera options, and optionally a remove action.

```dart
BaseImageSelectorBottomSheet.show(
  context,
  onImageSourceSelected: (ImageSource source) { ... },
  hasImage: true,           // show Remove option
  onRemove: () { ... },     // called when Remove is tapped
);
```

Never call `BaseBottomSheet.show()` directly for image picking — always use this helper.

---

# Workflows — Agent tasks

These workflows were previously separate Copilot prompt files; they are now native Claude Code workflows. Trigger phrases may be Italian or English equivalents. Use the `AskUserQuestion` tool wherever user input is required — do not proceed past a required question until answered.

---

## Project Initialisation

**Trigger**: "Inizializziamo il progetto", "inizializza il progetto", "reset del progetto", or clear equivalent.

### Step 1 — Collect info

Ask, in a single `AskUserQuestion` call:

1. **Username** — Still "Signore della UI"? If not, what name to use instead?
2. **Global rules** — Re-read the "Assistant identity & response language" and other global sections of this CLAUDE.md. Any rules to add/change/remove vs the template version? ("no changes" if none.)
3. **Project name** — e.g. `MyApp`, `RecipeBook`, `FitnessTracker`.
4. **App context** — 2–4 sentences: what the app does, who it's for. Stored as permanent context for future UI/UX/technical suggestions.

Do not proceed until all four are answered.

### Step 2 — Apply configuration changes

- **Username**: if changed, replace the "Assistant identity & response language" section in this CLAUDE.md — the identifier line and every occurrence of "Signore della UI" / "Signore delle UI".
- **Global rules**: add any new rules to the appropriate section of this CLAUDE.md, without deleting existing ones unless explicitly requested.
- **App context**: replace the `## App context` section content at the top of this CLAUDE.md with the text provided.
- **Version reset**: set `pubspec.yaml` `version:` to `1.0.0+1`. Reset the version badge in `README.md` to `1.0.0` if present.
- **CHANGELOG reset**: if `CHANGELOG.md` exists with content, clear the `[Unreleased]` section first, then run `dart run cider release 1.0.0` so the file starts clean from `1.0.0` with today's date — no history carried over. If it doesn't exist, cider creates it automatically on first use.
- **Rename the project** — read each file first to find the exact string to replace:

| File | Field | Value |
|---|---|---|
| `pubspec.yaml` | `name:` | snake_case of the name (e.g. `recipe_book`) |
| `lib/main.dart` | `title:` inside `MaterialApp.router` | The name as-is (e.g. `'RecipeBook'`) |
| `android/app/src/main/AndroidManifest.xml` | `android:label` | The name as-is |
| `ios/Runner/Info.plist` | `CFBundleName` and `CFBundleDisplayName` | The name as-is |

### Step 3 — Analyse `lib/` and refresh this CLAUDE.md

Analyse the entire `lib/` directory (`helpers/`, `layouts/`, `models/`, `screens/`, `services/`, `widgets/`) down to every sub-level and check whether the relevant sections of this CLAUDE.md (Design System, Helpers, Navigation, Screens, Widgets) are still accurate:

- New widgets in `lib/widgets/` not documented here?
- New helpers/tokens in `lib/helpers/` missing from the Design System sections?
- New screens with patterns not covered by the Screens section?
- Obsolete entries mentioned here but no longer present in code?
- Does the project deviate from the stack/conventions described above?

Update this CLAUDE.md to add/remove sections based on the actual state of `lib/`. Do not delete general rules or design tokens still valid. Report any relevant discrepancy briefly before applying changes, then proceed.

### Step 4 — Final report

Concise report in Italian: username set, project name set, renamed/updated files, CLAUDE.md sections changed, any inconsistency needing user intervention.

---

## Full Project Checkup

**Trigger**: "checkup completo", "checkup del progetto", "controllo completo", "full checkup", or clear equivalent.

Runs three sub-workflows in sequence, each completed fully before the next:

1. **Dependency Check** (below)
2. **Documentation Update** (below)
3. **Lint / Code Quality Check** (below)

### Final summary

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

---

## Dependency Check & Update

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

---

## Documentation Update (README.md)

**Trigger**: part of Full Project Checkup, or asked directly ("aggiorna la documentazione", "update docs").

### Step 1 — Read current state (in parallel)

`README.md`, `pubspec.yaml`, this `CLAUDE.md`, the `lib/` directory tree, all files in `lib/helpers/`, `lib/widgets/`, `lib/layouts/`, and `lib/router.dart`.

### Step 2 — Identify differences

Compare `README.md` against the actual codebase: outdated sections, missing sections (new widgets/helpers/screens/conventions), incorrect project name/version/stack info, broken links. Report a brief summary, then proceed without waiting for approval.

### Step 3 — Rewrite README.md (English)

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

Explain that this repo ships with a single `CLAUDE.md` at the project root containing: global rules, app context, design system reference, and the agent workflows (Project Initialisation, Full Project Checkup, Dependency Check, Documentation Update, Lint Check, Version Bump). List each workflow with its trigger phrase and a one-line description, as a table:

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
```

Rules: every chapter has a short intro paragraph; props tables use `Prop`/`Type`/`Description`; version badge reflects `pubspec.yaml`; ToC anchors must work on GitHub Markdown; never invent unverifiable info (mark TBD instead); sections 9 and 10 are always mandatory.

### Step 4 — Write the file

Overwrite `README.md`. Confirm in Italian: brief summary of changes + any TBD sections needing user input.

---

## Lint / Code Quality Check

**Trigger**: "check del progetto", "verifica la qualità del codice", "il progetto è pulito?", "fai un lint check", or part of Full Project Checkup.

### Linter context

On top of `package:flutter_lints/flutter.yaml`, this project enforces:

```yaml
rules:
  prefer_const_constructors: true
  prefer_const_literals_to_create_immutables: true
```

Every fix must comply with these plus Flutter/Dart best practices. **Never silence an issue with `// ignore` or `// ignore_for_file`** — fix in code, don't hide it.

### Auto-fix rules

- **`const` add where missing**: constructor calls and list/map/set literals that can be compile-time constants. Move `const` to the outermost eligible ancestor (don't repeat it on children already covered by a parent `const`).
- **`const` remove where unnecessary**: expressions that can't be compile-time constants (reference non-const variables or context-dependent values).
- **`print` statements**: remove any `print(...)` call anywhere. Replace any `debugPrint(...)` not inside `AppLogger` with the matching `AppLogger.debug/warn/error` call. Never wrap in manual `if (kDebugMode)`. Import `app_logger.dart` with a relative path if missing.
- **Unused imports/variables**: remove anything the analyser flags as unused.
- **Other info/hint diagnostics**: fix per Flutter best practices — never silence.

### Step 1 — Dart fix

Run `dart fix --dry-run`; if it finds fixable items, apply with `dart fix --apply`. Record how many fixes applied (or "none").

### Step 2 — Dart format

Run `dart format --output=none --set-exit-if-changed .`; if non-zero exit, run `dart format .`. Record which files were reformatted (or "none").

### Step 3 — Flutter analyze

Run `flutter analyze` and categorise every diagnostic:

- **Category A — Auto-fixable** (`warning •`, `info •`, `hint •`): fix all per the rules above, then re-run `flutter analyze` to confirm resolution.
- **Category B — Errors** (`error •`): blocking, do not auto-fix. List file path, line number, error code, description for manual review.

### Step 4 — Report (Italian)

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

---

## Version Bump

**Trigger**: "aggiornami il progetto alla versione X.Y.Z" or clear equivalent containing a version number.

**Build number guard**: if the user includes a build number (e.g. `2.0.0+5`), do **not** apply it. Reply in Italian: "Il numero di build (`+N`) è gestito automaticamente dal processo di CI/CD sincronizzato con gli store. Modificarlo manualmente potrebbe rompere la pubblicazione. Procederò ad aggiornare solo la versione `X.Y.Z`." Then continue using only `X.Y.Z`.

### About cider

This project uses [cider](https://pub.dev/packages/cider) (`dev_dependency`) for version bumps and `CHANGELOG.md` entries (Keep a Changelog format):

| Command | Effect |
|---|---|
| `dart run cider version` | Print current version |
| `dart run cider bump patch/minor/major` | Bump accordingly |
| `dart run cider log added/changed/fixed "..."` | Add entry under `[Unreleased]` |
| `dart run cider release [X.Y.Z]` | Promote `[Unreleased]` to `[X.Y.Z]` with today's date |

If `CHANGELOG.md` doesn't exist, cider creates it on first use.

### Step 1 — Read current state

Read in parallel: `pubspec.yaml` (current version, e.g. `1.0.0+1`), `README.md` (version badge), `CHANGELOG.md` (existing entries). Confirm with `dart run cider version`.

Parse `SEMVER` (part before `+`) and `BUILD` (integer after `+`, `0` if absent). New version = the one the user provided.

Ask (via `AskUserQuestion`): "Will this version be published to the App Store / Google Play?" — Yes → `NEW_BUILD = BUILD + 1`; No → `NEW_BUILD = BUILD` unchanged. Full new version string = `NEW_VERSION+NEW_BUILD`.

### Step 2 — Detect changes

Run `git log --oneline -20` and `git status --short`. Group detected changes: Added / Changed / Fixed / Dependencies / Configuration.

### Step 3 — Present for approval

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

### Step 4 — Apply all changes

1. For each approved change, run `dart run cider log added/changed/fixed "..."`.
2. Determine bump type (same major+minor → patch; same major diff minor → minor; diff major → major) and run `dart run cider bump <type>`, then `dart run cider release X.Y.Z` (promotes `[Unreleased]` in CHANGELOG, sets `pubspec.yaml` version).
3. Manually set the `+BUILD` suffix in `pubspec.yaml` (cider doesn't manage it): `version: X.Y.Z+NEW_BUILD`.
4. Update the version badge in `README.md` (add one after the project title if none exists): `![Version](https://img.shields.io/badge/version-X.Y.Z-blue)`.

### Step 5 — Confirm (Italian)

New version applied, files updated, CHANGELOG entry written.
