import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';

abstract class DamageService {
  int getHPAfterDamage({
    required Character underAttackCharacter,
    required Character attackingCharacter
  });
}