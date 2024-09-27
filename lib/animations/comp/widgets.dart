
import 'package:animation/const/colors.dart';
import 'package:flutter/material.dart';

class ContainerLogoWidget extends StatelessWidget {
  const ContainerLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PINK,
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: 150.0,
      height: 80.0,
      child: Center(
        child: Image.asset(
          'asset/logo.png',
          width: 100,
          color: BLUE,
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final Color? color;
  const LogoWidget({
    this.color,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/logo.png',
      width: 100,
      color: color ?? PINK,
    );
  }
}