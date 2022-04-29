class Validator {
  static String? validateUserName(String value) {
    if (value.isEmpty) {
      return "Please enter user name!";
    } else if (value.length < 3) {
      return "Please enter valid user name!";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter password!";
    } else if (value.length < 3) {
      return "Password must be more than 3 character";
    }
    return null;
  }

  static bool validateLoginForm(String? userName, String? password) {
    if (userName != null &&
        password != null &&
        userName.length >= 3 &&
        password.length >= 3) {
      return true;
    }
    return false;
  }
}
