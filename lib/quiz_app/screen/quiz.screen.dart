import 'package:animation/const/colors.dart';
import 'package:animation/quiz_app/model/quiz.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

final List<QuizModel> quiz = [
  QuizModel(
      question: '구명 보트에는 몇 명이 탈수 있을까?',
      answer: '9명(구명 보트)',
      svgUrl: 'asset/rescue.svg'),
  QuizModel(
      question: '사람의 몸무게가 가장 많이 나갈 때는?',
      answer: '철들 때',
      svgUrl: 'asset/scale.svg'),
  QuizModel(
    question: '오리가 얼면 뭐가 될까?',
    answer: '언덕',
    svgUrl: 'asset/duck.svg',
  ),
  QuizModel(
    question: '세상에서 가장 뜨거운 바다는?',
    answer: '열받아',
    svgUrl: 'asset/ocean.svg',
  ),
];

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _pageController =
      PageController(viewportFraction: 0.7, initialPage: 0);
  final List<bool> _isFlipped =
      List.generate(4, (_) => false); // Track the flipped state of each card

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE,
      body: Center(
        child: SizedBox(
          height: 500,
          child: PageView.builder(
            controller: _pageController,
            itemCount: quiz.length,
            itemBuilder: (context, index) {
              return _buildCard(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.0;

        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
        }else {
          value = (1 - ((index - _pageController.initialPage).abs() * 0.3)).clamp(0.7, 1.0);
        }

        return Transform.scale(
          scale: value,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isFlipped[index] = !_isFlipped[index]; // Flip the card state
              });
            },
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder:
                    (Widget child, Animation<double> animation) {
                  return _RotationYTransition(
                    animation: animation,
                    child: child,
                  );
                },
                child: _isFlipped[index]
                    ? _buildCardSide(
                        index: index,
                        label: quiz[index].answer,
                        key: ValueKey('front_$index'),
                      )
                    : _buildCardSide(
                        index: index,
                        label: quiz[index].question,
                        svgUrl: quiz[index].svgUrl,
                        key: ValueKey('back_$index'),
                      )),
          ),
        );
      },
    );
  }

  Widget _buildCardSide(
      {required int index,
      required String label,
      String? svgUrl,
      required Key key}) {
    return Card(
      key: key,
      color: PINK,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgUrl != null)
              SvgPicture.asset(
                svgUrl,
                color: BLUE,
                width: 200,
                height: 200,
              ),
            if (svgUrl != null)
              const SizedBox(
                height: 20,
              ),
            Text(
              label,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: BLUE,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _RotationYTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const _RotationYTransition({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final angle = animation.value * math.pi;

        return Transform(
          transform: Matrix4.rotationY(angle),
          alignment: Alignment.center,
          child: animation.value > 0.5
              ? Transform(
                  transform: Matrix4.rotationY(math.pi),
                  alignment: Alignment.center,
                  child: child,
                )
              : child,
        );
      },
      child: child,
    );
  }
}
