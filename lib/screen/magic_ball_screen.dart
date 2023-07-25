import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/components/constants/colors.dart';
import 'package:surf_practice_magic_ball/screen/widgets/ball.dart';
import 'package:surf_practice_magic_ball/screen/widgets/shadow_ball.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.backgroundAppTop,
                AppColors.backgroundAppBottom,
              ],
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 9,
                    child: Ball(),
                  ),
                  Expanded(
                    flex: 2,
                    child: ShadowBall(),
                  ),
                  Expanded(
                    child: Text(
                      'Tap on the ball\n or shake the phone',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.tapOrShakeText,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
