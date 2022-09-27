import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forca_game/models/palavra_model.dart';

part 'palavra_crud_event.dart';
part 'palavra_crud_state.dart';

class PalavraBloc extends Bloc<PalavraCrudEvent, PalavraCrudState> {
  PalavraBloc() : super(PalavraModelInitialized()) {
    on<ChangePalavra>((event, emit) =>
        {emit(PalavraChanged(palavraModel: event.palavraModel))});

    on<ChangeAjuda>((event, emit) =>
        {emit(AjudaChanged(palavraModel: event.palavraModel))});

    on<ValidateForm>((event, emit) =>
        {emit(FormIsValidated(isValidated: event.palavraModel.isValid))});

    on<SubmitForm>((event, emit) => {
          emit(
            FormIsSubmitted(),
          )
        });
  }
}
