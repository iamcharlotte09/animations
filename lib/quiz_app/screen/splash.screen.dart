import 'package:animation/const/colors.dart';
import 'package:animation/quiz_app/comp/rotating_gradient_button.dart';
import 'package:animation/quiz_app/screen/quiz.screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //컨트롤러
  late AnimationController _controller;

  //double 타입 애니메이션 (회전, 크기, 사이즈)
  late Animation<double> _rotateBox,
      _middlePinkBoxSize,
      _middleBlueBoxSize,
      _middleQuizTextRotate,
      _middleQuizTextSize,
      _middleQuestionMarkSize,
      _bottomGreenBoxHeight,
      _bottomCircleSize;

  //Offset 타입 애니메이션 (이동)
  late Animation<Offset> _middlePinkBoxMove,
      _middleBlueBoxMove,
      _bottomCircleMove;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // 애니메이션 초기화
    _initializeAnimations();

    // 애니메이션 시작
    _controller.forward();
  }

  // Double 타입 애니메이션 생성 함수
  Animation<double> createDoubleAnimation(
      double begin, double end, double startInterval, double endInterval) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: _controller,
        curve:
            Interval(startInterval, endInterval, curve: Curves.fastOutSlowIn),
      ),
    );
  }

  // Offset 타입 애니메이션 생성 함수
  Animation<Offset> createOffsetAnimation(
      Offset begin, Offset end, double startInterval, double endInterval) {
    return Tween<Offset>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(startInterval, endInterval, curve: Curves.easeInOut),
      ),
    );
  }

  void _initializeAnimations() {
    // 회전 애니메이션 (상단 초록색 박스 & 'Quiz' 텍스트에 재사용)
    _rotateBox = createDoubleAnimation(0.0, 1, 0.0, 0.8);

    // 중간 핑크색 박스 애니메이션
    _middlePinkBoxSize = createDoubleAnimation(0.0, 300.0, 0.0, 0.4);
    _middlePinkBoxMove =
        createOffsetAnimation(Offset.zero, Offset(-0.5, 0), 0.5, 0.8);

    // 중간 파란색 박스 애니메이션
    _middleBlueBoxSize = createDoubleAnimation(0.0, 200.0, 0.0, 0.4);
    _middleBlueBoxMove =
        createOffsetAnimation(Offset.zero, Offset(0.5, 0), 0.5, 0.8);

    // 중간 퀴즈 텍스트 애니메이션
    _middleQuizTextSize = createDoubleAnimation(0.0, 10.0, 0.5, 0.8);
    _middleQuizTextRotate = createDoubleAnimation(0.0, 270/360, 0.0, 1.0);

    // 중간 물음표 아이콘 애니메이션
    _middleQuestionMarkSize = createDoubleAnimation(0.0, 15.0, 0.5, 0.8);

    // 하단 초록색 박스 애니메이션
    _bottomGreenBoxHeight = createDoubleAnimation(100.0, 0.0, 0.0, 0.2);

    // 하단 원모양 버튼 애니메이션
    _bottomCircleSize = createDoubleAnimation(0.0, 100.0, 0.3, 0.5);
    _bottomCircleMove =
        createOffsetAnimation(Offset.zero, Offset(-1, 0), 0.5, 0.8);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE,
      body: Stack(
        children: [
          //1. 상단
          buildRotatingBox(),
          //2. 중간
          buildCenterBoxes(),
          //3. 하단 박스
          buildBottomBox(),
          //4. 하단 동그라미 버튼
          buildMovingCircle(),
        ],
      ),
    );
  }

  // 1. 상단 초록색 회전하는 박스
  Widget buildRotatingBox() {
    return Positioned(
      left: 20,
      top: 50,
      child: RotationTransition(
        turns: _rotateBox,
        child: buildBox(100.0, GREEN),
      ),
    );
  }

  // 2. 중간 핑크색 박스 & 파란색 박스
  Widget buildCenterBoxes() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SlideTransition(
            position: _middlePinkBoxMove,
            child: buildAnimatedBox(_middlePinkBoxSize, PINK),
          ),
          Positioned(
            left: 50,
            child: buildRotatingText(),
          ),
          SlideTransition(
            position: _middleBlueBoxMove,
            child: buildAnimatedBox(_middleBlueBoxSize, BLUE),
          ),
          Positioned(
            right: 40,
            child: buildAnimatedIcon(),
          ),
        ],
      ),
    );
  }

  // 애니메이션을 적용한 박스
  Widget buildAnimatedBox(Animation<double> animation, Color color) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return buildBox(animation.value, color);
      },
    );
  }

  // 박스 위젯 생성 함수
  Widget buildBox(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
    );
  }

  // 애니메이션으로 크기가 커지는 아이콘
  Widget buildAnimatedIcon() {
    return ScaleTransition(
      scale: _middleQuestionMarkSize,
      child: Icon(
        Icons.question_mark_rounded,
        color: PINK,
      ),
    );
  }

  // 'Quiz' 텍스트 회전 애니메이션
  Widget buildRotatingText() {
    return RotationTransition(
      turns: _middleQuizTextRotate, // 회전 애니메이션 전달
      child: ScaleTransition(
        scale: _middleQuizTextSize, // 크기 애니메이션
        child: Text(
          'Quiz',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: BLUE,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // 3. 하단 초록색 박스
  Widget buildBottomBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedBuilder(
        animation: _bottomGreenBoxHeight,
        builder: (context, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: _bottomGreenBoxHeight.value,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: GREEN,
            ),
          );
        },
      ),
    );
  }

  //4. 하단 원모양 시작 버튼
  Widget buildMovingCircle() {
    return Positioned(
      right: 50,
      bottom: 50,
      child: SlideTransition(
        position: _bottomCircleMove,
        child: AnimatedBuilder(
          animation: _bottomCircleSize,
          builder: (context, child) {
            return InkWell(
              onTap: navigateToNextScreen,
              child: Container(
                width: _bottomCircleSize.value,
                height: _bottomCircleSize.value,
                child: RotatingGradientButton(),
              ),
            );
          },
        ),
      ),
    );
  }

  void navigateToNextScreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => QuizScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: Curves.easeInOut));
          return SlideTransition(
              position: animation.drive(tween), child: child);
        },
      ),
    );
  }
}
