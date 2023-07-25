import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/data/repositories/repository.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_cubit/magic_ball_state.dart';

class MagicBallCubit extends Cubit<MagicBallState> {
  MagicBallCubit(this._repository) : super(const MagicBallState());

  final Repository _repository;

  void fetchAnswer() async {
    try {
      emit(state.copyWith(status: MagicBallStatus.inProgress));
      final answer = await _repository.fetchAnswer();
      emit(state.copyWith(answer: answer?.reading));
      emit(state.copyWith(status: MagicBallStatus.success));
    } catch (_) {
      emit(state.copyWith(status: MagicBallStatus.failure));
    }
  }
}
