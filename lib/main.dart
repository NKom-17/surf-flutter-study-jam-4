import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/components/constants/colors.dart';
import 'package:surf_practice_magic_ball/data/repositories/repository.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_cubit/magic_ball_cubit.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Repository();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundAppTop,
        systemNavigationBarColor: AppColors.backgroundAppBottom,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Lumanosimo',
      ),
      home: RepositoryProvider.value(
        value: repository,
        child: BlocProvider<MagicBallCubit>(
          create: (_) => MagicBallCubit(repository),
          child: const MagicBallScreen(),
        ),
      ),
    );
  }
}
