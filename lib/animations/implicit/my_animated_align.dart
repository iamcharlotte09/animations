
import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyAnimatedAlign extends StatefulWidget {
  const MyAnimatedAlign({Key? key}) : super(key: key);

  @override
  State<MyAnimatedAlign> createState() => _MyAnimatedAlignState();
}

class _MyAnimatedAlignState extends State<MyAnimatedAlign> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: AnimatedAlign(
          alignment: _isSelected ? Alignment.center : Alignment.centerRight,
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: ContainerLogoWidget(),
        ),
      ),
    );
  }
}
