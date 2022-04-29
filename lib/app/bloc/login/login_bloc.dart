import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/login_repository.dart';
import '../../utils/validator.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository? loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<LoginSubmitted>(_onSubmitted);
    on<LoginUserNameChanged>(_loginUserNameChanged);
    on<LoginPasswordChanged>(_loginPasswordChanged);
    on<LoginInit>(_loginInit);
  }

  void _loginInit(
    LoginInit event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoggedIn: false, isFormValid: false));
  }

  void _loginUserNameChanged(
    LoginUserNameChanged event,
    Emitter<LoginState> emit,
  ) async {
    bool isValidForm =
        Validator.validateLoginForm(event.userName, state.password);
    emit(state.copyWith(userName: event.userName, isFormValid: isValidForm));
  }

  void _loginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    bool isValidForm =
        Validator.validateLoginForm(event.password, state.userName);
    emit(state.copyWith(password: event.password, isFormValid: isValidForm));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    loginRepository?.saveIsLoggedIn(true);
    emit(state.copyWith(isLoggedIn: true));
  }
}
