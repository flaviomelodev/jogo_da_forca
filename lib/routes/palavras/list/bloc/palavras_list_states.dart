part of 'palavras_list_bloc.dart';

enum PalavrasStatus { initial, sucess, failure }

class PalavrasListStates extends Equatable {
  final PalavrasStatus status;
  final List<PalavraModel> palavras;
  final bool hasReachedMax;

  const PalavrasListStates({
    this.status = PalavrasStatus.initial,
    this.palavras = const <PalavraModel>[],
    this.hasReachedMax = false,
  });

  PalavrasListStates copyWith({
    PalavrasStatus? status,
    List<PalavraModel>? palavras,
    bool? hasReachedMax,
  }) {
    return PalavrasListStates(
      status: status ?? this.status,
      palavras: palavras ?? this.palavras,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, palavras, hasReachedMax];
}
