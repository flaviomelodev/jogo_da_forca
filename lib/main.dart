import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forca_game/app_helpers/app_router.dart';
import 'package:forca_game/drawer/blocs/drawer_bloc.dart';
import 'package:forca_game/routes/palavras/crud/bloc/palavra_crud_bloc.dart';
import 'package:forca_game/routes/splash_screen_route.dart';

void main() => runApp(const ForcaApp());

class ForcaApp extends StatelessWidget {
  const ForcaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DrawerBloc(),
        ),
        BlocProvider(create: (_) => PalavraBloc()),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Forca App',
        theme: ThemeData(
            primarySwatch: Colors.blue, backgroundColor: Colors.green),
        home: const ForcaHomePage(),
      ),
    );
  }
}

class ForcaHomePage extends StatelessWidget {
  const ForcaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenRoute(),
    );
  }
}
