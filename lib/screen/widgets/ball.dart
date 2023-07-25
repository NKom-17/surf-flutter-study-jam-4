import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/components/constants/colors.dart';
import 'package:surf_practice_magic_ball/components/constants/query.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_cubit/magic_ball_cubit.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_cubit/magic_ball_state.dart';

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    ShakeDetector.autoStart(
      onPhoneShake: () => context.read<MagicBallCubit>().fetchAnswer(),
    );
    return GestureDetector(
      onTap: () async {
        context.read<MagicBallCubit>().fetchAnswer();
      },
      child: Container(
        height: 320,
        width: 320,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(Query.ball),
          ),
        ),
        child: BlocBuilder<MagicBallCubit, MagicBallState>(
          builder: (context, state) {
            return state.status == MagicBallStatus.initial
                ? const SizedBox()
                : Center(
                    child: Container(
                      width: 240,
                      height: 240,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.ballShading,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            spreadRadius: 20,
                            color: AppColors.ballShading,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          state.answer ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.answerText,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
