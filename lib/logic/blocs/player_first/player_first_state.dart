part of 'player_first_cubit.dart';

abstract class PlayerFirstState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlayerFirstInitial extends PlayerFirstState {}

class PlayerFirstInFight extends PlayerFirstState {
  PlayerFirstInFight({required this.barbarian});

  final Barbarian barbarian;

  @override
  List<Object> get props => [barbarian];

  @override
  bool? get stringify => true;
}

class PlayerFirstIsLoading extends PlayerFirstState {}
