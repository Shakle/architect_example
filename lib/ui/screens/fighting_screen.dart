import 'package:architect_example/config/theme/gradients.dart';
import 'package:architect_example/constants/application.dart';
import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/ui/widgets/action_button.dart';
import 'package:architect_example/ui/widgets/app_bar.dart';
import 'package:architect_example/ui/widgets/character.dart';
import 'package:architect_example/ui/widgets/fab.dart';
import 'package:flutter/material.dart';

class ScreenFighting extends StatelessWidget {
  final CharacterType characterType;

  const ScreenFighting({
    required this.characterType,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: warmGradient
      ),
      child: Scaffold(
        appBar: const CustomAppBar(),
        backgroundColor: Colors.transparent,
        body: layout(),
        floatingActionButton: const Fab(),
        floatingActionButtonLocation: Navigator.canPop(context)
            ? FloatingActionButtonLocation.startFloat
            : FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget layout() {
    return Padding(
      padding: standardScreenPadding,
      child: Column(
        children: [
          Column(
            children: [
              character(isPlayable: true),
              const SizedBox(height: 10),
              character(isPlayable: false),
            ],
          ),
          Expanded(
            child: Center(
                child: actionsRow()
            ),
          ),
        ],
      ),
    );
  }

  Widget character({required bool isPlayable}) {
    CharacterType getCharacterType() {
      if (isPlayable) {
        return characterType;
      } else {
        return CharacterType.values.firstWhere((c)
          => c.index != characterType.index);
      }
    }

    return CharacterAvatar(
      isPlayable: isPlayable,
      characterType: getCharacterType(),
    );
  }

  Widget actionsRow() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          maxWidth: 400
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: const [
          ActionButton(heroAction: HeroAction.heal),
          ActionButton(heroAction: HeroAction.attack),
        ],
      ),
    );
  }

}
