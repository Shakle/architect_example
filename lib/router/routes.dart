import 'package:architect_example/constants/enums.dart';
import 'package:architect_example/ui/screens/fighting_screen.dart';
import 'package:flutter/material.dart';

const String routeHome = '/';
const String routeEnemy = '/enemy';

Map<String, WidgetBuilder> routes(BuildContext context) {
  return {
    routeHome: (context) =>
        const ScreenFighting(characterType: CharacterType.barbarian),
    routeEnemy: (context) =>
        const ScreenFighting(characterType: CharacterType.zombie),
  };
}