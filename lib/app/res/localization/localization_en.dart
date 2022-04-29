import 'localization.dart';

class LocalizationEN implements Localization {
  //App Strings
  @override
  String get txtAppName => 'Localization Demo';

  @override
  String get tournamentsPlayed => 'Tournaments played';

  @override
  String get tournamentsWon => 'Tournaments won';

  @override
  String get winningPercentage => 'Winning percentage';

  @override
  String get recommendedForYou => 'Recommended for you';

  @override
  String get eloRating => 'Elo rating';

  @override
  String get userName => 'User name';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot password';

  @override
  String get welcomeBack => "Welcome back !";

  @override
  String get loginWithUserName =>
      'Login with username and password to continue';

  @override
  String get notHaveAnAccount => "Don't have an account? ";

  @override
  String get txtSignUpWithEmail => 'Sign up with Email';

  @override
  String get changeLanguage => "Change Language";

  @override
  String get english => "English";

  @override
  String get japanese => 'Japanese';

  @override
  String get txtLogin => 'Log In';

  //Alert Dialog  Messages
  @override
  String get txtAreYouSure => 'Are you sure?';

  @override
  String get txtNo => 'No';

  @override
  String get txtYes => 'Yes';

  @override
  String get txtWantToLogout => 'Do you want to logout';

  @override
  String get txtExitApp => 'Do you want to exit the app';

  @override
  String get txtLogout => 'Log out';
}
