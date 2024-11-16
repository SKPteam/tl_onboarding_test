import 'package:flutter_firebase_test/data/repositories/chat.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ChatController extends GetxController {
  final ChatRepository chatRepository = GetIt.instance.get<ChatRepository>();

  final _state = ChatState().obs;
  ChatState get state => _state.value;

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> createChat(int consultantId) async {
    try {
      isLoading.value = true;
      _state.value = state.copyWith(status: ChatStatus.loading);

      final chat = await chatRepository.createNewChat(
        consultantId: consultantId,
      );

      if (chat != null) {
        final updatedChats = [...state.chats, chat];
        _state.value = state.copyWith(
          status: ChatStatus.success,
          chats: updatedChats,
        );
        // Navigate to chat screen or update UI
        Get.toNamed('/chat-detail', arguments: chat);
      }
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

