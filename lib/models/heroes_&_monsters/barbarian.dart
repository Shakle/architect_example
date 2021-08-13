import 'package:architect_example/constants/aliases.dart';
import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/models/heroes_&_monsters/abstract/humanoid.dart';
import 'package:equatable/equatable.dart';

class Barbarian with EquatableMixin implements Humanoid {
  @override
  final CharacterType characterType = CharacterType.barbarian;
  @override
  int health;
  @override
  final int strength;

  Barbarian({
    required this.health,
    required this.strength,
  });

  Barbarian.fromJson(Json json)
      : health = json['health'] ?? 0,
        strength = json['strength'] ?? 0;

  Json toJson() {
    return {
      'health': health,
      'strength': strength,
    };
  }

  @override
  Barbarian copyWith({int? health, int? strength}) {
    return Barbarian(
      health: health ?? this.health,
      strength: strength ?? this.strength,
    );
  }

  @override
  List<Object?> get props => [characterType, health, strength];

}