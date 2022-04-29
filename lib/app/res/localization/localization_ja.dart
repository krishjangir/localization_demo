import 'localization.dart';

class LocalizationJA implements Localization {
  //App Strings
  @override
  String get txtAppName => 'Localization Demo';

  @override
  String get tournamentsPlayed => 'トーナメントが行われました';

  @override
  String get tournamentsWon => 'トーナメント優勝';

  @override
  String get winningPercentage => '勝率';

  @override
  String get recommendedForYou => 'あなたにおすすめ';

  @override
  String get eloRating => 'イロレーティング';

  @override
  String get userName => 'ユーザー名';

  @override
  String get password => 'パスワード';

  @override
  String get forgotPassword => 'パスワードをお忘れですか';

  @override
  String get welcomeBack => 'お帰りなさい！';

  @override
  String get loginWithUserName => '続行するには、ユーザー名とパスワードでログインしてください';

  @override
  String get notHaveAnAccount => 'アカウントをお持ちではありませんか？';

  @override
  String get txtSignUpWithEmail => 'メールでサインアップ';

  @override
  String get changeLanguage => '言語を変えてください';

  @override
  String get english => '英語';

  @override
  String get japanese => '日本';

  //Form Strings

  @override
  String get txtLogin => 'ログインする';

  //Alert Dialog  Messages
  @override
  String get txtAreYouSure => '本気ですか？';

  @override
  String get txtNo => 'いいえ';

  @override
  String get txtYes => 'はい';

  @override
  String get txtWantToLogout => 'ログアウトしますか';

  @override
  String get txtExitApp => 'アプリを終了しますか';

  @override
  String get txtLogout => 'ログアウト';
}
