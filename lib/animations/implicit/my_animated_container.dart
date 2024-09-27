import 'package:animation/const/colors.dart';
import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
              color: _isSelected ? GREEN : PINK,
              border: Border.all(style: BorderStyle.none),
          borderRadius: _isSelected ? BorderRadius.circular(30.0) : null,
        ),
        width: _isSelected ? 150.0 : 200.0,
        height: _isSelected ? 100.0 : 40.0,
        alignment:
        _isSelected ? Alignment.center : Alignment.topCenter,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: Center(
          child: Image.asset(
            'asset/logo.png',
            width: 100,
            color: BLUE,
          ),
        ),
      ),
    ),);
  }
}
