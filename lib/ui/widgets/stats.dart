import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/logic/blocs/player_first/player_first_cubit.dart' as p_first;
import 'package:architect_example/logic/blocs/player_second/player_second_bloc.dart' as p_second;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Stats extends StatelessWidget {
  const Stats({
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
      children: [
        const SizedBox(height: 10),
        hp(),
        const SizedBox(height: 10),
        attackPower(),
      ],
    );
  }

  Widget hp() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.favorite,
          color: Colors.red,
          size: iconSize(),
        ),
        const SizedBox(width: 5),
        Builder(
          builder: (context) {
            final state = characterType == CharacterType.barbarian
                ? context.watch<p_first.PlayerFirstCubit>().state
                : context.watch<p_second.PlayerSecondBloc>().state;

            return Text(getHealth(state), style: numbersStatStyle());
          },
        ),
      ],
    );
  }

  Widget attackPower() {
    return Row(
      children: [
        Icon(
          Icons.sports_mma,
          color: Colors.brown,
          size: iconSize(),
        ),
        const SizedBox(width: 5),
        Text('25', style: numbersStatStyle()),
      ],
    );
  }

  double iconSize() => isPlayable ? 25 : 20;

  TextStyle numbersStatStyle() => TextStyle(
    fontSize: isPlayable ? 16 : 14,
    fontWeight: FontWeight.w700,
  );

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

  String getHealth(dynamic state) {
    if (state is p_first.PlayerFirstInFight) {
      return state.barbarian.health.toString();
    } else if (state is p_second.PlayerSecondReady) {
      return state.zombie.health.toString();
    }

    switch (state.runtimeType) {
      case p_first.PlayerFirstInFight: return state.barbarian.health.toString();
      case p_second.PlayerSecondReady: return (state as p_second.PlayerSecondReady).zombie.health.toString();
      default: return '-';
    }
  }

}
