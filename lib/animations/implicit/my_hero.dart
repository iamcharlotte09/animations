
import 'package:animation/animations/comp/widgets.dart';
import 'package:flutter/material.dart';

class MyHero extends StatefulWidget {
  const MyHero({Key? key}) : super(key: key);

  @override
  State<MyHero> createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => _SecondScreen()),
          );
        },
        child: Hero(
          tag: 'hero-image',
          child: ContainerLogoWidget(),
        ),
      ),
    );
  }
}

class _SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
      ),
      body: Hero(
        tag: 'hero-image',
        child: ContainerLogoWidget(),
      ),
    );
  }
}