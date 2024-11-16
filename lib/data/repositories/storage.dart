import 'dart:convert';

import 'package:flutter_firebase_test/data/login_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageKeys {
  static const String clientId = 'client_id';
  static const String token = 'auth_token';
}

class UserRepository {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const _userKey = 'secure_login_user';
  static const String clientId = 'client_id';
  static const String token = 'auth_token';

  Future<void> saveClientId(int clientId) async {
    try {
      await _storage.write(
          key: StorageKeys.clientId, value: clientId.toString());
    } catch (e) {
      print('Error saving client ID: $e');
    }
  }

  Future<int?> getClientId() async {
    try {
      String? clientIdString = await _storage.read(key: StorageKeys.clientId);
      return clientIdString != null ? int.tryParse(clientIdString) : null;
    } catch (e) {
      print('Error retrieving client ID: $e');
      return null;
    }
  }

  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: StorageKeys.token, value: token);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  /// Retrieve token
  Future<String?> getToken() async {
    try {
      return await _storage.read(key: StorageKeys.token);
    } catch (e) {
      print('Error retrieving token: $e');
      return null;
    }
  }

  Future<void> saveLoggedInUser(LoginUser user) async {
    try {
      // Convert the LoginUser object to a JSON string
      final userJson = json.encode(user.toJson());
      print('Encoded JSON: $userJson');

      // Save the JSON string to FlutterSecureStorage
      await _storage.write(key: _userKey, value: userJson);

      print("User saved successfully. Email: ${user.email}");

      final savedJson = await _storage.read(key: _userKey);
      print('Verification - Read back value: $savedJson');
    } catch (e) {
      print("Error saving user: $e");
      throw Exception("Failed to save user data");
    }
  }

  Future<LoginUser?> getUserData() async {
    try {
      // Read the JSON string from secure storage
      String? userJson = await _storage.read(key: _userKey);

      if (userJson == null) return null;
      return LoginUser.fromJson(jsonDecode(userJson));
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
  // try {
  //   final currentUserId = await _storage.read(key: "current_user_id");
  //   if (currentUserId != null) {
  //     final userJson = await _storage.read(key: "user_$currentUserId");
  //     if (userJson != null) {
  //       final userMap = json.decode(userJson);
  //       return LoginUser.fromJson(userMap);
  //     }
  //   }
  //   return null;
  // } catch (e) {
  //   print("Error getting logged in user: $e");
  //   return null;
  // }
}
