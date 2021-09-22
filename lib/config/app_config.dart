import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void configureApp() {
  _platformConfiguration();
}

void _platformConfiguration() {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
  }
}
