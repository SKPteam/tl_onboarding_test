import 'package:equatable/equatable.dart';

abstract class CreateChatState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateChatInitial extends CreateChatState {}

class CreateChatLoading extends CreateChatState {}

class CreateChatSuccess extends CreateChatState {
  final Map<String, dynamic> response;

  CreateChatSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class CreateChatFailure extends CreateChatState {
  final String error;

  CreateChatFailure(this.error);

  @override
  List<Object> get props => [error];
}
