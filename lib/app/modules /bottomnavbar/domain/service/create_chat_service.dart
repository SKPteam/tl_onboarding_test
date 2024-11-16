import 'package:dio/dio.dart';
import 'package:flutter_firebase_test/app/shared/constants/constant.dart';

class CreateChatService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://tranquil-api-staging-205081a15c84.herokuapp.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $globalToken",
    },
  ));

  Future<Map<String, dynamic>> createChat(
      int consultantId, int clientId) async {
    if (globalToken == null || globalToken!.isEmpty) {
      throw Exception('Authentication token is missing.');
    }
    try {
      final response = await _dio.post(
        '/api/client/create-chat',
        data: {
          'consultant_id': consultantId,
          'client_id': clientId,
        },
      );
      print("this is create chat servrivr ${response.data}");
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
