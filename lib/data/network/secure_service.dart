// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'dart:convert';
//
// class SecureStorageService {
//   final FlutterSecureStorage _storage = FlutterSecureStorage(
//     aOptions: AndroidOptions(
//       encryptedSharedPreferences: true,
//       // Encryption key is automatically managed by the system
//       // keyCipher: KeyCipher.AES_GCM_NoPadding,
//       sharedPreferencesName: 'myAppPrefs',
//     ),
//     iOptions: const IOSOptions(
//       accessibility: KeychainAccessibility.first_unlock,
//       // Synchronizable: false by default
//       synchronizable: false,
//     ),
//   );
//
//   // Write value
//   Future<void> writeSecureData(String key, String value) async {
//     try {
//       await _storage.write(key: key, value: value);
//     } catch (e) {
//       throw Exception('Error writing to secure storage: $e');
//     }
//   }
//
//   // Read value
//   Future<String?> readSecureData(String key) async {
//     try {
//       return await _storage.read(key: key);
//     } catch (e) {
//       throw Exception('Error reading from secure storage: $e');
//     }
//   }
//
//   // Delete value
//   Future<void> deleteSecureData(String key) async {
//     try {
//       await _storage.delete(key: key);
//     } catch (e) {
//       throw Exception('Error deleting from secure storage: $e');
//     }
//   }
//
//   // Delete all values
//   Future<void> deleteAllSecureData() async {
//     try {
//       await _storage.deleteAll();
//     } catch (e) {
//       throw Exception('Error deleting all secure storage: $e');
//     }
//   }
//
//   // Store complex objects (convert to JSON first)
//   Future<void> writeObject(String key, Map<String, dynamic> value) async {
//     try {
//       String jsonString = json.encode(value);
//       await writeSecureData(key, jsonString);
//     } catch (e) {
//       throw Exception('Error writing object to secure storage: $e');
//     }
//   }
//
//   // Read complex objects
//   Future<Map<String, dynamic>?> readObject(String key) async {
//     try {
//       String? jsonString = await readSecureData(key);
//       if (jsonString == null) return null;
//       return json.decode(jsonString) as Map<String, dynamic>;
//     } catch (e) {
//       throw Exception('Error reading object from secure storage: $e');
//     }
//   }
//
//   // Check if key exists
//   Future<bool> containsKey(String key) async {
//     try {
//       return await _storage.containsKey(key: key);
//     } catch (e) {
//       throw Exception('Error checking key in secure storage: $e');
//     }
//   }
// }