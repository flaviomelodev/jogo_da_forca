import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'palavra_model.g.dart';

@JsonSerializable()
class PalavraModel extends Equatable {
  String? palavraID;
  final String palavra;
  final String ajuda;

  @override
  List<Object> get props => [palavraID ?? ''];

  PalavraModel({
    this.palavraID,
    required this.palavra,
    required this.ajuda,
  });

  factory PalavraModel.fromJson(Map<String, dynamic> json) =>
      _$PalavraModelFromJson(json);
  Map<String, dynamic> toJson() => _$PalavraModelToJson(this);

  PalavraModel copyWith({
    String? palavraID,
    String? palavra,
    String? ajuda,
  }) {
    return PalavraModel(
      palavraID: palavraID ?? this.palavraID,
      palavra: palavra ?? this.palavra,
      ajuda: ajuda ?? this.ajuda,
    );
  }

  static PalavraModel empty() {
    return PalavraModel(palavraID: '', palavra: '', ajuda: '');
  }

  bool get isValid => palavra.isNotEmpty && ajuda.isNotEmpty;
}
