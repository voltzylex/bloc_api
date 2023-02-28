import 'package:dbstech_blocapi/bloc/app_event.dart';
import 'package:dbstech_blocapi/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users: users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
