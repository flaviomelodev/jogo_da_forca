import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forca_game/drawer/widgets/container_iluminado_widget.dart';
import 'package:forca_game/models/palavra_model.dart';
import 'package:forca_game/routes/palavras/crud/bloc/palavra_crud_bloc.dart';
import 'package:forca_game/widgets/dialogs/sucess_dialog_widget.dart';
import 'package:forca_game/widgets/text_formfield_forca.dart';
import 'package:forca_game/widgets/textbutton_with_snackbar_widget.dart';

import '../../../local_persistence/daos/palavra_dao.dart';

class PalavraCrudRoute extends StatefulWidget {
  const PalavraCrudRoute({Key? key}) : super(key: key);

  @override
  State<PalavraCrudRoute> createState() => _PalavraCrudRouteState();
}

class _PalavraCrudRouteState extends State<PalavraCrudRoute> {
  final TextEditingController _palavraController = TextEditingController();
  final TextEditingController _ajudaController = TextEditingController();
  final FocusNode _ajudaFocus = FocusNode();
  final FocusNode _palavraFocus = FocusNode();
  PalavraModel _palavraModel = PalavraModel.empty();
  late BuildContext _buildContext;

  static PalavraModel empty() {
    return PalavraModel(
      palavraID: '',
      palavra: '',
      ajuda: '',
    );
  }

  @override
  void initState() {
    super.initState();
    _palavraController.addListener(_onPalavraChanged);
    _ajudaController.addListener(_onAjudaChanged);
  }

  @override
  void dispose() {
    _palavraController.dispose();
    super.dispose();
  }

  void _onPalavraChanged() {
    context.read<PalavraBloc>().add(
          ChangePalavra(
            palavraModel:
                _palavraModel.copyWith(palavra: _palavraController.text),
          ),
        );
  }

  void _onAjudaChanged() {
    context.read<PalavraBloc>().add(
          ChangeAjuda(
            palavraModel: _palavraModel.copyWith(ajuda: _ajudaController.text),
          ),
        );
  }

  void _onSubmitPressed() async {
    PalavraDAO palavraDAO = PalavraDAO();
    PalavraModel palavraModel = PalavraModel(
      palavra: _palavraController.text,
      ajuda: _ajudaController.text,
    );

    try {
      await palavraDAO.insert(palavraModel: palavraModel);
      context.read<PalavraBloc>().add(SubmitForm());
    } catch (e) {
      rethrow;
    }
  }

  _resetForm() {
    _palavraController.clear();
    _ajudaController.clear();
  }

  //Responsável pelos componentes de interação com o usuário
  Widget _form() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormFieldForca(
            focusNode: _palavraFocus,
            controller: _palavraController,
            labelText: 'Palavra',
            textInputAction: TextInputAction.next,
            validator: (_) {
              return _palavraModel.palavra.isNotEmpty
                  ? null
                  : 'Informe a palavra';
            },
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_ajudaFocus),
          ),
          const SizedBox(height: 20),
          TextFormFieldForca(
            maxLines: 5,
            focusNode: _ajudaFocus,
            controller: _ajudaController,
            labelText: 'Ajuda',
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) {},
            validator: (_) {
              return _palavraModel.ajuda.isNotEmpty ? null : 'Informe ajuda';
            },
          ),
          const SizedBox(height: 20),
          TextButtonWithSnackBarWidget(
            onPressedVisible: _palavraModel.isValid,
            buttonText: 'Gravar',
            sucessTextToSnackBar:
                'Os dados informados foram registrados com sucesso.',
            failTextSnackBar: 'Erro na inserção dos dados.',
            onButtonPressed: _onSubmitPressed,
            onSnackBarClosed: _resetForm,
          ),
        ],
      ),
    );
  }

  Widget _mainColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: ContainerIluminadoWidget(
            backgroundColor: Colors.white,
            shadowColor: Colors.white70,
            height: 350,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: BlocBuilder<PalavraBloc, PalavraCrudState>(
                builder: (context, formState) {
                  if (formState is PalavraChanged) {
                    _palavraModel = _palavraModel.copyWith(
                        palavra: formState.palavraModel.palavra);
                  } else if (formState is AjudaChanged) {
                    _palavraModel = _palavraModel.copyWith(
                        ajuda: formState.palavraModel.ajuda);
                  } else if (formState is FormIsSubmitted) {
                    return SucessDialogWidget(onDismissed: () {
                      _palavraController.clear();
                      _ajudaController.clear();
                    });
                  }
                  return _form();
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: const Text('Registro de Palavras'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: _mainColumn(),
          ),
        ),
      ),
    );
  }
}
