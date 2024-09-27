import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({Key? key}) : super(key: key);

  @override
  State<MyAnimatedWidget> createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _SpinningIcon(animation: _controller);
  }
}

class _SpinningIcon extends AnimatedWidget {
  _SpinningIcon({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Transform.rotate(
      angle: animation.value * 2 * 3.14,
      child: Center(
        child: LogoWidget(),
      ),
    );
  }
}