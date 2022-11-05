// import 'package:coupon/Utility/Values/app_colors.dart';
import 'package:flutter/material.dart';

import '../values/size_utils.dart';

const twoPi = 3.14 * 2;

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 4),
          builder: (context, value, child) {
            return SizedBox(
              height: SizeUtils.getHeight(100),
              width: SizeUtils.getWidth(100),
              child: Stack(
                  //   children: [ShaderMask(

                  //     shaderCallback: (rect) {
                  //     return SweepGradient(
                  //              startAngle: 0.0,
                  //              endAngle: twoPi,
                  //              stops: [0.0, ]
                  //   })],
                  ),
            );
          },
        ),
      ),
    );
  }
}
