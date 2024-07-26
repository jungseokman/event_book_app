import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_menu_event.dart';
part 'home_menu_state.dart';

class HomeMenuBloc extends Bloc<HomeMenuEvent, HomeMenuState> {
  HomeMenuBloc() : super(const HomeMenuInitial()) {
    on<ChangeHomeMenuEvent>((event, emit) {
      emit(state.copyWith(isMenu: !state.isMenu));
    });
  }
}
