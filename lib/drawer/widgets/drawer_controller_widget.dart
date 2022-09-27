import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forca_game/drawer/blocs/drawer_bloc.dart';

class DrawerControllerWidget extends StatelessWidget {
  final AppBar? appBar;
  final Widget? body;
  final double? topBody;

  final Drawer? drawer;
  final Function? callbackFunction;

  final double? leftBodyOpen;
  final double? leftBodyClose;
  DrawerControllerWidget({
    Key? key,
    this.appBar,
    this.body,
    this.topBody,
    this.drawer,
    this.callbackFunction,
    this.leftBodyOpen,
    this.leftBodyClose,
  }) : super(key: key);

  GlobalKey<DrawerControllerState> drawerKey =
      GlobalKey<DrawerControllerState>();

  //abertura do Drawer
  void _openDrawer() {
    drawerKey.currentState!.open();
    _isDrawerOpened = true;
  }

  void _closeDrawer() {
    drawerKey.currentState!.close();
    _isDrawerOpened = false;
  }

  bool _isDrawerOpened = false;

  void _drawerCallback(bool status) {
    if (_isDrawerOpened && status) {
      status = false;
      _closeDrawer();
    }
    if (callbackFunction != null) {
      callbackFunction!(status);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            //(appBar == 0) ? AppBar() : appBar!
            //Operador null-aware
            child: (appBar == null)
                ? AppBar()
                : AppBar(
                    automaticallyImplyLeading:
                        appBar!.automaticallyImplyLeading,
                    title: appBar!.title,
                    centerTitle: appBar!.centerTitle,
                    actions: [
                      GestureDetector(
                        child: appBar?.actions?[0],
                        onTap: () => _openDrawer(),
                      ),
                    ],
                  ),
          ),
          (topBody != null)
              ? BlocBuilder<DrawerBloc, DrawerTooglePressed>(
                  builder: (context, isDrawerOpen) {
                  double left =
                      _isDrawerOpened ? leftBodyOpen! : leftBodyClose!;
                  return AnimatedPositioned(
                    duration: const Duration(seconds: 1),
                    top: topBody,
                    left: left,
                    child: (body == null) ? Container() : body!,
                  );
                })
              : body!,
          DrawerController(
            key: drawerKey,
            alignment: DrawerAlignment.end,
            child: drawer != null ? drawer! : Container(),
            drawerCallback: (status) {
              if (!_isDrawerOpened) {
                _drawerCallback(status);
              }
            },
          ),
        ],
      ),
    );
  }
}
