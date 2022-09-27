import 'package:flutter/material.dart';
import 'package:forca_game/drawer/drawer_route.dart';
import 'package:forca_game/shared_preferences/app_preferences.dart';

class WelcomeRoute extends StatefulWidget {
  const WelcomeRoute({Key? key}) : super(key: key);

  @override
  State<WelcomeRoute> createState() => _WelcomeRouteState();
}

class _WelcomeRouteState extends State<WelcomeRoute> {
  bool _checkBoxIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Bem-vindo',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Marcar como lido',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Checkbox(
                        value: _checkBoxIsChecked,
                        onChanged: (status) {
                          setState(() {
                            _checkBoxIsChecked = status ?? false;
                          });
                        }),
                  ],
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    await AppPreferences.setWelcomeRead(
                        status: _checkBoxIsChecked);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DrawerRoute(),
                      ),
                    );
                  },
                  child: Text(
                    'Começar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
