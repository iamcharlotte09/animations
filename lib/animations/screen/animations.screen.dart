import 'package:animation/animations/explicit/my_animated_builder.dart';
import 'package:animation/animations/explicit/my_animated_list.dart';
import 'package:animation/animations/explicit/my_animated_modal_barrier.dart';
import 'package:animation/animations/explicit/my_animated_switcher.dart';
import 'package:animation/animations/explicit/my_animated_widget.dart';
import 'package:animation/animations/explicit/my_decorated_box_transition.dart';
import 'package:animation/animations/explicit/my_fade_transition.dart';
import 'package:animation/animations/explicit/my_positioned_transition.dart';
import 'package:animation/animations/explicit/my_rotation_transition.dart';
import 'package:animation/animations/explicit/my_scale_transition.dart';
import 'package:animation/animations/explicit/my_size_transition.dart';
import 'package:animation/animations/explicit/my_slide_transition.dart';
import 'package:animation/animations/implicit/my_animated_align.dart';
import 'package:animation/animations/implicit/my_animated_container.dart';
import 'package:animation/animations/implicit/my_animated_cross_fade.dart';
import 'package:animation/animations/implicit/my_animated_default_textstyle.dart';
import 'package:animation/animations/implicit/my_animated_physical_model.dart';
import 'package:animation/animations/implicit/my_hero.dart';
import 'package:animation/animations/implicit/my_animated_opacity.dart';
import 'package:animation/animations/implicit/my_animated_positioned.dart';
import 'package:animation/animations/implicit/my_animated_size.dart';
import 'package:animation/const/colors.dart';

import 'package:flutter/material.dart';

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.grey,
    );

    const spacer200 = SizedBox(
      height: 200,
    );
    const spacer20 = SizedBox(
      height: 20,
    );

    ///controller 로 하는건 repeat 하고 아닌건 onclick
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Title(title: '🤫 암시적 애니메이션 🤫'),

            ///Implicit
            _Title(
              title: '크기',
              isSubtitle: true,
            ),
            spacer20,

            Text(
              'AnimatedSize',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedSize(),
            spacer200,

            _Title(
              title: '위치',
              isSubtitle: true,
            ),
            spacer20,
            Text(
              'AnimatedAlign',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedAlign(),
            spacer200,

            _Title(
              title: '크기, 위치',
              isSubtitle: true,
            ),

            spacer20,
            Text(
              'AnimatedPositioned',
              style: textStyle,
            ),

            spacer20,
            MyAnimatedPositioned(),
            spacer200,

            _Title(
              title: '스타일',
              isSubtitle: true,
            ),
            spacer20,

            Text(
              'AnimatedDefaultTextStyle',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedDefaultTextStyle(),
            spacer200,

            Text(
              'AnimatedOpacity',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedOpacity(),
            spacer200,

            Text(
              'AnimatedPhysicalModel',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedPhysicalModel(),
            spacer200,

            _Title(
              title: '크기, 위치, 스타일',
              isSubtitle: true,
            ),
            spacer20,
            Text(
              'AnimatedContainer',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedContainer(),
            spacer200,

            _Title(
              title: '전환',
              isSubtitle: true,
            ),
            spacer20,
            Text(
              'AnimatedCrossFade',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedCrossFade(),
            spacer200,

            _Title(
              title: '크기, 위치, 스타일, 전환',
              isSubtitle: true,
            ),
            spacer20,
            Text(
              'Hero',
              style: textStyle,
            ),
            spacer20,
            MyHero(),
            spacer200,
            spacer200,

            ///Explicit
            _Title(title: '🤩 명시적 애니메이션 🤩'),

            _Title(
              title: '위치',
              isSubtitle: true,
            ),
            spacer20,

            Text(
              'PositionedTransition',
              style: textStyle,
            ),

            MyPositionedTransition(),
            spacer200,

            Text(
              'SlideTransition',
              style: textStyle,
            ),
            spacer20,
            MySlideTransition(),
            spacer200,

            Text(
              'RotationTransition',
              style: textStyle,
            ),
            spacer20,
            MyRotationTransition(),
            spacer200,

            _Title(
              title: '크기, 위치',
              isSubtitle: true,
            ),
            spacer20,

            Text(
              'SizeTransition',
              style: textStyle,
            ),
            spacer20,
            MySizeTransition(),
            spacer200,

            Text(
              'ScaleTransition',
              style: textStyle,
            ),
            spacer20,
            MyScaleTransition(),
            spacer200,

            _Title(
              title: '스타일',
              isSubtitle: true,
            ),
            spacer20,
            spacer20,
            Text(
              'FadeTransition',
              style: textStyle,
            ),
            spacer20,
            MyFadeTransition(),
            spacer200,

            Text(
              'AnimatedModalBarrier',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedModalBarrier(
              nextScreen: ModalOverlayScreen(),
            ),
            spacer200,

            _Title(
              title: '크기, 스타일',
              isSubtitle: true,
            ),

            Text(
              'DecoratedBoxTransition',
              style: textStyle,
            ),
            spacer20,
            MyDecoratedBoxTransition(),
            spacer200,

            _Title(
              title: '애니메이션 관리',
              isSubtitle: true,
            ),
            spacer200,

            Text(
              'AnimatedBuilder',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedBuilder(),
            spacer200,
            spacer200,

            Text(
              'AnimatedWidget',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedWidget(),
            spacer200,

            Text(
              'AnimatedList',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedModalBarrier(
              nextScreen: MyAnimatedList(),
            ),
            spacer200,

            Text(
              'AnimatedSwitcher',
              style: textStyle,
            ),
            spacer20,
            MyAnimatedSwitcher(),
            spacer200,
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final bool isSubtitle;

  const _Title({
    required this.title,
    this.isSubtitle = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.black54,
            child: Padding(
              padding: EdgeInsets.all(isSubtitle ? 4 : 16.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isSubtitle ? 20 : 30,
                  color: isSubtitle ? Colors.grey : Colors.grey,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContainerWidget extends StatelessWidget {
  const _ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PINK,
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: 150.0,
      height: 150.0,
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
