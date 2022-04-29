part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class CurrentLanguageChanged extends AppEvent {
  const CurrentLanguageChanged({required this.currentLanguage});

  final String currentLanguage;

  @override
  List<Object> get props => [currentLanguage];
}
