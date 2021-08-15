import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/humanoid.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/monster.dart';
import 'package:equatable/equatable.dart';
import '../../constants/aliases.dart';

class Zombie with EquatableMixin implements Humanoid,  Monster {

  @override
  final CharacterType characterType = CharacterType.zombie;

  @override
  final int maxHealth;

  @override
  int health;

  @override
  final int strength;

  @override
  final int defence;

  Zombie({
    required this.maxHealth,
    required this.health,
    required this.strength,
    required this.defence
  });

  Zombie.fromJson(Json json)
      : maxHealth = json['max_health'] ?? 100,
        health = json['max_health'] ?? 100,
        strength = json['strength'] ?? 0,
        defence = json['defence'] ?? 0;

  Json toJson() {
    return {
      'max_health': maxHealth,
      'strength': strength,
      'defence': defence,
    };
  }

  @override
  Zombie copyWith({int? health, int? strength, int? defence}) {
    return Zombie(
      maxHealth: maxHealth,
      health: health ?? this.health,
      strength: strength ?? this.strength,
      defence: defence ?? this.defence,
    );
  }

  @override
  List<Object?> get props => [characterType, maxHealth, health, strength, defence];

}