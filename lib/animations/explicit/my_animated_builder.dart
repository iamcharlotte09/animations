import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyAnimatedBuilder extends StatefulWidget {
  const MyAnimatedBuilder({Key? key}) : super(key: key);

  @override
  State<MyAnimatedBuilder> createState() => _MyAnimatedBuilderState();
}

class _MyAnimatedBuilderState extends State<MyAnimatedBuilder>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotateAnimation, _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _rotateAnimation =
        Tween<double>(begin: 0, end: 4.0 * math.pi).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));

    _scaleAnimation =
        Tween<double>(begin: 0, end: 3).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.fastOutSlowIn,
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _rotateAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value, // 크기 변화
            child: const Center(
              child: LogoWidget(),
            ),
          ),
        );
      },
    );
  }
}
