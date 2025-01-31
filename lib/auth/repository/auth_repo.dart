import 'package:dio/dio.dart';
import 'package:flutter_firebase_test/auth/repository/base_service.dart';
import 'package:flutter_firebase_test/utils/api_const.dart';

class AuthRepo {
  BaseService service = BaseService();

  Future<Response> login(dynamic body) async {
    try {
      Response response = await service.request("$baseApi/auth/login",
          body: body, method: "Post");
      return response;
    } on DioException catch (e) {
      throw handleError(e);
    }
  }
}
