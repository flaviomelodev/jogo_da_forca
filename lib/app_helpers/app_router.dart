import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_game/app_constants/router_constants.dart';
import 'package:forca_game/routes/palavras/crud/palavra_crud_route.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kPalavraCrudRoute:
        return MaterialPageRoute(builder: (_) => const PalavraCrudRoute());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
