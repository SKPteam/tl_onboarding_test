import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_firebase_test/models/user.dart';

import 'api_config.dart';

class Api {
  static Future<User> loginApi(String email, String password) async {
    try {
      Response res = await dio
          .post('client/login', data: {'email': email, 'password': password});
      dio.options.headers
          .addAll({'Authorization': "Bearer ${res.data['data']['auth_token']}"});
      return User.fromMap(res.data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response != null) {
        log(e.response!.data.toString());
        throw "Something unexpected happened, try again";
      } else {
        throw "No internet connection";
      }
    }
  }

  //--------------------------------------------------------------------------------------------
  static speakWithMiraApi(int id) async {
    try {
      await dio.post('client/create-chat',
          data: {'consultant_id': 2, 'client_id': id});
    } on DioException catch (e) {
      if (e.response != null) {
        log(e.response!.data.toString());
        throw "Something unexpected happened, try again";
      } else {
        throw "No internet connection";
      }
    }
  }
}
