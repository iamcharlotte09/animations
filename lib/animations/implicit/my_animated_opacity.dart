
import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyAnimatedOpacity extends StatefulWidget {
  const MyAnimatedOpacity({Key? key}) : super(key: key);

  @override
  State<MyAnimatedOpacity> createState() => _MyAnimatedOpacityState();
}

class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (opacityLevel == 1.0) {
            opacityLevel = 0.0;
          } else {
            opacityLevel = 1.0;
          }
        });
      },
      child: AnimatedOpacity(
        opacity: opacityLevel,
        duration: const Duration(seconds: 1),
        child: LogoWidget(),
      ),
    );
  }
}