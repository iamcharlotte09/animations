import 'package:animation/const/colors.dart';
import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyAnimatedPhysicalModel extends StatefulWidget {
  const MyAnimatedPhysicalModel({Key? key}) : super(key: key);

  @override
  State<MyAnimatedPhysicalModel> createState() =>
      _MyAnimatedPhysicalModelState();
}

class _MyAnimatedPhysicalModelState extends State<MyAnimatedPhysicalModel> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedPhysicalModel(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      elevation: _isElevated ? 30.0 : 0.0,
      shape: BoxShape.rectangle,
      shadowColor: Colors.grey,
      color: BLUE,
      animateColor: true,
      borderRadius: BorderRadius.circular(30.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isElevated = !_isElevated;
          });
        },
        child: ContainerLogoWidget(),
      ),
    );
  }
}
