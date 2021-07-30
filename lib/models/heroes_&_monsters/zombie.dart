import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/humanoid.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/monster.dart';
import 'package:equatable/equatable.dart';
import '../../constants/aliases.dart';

class Zombie with EquatableMixin implements Humanoid,  Monster {
  @override
  final CharacterType characterType = CharacterType.zombie;
  @override
  int health;
  @override
  final int strength;
  @override
  final int defence;

  Zombie({
    required this.health,
    required this.strength,
    required this.defence
  });

  Zombie.fromJson(Json json)
      : health = json['health'],
        strength = json['strength'],
        defence = json['defence'];

  Json toJson() {
    return {
      'health': health,
      'strength': strength,
      'defence': defence,
    };
  }

  @override
  Zombie copyWith({int? health, int? strength, int? defence}) {
    return Zombie(
      health: health ?? this.health,
      strength: strength ?? this.strength,
      defence: defence ?? this.defence,
    );
  }

  @override
  List<Object?> get props => [characterType, health, strength, defence];

}