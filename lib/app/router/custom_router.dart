import 'package:localization_demo/app/router/router.dart';

//This class is used for app routing mention all screen here to navigate and routing
class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomeScreen());
      case LoginScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
