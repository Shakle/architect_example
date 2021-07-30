import 'dart:async';

import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_second_event.dart';
part 'player_second_state.dart';

class PlayerSecondBloc extends Bloc<PlayerSecondEvent, PlayerSecondState> {
  PlayerSecondBloc() : super(PlayerSecondInitial());

  @override
  Stream<PlayerSecondState> mapEventToState(PlayerSecondEvent event) async* {

  }
}
