import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/components/constants/query.dart';

class ShadowBall extends StatelessWidget {
  const ShadowBall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(Query.ballShadowBlur),
        ),
      ),
      child: Center(
        child: SizedBox(
          height: 20,
          width: 100,
          child: CachedNetworkImage(imageUrl: Query.ballShadow),
        ),
      ),
    );
  }
}
