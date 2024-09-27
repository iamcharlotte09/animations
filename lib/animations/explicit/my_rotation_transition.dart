import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyRotationTransition extends StatefulWidget {
  const MyRotationTransition({super.key});

  @override
  State<MyRotationTransition> createState() => _MyRotationTransitionState();
}

class _MyRotationTransitionState extends State<MyRotationTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation =CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: LogoWidget(),
        ),
      ),
    );
  }
}
