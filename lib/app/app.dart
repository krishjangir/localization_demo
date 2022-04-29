import 'index.dart';

class App extends StatelessWidget {
  final SharedPreferenceHelper? sharedPrefHelper;

  const App({Key? key, this.sharedPrefHelper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.currentLanguage != current.currentLanguage,
        builder: (cxt, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.navigatorKey,
            title: AppStrings.appName,
            onGenerateRoute: CustomRouter.generateRoute,
            initialRoute: sharedPrefHelper?.isLoggedIn ?? false
                ? HomeScreen.id
                : LoginScreen.id,
            theme: AppTheme.appTheme(context),
            locale: Locale(sharedPrefHelper?.currentLanguage ??
                Languages.english.languageCode!),
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              Locale(Languages.english.languageCode!),
              Locale(Languages.japanese.languageCode!),
            ],
          );
        });
  }
}
