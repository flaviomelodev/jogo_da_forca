import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forca_game/routes/palavras/list/bloc/palavras_list_bloc.dart';
import 'package:forca_game/routes/palavras/widgets/palavras_listtile_widget.dart';

class PalavrasListViewRoute extends StatefulWidget {
  const PalavrasListViewRoute({Key? key}) : super(key: key);

  @override
  State<PalavrasListViewRoute> createState() => _PalavrasListViewRouteState();
}

class _PalavrasListViewRouteState extends State<PalavrasListViewRoute> {
  final scrollController = ScrollController();
  final _scrollTreshold = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Palavras registradas'),
        elevation: 10,
      ),
      body: BlocBuilder<PalavrasBloc, PalavrasListStates>(
        builder: (context, formState) {
          if (formState.status == PalavrasStatus.failure) {
            return const Center(
              child: Text('Falha ao recuperar palavras'),
            );
          }
          if (formState.status == PalavrasStatus.sucess) {
            if (formState.palavras.isEmpty) {
              return const Center(
                child: Text('Nenhuma palavra registrada ainda'),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: formState.palavras.length,
              itemBuilder: (BuildContext context, int index) {
                return PalavrasListTileWidget(
                  title: formState.palavras[index].palavra,
                  trailing: const Icon(Icons.keyboard_arrow_right),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
