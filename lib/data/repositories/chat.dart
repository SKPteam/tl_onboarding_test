import 'package:flutter_firebase_test/api/services/create_chat_service.dart';

import 'package:flutter_firebase_test/data/models/create_chat.dart';
import 'package:flutter_firebase_test/data/repositories/storage.dart';
import 'package:get_it/get_it.dart';

class ChatRepository {
  final ChatService chatService = GetIt.instance.get<ChatService>();
  final UserRepository userRepository = GetIt.instance.get<UserRepository>();

  Future<CreateChat?> createNewChat({
    required int consultantId,
    required int clientId,
  }) async {
    try {
      return await chatService.createChat(
        consultantId: consultantId,
        clientId: clientId,
      );
    } catch (e) {
      rethrow;
    }
  }
}

enum ChatStatus { initial, loading, success, error }

class ChatState {
  final ChatStatus status;
  final List<CreateChat> chats;
  final String? errorMessage;

  ChatState({
    this.status = ChatStatus.initial,
    this.chats = const [],
    this.errorMessage,
  });

  ChatState copyWith({
    ChatStatus? status,
    List<CreateChat>? chats,
    String? errorMessage,
  }) {
    return ChatState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
