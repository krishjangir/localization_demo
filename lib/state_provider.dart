import 'index.dart';

class StateProvider extends StatelessWidget {
  final Widget child;
  final SharedPreferenceHelper sharedPrefHelper;

  const StateProvider(
      {Key? key, required this.child, required this.sharedPrefHelper})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //-------- Repositories ------------
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (_) =>
                  AppRepository(sharedPreferenceHelper: sharedPrefHelper)),
          RepositoryProvider(
              create: (_) =>
                  LoginRepository(sharedPreferenceHelper: sharedPrefHelper)),
        ],
        //-------- Blocs ------------
        child: MultiBlocProvider(providers: [
          BlocProvider<AppBloc>(
              create: (_) => AppBloc(
                  appRepository: RepositoryProvider.of<AppRepository>(_))),
          BlocProvider<LoginBloc>(
              create: (_) => LoginBloc(
                  loginRepository: RepositoryProvider.of<LoginRepository>(_))),
          BlocProvider<HomeBloc>(
              create: (_) => HomeBloc(
                  appRepository: RepositoryProvider.of<AppRepository>(_))
                ..add(const GetTournaments())),
        ], child: child));
  }
}
