import 'package:animation/const/colors.dart';
import 'package:flutter/material.dart';

class MyAnimatedModalBarrier extends StatelessWidget {
  final Widget nextScreen;

  const MyAnimatedModalBarrier({
    required this.nextScreen,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: PINK),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => nextScreen));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '예시 보러가기',
          style: TextStyle(
            fontSize: 20,
            color: BLUE,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class ModalOverlayScreen extends StatefulWidget {
  @override
  _ModalOverlayScreenState createState() => _ModalOverlayScreenState();
}

class _ModalOverlayScreenState extends State<ModalOverlayScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool _isModalVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.black54,
      end: Colors.black,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Modal Barrier'),
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: PINK),
              onPressed: _toggleModal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '다이얼로그 열기',
                  style: TextStyle(
                    fontSize: 20,
                    color: BLUE,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          if (_isModalVisible) ...[
            AnimatedModalBarrier(
              color: _colorAnimation,
              dismissible: true,
            ),
            Center(
              child: _getDialog(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _getDialog() {
    return Container(
      padding: EdgeInsets.all(20),
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: PINK,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '다이얼로그',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: BLUE,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: BLUE,
            ),
            onPressed: _toggleModal,
            child: Text(
              '닫기',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _toggleModal() {
    if (_isModalVisible) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isModalVisible = !_isModalVisible;
    });
  }
}
