part of 'player_second_bloc.dart';

abstract class PlayerSecondState {
  const PlayerSecondState();
}

class PlayerSecondInitial extends PlayerSecondState {}

class PlayerSecondReady extends PlayerSecondState with EquatableMixin {
  final Character character;
  const PlayerSecondReady({required this.character});

  @override
  List<Object> get props => [character];
}

class PlayerFirstInFight extends PlayerSecondState with EquatableMixin {
  final Character character;
  const PlayerFirstInFight({required this.character});

  @override
  List<Object> get props => [character];
}

class PlayerSecondIsLoading extends PlayerSecondState {}