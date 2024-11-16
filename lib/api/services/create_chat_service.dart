import 'package:dio/dio.dart';
import 'package:flutter_firebase_test/api/endpoints/endpoints.dart';
import 'package:flutter_firebase_test/data/models/create_chat.dart';

class ChatService {
  final Dio _dio = Dio();
  //final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<CreateChat?> createChat({
    required int consultantId,
    required int clientId,
  }) async {
    try {
      final response = await _dio.post(
        Apis.createChat, // Adjust endpoint path as needed
        data: {
          'consultant_id': consultantId,
          'client_id': clientId,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("chat response: $response.data");
        return CreateChat.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print('Error creating chat: ${e.message}');
      rethrow;
    }
  }
}
