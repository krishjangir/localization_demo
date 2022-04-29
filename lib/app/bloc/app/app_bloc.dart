import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/app_repository.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository? appRepository;

  AppBloc({required this.appRepository}) : super(const AppState()) {
    on<CurrentLanguageChanged>(_currentLanguageChanged);
  }

  void _currentLanguageChanged(
    CurrentLanguageChanged event,
    Emitter<AppState> emit,
  ) async {
    appRepository?.changeLanguage(event.currentLanguage);
    emit(state.copyWith(currentLanguage: event.currentLanguage));
  }
}
