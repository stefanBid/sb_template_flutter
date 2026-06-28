# CLAUDE.md — sb_template_flutter

## App context

This is a Flutter template app designed to provide a solid and opinionated starting structure for building new mobile applications. It comes with a pre-configured design system, routing setup, reusable widgets, helpers and project organisation so that developers can focus on building features rather than scaffolding. The template is meant to be cloned and initialised for a specific project, progressively replacing placeholder screens and components with real ones while keeping the underlying conventions and tooling intact.

Use this context to give suggestions — UI, UX, architectural or otherwise — that are consistent with a general-purpose, well-structured Flutter starter template.

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
