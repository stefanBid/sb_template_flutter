## 3.0.0 - 2026-05-25
### Added
- `AppStorage` helper (`app_storage.dart`): app-wide singleton for encrypted key-value storage via `flutter_secure_storage` ^10.3.0, with JSON object serialisation helpers
- `AppImage` helper (`app_image.dart`): static utility for resolving image source type (network / asset / file) and building the appropriate widget
- `BaseImagePicker` widget: tappable image preview with placeholder, opens a bottom sheet to pick from gallery / camera or remove the current image
- `BaseImageSelectorBottomSheet` widget: static bottom sheet utility for image source selection (gallery, camera, optional remove)

### Changed
- Replaced `phosphor_flutter` with Flutter's built-in **Material Icons** (`Icons.*`) — all widget and screen icon references updated accordingly
- `flutter_secure_storage` upgraded to ^10.3.0 (iOS Swift Package Manager support via `flutter_secure_storage_darwin`)
- Android `minSdk` set to `23` — required by `flutter_secure_storage` v10.x
- iOS dependency manager migrated to pure **Swift Package Manager** — CocoaPods integration fully removed
- `BaseBottomSheet`: fixed Android navigation bar overlap by accounting for `MediaQuery.viewPaddingOf(context).bottom`

### Removed
- `phosphor_flutter` package dependency
- CocoaPods integration (Podfile deleted, xcconfig includes removed)

## 2.0.1 - 2026-04-25
### Added
- Full project checkup workflow (full-checkup.prompt.md) that runs dependency check, documentation update and lint in sequence

### Changed
- Updated go\_router from 17.1.0 to 17.2.2

## 2.0.0 - 2026-04-02
### Added
- Completely redesigned UI with a coherent and opinionated design system
- New Base components: BaseBadge, BaseScaffoldMessenger, BaseInput, BaseValueCard, BaseIconButton, GcGridView
- New ready-to-use screen templates: Home Page, Form Page, Profile Page and Detail Page
- Native AI development support via GitHub Copilot Agent: contextual instruction files, automated workflows (init-project, bump-version, check-dependencies, update-docs) and design system integrated into the model context

### Changed
- Project structure fully reorganised: leaner layout, consistent naming conventions for files and directories, clear separation between layouts, screens, widgets, helpers and services
- Design system centralised in AppColors, AppTypography and AppDesign with tokens for colours, typography, spacing and border radius
- Type-safe routing via AppRouter on top of go\_router: no more direct context.go() calls
- Migrated to cached\_network\_image for network image handling
- Removed flutter\_secure\_storage
- General update of all dependencies
