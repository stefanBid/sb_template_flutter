import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// Project - Models
import '../models/abstracts/json_serializable.dart';

class LocalStorageService {
  LocalStorageService._();

  static const _storage = FlutterSecureStorage();

  /// Save a value to local storage
  /// [ key ] The key to identify the value
  /// [ value ] The value to be stored
  /// Returns a Future that completes when the value is saved
  static Future<void> saveSimpleValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Save a complex value to local storage
  /// [ key ] The key to identify the value
  /// [ value ] The object to be stored (must implement JsonSerializable)
  /// Returns a Future that completes when the value is saved
  static Future<void> saveComplexValue(
    String key,
    JsonSerializable value,
  ) async {
    final jsonMap = value.toJson();
    final jsonString = jsonEncode(jsonMap);
    await _storage.write(key: key, value: jsonString);
  }

  /// Get a simple value from local storage
  /// [ key ] The key to identify the value
  /// Returns a Future that completes with the retrieved value, or null if not found
  static Future<String?> getSimpleValue(String key) async {
    return await _storage.read(key: key);
  }

  /// Get a complex value from local storage
  /// [ key ] The key to identify the value
  /// [ fromJson ] Function to convert JSON Map to the desired object
  /// Returns a Future that completes with the retrieved object, or null if not found
  static Future<T?> getComplexValue<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final jsonString = await _storage.read(key: key);
    if (jsonString == null) return null;

    try {
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return fromJson(jsonMap);
    } catch (e) {
      return null;
    }
  }

  /// Delete a value from local storage
  /// [ key ] The key to identify the value
  /// Returns a Future that completes when the value is deleted
  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Clear all values from local storage
  /// Returns a Future that completes when all values are deleted
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  /// Check if a key exists in local storage
  /// [ key ] The key to check
  /// Returns a Future that completes with true if the key exists, false otherwise
  static Future<bool> containsKey(String key) async {
    final value = await _storage.read(key: key);
    return value != null;
  }

  /// Get all keys from local storage
  /// Returns a Future that completes with a Map of all stored key-value pairs
  static Future<Map<String, String>> getAll() async {
    return await _storage.readAll();
  }
}
