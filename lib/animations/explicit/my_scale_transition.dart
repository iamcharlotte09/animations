import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyScaleTransition extends StatefulWidget {
  const MyScaleTransition({super.key});

  @override
  State<MyScaleTransition> createState() => _MyScaleTransitionState();
}

class _MyScaleTransitionState extends State<MyScaleTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(CurvedAnimation(
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
    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: LogoWidget(),
        ),
      ),
    );
  }
}
