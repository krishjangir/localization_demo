import '../remote/api_base_helper.dart';
import '../remote/api_config.dart';
import '../remote/api_response.dart';
import '../shared_pref/shared_preference_helper.dart';

class AppRepository {
  static AppRepository? _instance;
  final SharedPreferenceHelper? sharedPrefHelper;

  AppRepository._internal({this.sharedPrefHelper});

  factory AppRepository(
          {required SharedPreferenceHelper? sharedPreferenceHelper}) =>
      _instance ??=
          AppRepository._internal(sharedPrefHelper: sharedPreferenceHelper);

  //method for currentLanguage
  String? currentLanguage() {
    return sharedPrefHelper?.currentLanguage;
  }

  //method for changeLanguage
  void changeLanguage(String language) {
    sharedPrefHelper?.changeLanguage(language);
  }

  //method for clear clearPreference
  Future<bool?> logout() async {
    return sharedPrefHelper?.clearPreference();
  }

  //Get Tournaments api call:----------------------------------
  Future<ApiResponse?> getTournaments(String? cursor) async {
    final response = await ApiBaseHelper.getInstance().getApiCallWithQuery(
        ApiConfig.tournamentListApi,
        {"limit": "10", "status": "all", "cursor": cursor ?? ''});
    return response;
  }
}
