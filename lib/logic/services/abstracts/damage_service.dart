import 'package:architect_example/logic/services/abstracts/defence_service.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';

abstract class DamageService {
  final DefenceService defenceService;

  DamageService(this.defenceService);

  int getHPAfterDamage({
    required Character attackingCharacter,
    required Character characterUnderAttack,
  });
}