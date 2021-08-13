part of 'player_second_bloc.dart';

abstract class PlayerSecondEvent {
  const PlayerSecondEvent();
}

class PlayerSecondRequested extends PlayerSecondEvent {}

class PlayerSecondDamageReceived extends PlayerSecondEvent {
  final Character character;
  const PlayerSecondDamageReceived({required this.character});
}

class PlayerSecondAttackMade extends PlayerSecondEvent {
  final PlayerFirstCubit playerFirstCubit;
  const PlayerSecondAttackMade({required this.playerFirstCubit});
}

class PlayerSecondHealingReceived extends PlayerSecondEvent {}

