part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.currentLanguage = 'en',
  });

  final String? currentLanguage;

  AppState copyWith({
    String? currentLanguage,
  }) {
    return AppState(
      currentLanguage: currentLanguage ?? this.currentLanguage,
    );
  }

  @override
  List<Object?> get props => [currentLanguage];
}
