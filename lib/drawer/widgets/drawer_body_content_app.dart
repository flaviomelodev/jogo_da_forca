import 'package:flutter/material.dart';
import 'package:forca_game/app_constants/router_constants.dart';
import 'package:forca_game/widgets/list_tile_app_widget.dart';

class DrawerBodyContentApp extends StatelessWidget {
  const DrawerBodyContentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTileTheme(
          contentPadding: const EdgeInsets.only(left: 6.0),
          child: ExpansionTile(
            leading: const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/drawer/base_de_palavras.png'),
            ),
            title: const Text(
              'Base de Palavras',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            onExpansionChanged: null,
            children: [
              ListTileAppWidget(
                  titleText: 'Novas Palavras',
                  subTitleText: 'Vamos inserir palavras?',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(kPalavraCrudRoute);
                  }),
              ListTileAppWidget(
                  titleText: 'Palavras existentes',
                  subTitleText: 'Vamos ver as que já temos?',
                  onTap: () {}),
            ],
          ),
        ),
        _createListTile(
            contentPadding: const EdgeInsets.only(left: 6.0),
            titleText: 'Jogar',
            subTitleText: 'Começar a Diversão',
            avatarImage: const AssetImage('assets/images/drawer/jogar.png')),
        _createListTile(
            contentPadding: const EdgeInsets.only(left: 6.0),
            titleText: 'Score',
            subTitleText: 'Relaçao dos Top 10',
            avatarImage: const AssetImage('assets/images/drawer/top10.png')),
      ],
    );
  }

  ListTile _createListTile({
    required EdgeInsets contentPadding,
    ImageProvider? avatarImage,
    required String titleText,
    required String subTitleText,
  }) {
    return ListTile(
      contentPadding: contentPadding,
      leading: avatarImage != null
          ? CircleAvatar(backgroundImage: avatarImage)
          : null,
      trailing: Icon(Icons.arrow_forward),
      title: Text(titleText),
      subtitle: Text(subTitleText),
      onTap: () {},
    );
  }
}
