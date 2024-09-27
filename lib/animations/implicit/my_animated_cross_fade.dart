import 'package:animation/const/colors.dart';
import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAnimatedCrossFade extends StatefulWidget {
  const MyAnimatedCrossFade({Key? key}) : super(key: key);

  @override
  State<MyAnimatedCrossFade> createState() => _MyAnimatedCrossFadeState();
}

class _MyAnimatedCrossFadeState extends State<MyAnimatedCrossFade> {
  bool _isFirst = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFirst = !_isFirst;
        });
      },
      child: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        firstChild: LogoWidget(),
        secondChild: SvgPicture.asset(
          'asset/duck.svg',
          width: 100,
          color: PINK,
        ),
        crossFadeState:
        _isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }
}