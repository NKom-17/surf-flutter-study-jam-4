import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:surf_practice_magic_ball/components/constants/query.dart';
import 'package:surf_practice_magic_ball/data/dto/answer_dto.dart';
import 'package:surf_practice_magic_ball/data/mappers/answer_mapper.dart';
import 'package:surf_practice_magic_ball/domain/models/answer_model.dart';

class Repository {
  final _dio = Dio()
    ..interceptors.add(
      PrettyDioLogger(),
    );

  Future<AnswerModel?> fetchAnswer() async {
    try {
      const String url = Query.baseUrl;
      final Response<dynamic> response = await _dio.get(url);

      final AnswerDTO dto =
          AnswerDTO.fromJson(response.data as Map<String, dynamic>);
      final AnswerModel model = dto.toDomain();
      return model;
    } on DioException catch (_) {
      return null;
    }
  }
}
