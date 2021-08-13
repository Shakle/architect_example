import 'package:architect_example/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_config.dart';
import 'constants/application.dart';
import 'logic/blocs/global/global.dart';

void main() {
  configureApp();

  runApp(const ArchitectApp());
}

class ArchitectApp extends StatelessWidget {
  const ArchitectApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: globalBlocs,
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        initialRoute: routeHome,
        routes: routes(context),
      ),
    );
  }
}
