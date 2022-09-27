part of 'palavra_crud_bloc.dart';

abstract class PalavraCrudEvent extends Equatable {
  const PalavraCrudEvent();

  @override
  List<Object> get props => [];
}

class ChangePalavra extends PalavraCrudEvent {
  final PalavraModel palavraModel;

  const ChangePalavra({required this.palavraModel});

  @override
  List<Object> get props => [palavraModel.palavra];
}

class ChangeAjuda extends PalavraCrudEvent {
  final PalavraModel palavraModel;

  const ChangeAjuda({required this.palavraModel});

  @override
  List<Object> get props => [palavraModel.ajuda];
}

class ValidateForm extends PalavraCrudEvent {
  final PalavraModel palavraModel;

  const ValidateForm({required this.palavraModel});

  @override
  List<Object> get props => [
        palavraModel.palavraID!,
        palavraModel.palavra,
        palavraModel.ajuda,
      ];
}

class SubmitForm extends PalavraCrudEvent {}
