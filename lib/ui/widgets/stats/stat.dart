import 'package:architect_example/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:architect_example/logic/blocs/player_first/player_first_cubit.dart' as p_first;
import 'package:architect_example/logic/blocs/player_second/player_second_bloc.dart' as p_second;
import 'package:flutter_bloc/flutter_bloc.dart';

class Stat extends StatelessWidget {
  const Stat({
    required this.heroStatType,
    required this.characterType,
    required this.isPlayable,
    Key? key
  }) : super(key: key);

  final HeroStatType heroStatType;
  final bool isPlayable;
  final CharacterType characterType;

  @override
  Widget build(BuildContext context) {
    return statRow();
  }

  Widget statRow() {
    return Row(
      children: [
        getIcon(),
        const SizedBox(width: 5),
        statValue(),
      ],
    );
  }

  Widget getIcon() {
    switch (heroStatType) {
      case HeroStatType.attackPower: return Icon(
        Icons.sports_mma,
        color: Colors.brown,
        size: iconSize(),
      );
      case HeroStatType.health: return Icon(
        Icons.favorite,
        color: Colors.red,
        size: iconSize(),
      );
      case HeroStatType.defence: return Icon(
        Icons.shield,
        color: Colors.blueGrey,
        size: iconSize(),
      );
    }
  }

  Widget statValue() {
    return Builder(
      builder: (context) {
        return ConstrainedBox(
          constraints: const BoxConstraints(
              minWidth: 35
          ),
          child: Text(
            getStatValue(context),
            style: numbersStatStyle(),
          ),
        );
      },
    );
  }

  String getStatValue(BuildContext context) {
    const String undefinedValue = '-';
    final String? statValue;

    switch (heroStatType) {
      case HeroStatType.attackPower:
        if (characterType == CharacterType.barbarian) {
          statValue = context.select((p_first.PlayerFirstCubit b) {
            if (b.state is p_first.PlayerFirstInFight) {
              final String strength = '${(b.state as p_first.PlayerFirstInFight)
                  .barbarian
                  .strength
              }';
              return strength;
            }
          });
        } else {
          statValue = context.select((p_second.PlayerSecondBloc z) {
            if (z.state is p_second.PlayerSecondInFight) {
              final String strength = '${(z.state as p_second.PlayerSecondInFight)
                  .zombie
                  .strength
              }';
              return strength;
            }
          });
        }
        break;
      case HeroStatType.health:
        if (characterType == CharacterType.barbarian) {
          statValue = context.select((p_first.PlayerFirstCubit b) {
            if (b.state is p_first.PlayerFirstInFight) {
              final String health = '${(b.state as p_first.PlayerFirstInFight)
                  .barbarian
                  .health
              }';
              return health;
            }
          });
        } else {
          statValue = context.select((p_second.PlayerSecondBloc z) {
            if (z.state is p_second.PlayerSecondInFight) {
              final String health = '${(z.state as p_second.PlayerSecondInFight)
                  .zombie
                  .health
              }';
              return health;
            }
          });
        }
        break;
      case HeroStatType.defence:
        if (characterType == CharacterType.zombie) {
          statValue = context.select((p_second.PlayerSecondBloc z) {
            if (z.state is p_second.PlayerSecondInFight) {
              final String defence = '${(z.state as p_second.PlayerSecondInFight)
                  .zombie
                  .defence
              }';
              return defence;
            }
          });
        } else {
          statValue = undefinedValue;
        }
        break;
    }

    return statValue ?? undefinedValue;
  }

  TextStyle numbersStatStyle() => TextStyle(
    fontSize: isPlayable ? 16 : 14,
    fontWeight: FontWeight.w700,
  );

  double iconSize() => isPlayable ? 25 : 19;

}
