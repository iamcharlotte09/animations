import 'package:animation/const/colors.dart';
import 'package:flutter/material.dart';

class MyAnimatedSize extends StatefulWidget {
  const MyAnimatedSize({Key? key}) : super(key: key);

  @override
  State<MyAnimatedSize> createState() => _AnimatedSizeState();
}

class _AnimatedSizeState extends State<MyAnimatedSize> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Center(
          child: Image.asset('asset/logo.png',
              color: PINK,
              height: _isSelected ? 50 : 100,
              width: _isSelected ? 75.0 : 100),
        ),
      ),
    );
  }
}