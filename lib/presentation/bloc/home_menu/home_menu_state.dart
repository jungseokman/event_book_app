part of 'home_menu_bloc.dart';

class HomeMenuState extends Equatable {
  const HomeMenuState({
    required this.isMenu,
  });
  final bool isMenu;

  HomeMenuState copyWith({
    bool? isMenu,
  }) {
    return HomeMenuState(
      isMenu: isMenu ?? this.isMenu,
    );
  }

  @override
  String toString() => 'HomeMenuState(isMenu: $isMenu)';

  @override
  List<Object> get props => [isMenu];
}

class HomeMenuInitial extends HomeMenuState {
  const HomeMenuInitial() : super(isMenu: false);
}
