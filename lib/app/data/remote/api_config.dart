//This class is used to handle api configs
class ApiConfig {
  ApiConfig._(); // this basically makes it so you can't instantiate this class

  //API Base URL's
  //For Local
  static const String baseUrlDev =
      'http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/';

  //For Live
  static const String baseUrlLive =
      'http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/';

  //For Uat
  static const String baseUrlUat =
      'http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/';

  //Apis names
  static const String tournamentListApi = 'tournaments_list_v2';
}
