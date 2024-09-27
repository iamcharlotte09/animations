
import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyFadeTransition extends StatefulWidget {
  const MyFadeTransition({Key? key}) : super(key: key);

  @override
  State<MyFadeTransition> createState() => _MyFadeTransitionState();
}

class _MyFadeTransitionState extends State<MyFadeTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: LogoWidget(),
    );
  }
}
