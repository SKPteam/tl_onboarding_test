import 'package:dio/dio.dart';
import 'package:flutter_firebase_test/api/endpoints/endpoints.dart';
import 'package:flutter_firebase_test/data/login_user.dart';

class LoginUserService {
  final Dio _dio = Dio();

  Future<LoginUser?> login(String email, String password) async {
    try {
      final Response response = await _dio
          .post(Apis.loginUser, data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData != null) {
          final loginUser = LoginUser.fromJson(response.data);
          return loginUser;
        } else {
          throw Exception("Invalis response data structure");
        }
      } else {
        print("Login failed. Status code: ${response.statusCode}");
        print("Response data: ${response.data}");
        throw Exception('Login failed: ${response.data}');
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
