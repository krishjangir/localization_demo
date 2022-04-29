part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.userName,
    this.isLoggedIn,
    this.password,
    this.isFormValid = false,
  });

  final String? userName;
  final String? password;
  final bool? isLoggedIn;
  final bool? isFormValid;

  LoginState copyWith({
    String? userName,
    String? password,
    bool? isLoggedIn,
    bool? isFormValid,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isFormValid: isFormValid ?? this.isFormValid,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [userName, password, isLoggedIn, isFormValid];
}
