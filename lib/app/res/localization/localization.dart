import 'package:flutter/material.dart';

abstract class Localization {
  static Localization? of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  //App Strings
  String get txtAppName;

  String get tournamentsPlayed;

  String get tournamentsWon;

  String get winningPercentage;

  String get recommendedForYou;

  String get eloRating;

  String get changeLanguage;

  String get english;

  String get japanese;

  String get userName;

  String get password;

  String get forgotPassword;

  String get welcomeBack;

  String get loginWithUserName;

  String get notHaveAnAccount;

  String get txtSignUpWithEmail;

  String get txtLogin;

  //Alert Dialog  Messages
  String get txtAreYouSure;

  String get txtNo;

  String get txtYes;

  String get txtWantToLogout;

  String get txtExitApp;

  //Settings Strings
  String get txtLogout;
}
