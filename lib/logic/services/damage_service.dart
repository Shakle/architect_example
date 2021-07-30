import 'package:architect_example/logic/services/abstracts/damage_service.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/character.dart';

class DamageServiceImpl implements DamageService {

  @override
  int getHPAfterDamage({required Character character}) {
    return character.strength ~/ 2;
  }
}