import 'dart:async';

import 'package:architect_example/data/repositories/abstracts/character_repository.dart';
import 'package:architect_example/logic/services/abstracts/damage_service.dart';
import 'package:architect_example/logic/services/abstracts/healing_service.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';
import 'package:architect_example/models/heroes_&_monsters/zombie.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_second_event.dart';
part 'player_second_state.dart';

class PlayerSecondBloc extends Bloc<PlayerSecondEvent, PlayerSecondState> {
  final CharacterRepository characterRepository;
  final HealingService healingService;
  final DamageService damageService;

  PlayerSecondBloc({
    required this.characterRepository,
    required this.healingService,
    required this.damageService,
  }) : super(PlayerSecondInitial()) {
    _fetchFirstCharacter();
  }

  @override
  Stream<PlayerSecondState> mapEventToState(PlayerSecondEvent event) async* {
    if (event is PlayerSecondRequested) {
      yield* _requestPlayer(event);
    } else if (event is PlayerSecondHealingReceived) {
      yield* _heal();
    }
  }

  Stream<PlayerSecondReady> _heal() async* {
    if (state is PlayerSecondReady) {
      final Zombie zombie = (state as PlayerSecondReady).zombie;
      final int hpAfterHealing = healingService.getHPAfterHealing(character: zombie);

      yield PlayerSecondReady(zombie: zombie.copyWith(health: hpAfterHealing));
    }
  }

  Stream<PlayerSecondState> _requestPlayer(PlayerSecondEvent event) async* {
    yield PlayerSecondIsLoading();

    try {
      Zombie zombie = await characterRepository.getZombie();
      yield PlayerSecondReady(zombie: zombie);
    } catch (e) {
      add(PlayerSecondRequested());
    }
  }

  Future<void> _fetchFirstCharacter() async {
    if (state is PlayerSecondInitial) {
      add(PlayerSecondRequested());
    }
  }
}
