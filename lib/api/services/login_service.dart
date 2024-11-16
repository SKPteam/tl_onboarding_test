import 'package:dio/dio.dart';
import 'package:flutter_firebase_test/api/api_utils/api_utils.dart';
import 'package:flutter_firebase_test/api/endpoints/endpoints.dart';
import 'package:flutter_firebase_test/data/login_user.dart';

import 'package:flutter_firebase_test/data/repositories/storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class LoginUserService {
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final UserRepository userRepository = GetIt.instance.get<UserRepository>();
  final ApiUtils apiUtils = GetIt.instance.get<ApiUtils>();

  Future<LoginUser?> login(String email, String password) async {
    try {
      final Response response = await _dio
          .post(Apis.loginUser, data: {"email": email, "password": password});
      print('Raw API Response: ${response.data}'); //

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData != null && responseData is Map<String, dynamic>) {
          // Check if the response has a data field
          final userData = responseData['data'] ?? responseData;

          print('User data before parsing: $userData'); // Debug print

          try {
            final loginUser = LoginUser.fromJson(userData);

            // Verify the parsed data
            print('Parsed user data:');
            print('Email: ${loginUser.email}');
            print('Auth Token: ${loginUser.authToken}');
            print('Name: ${loginUser.fName} ${loginUser.lName}');

            if (loginUser.email == null || loginUser.authToken == null) {
              throw Exception('Critical user data missing from response');
            }
            // final cookie = apiUtils.extractCookieFromHeaders(response.headers);
            // if (cookie != null) {
            //   await _storage.write(key: "cookie", value: cookie);
            // } else {
            //   throw Exception(" Cookie not found in headers");
            // }

            await userRepository.saveLoggedInUser(loginUser);
            return loginUser;
          } catch (e) {
            print('Error parsing user data: $e');
            throw Exception('Failed to parse login response: $e');
          }
        } else {
          print('Invalid response structure: $responseData');
          throw Exception('Invalid response data structure');
        }
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response!.data;
        print(errorData);
      }
    }
    return null;
  }
}
