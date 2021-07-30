import 'package:architect_example/config/theme/colors.dart';
import 'package:architect_example/router/routes.dart';
import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  const Fab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => navigate(context),
      heroTag: 'navigation_fab',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: const BorderSide(
            color: Colors.brown,
            width: 0.2
        ),
      ),
      backgroundColor: lightOrange,
      hoverColor: Colors.brown,
      splashColor: Colors.brown,
      focusColor: Colors.brown,
      child: getIcon(context),
    );
  }

  Widget getIcon(BuildContext context) {
    IconData iconData = !Navigator.canPop(context)
        ? Icons.arrow_forward
        : Icons.arrow_back;

    return Icon(iconData,
        color: Colors.brown.shade700
    );
  }

  void navigate(BuildContext context) {
    if (!Navigator.canPop(context)) {
      Navigator.pushNamed(context, routeEnemy);
    } else {
      Navigator.pop(context);
    }
  }

}
