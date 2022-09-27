import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forca_game/drawer/drawer_route.dart';
import 'package:forca_game/routes/welcome_route.dart';
import 'package:forca_game/shared_preferences/app_preferences.dart';

import '../widgets/circular_image_widget.dart';

class SplashScreenRoute extends StatefulWidget {
  const SplashScreenRoute({Key? key}) : super(key: key);

  @override
  State<SplashScreenRoute> createState() => _SplashScreenRouteState();
}

class _SplashScreenRouteState extends State<SplashScreenRoute> {
  _whereToNavigate({required bool welcomeRead}) {
    if (welcomeRead) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DrawerRoute(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeRoute(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppPreferences.getWelcomeRead().then((status) {
          _whereToNavigate(welcomeRead: status);
        });
      });
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularImageWidget(
          imageProvider: AssetImage(
            'assets/images/splashscreen.png',
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 25.0,
            bottom: 25.0,
          ),
          child: Text(
            'Aguarde...',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
              left: 100.0,
              right: 100.0,
            ),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color?>(Colors.black54),
            )),
      ],
    );
  }
}
