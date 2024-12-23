import 'dart:async';

import 'package:flutter/material.dart';

class TutorialComplete extends StatefulWidget {
  @override
  _TutorialCompleteState createState() => _TutorialCompleteState();
}

class _TutorialCompleteState extends State<TutorialComplete> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _fadeIn();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false)
    );
  }

  void _fadeIn() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _isVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.orange,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                  child: Text(
                    '이제 JOODLE로 주문해보세요',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.easeInExpo,
                  child: Text(
                    '주문 들어갑니다!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
