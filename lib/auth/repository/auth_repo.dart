import 'package:dio/dio.dart';
import 'package:flutter_firebase_test/auth/repository/base_service.dart';
import 'package:flutter_firebase_test/utils/api_const.dart';

class AuthRepo {
  BaseService service = BaseService();

  Future<Response> login(dynamic body) async {
    try {
      print('RESPONSE ONE');
      Response response = await service.request("$baseApi/api/client/login",
          body: body, method: "Post");
      print('RESPONSE ONE::: $response');

      return response;
    } on DioException catch (e) {
      throw handleError(e);
    }
  }

   Future<Response> createChat(dynamic body) async {
    try {
      print('RESPONSE ONE');
      Response response = await service.request("$baseApi api/client/create-chat",
          body: body, method: "Post");
      print('RESPONSE ONE::: $response');

      return response;
    } on DioException catch (e) {
      throw handleError(e);
    }
  }
}
