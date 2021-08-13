import 'package:architect_example/logic/services/abstracts/damage_service.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';

class DamageServiceImpl implements DamageService {

  @override
  int getHPAfterDamage({
    required Character underAttackCharacter,
    required Character attackingCharacter
  }) {
    int attackPower = attackingCharacter.strength ~/ 2;
    int hp = underAttackCharacter.health - attackPower;

    return hp > 0 ? hp : 0;
  }
}