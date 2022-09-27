import 'package:flutter/material.dart';

class DrawerHeaderApp extends StatelessWidget {
  const DrawerHeaderApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/drawer/drawer_header.png'),
        ),
      ),
      child: UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        accountName: Text(
          'Flávio Melo',
          style: TextStyle(color: Colors.black),
        ),
        accountEmail: Text(
          'flaviofsmelo@hotmail.com',
          style: TextStyle(color: Colors.black54),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundImage:
              AssetImage('assets/images/drawer/avatar_picture.jpg'),
        ),
        otherAccountsPictures: [
          CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/drawer/avatar_picture_03.png'),
          )
        ],
      ),
    );
  }
}
