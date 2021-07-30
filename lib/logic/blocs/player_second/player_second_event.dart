part of 'player_second_bloc.dart';

abstract class PlayerSecondEvent {
  const PlayerSecondEvent();
}

class PlayerSecondRequested extends PlayerSecondEvent {}

class PlayerSecondLoadSuccess extends PlayerSecondEvent with EquatableMixin {
  final Character character;
  const PlayerSecondLoadSuccess({required this.character});

  @override
  List<Object> get props => [character];
}

class PlayerLoadFailed extends PlayerSecondEvent {}

class PlayerSecondDamageReceived extends PlayerSecondEvent {
  final Character character;
  const PlayerSecondDamageReceived({required this.character});
}

class PlayerSecondDamageMade extends PlayerSecondEvent {}
class PlayerSecondHealingReceived extends PlayerSecondEvent {}

