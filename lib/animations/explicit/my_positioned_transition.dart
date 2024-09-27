
import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyPositionedTransition extends StatefulWidget {
  const MyPositionedTransition({Key? key}) : super(key: key);

  @override
  State<MyPositionedTransition> createState() => _MyPositionedTransitionState();
}

class _MyPositionedTransitionState extends State<MyPositionedTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<RelativeRect> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(
        reverse: true);


    _animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 0, 100, 0),
      end: RelativeRect.fromLTRB(100, 0, 0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Stack(
          children: [
            PositionedTransition(
              rect: _animation,
              child: LogoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
