import 'package:architect_example/constants/enums.dart';

abstract class Character {
  abstract final CharacterType characterType;
  abstract int health;
  abstract final int strength;

  Character copyWith();
}