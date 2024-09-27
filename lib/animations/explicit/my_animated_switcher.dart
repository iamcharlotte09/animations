import 'package:animation/animations/comp/widgets.dart';
import 'package:animation/const/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyAnimatedSwitcher extends StatefulWidget {
  const MyAnimatedSwitcher({Key? key}) : super(key: key);

  @override
  State<MyAnimatedSwitcher> createState() => _MyAnimatedSwitcherState();
}

class _MyAnimatedSwitcherState extends State<MyAnimatedSwitcher> {
  bool _isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _toggleCard,
        child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return _RotationYTransition(
                animation: animation,
                child: child,
              );
            },
            child: _isFlipped
                ? Container(
                    key: ValueKey(false),
                    width: 200,
                    height: 100,
                    color: BLUE,
                    alignment: Alignment.center,
                    child: LogoWidget(),
                  )
                : Container(
                    key: ValueKey(true),
                    width: 200,
                    height: 100,
                    color: PINK,
                    alignment: Alignment.center,
                    child: LogoWidget(
                      color: BLUE,
                    ),
                  )),
      ),
    );
  }

  void _toggleCard() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }
}

class _RotationYTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const _RotationYTransition({
    required this.animation,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final angle = animation.value * math.pi;

        return Transform(
          transform: Matrix4.rotationY(angle),
          alignment: Alignment.center,
          child: animation.value > 0.5
              ? Transform(
                  transform: Matrix4.rotationY(math.pi),
                  alignment: Alignment.center,
                  child: child,
                )
              : child,
        );
      },
      child: child,
    );
  }
}
