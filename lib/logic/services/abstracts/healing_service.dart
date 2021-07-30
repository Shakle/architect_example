import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';

abstract class HealingService {
  int getHPAfterHealing({required Character character});
}