part of 'palavra_crud_bloc.dart';

abstract class PalavraCrudState extends Equatable {
  const PalavraCrudState();

  @override
  List<Object> get props => [];
}

class PalavraModelInitialized extends PalavraCrudState {}

class PalavraChanged extends PalavraCrudState {
  final PalavraModel palavraModel;

  const PalavraChanged({required this.palavraModel});

  @override
  List<Object> get props => [palavraModel.palavra];
}

class AjudaChanged extends PalavraCrudState {
  final PalavraModel palavraModel;

  const AjudaChanged({required this.palavraModel});

  @override
  List<Object> get props => [palavraModel.ajuda];
}

class FormIsValidated extends PalavraCrudState {
  final bool isValidated;

  const FormIsValidated({required this.isValidated});

  @override
  List<Object> get props => [isValidated];
}

class FormIsSubmitted extends PalavraCrudState {}
