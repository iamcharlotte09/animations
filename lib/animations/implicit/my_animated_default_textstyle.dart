
import 'package:animation/const/colors.dart';
import 'package:flutter/material.dart';

class MyAnimatedDefaultTextStyle extends StatefulWidget {
  const MyAnimatedDefaultTextStyle({Key? key}) : super(key: key);

  @override
  State<MyAnimatedDefaultTextStyle> createState() =>
      _MyAnimatedDefaultTextStyleState();
}

class _MyAnimatedDefaultTextStyleState extends State<MyAnimatedDefaultTextStyle> {
  double _size = 20;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_size < 50) {
            _size = _size + 10;
          } else {
            _size = 20;
          }
        });
      },
      child: AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: 400),
        style: TextStyle(fontSize: _size),
        child: Text(
          'CodeFactory',
          style: TextStyle(
            color: PINK,
          ),
        ),
      ),
    );
  }
}
