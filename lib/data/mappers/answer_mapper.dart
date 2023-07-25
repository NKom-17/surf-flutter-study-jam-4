import 'package:surf_practice_magic_ball/data/dto/answer_dto.dart';
import 'package:surf_practice_magic_ball/domain/models/answer_model.dart';

extension AnswerFromDTOToDomain on AnswerDTO {
  AnswerModel toDomain() {
    return AnswerModel(reading: reading);
  }
}
