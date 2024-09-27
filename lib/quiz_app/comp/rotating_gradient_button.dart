import 'package:animation/const/colors.dart';
import 'package:flutter/material.dart';

class RotatingGradientButton extends StatefulWidget {
  const RotatingGradientButton({Key? key}) : super(key: key);

  @override
  State<RotatingGradientButton> createState() => RotatingGradientButtonState();
}

class RotatingGradientButtonState extends State<RotatingGradientButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 2.0).animate(CurvedAnimation(
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
    return Stack(
      alignment: Alignment.center, // 텍스트와 회전하는 원을 겹쳐서 배치
      children: [
        RotationTransition(
          turns: _animation,
          child: Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  BLUE,
                  PINK,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        const CircleAvatar(
          radius: 45,
          backgroundColor: BLUE,
          child: Text(
            '시작!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
