import 'package:json_annotation/json_annotation.dart';

part 'answer_dto.g.dart';

@JsonSerializable()
class AnswerDTO {
  final String reading;

  AnswerDTO({required this.reading});

  factory AnswerDTO.fromJson(Map<String, dynamic> json) =>
      _$AnswerDTOFromJson(json);
}
