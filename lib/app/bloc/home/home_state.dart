part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.apiCallState, //Network calling status
    this.tournamentRes,
    this.currentPageNumber = 1,
    this.tournaments,
    this.isLoggedOut,
    this.currentIndex = 0,
  });

  final ApiCallState? apiCallState; //Network calling status
  final Tournaments? tournamentRes;
  final int? currentPageNumber;
  final List<Tournament>? tournaments;
  final bool? isLoggedOut;
  final int? currentIndex;

  HomeState copyWith(
      {ApiCallState? apiCallState, //Network calling status
      Tournaments? tournamentRes,
      int? currentPageNumber,
      List<Tournament>? tournaments,
      int? currentIndex,
      bool? isLoggedOut}) {
    return HomeState(
      //Network calling status
      apiCallState: apiCallState ?? this.apiCallState,
      tournamentRes: tournamentRes ?? this.tournamentRes,
      currentPageNumber: currentPageNumber ?? this.currentPageNumber,
      currentIndex: currentIndex ?? this.currentIndex,
      tournaments: tournaments ?? this.tournaments,
      isLoggedOut: isLoggedOut ?? this.isLoggedOut,
    );
  }

  @override
  List<Object?> get props => [
        apiCallState,
        tournamentRes,
        currentPageNumber,
        isLoggedOut,
        currentIndex
      ];
}
