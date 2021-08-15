import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/ui/widgets/stats/stat.dart';
import 'package:flutter/material.dart';

class StatsList extends StatelessWidget {
  const StatsList({
    required this.characterType,
    required this.isPlayable,
    Key? key
  }) : super(key: key);

  final bool isPlayable;
  final CharacterType characterType;

  @override
  Widget build(BuildContext context) {
    return layout();
  }

  Widget layout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: verticalPadding()),
        Stat(
            characterType: characterType,
            isPlayable: isPlayable,
            heroStatType: HeroStatType.health,
        ),
        SizedBox(height: verticalPadding()),
        Stat(
            characterType: characterType,
            isPlayable: isPlayable,
            heroStatType: HeroStatType.attackPower,
        ),
        SizedBox(height: verticalPadding()),
        Stat(
            characterType: characterType,
            isPlayable: isPlayable,
            heroStatType: HeroStatType.defence,
        ),
      ],
    );
  }

  Widget characterName() {
    return Text(
      getCharacterName(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: isPlayable ? 18 : 14,
      ),
    );
  }

  String getCharacterName() {
    switch (characterType) {
      case CharacterType.barbarian: return 'Barbarian';
      case CharacterType.zombie: return 'Zombie';
    }
  }

  double verticalPadding() => isPlayable ? 10 : 5;

}
