import 'package:flutter/material.dart';
import 'package:flutter_skeleton_template/ui/example_screen.dart';

import 'routes.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.exampleScreen:
        final args = settings.arguments as ExampleScreen;
        return MaterialPageRoute(builder: (context) =>  ExampleScreen(example: args.example), settings: settings);

      default:
        return null;
    }
  }
}
