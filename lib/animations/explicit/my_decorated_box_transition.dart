import 'package:animation/const/colors.dart';
import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyDecoratedBoxTransition extends StatefulWidget {
  const MyDecoratedBoxTransition({Key? key}) : super(key: key);

  @override
  State<MyDecoratedBoxTransition> createState() =>
      _MyDecoratedBoxTransitionState();
}

class _MyDecoratedBoxTransitionState extends State<MyDecoratedBoxTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final DecorationTween _decorationTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _decorationTween = DecorationTween(
      begin: BoxDecoration(
        color: PINK,
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(60.0),
      ),
      end: BoxDecoration(
        color: PINK,
        border: Border.all(
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.zero,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      decoration: _decorationTween.animate(_controller),
      child: ContainerLogoWidget(),
    );
  }
}
