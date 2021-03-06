import 'package:architect_example/logic/services/abstracts/healing_service.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';

class HealingServiceImpl implements HealingService {

  @override
  int getHPAfterHealing({required Character character}) {
    int healPoints = 5;

    final int healedHealth = character.health + healPoints;

    return healedHealth <= character.maxHealth
        ? healedHealth
        : character.maxHealth;
  }
}