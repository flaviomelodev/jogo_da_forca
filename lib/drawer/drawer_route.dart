import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forca_game/drawer/blocs/drawer_bloc.dart';
import 'package:forca_game/drawer/widgets/drawer_body_app.dart';
import 'package:forca_game/drawer/widgets/drawer_body_content_app.dart';
import 'package:forca_game/drawer/widgets/drawer_controller_widget.dart';
import 'package:forca_game/drawer/widgets/drawer_header_app.dart';
import 'package:forca_game/widgets/circular_image_widget.dart';

class DrawerRoute extends StatefulWidget {
  const DrawerRoute({Key? key}) : super(key: key);

  @override
  State<DrawerRoute> createState() => _DrawerRouteState();
}

class _DrawerRouteState extends State<DrawerRoute> {
  bool _drawerIsOpen = false;
  double _topBody() {
    return MediaQuery.of(context).size.height - 105;
  }

  double _leftBodyOpen() {
    return 5;
  }

  double _leftBodyClose() {
    return MediaQuery.of(context).size.width - 105;
  }

  void _drawerCallback(bool status) {
    context.read<DrawerBloc>().add(ToogleDrawer(isOpen: !status));
  }

  @override
  Widget build(BuildContext context) {
    return DrawerControllerWidget(
      appBar: AppBar(
        //Responsável por desenhar ou não o ícone/botão de retornar à rota chamadora
        automaticallyImplyLeading: false,
        title: const Text('Jogo da Forca'),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.menu,
            size: 40.0,
          ),
        ],
      ),
      topBody: _topBody(),
      leftBodyOpen: _leftBodyOpen(),
      leftBodyClose: _leftBodyClose(),
      callbackFunction: _drawerCallback,
      body: const CircularImageWidget(
        imageProvider: AssetImage('assets/images/splashscreen.png'),
        width: 100,
        height: 100,
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            DrawerHeaderApp(),
            DrawerBodyApp(
              child: DrawerBodyContentApp(),
            ),
          ],
        ),
      ),
    );
  }
}
