import 'package:equatable/equatable.dart';

abstract class CreateChatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateChatRequested extends CreateChatEvent {
  final int consultantId;
  final int clientId;

  CreateChatRequested(this.consultantId, this.clientId);

  @override
  List<Object> get props => [consultantId, clientId];
}
