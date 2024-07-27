part of 'home_menu_bloc.dart';

sealed class HomeMenuEvent extends Equatable {
  const HomeMenuEvent();

  @override
  List<Object> get props => [];
}

class ChangeHomeMenuEvent extends HomeMenuEvent {
  const ChangeHomeMenuEvent();

  @override
  List<Object> get props => [];
}
