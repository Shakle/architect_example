import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/logic/blocs/player_first/player_first_cubit.dart';
import 'package:architect_example/logic/blocs/player_second/player_second_bloc.dart';
import 'package:architect_example/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.heroAction,
    Key? key,
  }) : super(key: key);

  final HeroAction heroAction;

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    const double circularRadius = 32;

    return OutlinedButton(
      onPressed: () {
        if (heroAction == HeroAction.heal) {
          if (ModalRoute.of(context)?.settings.name == routeHome) {
            context.read<PlayerFirstCubit>().heal();
          } else if (ModalRoute.of(context)?.settings.name == routeEnemy) {
            context.read<PlayerSecondBloc>().add(PlayerSecondHealingReceived());
          }
        }
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        fixedSize: const Size(80, 80),
        primary: Colors.black87,
        backgroundColor: getColor().withOpacity(0.1),
        side: BorderSide(
          color: getColor(),
          width: 2.5
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(getButtonIcon()),
          const SizedBox(height: 2),
          Text(getButtonText()),
        ],
      ),
    );
  }

  IconData getButtonIcon() {
    switch (heroAction) {
      case HeroAction.attack: return Icons.gavel;
      case HeroAction.heal: return Icons.favorite_border;
    }
  }

  String getButtonText() {
    switch (heroAction) {
      case HeroAction.attack: return 'Attack';
      case HeroAction.heal: return 'Heal';
    }
  }

  Color getColor() {
    switch (heroAction) {
      case HeroAction.attack: return Colors.red.withOpacity(0.5);
      case HeroAction.heal: return Colors.green.withOpacity(0.5);
    }
  }
}
