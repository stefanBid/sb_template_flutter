---
applyTo: "**/helpers/**"
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
