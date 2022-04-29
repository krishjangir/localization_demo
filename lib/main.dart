import 'dart:developer';

import 'index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //for screen support portrait / landscape
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runZonedGuarded(() async {
    //-------- Data helpers ------------
    SharedPreferenceHelper? sharedPrefHelper =
        await SharedPreferenceHelper.getInstance();

    runApp(StateProvider(
        sharedPrefHelper: sharedPrefHelper,
        child: App(sharedPrefHelper: sharedPrefHelper)));
  }, (error, stack) async {
    // for crash log
    if (kDebugMode) {
      log(error.toString());
    }
  }, zoneSpecification: const ZoneSpecification());
}
