import 'package:flutter/material.dart';
import 'package:weather_app/ui/router.dart';
import 'package:weather_app/ui/shared/theme.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      initialRoute: '/',
      onGenerateRoute: Router.generateRoutes,
    );
  }
}
