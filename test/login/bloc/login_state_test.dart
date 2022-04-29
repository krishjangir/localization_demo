// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:localization_demo/app/ui/login/index.dart';

void main() {
  const email = 'email';
  const password = 'password';
  group('LoginState', () {
    test('supports value comparisons', () {
      expect(LoginState(), LoginState());
    });

    test('returns same object when no properties are passed', () {
      expect(LoginState().copyWith(), LoginState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        LoginState().copyWith(isLoggedIn: true),
        LoginState(isLoggedIn: true),
      );
    });

    test('returns object with updated username when username is passed', () {
      expect(
        LoginState().copyWith(userName: email),
        LoginState(userName: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        LoginState().copyWith(password: password),
        LoginState(password: password),
      );
    });
  });
}
