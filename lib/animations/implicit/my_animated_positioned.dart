import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyAnimatedPositioned extends StatefulWidget {
  const MyAnimatedPositioned({Key? key}) : super(key: key);

  @override
  State<MyAnimatedPositioned> createState() => _MyAnimatedPositionedState();
}

class _MyAnimatedPositionedState extends State<MyAnimatedPositioned> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        ///only works as a child of stack
        children: [
          AnimatedPositioned(
            width: _isSelected ? 100.0 : 200.0,
            height: _isSelected ? 100.0 : 40.0,
            right: _isSelected ? 0.0 : 200.0,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                },
                child: ContainerLogoWidget()),
          ),
        ],
      ),
    );
  }
}
