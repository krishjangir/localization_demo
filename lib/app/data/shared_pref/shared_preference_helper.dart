import 'dart:async';
import 'package:localization_demo/app/data/shared_pref/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

//This class is used to handle sharedPreference
class SharedPreferenceHelper {
  // SharedPreferences instance
  static SharedPreferences? _sharedPreference;

  //This creates the single instance by calling
  // the `_internal` constructor specified below
  static final SharedPreferenceHelper _singleton =
      SharedPreferenceHelper._internal();

  SharedPreferenceHelper._internal();

  //This is what's used to retrieve the instance through the app
  static Future<SharedPreferenceHelper> getInstance() async {
    _sharedPreference ??= await SharedPreferences.getInstance();
    return _singleton;
  }

  // General Methods: ----------------------------------------------------------
  String? get firebaseNotificationToken {
    return _sharedPreference?.getString(Preferences.firebaseNotificationToken);
  }

  Future<bool?> saveFirebaseNotificationToken(
      String firebaseNotificationToken) async {
    return _sharedPreference?.setString(
        Preferences.firebaseNotificationToken, firebaseNotificationToken);
  }

  Future<bool?> removeFirebaseNotificationToken() async {
    return _sharedPreference?.remove(Preferences.firebaseNotificationToken);
  }

  String? get apiToken {
    return _sharedPreference?.getString(Preferences.apiToken);
  }

  Future<bool?> saveApiToken(String value) async {
    return _sharedPreference?.setString(Preferences.apiToken, value);
  }

  // Login:---------------------------------------------------------------------
  bool get isLoggedIn {
    return _sharedPreference?.getBool(Preferences.isLoggedIn) ?? false;
  }

  Future<bool?> saveIsLoggedIn(bool value) async {
    return _sharedPreference?.setBool(Preferences.isLoggedIn, value);
  }

  int? get userId {
    return _sharedPreference?.getInt(Preferences.userId);
  }

  Future<bool?> saveUserId(int value) async {
    return _sharedPreference?.setInt(Preferences.userId, value);
  }

  int? get userType {
    return _sharedPreference?.getInt(Preferences.userType);
  }

  Future<bool?> saveUserType(int value) async {
    return _sharedPreference?.setInt(Preferences.userType, value);
  }

  double? get latitude {
    return _sharedPreference?.getDouble(Preferences.userLatitude);
  }

  Future<bool?> saveLatitude(double value) async {
    return _sharedPreference?.setDouble(Preferences.userLatitude, value);
  }

  double? get longitude {
    return _sharedPreference?.getDouble(Preferences.userLongitude);
  }

  Future<bool?> saveLongitude(double value) async {
    return _sharedPreference?.setDouble(Preferences.userLongitude, value);
  }

  String? get userInfo {
    return _sharedPreference?.getString(Preferences.userInfo);
  }

  Future<bool?> saveUserInfo(String value) async {
    return _sharedPreference?.setString(Preferences.userInfo, value);
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference?.getBool(Preferences.isDarkMode) ?? false;
  }

  Future<bool>? changeBrightnessToDark(bool value) {
    return _sharedPreference?.setBool(Preferences.isDarkMode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference?.getString(Preferences.currentLanguage);
  }

  Future<bool>? changeLanguage(String language) {
    return _sharedPreference?.setString(Preferences.currentLanguage, language);
  }

  //Clear preference:---------------------------------------------------
  Future<bool?> clearPreference() async {
    return _sharedPreference?.clear();
  }
}
