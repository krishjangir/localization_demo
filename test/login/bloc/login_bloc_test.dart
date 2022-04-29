import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:localization_demo/app/data/repository/login_repository.dart';
import 'package:localization_demo/app/data/shared_pref/shared_preference_helper.dart';
import 'package:localization_demo/app/ui/login/index.dart';

class MockLoginRepository extends Mock implements LoginRepository {
  MockLoginRepository();
}

class MockSharedPreferenceHelper extends Mock
    implements SharedPreferenceHelper {
  MockSharedPreferenceHelper();
}

void main() {
  late LoginRepository loginRepository;

  setUp(() {
    loginRepository = MockLoginRepository();
  });

  group('LoginBloc', () {
    test('initial state is LoginState', () {
      final loginBloc = LoginBloc(
        loginRepository: loginRepository,
      );
      expect(loginBloc.state, const LoginState());
    });

    group('LoginSubmitted', () {
      blocTest<LoginBloc, LoginState>(
        'emits [isLoggedIn] '
        'when login succeeds',
        setUp: () {
          when(() => loginRepository.saveIsLoggedIn(false));
        },
        build: () => LoginBloc(
          loginRepository: loginRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const LoginUserNameChanged(userName: 'userName'))
            ..add(const LoginPasswordChanged(password: 'password'))
            ..add(const LoginSubmitted());
        },
        expect: () => const <LoginState>[
          LoginState(
            userName: 'userName',
            password: null,
            isLoggedIn: null,
            isFormValid: false,
          ),
          LoginState(
            userName: 'userName',
            password: 'password',
            isLoggedIn: null,
            isFormValid: true,
          ),
          LoginState(
            userName: 'userName',
            password: 'password',
            isLoggedIn: true,
            isFormValid: true,
          ),
        ],
      );
    });
  });
}
