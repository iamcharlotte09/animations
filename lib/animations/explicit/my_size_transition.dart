import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MySizeTransition extends StatefulWidget {
  const MySizeTransition({super.key});

  @override
  State<MySizeTransition> createState() => _MySizeTransitionState();
}

class _MySizeTransitionState extends State<MySizeTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.horizontal,
      axisAlignment: 0,
      child: Center(
        child: LogoWidget(),
      ),
    );
  }
}
