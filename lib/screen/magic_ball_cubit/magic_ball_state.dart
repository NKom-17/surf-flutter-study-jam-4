import 'package:equatable/equatable.dart';

enum MagicBallStatus { initial, inProgress, success, failure }

class MagicBallState extends Equatable {
  const MagicBallState({this.answer, this.status = MagicBallStatus.initial});

  final String? answer;
  final MagicBallStatus status;

  @override
  List<Object?> get props => [answer, status];

  MagicBallState copyWith({
    String? answer,
    MagicBallStatus? status,
  }) {
    return MagicBallState(
      answer: answer ?? this.answer,
      status: status ?? this.status,
    );
  }
}
