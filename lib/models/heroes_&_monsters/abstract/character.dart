import 'package:architect_example/constants/enums.dart';

abstract class Character {
  abstract final CharacterType characterType;
  abstract final int strength;
  abstract final int maxHealth;
  abstract int health;

  Character copyWith();
}