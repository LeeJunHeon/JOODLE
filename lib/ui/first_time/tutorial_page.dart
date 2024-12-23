import 'package:flutter/material.dart';

import '../../utils/chatBubble.dart';
import '../../utils/dimensions.dart';

class TutorialPage extends StatefulWidget {
  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int helpVisibleNum = 0;
  final int helpCount = 3; // 도움말 개수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _updateVisibleNum();
        },
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                color: Colors.yellow,
              ),
              Image.asset(
                'assets/images/landingpage_image/main_screen.PNG',
                fit: BoxFit.cover,
                width: Dimensions.screenWidth,
                height: Dimensions.screenHeight,
              ),
              Visibility(
                visible: helpVisibleNum == 0,
                child: CustomPaint(
                  painter: ChatBubble(
                    position: Offset(100.0, 75.0),
                    text: '도움말1',
                  ),
                ),
              ),
              Visibility(
                visible: helpVisibleNum == 1,
                child: CustomPaint(
                  painter: ChatBubble(
                    position: Offset(300, 100),
                    text: '도움말2',
                  ),
                ),
              ),
              Visibility(
                visible: helpVisibleNum == 2,
                child: CustomPaint(
                  painter: ChatBubble(
                    position: Offset(300, 200),
                    text: '도움말3',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateVisibleNum() {
    setState(() {
      if (helpVisibleNum < helpCount - 1) {
        helpVisibleNum++;
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/tutorialComplete', (route) => false);
      }
    });
  }
}
