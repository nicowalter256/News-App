import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      Constants.loadingGif,
      height: 200,
      width: 200,
      animate: true,
      repeat: true,
    );
  }
}
