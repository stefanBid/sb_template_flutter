---
applyTo: "**/widgets/**"
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
  fit: BoxFit.cover,        // cover | contain
  filter: ImageFilter.none, // none | darken
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

## BaseButton

```dart
BaseButton(
  label: 'Submit',
  icon: Icons.arrow_forward, // optional
  type: BaseButtonType.filled,           // filled | outlined
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
  type: BaseButtonType.filled, // filled | outlined
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
  itemCount: items.length,
  itemBuilder: (context, index) => ...,
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

## Design system

All colours, spacing and typography must come from helpers — never hardcode values. Full reference in `design-system.instructions.md`.
