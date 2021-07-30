import 'package:architect_example/data/repositories/abstracts/character_repository.dart';
import 'package:architect_example/logic/blocs/player_second/player_second_bloc.dart';
import 'package:architect_example/logic/services/abstracts/damage_service.dart';
import 'package:architect_example/logic/services/abstracts/healing_service.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';
import 'package:architect_example/models/heroes_&_monsters/barbarian.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_first_state.dart';

class PlayerFirstCubit extends Cubit<PlayerFirstState> {
  final CharacterRepository characterRepository;
  final HealingService healingService;
  final DamageService damageService;
  final PlayerSecondBloc playerSecondBloc;

  PlayerFirstCubit({
    required this.characterRepository,
    required this.healingService,
    required this.damageService,
    required this.playerSecondBloc,
  }) : super(PlayerFirstInitial()) {
    _fetchFirstCharacter();
  }

  void attack() {
    if (state is PlayerFirstInFight) {
      final Barbarian barbarian = (state as PlayerFirstInFight).barbarian;

      playerSecondBloc.add(PlayerSecondDamageReceived(character: barbarian));
    }
  }

  void heal() {
    if (state is PlayerFirstInFight) {
      final Barbarian barbarian = (state as PlayerFirstInFight).barbarian;
      final int hpAfterHealing = healingService.getHPAfterHealing(character: barbarian);

      emit(PlayerFirstInFight(barbarian: barbarian.copyWith(health: hpAfterHealing)));
    }
  }

  void receiveDamage({required Character character}) {
    if (state is PlayerFirstInFight) {
      final Barbarian barbarian = (state as PlayerFirstInFight).barbarian;
      final int hpAfterDamage = damageService.getHPAfterDamage(character: character);

      emit(PlayerFirstInFight(barbarian: barbarian.copyWith(health: hpAfterDamage)));
    }
  }

  Future<void> _fetchFirstCharacter() async {
    if (state is PlayerFirstInitial) {
      try {
        Barbarian barbarian = await characterRepository.getBarbarian();
        emit(PlayerFirstInFight(barbarian: barbarian));
      } catch (e) {
        emit(PlayerFirstInitial());
      }
    }
  }



}
