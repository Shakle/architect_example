import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/ui/widgets/stats/stats_list.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CharacterAvatar extends StatelessWidget {
  const CharacterAvatar({
    required this.characterType,
    required this.isPlayable,
    Key? key,
  }) : super(key: key);

  final CharacterType characterType;
  final bool isPlayable;

  @override
  Widget build(BuildContext context) {
    return isPlayable ? playableHeroBox() : nonPlayableHeroBox();
  }

  Widget playableHeroBox() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 320,
      ),
      child: Stack(
        children: [
          Center(child: character()),
          Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: StatsList(
                  isPlayable: isPlayable,
                  characterType: characterType,
              ),
          ),
        ],
      ),
    );
  }

  Widget nonPlayableHeroBox() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            character(),
            StatsList(
              isPlayable: isPlayable,
              characterType: characterType,
            ),
          ],
        ),
        const SizedBox(height: 10),
        enemyText(),
      ],
    );
  }

  Widget character() {
    final double size = isPlayable ? 220 : 100;

    return SizedBox(
      height: size,
      width: size,
      child: RiveAnimation.asset(
        getCharacterPath(),
        fit: BoxFit.cover,
        animations: getHeroAnimations(),
      ),
    );
  }

  Widget enemyText() {
    return RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.brown,
            fontStyle: FontStyle.italic,
          ),
          children: [
            const TextSpan(text: 'Enemy: ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
            )),
            TextSpan(text: getCharacterName(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
            )),
          ]
        ),
    );
  }

  String getCharacterName() {
    switch (characterType) {
      case CharacterType.barbarian: return 'Barbarian';
      case CharacterType.zombie: return 'Zombie';
    }
  }

  String getCharacterPath() {
    switch (characterType) {
      case CharacterType.barbarian: return 'assets/animations/viking.riv';
      case CharacterType.zombie: return 'assets/animations/zombie.riv';
    }
  }

  List<String> getHeroAnimations() {
    switch (characterType) {
      case CharacterType.barbarian: return [];
      case CharacterType.zombie: return ['Walk'];
    }
  }
}
