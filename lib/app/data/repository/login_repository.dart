import '../shared_pref/shared_preference_helper.dart';

class LoginRepository {
  final SharedPreferenceHelper? sharedPrefHelper;
  static LoginRepository? _instance;

  LoginRepository._internal({this.sharedPrefHelper});

  factory LoginRepository(
          {required SharedPreferenceHelper? sharedPreferenceHelper}) =>
      _instance ??=
          LoginRepository._internal(sharedPrefHelper: sharedPreferenceHelper);

  //method for check user is loggedIn or not
  bool? isLoggedIn() {
    return sharedPrefHelper?.isLoggedIn;
  }

  //method for save user is loggedIn or not
  void saveIsLoggedIn(bool value) {
    sharedPrefHelper?.saveIsLoggedIn(value);
  }

  //method for save UserInfo
  void saveIsUserInfo(String value) {
    sharedPrefHelper?.saveUserInfo(value);
  }
}
