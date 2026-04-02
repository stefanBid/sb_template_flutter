<div align="center">
  <div style="background: white; padding: 20px; border-radius: 12px; display: inline-block;">
    <img src="https://stunning-confidence-0ce6b255c4.media.strapiapp.com/sb_template_flutter_logo_2c81964a6e.webp" alt="SB-Template Flutter Logo" width="200">
  </div>

  # SB-Template Flutter

  ### 🚀 Production-Ready Flutter Starter with Superpowers

  ![Flutter](https://img.shields.io/badge/flutter-%3E%3D3.11.0-02569B?logo=flutter)
  ![Dart](https://img.shields.io/badge/dart-%5E3.11.0-0175C2?logo=dart)
  ![flutter_bloc](https://img.shields.io/badge/bloc-9.1.1-0175C2)
  ![go_router](https://img.shields.io/badge/go__router-17.1.0-00D9FF)
  ![Google Fonts](https://img.shields.io/badge/google__fonts-8.0.2-4285F4?logo=google)
  ![Material Design](https://img.shields.io/badge/material__design-3-757575?logo=material-design)

  **Stop wasting time on boilerplate. Start building features.**

  A battle-tested, feature-rich Flutter template that includes everything you need: modern design system, reusable UI components, state management, routing, and production-ready services. Build beautiful, cross-platform apps in minutes, not weeks.

  [Quick Start](#-quick-start) • [Features](#-core-features) • [Components](#-ready-to-use-components) • [Deploy](#-deployment)

</div>

---

## 📋 Table of Contents

- [Core Features](#-core-features)
- [Ready-to-Use Components](#-ready-to-use-components)
- [Quick Start](#-quick-start)
- [Project Structure](#-project-structure)
- [Customization](#-customization)
  - [Theme & Styling](#-theme--styling)
  - [State Management](#-state-management)
  - [Routing](#-routing)
  - [Components](#-using-built-in-components)
  - [Services](#-services-reference)
- [Deployment](#-deployment)
- [AI Tooling — Prompts & Instructions](#-ai-tooling--prompts--instructions)
- [Version Management](#-version-management)

---

## ✨ Core Features

### 🎨 Design System & Theming
- **Adaptive Color System** - Light/Dark mode ready with semantic color palette
- **AppColors** - Adaptive colors that respect system theme (primary, secondary, surface, background)
- **AppDesign** - Consistent spacing scale (xs→xxl), border radius, shadows, and paddings
- **AppTypography** - Mobile-optimized type scale (heading1→heading4, body, caption, small)
- **Google Fonts 8.0.2** - 1000+ fonts ready to use
- **Dark Mode Support** - Built-in theme switching infrastructure
- **Responsive Design** - Mobile-first with tablet considerations

### 🧭 Navigation & Routing
- **go_router 17.1.0** - Declarative routing with deep linking support
- **Named Routes** - Type-safe navigation with `AppRouter`
- **Custom Transitions** - Smooth page transitions (fade, slide, scale)
- **Router Extensions** - Helper methods for easy navigation (`context.goTo()`, `context.goBack()`)
- **Route Guards** - Built-in structure for authentication flow

### 🔄 State Management
- **flutter_bloc 9.1.1** - Predictable state management
- **Equatable 2.0.8** - Value equality for cleaner state comparison
- **Provider 6.1.5** - Dependency injection ready
- **BLoC Pattern** - Separation of business logic and UI
- **Example BLoCs** - Pre-built fake loader bloc for splash screen

### 🧩 Pre-Built Components
- **AppButton** - Multi-variant button (solid, outline) with loading states
- **AppBadge** - Status badges (primary, secondary, success, warning, error)
- **AppCard** - Flexible card container for content
- **AppSimpleInput** - Simple text input with validation
- **AppFormFieldInput** - Form-ready input with labels and error states
- **AppDatePicker** - Material date picker integration
- **Showcase Screens** - Live examples of all components

### 🛠️ Developer Experience
- **Hot Reload** - Lightning-fast development with Flutter's hot reload
- **flutter_lints 6.0.0** - Flutter team's recommended lints
- **Type Safety** - Full Dart type safety with null safety
- **Auto-imports** - No manual imports needed for project files
- **Clean Architecture** - Separation of concerns (widgets, screens, services, helpers)
- **Cider** - Automated version management from CLI

### 📱 Mobile Features
- **flutter_secure_storage 10.0.0** - Encrypted key-value storage (Keychain/Keystore)
- **image_picker 1.2.1** - Camera and gallery access
- **package_info_plus 9.0.0** - App version and build info
- **intl 0.19.0** - Internationalization support ready
- **UUID 4.5.2** - Unique ID generation

### 🎯 Production-Ready Services
- **AlertService** - SnackBars and dialogs with consistent styling
- **LocalStorageService** - Secure data persistence
- **Modular Services** - Clean separation of logic and UI services

---

## 🧩 Ready-to-Use Components

**Build modern interfaces in minutes.** This template includes a complete library of production-ready, reusable, and fully customizable UI components designed to accelerate your Flutter development workflow.

### 🎨 Buttons

#### **AppButton**
Full-featured button component with variants, loading states, and icons.

**Variants:** `solid`, `outline`
**States:** loading, disabled
**Features:** Prefix/suffix icons, full width option, accessible

```dart
// Solid button with loading state
AppButton(
  text: 'Submit',
  onPressed: _handleSubmit,
  variant: AppButtonVariant.solid,
  isLoading: _isLoading,
  prefixIcon: Icons.send,
  fullWidth: true,
)

// Outline button
AppButton(
  text: 'Cancel',
  onPressed: () => context.goBack(),
  variant: AppButtonVariant.outline,
  suffixIcon: Icons.arrow_forward,
)
```

### 🏷️ Badges & Labels

#### **AppBadge**
Status indicator component with multiple variants and icon support.

**Variants:** `primary`, `secondary`, `success`, `warning`, `error`, `custom`
**Features:** Icon support, custom colors, adaptive theming

```dart
// Status badges
AppBadge(
  text: 'Active',
  variant: BadgeVariant.success,
  icon: Icons.check_circle,
)

AppBadge(
  text: 'Pending',
  variant: BadgeVariant.warning,
)

// Custom color badge
AppBadge(
  text: 'Premium',
  variant: BadgeVariant.custom,
  customColor: Colors.purple,
  icon: Icons.star,
)
```

### 📝 Form Components

#### **AppFormFieldInput**
Form-ready text input with validation, labels, and error handling.

**Types:** `text`, `email`, `password`, `number`, `phone`
**Features:** Validation states, helper text, error messages, prefix/suffix icons

```dart
AppFormFieldInput(
  label: 'Email',
  hintText: 'Enter your email',
  keyboardType: TextInputType.emailAddress,
  prefixIcon: Icons.email,
  validator: (value) {
    if (value?.isEmpty ?? true) return 'Email is required';
    return null;
  },
  onSaved: (value) => _email = value,
)
```

#### **AppSimpleInput**
Simple text input without form integration.

**Features:** Clean design, optional icons, custom styling

```dart
AppSimpleInput(
  placeholder: 'Search...',
  prefixIcon: Icons.search,
  onChanged: (value) => _performSearch(value),
)
```

#### **AppDatePicker**
Material design date picker integration.

**Features:** Material date picker, formatted output, validation

```dart
AppDatePicker(
  label: 'Birth Date',
  selectedDate: _birthDate,
  onDateSelected: (date) => setState(() => _birthDate = date),
  firstDate: DateTime(1900),
  lastDate: DateTime.now(),
)
```

### 📦 Layout Components

#### **AppCard**
Flexible card container for organizing content.

**Features:** Elevation, border radius, padding, tap interaction
**Use cases:** Lists, dashboards, content containers

```dart
AppCard(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Card Title', style: AppTypography.of(context).heading3),
      SizedBox(height: AppDesign.sm),
      Text('Card content goes here', style: AppTypography.of(context).body),
    ],
  ),
  onTap: () => _handleCardTap(),
)
```

### 🎯 Why These Components?

✅ **Consistent** - All components follow the same design system
✅ **Accessible** - Built with Material Design guidelines
✅ **Responsive** - Optimized for mobile and tablet
✅ **Type-Safe** - Full Dart type safety with null safety
✅ **Production-Ready** - Battle-tested in real apps
✅ **Theme-Aware** - Automatically adapt to light/dark mode
✅ **Customizable** - Easy to extend and modify

**See all components in action:** Run the app and navigate through the showcase screens (Typography, Inputs, Buttons, Forms, Components).

---

## 🚀 Quick Start

### Prerequisites

- **Flutter SDK** ≥ 3.11.0
- **Dart SDK** ≥ 3.11.0
- **Xcode** (for iOS development)
- **Android Studio** / **Android SDK** (for Android development)

### Installation

**Option 1: Use as GitHub Template** (Recommended)

1. Click **"Use this template"** on GitHub
2. Clone your new repository:
```bash
git clone https://github.com/your-username/your-project.git
cd your-project
```

**Option 2: Clone Directly**

```bash
git clone https://github.com/stefanoBid/sb-flutter-template.git my-project
cd my-project
rm -rf .git && git init  # Start fresh
```

### Setup

```bash
# Install dependencies
flutter pub get

# (Optional) Reset version to 0.1.0
cider version 0.1.0
# OR manually edit pubspec.yaml and set version: 0.1.0

# Check Flutter setup
flutter doctor

# Run the app on connected device
flutter run

# Or specify platform
flutter run -d ios      # iOS (requires macOS)
flutter run -d android  # Android
```

---

## 📁 Project Structure

```
sb_template_flutter/
├── lib/
│   ├── helpers/
│   │   ├── router/
│   │   │   ├── app_router.dart           # Route definitions
│   │   │   └── router_transitions.dart   # Custom page transitions
│   │   └── theme/
│   │       ├── app_colors.dart           # Adaptive color system
│   │       ├── app_design.dart           # Spacing, borders, shadows
│   │       ├── app_typography.dart       # Type scale & text styles
│   │       └── app_theme.dart            # ThemeData configuration
│   │
│   ├── layouts/
│   │   └── app/
│   │       └── app_layout.dart           # Main app layout scaffold
│   │
│   ├── models/
│   │   └── app_route.dart                # Route model
│   │
│   ├── router/
│   │   ├── router.dart                   # GoRouter configuration
│   │   ├── router_extensions.dart        # Navigation helpers
│   │   └── router_transitions.dart       # Transition builders
│   │
│   ├── screens/
│   │   ├── splash/                       # Splash screen with BLoC
│   │   │   ├── bloc/                     # Fake loader BLoC
│   │   │   ├── widgets/                  # VersionBadge widget
│   │   │   └── splash_screen.dart
│   │   ├── typography/                   # Typography showcase
│   │   ├── inputs/                       # Input & date picker examples
│   │   ├── buttons/                      # Button examples
│   │   ├── forms/                        # Form examples
│   │   └── components/                   # Component showcase
│   │
│   ├── services/
│   │   ├── logic/
│   │   │   └── local_storage_service.dart # Secure storage wrapper
│   │   └── ui/
│   │       └── alert_service.dart         # SnackBars & dialogs
│   │
│   ├── widgets/
│   │   └── app/
│   │       ├── badge/
│   │       │   └── app_badge.dart         # AppBadge component
│   │       ├── button/
│   │       │   └── app_button.dart        # AppButton component
│   │       ├── card/
│   │       │   └── app_card.dart          # AppCard component
│   │       ├── date-picker/
│   │       │   └── app_date_picker.dart   # AppDatePicker component
│   │       ├── form-field-input/
│   │       │   └── app_form_field_input.dart # Form input
│   │       └── simple-input/
│   │           └── app_simple_input.dart  # Simple input
│   │
│   └── main.dart                          # App entry point
│
├── assets/
│   └── sb-template-flutter-logo.png       # App logo
│
├── android/                                # Android native code
├── ios/                                    # iOS native code
│
├── pubspec.yaml                            # Dependencies & assets
├── analysis_options.yaml                   # Linting rules
└── README.md
```

---

## 🛠️ Available Commands

| Command | Description |
|---------|-------------|
| `flutter run` | Run app on connected device/emulator |
| `flutter run -d ios` | Run on iOS simulator |
| `flutter run -d android` | Run on Android emulator |
| `flutter build apk` | Build Android APK |
| `flutter build ipa` | Build iOS IPA (requires macOS) |
| `flutter test` | Run unit tests |
| `flutter analyze` | Analyze code for issues |
| `cider bump patch` | Bump patch version (1.0.0 → 1.0.1) |
| `cider bump minor` | Bump minor version (1.0.0 → 1.1.0) |
| `cider bump major` | Bump major version (1.0.0 → 2.0.0) |

---

## 🎨 Customization

### 🎨 Theme & Styling

#### Customize Colors

Edit [lib/helpers/theme/app_colors.dart](lib/helpers/theme/app_colors.dart) to change the color palette:

```dart
class AppColors {
  // Change primary and secondary colors
  static const Color primary = Color(0xFF60C9F8);      // Your brand color
  static const Color secondary = Color(0xFF0A599C);    // Secondary brand color
  
  // Adaptive colors automatically adjust for light/dark mode
  Color get appBarBackground => isDark 
    ? const Color(0xFF0A599C)   // Dark mode app bar
    : const Color(0xFF60C9F8);  // Light mode app bar
    
  Color get background => isDark 
    ? const Color(0xFF0D1B2A)   // Dark background
    : const Color(0xFFF5FBFF);  // Light background
  
  // Add your custom colors
  static const Color accent = Color(0xFFFF6B6B);
  static const Color highlight = Color(0xFFFFD93D);
}
```

#### Design Tokens

Edit [lib/helpers/theme/app_design.dart](lib/helpers/theme/app_design.dart) for spacing and design tokens:

```dart
class AppDesign {
  // Spacing scale
  static const double xs = 4.0;    // Minimal gaps
  static const double sm = 8.0;    // Small spacing
  static const double md = 12.0;   // Medium spacing
  static const double lg = 16.0;   // Standard component padding
  static const double xl = 24.0;   // Section spacing
  static const double xxl = 32.0;  // Major separations
  
  // Border radius
  static BorderRadius get borderRadiusS => BorderRadius.circular(4);
  static BorderRadius get borderRadiusM => BorderRadius.circular(6);
  static BorderRadius get borderRadiusL => BorderRadius.circular(10);
  static BorderRadius get borderRadiusXL => BorderRadius.circular(16);
  
  // Shadows
  static List<BoxShadow> get shadowSmall => [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];
}
```

#### Typography System

Pre-configured typography in [lib/helpers/theme/app_typography.dart](lib/helpers/theme/app_typography.dart):

| Style | Size | Weight | Usage |
|-------|------|--------|-------|
| `heading1` | 28px | Bold | Main screen titles |
| `heading2` | 22px | Bold | Section titles |
| `heading3` | 18px | SemiBold | Subsection titles |
| `heading4` | 16px | SemiBold | Card titles, list items |
| `body` | 16px | Regular | Body text, paragraphs |
| `bodySecondary` | 16px | Regular | Secondary text (muted) |
| `caption` | 14px | Medium | Labels, captions |
| `small` | 12px | Regular | Small text, metadata |
| `tiny` | 11px | Regular | Tiny labels |

**Example:**
```dart
Text(
  'Welcome to Flutter',
  style: AppTypography.of(context).heading1,
)

Text(
  'Your daily tasks',
  style: AppTypography.of(context).heading2,
)

Text(
  'This is body text with proper styling.',
  style: AppTypography.of(context).body,
)
```

#### Google Fonts Integration

Change the app font in [lib/helpers/theme/app_theme.dart](lib/helpers/theme/app_theme.dart):

```dart
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // Use Google Fonts
    textTheme: GoogleFonts.interTextTheme(),      // Inter
    // OR
    textTheme: GoogleFonts.robotoTextTheme(),     // Roboto
    // OR
    textTheme: GoogleFonts.poppinsTextTheme(),    // Poppins
    
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );
}
```

---

### 🔄 State Management

#### Create a New BLoC

**1. Create the event:**

```dart
// lib/bloc/counter/counter_event.dart
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
  
  @override
  List<Object?> get props => [];
}

class IncrementCounter extends CounterEvent {}
class DecrementCounter extends CounterEvent {}
```

**2. Create the state:**

```dart
// lib/bloc/counter/counter_state.dart
import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  const CounterState();
  
  @override
  List<Object?> get props => [];
}

class CounterInitial extends CounterState {
  final int count;
  const CounterInitial({this.count = 0});
  
  @override
  List<Object?> get props => [count];
}
```

**3. Create the BLoC:**

```dart
// lib/bloc/counter/counter_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementCounter>(_onIncrement);
    on<DecrementCounter>(_onDecrement);
  }
  
  void _onIncrement(IncrementCounter event, Emitter<CounterState> emit) {
    final current = state as CounterInitial;
    emit(CounterInitial(count: current.count + 1));
  }
  
  void _onDecrement(DecrementCounter event, Emitter<CounterState> emit) {
    final current = state as CounterInitial;
    emit(CounterInitial(count: current.count - 1));
  }
}
```

**4. Use in your screen:**

```dart
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          final count = (state as CounterInitial).count;
          
          return Scaffold(
            body: Center(
              child: Text('Count: $count'),
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
```

---

### 🧭 Routing

#### Add a New Route

**1. Define the path in [lib/models/app_route.dart](lib/models/app_route.dart):**

```dart
enum AppRoutePath {
  splash('/'),
  typography('/typography'),
  profile('/profile'),  // New route
  ;

  final String value;
  const AppRoutePath(this.value);
}
```

**2. Add route to [lib/helpers/router/app_router.dart](lib/helpers/router/app_router.dart):**

```dart
static List<AppRoute> get routes => [
  // ... existing routes
  const AppRoute(
    label: 'Profile',
    path: AppRoutePath.profile,
    screenTitle: 'User Profile',
    icon: Icons.person,
  ),
];

static String get profileRoute => AppRoutePath.profile.value;
```

**3. Register in [lib/router/router.dart](lib/router/router.dart):**

```dart
GoRoute(
  path: AppRoutePath.profile.value,
  name: AppRoutePath.profile.name,
  builder: (context, state) => const ProfileScreen(),
  pageBuilder: (context, state) => buildPageWithFadeTransition(
    context: context,
    state: state,
    child: const ProfileScreen(),
  ),
),
```

**4. Navigate to the route:**

```dart
// Using extension methods
context.goTo(AppRouter.profileRoute);

// Using go_router directly
context.go(AppRouter.profileRoute);

// With parameters
context.goNamed(
  AppRoutePath.profile.name,
  queryParameters: {'userId': '123'},
);
```

#### Custom Page Transitions

Edit [lib/helpers/router/router_transitions.dart](lib/helpers/router/router_transitions.dart):

```dart
// Fade transition (default)
CustomTransitionPage<void> buildPageWithFadeTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

// Slide transition
CustomTransitionPage<void> buildPageWithSlideTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
```

---

### 🧩 Using Built-in Components

#### Alert Service (SnackBars & Dialogs)

```dart
import 'package:sb_template_flutter/services/ui/alert_service.dart';

// Show success snackbar
AlertService.showAppSnackBar(
  context,
  'Profile updated successfully!',
  type: AlertType.success,
  icon: Icons.check_circle,
  duration: Duration(seconds: 3),
);

// Show error snackbar
AlertService.showAppSnackBar(
  context,
  'Something went wrong',
  type: AlertType.error,
  icon: Icons.error,
);

// Show confirmation dialog
await AlertService.showAppDialog(
  context: context,
  title: 'Delete Account',
  message: 'Are you sure you want to delete your account? This action cannot be undone.',
  confirmText: 'Delete',
  cancelText: 'Cancel',
  onConfirm: () {
    // Handle deletion
  },
);
```

**Alert Types:** `success`, `error`, `info`

---

### 🔧 Services Reference

#### LocalStorageService

Secure key-value storage using `flutter_secure_storage`:

```dart
import 'package:sb_template_flutter/services/logic/local_storage_service.dart';

// Save data
await LocalStorageService.write(key: 'auth_token', value: 'abc123');
await LocalStorageService.write(key: 'user_id', value: '42');

// Read data
final token = await LocalStorageService.read(key: 'auth_token');
print(token); // 'abc123'

// Delete data
await LocalStorageService.delete(key: 'auth_token');

// Clear all data
await LocalStorageService.deleteAll();

// Check if key exists
final hasToken = await LocalStorageService.containsKey(key: 'auth_token');
```

> **💡 Tip:** Data is encrypted on iOS (Keychain) and Android (EncryptedSharedPreferences).

---

### 🌍 Internationalization (Ready to Use)

This template includes `intl` package. Here's how to add multi-language support:

**1. Add generated files to `.gitignore`:**
```
lib/l10n/
```

**2. Create ARB files:**

```arb
// lib/l10n/app_en.arb
{
  "@@locale": "en",
  "appTitle": "My App",
  "welcome": "Welcome",
  "login": "Login",
  "logout": "Logout"
}
```

```arb
// lib/l10n/app_it.arb
{
  "@@locale": "it",
  "appTitle": "La Mia App",
  "welcome": "Benvenuto",
  "login": "Accedi",
  "logout": "Esci"
}
```

**3. Configure in `pubspec.yaml`:**

```yaml
flutter:
  generate: true

flutter_gen:
  integrations:
    flutter_localizations: true
```

**4. Create `l10n.yaml`:**

```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

**5. Generate localizations:**

```bash
flutter gen-l10n
```

**6. Use in your app:**

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  locale: Locale('it'), // or Locale('en')
  // ...
);

// In widgets
Text(AppLocalizations.of(context)!.welcome);
```

---

## 📦 Deployment

### iOS

#### Test distribution (TestFlight)

**1. Bump version/build** using the `bump-version` prompt (see [AI Tooling](#-ai-tooling--prompts--instructions)).

**2. Build the release IPA:**
```bash
flutter build ipa --release
```

**3. Upload via Xcode Organizer:**
- Open `build/ios/archive/Runner.xcarchive` in Xcode
- Product → Archive → Distribute App → App Store Connect
- Select **TestFlight Internal Testing** or **External Testing**

**4. Invite testers** from [App Store Connect](https://appstoreconnect.apple.com) → TestFlight tab.

---

#### Production release (App Store)

**1. Configure app identity:**

Edit `ios/Runner/Info.plist`:
- Set `CFBundleDisplayName` (app name)
- Set `CFBundleIdentifier` (com.yourcompany.yourapp)

**2. Add app icons:**
- Use [appicon.co](https://appicon.co) to generate icons
- Place in `ios/Runner/Assets.xcassets/AppIcon.appiconset/`

**3. Build release:**
```bash
flutter build ipa --release
```

**4. Upload to App Store Connect:**
- Open `build/ios/archive/Runner.xcarchive` in Xcode
- Product → Archive → Distribute App → App Store Connect
- Complete metadata, screenshots and review information
- Submit for review

---

### Android

#### Test distribution (Internal Testing / Firebase App Distribution)

**1. Bump version/build** using the `bump-version` prompt.

**2. Build the release bundle:**
```bash
flutter build appbundle --release
```

**3a. Google Play — Internal Testing:**
- Go to [Google Play Console](https://play.google.com/console)
- Create the app → Internal Testing track → Upload `.aab`
- Add tester email addresses or Google Groups

**3b. Firebase App Distribution (alternative):**
```bash
flutter build apk --release
```
- Upload the `.apk` to Firebase App Distribution and invite testers.

---

#### Production release (Google Play)

**1. Configure app:**

Edit `android/app/build.gradle`:
```gradle
android {
    defaultConfig {
        applicationId "com.yourcompany.yourapp"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode 1
        versionName "1.0.0"
    }
}
```

**2. Create keystore:**
```bash
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA \
  -keysize 2048 -validity 10000 -alias upload
```

**3. Configure signing:**

Create `android/key.properties`:
```properties
storePassword=<password>
keyPassword=<password>
keyAlias=upload
storeFile=/Users/you/upload-keystore.jks
```

Add to `android/app/build.gradle`:
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

**4. Build release:**

```bash
flutter build appbundle --release
```

**5. Upload to Google Play Console:**
- Go to [play.google.com/console](https://play.google.com/console)
- Upload `build/app/outputs/bundle/release/app-release.aab`

---

## 🔄 Version Management

This template uses **Cider** for automated version management.

### Bump Version

```bash
# Patch version (1.0.0 → 1.0.1)
cider bump patch

# Minor version (1.0.0 → 1.1.0)
cider bump minor

# Major version (1.0.0 → 2.0.0)
cider bump major

# Set specific version
cider version 2.5.0
```

### Build Number

```bash
# Increment build number
cider bump build

# Set specific build number
cider build 42
```

### Release Notes

```bash
# Add to changelog
cider log add "Added dark mode support" --type feat
cider log add "Fixed login bug" --type fix

# Tag release
cider release
```

---

## 🧪 What You Can Build

This template is perfect for:

✅ **Mobile Apps** - iOS and Android with native performance
✅ **Cross-Platform Apps** - Single codebase for iOS and Android
✅ **SaaS Applications** - User authentication, dashboards, forms
✅ **E-commerce Apps** - Product catalogs, shopping carts, checkout
✅ **Social Apps** - Feeds, profiles, messaging
✅ **Productivity Apps** - Task managers, note-taking, calendars
✅ **Portfolio Apps** - Showcase your work with beautiful UI

---

## 💡 Best Practices

### File Organization

- **Widgets:** Use `PascalCase` for widget files (e.g., `AppButton.dart`)
- **Screens:** Group screens in folders with related widgets and BLoCs
- **Services:** Separate logic services from UI services
- **Models:** Use `snake_case` for model files (e.g., `app_route.dart`)

### Code Style

- Follow Flutter's style guide
- Run `flutter analyze` before committing
- Use `const` constructors wherever possible for performance
- Prefer composition over inheritance
- Keep widgets small and focused

### State Management

- Use BLoC for complex state management
- Use Provider for simple dependency injection
- Keep business logic out of widgets
- Use Equatable for state comparison

### Performance

- Use `const` widgets to reduce rebuilds
- Lazy load images with `CachedNetworkImage`
- Implement pagination for long lists
- Use `ListView.builder()` instead of `ListView()`
- Profile performance with Flutter DevTools

---

## 🐛 Troubleshooting

### Common Issues

**Issue:** `flutter_secure_storage` doesn't work on Android emulator
**Solution:** Use a physical device or use SharedPreferences for development

**Issue:** iOS build fails with code signing error
**Solution:** Open `ios/Runner.xcworkspace` in Xcode and configure signing team

**Issue:** Hot reload doesn't work after major changes
**Solution:** Use hot restart (`R` in terminal) or full restart

**Issue:** Google Fonts not loading
**Solution:** Run `flutter pub get` and check internet connection

**Issue:** Go router doesn't navigate
**Solution:** Make sure routes are properly registered in `router.dart`

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report bugs** - Open an issue with details and reproduction steps
2. **Suggest features** - Share your ideas for improvements
3. **Submit PRs** - Fork, create a branch, and submit a pull request

**Development Setup:**
```bash
git clone https://github.com/stefanoBid/sb-flutter-template.git
cd sb-flutter-template
flutter pub get
flutter run
```

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

Feel free to use it for personal or commercial projects.

---

## 👤 Author

**Stefano Biddau**

📧 Email: biddau.stefano99@gmail.com

🐙 GitHub: [@stefanoBid](https://github.com/stefanoBid)

🌐 Website: [stefanobiddau.com](https://stefanobiddau.com)

---

## 🎨 More Templates

Looking for more starter templates? Check out the **SB Templates Project** collection!

👉 **[Browse All Templates](https://stefanobiddau.com/my-projects)**

Visit the website and navigate to the **SB TEMPLATES PROJECT** section to discover more production-ready templates for different frameworks and use cases.

---

## 🌟 Show Your Support

If this template helped you build faster, give it a ⭐️ on GitHub!

Your support motivates me to maintain and improve this project.

---

## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [Go Router Documentation](https://pub.dev/packages/go_router)
- [Google Fonts](https://fonts.google.com/)
- [Material Design Guidelines](https://m3.material.io/)

---

<div align="center">

**Happy coding! 🚀**

Built with ❤️ by developers, for developers.

</div>
