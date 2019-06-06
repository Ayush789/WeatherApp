import 'package:flutter/material.dart';
import 'package:weather_app/ui/views/home_view.dart';

class Router {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeView());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text(
                      "404 Not Found. No Route defined for ${settings.name}"),
                ),
              ),
        );
    }
  }
}
