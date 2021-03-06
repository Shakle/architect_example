part of 'player_second_bloc.dart';

abstract class PlayerSecondState {
  const PlayerSecondState();
}

class PlayerSecondInitial extends PlayerSecondState {}

class PlayerSecondInFight extends PlayerSecondState with EquatableMixin {
  final Zombie zombie;
  const PlayerSecondInFight({required this.zombie});

  @override
  List<Object> get props => [zombie];
}

class PlayerFirstInFight extends PlayerSecondState with EquatableMixin {
  final Zombie zombie;
  const PlayerFirstInFight({required this.zombie});

  @override
  List<Object> get props => [zombie];
}

class PlayerSecondIsLoading extends PlayerSecondState {}