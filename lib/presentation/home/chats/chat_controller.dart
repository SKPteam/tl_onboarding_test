import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/data/models/create_chat.dart';
import 'package:flutter_firebase_test/data/repositories/chat.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ChatController extends GetxController {
  final ChatRepository chatRepository = GetIt.instance.get<ChatRepository>();

  // @override
  // void onInit() {
  //   // TODO: implement onInit

  //   super.onInit();
  // }

  final _state = ChatState().obs;
  ChatState get state => _state.value;

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<CreateChat> createChat(
      {required int consultantId, required int clientId}) async {
    try {
      isLoading.value = true;
      _state.value = state.copyWith(status: ChatStatus.loading);

      final chat = await chatRepository.createNewChat(
          consultantId: consultantId, clientId: clientId);

      if (chat != null) {
        final updatedChats = [...state.chats, chat];
        _state.value = state.copyWith(
          status: ChatStatus.success,
          chats: updatedChats,
        );
        // Navigate to chat screen or update UI
        Get.toNamed('/chat-detail', arguments: chat);
        return chat;
      }
      throw Exception("Failed to create chat");
    } catch (e) {
      _state.value = state.copyWith(
        status: ChatStatus.error,
        errorMessage: e.toString(),
      );
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
  // Additional methods for chat management
  // void clearError() {
  //   _state.value = state.copyWith(
  //     status: ChatStatus.initial,
  //     errorMessage: null,
  //   );
  //   errorMessage.value = '';
  // }

