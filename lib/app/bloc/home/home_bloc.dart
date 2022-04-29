import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/tournaments.dart';
import '../../data/remote/api_response.dart';
import '../../data/repository/app_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRepository? appRepository;

  HomeBloc({required this.appRepository}) : super(const HomeState()) {
    on<CurrentIndexChanged>(_currentIndexChanged);
    on<GetTournaments>(_getTournaments);
    on<LogOut>(_logOut);
    on<HomeInit>(_homeInit);
  }

  void _homeInit(
    HomeInit event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoggedOut: false));
  }

  void _logOut(
    LogOut event,
    Emitter<HomeState> emit,
  ) async {
    var isLoggedOut = await appRepository?.logout();
    emit(state.copyWith(isLoggedOut: isLoggedOut));
  }

  void _currentIndexChanged(
    CurrentIndexChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }

  //Get Tournaments:-------------------------------
  void _getTournaments(
    GetTournaments event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(apiCallState: ApiCallState.loading));
      var apiResponse = await appRepository
          ?.getTournaments(state.tournamentRes?.data?.cursor);
      var response = Tournaments.fromJson(apiResponse?.data);
      if (state.tournamentRes?.data?.cursor == null) {
        emit(state.copyWith(
            tournamentRes: response,
            tournaments: response.data?.tournaments,
            apiCallState: ApiCallState.success));
      } else {
        if (response.data!.tournaments!.isNotEmpty) {
          var tournaments = state.tournaments;
          tournaments?.addAll(response.data!.tournaments!);
          emit(state.copyWith(
              tournamentRes: response,
              tournaments: tournaments,
              apiCallState: ApiCallState.success));
        }
      }
    } catch (_) {
      emit(state.copyWith(apiCallState: ApiCallState.error));
    }
  }
}
