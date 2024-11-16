import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/service/authentication_service.dart';
import '../event/login_event.dart';
import '../state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authRepository;

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final userData =
            await authRepository.login(event.email, event.password);

        emit(LoginSuccess(userData));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
