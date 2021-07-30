import 'package:architect_example/router/routes.dart';
import 'package:flutter/material.dart';

import 'config/app_config.dart';
import 'constants/application.dart';

void main() {
  configureApp();

  runApp(const ArchitectApp());
}

class ArchitectApp extends StatelessWidget {
  const ArchitectApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      initialRoute: routeHome,
      routes: routes(context),
    );
  }
}
