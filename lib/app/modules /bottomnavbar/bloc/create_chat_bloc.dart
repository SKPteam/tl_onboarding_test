import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_test/app/modules%20/bottomnavbar/domain/service/create_chat_service.dart';

import '../event/create_chat_even.dart';
import '../state/create_chat_state.dart';

class CreateChatBloc extends Bloc<CreateChatEvent, CreateChatState> {
  final CreateChatService createChatService;

  CreateChatBloc(this.createChatService) : super(CreateChatInitial()) {
    on<CreateChatRequested>((event, emit) async {
      emit(CreateChatLoading());
      try {
        final response = await createChatService.createChat(
            event.consultantId, event.clientId);
        emit(CreateChatSuccess(response));
      } catch (e) {
        emit(CreateChatFailure(e.toString()));
      }
    });
  }
}
