import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/utils/app_snackbars.dart';
import 'package:flutter_firebase_test/utils/local_storage.dart';
import 'package:flutter_firebase_test/utils/logger.dart';
import 'package:get/get.dart' as getx;

class BaseService {
  static const String baseApi =
      "https://tranquil-api-staging-205081a15c84.herokuapp.com";

  String baseUrlTest = baseApi;
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "https://tranquil-api-staging-205081a15c84.herokuapp.com",
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      },
      connectTimeout: const Duration(seconds: 60 * 2000),
      receiveTimeout: const Duration(seconds: 60 * 2000)))
    ..interceptors.add(LoggingInterceptor());

  Future<Response> request(String url,
      {dynamic body, required String method}) async {
    var token = await LocalStorage.getTokenShared();
    try {
      print("Sending request to: $url");
      if (body is Function) {
        body = await body(); // Rebuild FormData if body is a function
      }

      Response res = await _dio.request(url,
          data: body,
          options: Options(
              method: method,
              headers:
                  token != null ? {'authorization': 'Bearer $token'} : null));

      print("Request completed with status code: ${res.statusCode}");

      return res;
    } on DioException catch (e) {
      print("DioException caught in request method");
      print("Error status code: ${e.response?.statusCode}");
      print("Error message: ${e.message}");

      rethrow;
    }
  }
}

handleError(DioException error) {
  print(error.response.toString());
  if (error.message!.contains('SocketException')) {
    return AppSnackBars.noInternet(
      message:
          'We cannot detect internet connection. Seems like you are offline.',
      message2: 'Please retry.',
      icon: const Icon(Icons.signal_cellular_connected_no_internet_4_bar_sharp),
    );
  }

  if (error.type == DioExceptionType.connectionTimeout) {
    return AppSnackBars.noInternet(
      message: 'Connection timed out. Seems like you are offline.',
      message2: 'Please retry.',
      icon: const Icon(Icons.signal_cellular_connected_no_internet_4_bar_sharp),
    );
  }

  if (error.response == null || error.response?.data is String) {
    return AppSnackBars.noInternet(
      message: 'Something went wrong.',
      message2: 'Please try again later',
      icon: const Icon(Icons.signal_cellular_connected_no_internet_4_bar_sharp),
    );
  }
  return AppSnackBars.noInternet(
    message: 'Something went wrong.',
    message2: 'Please try again later',
    icon: const Icon(Icons.not_interested),
  );
}
