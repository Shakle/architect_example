import 'package:architect_example/logic/services/abstracts/damage_service.dart';
import 'package:architect_example/logic/services/abstracts/defence_service.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/monster.dart';

class DamageServiceImpl implements DamageService {

  @override
  final DefenceService defenceService;

  DamageServiceImpl({required this.defenceService});

  @override
  int getHPAfterDamage({
    required Character attackingCharacter,
    required Character characterUnderAttack,
  }) {
    int attackPower = attackingCharacter.strength ~/ 2;

    if (characterUnderAttack is Monster) {
      attackPower = defenceService.getAttackPowerAfterDefence(
        attackValue: attackPower,
        defenceValue: characterUnderAttack.defence,
      );
    }

    int hp = characterUnderAttack.health - attackPower;

    return hp > 0 ? hp : 0;
  }

}