import 'dart:io';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../repo/nfc_repo.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int dotIndicatorNum = 0;
  bool _isNfcAvalible = false;

  @override
  void initState() {
    _isNfcAvailable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  ///NFC 사용 가능 여부
                  _pageController.animateToPage(_currentPage+1, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuint);
                },
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _isNfcAvailable();
                      /// page가 바뀔 때마다 NFC가 켜져 있는지 확인함
                        if(!_isNfcAvalible){
                          _navigateToNfcSettingOn();
                        }
                      _currentPage = page;
                    });
                  },
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset('assets/images/landingpage_image/nfctag_3.png'),
                          SizedBox(height: 20,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Text('NFC 사용 여부를 확인합니다\nNFC가 기본모드로 켜져 있는지\n확인해주세요',
                                  style: Theme.of(context).textTheme.headlineSmall,),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                    Container(color: Colors.blueAccent,),
                    Container()
                  ],
                ),
              )
            ),
            const SizedBox(height: 20,),
            DotsIndicator(
              dotsCount: 3,
              position: _currentPage,
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: Colors.deepOrange,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
  void _isNfcAvailable() async{
    _isNfcAvalible = await NfcManager.instance.isAvailable();
  }
  void _navigateToNfcSettingOn(){
    if(Platform.isAndroid){
      nfcSettingOn();
    }
    if(Platform.isIOS){
      nfcSettingOn();
    }
    ///TODO: ios에서는 잘 되는지 해봐야 됨
  }
}

/// 화살표로 정보 제공 예제
/*
class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  List<String> infoList = [
    '첫 번째 정보',
    '두 번째 정보',
    '세 번째 정보',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro Page'),
      ),
      body: GestureDetector(
        onTap: () {
          if (currentIndex < infoList.length - 1) {
            setState(() {
              currentIndex++;
            });
          }
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  infoList[currentIndex],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            if (currentIndex < infoList.length - 1)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: SpeechBubble(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SpeechBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _SpeechBubbleClipper(),
      child: Container(
        width: 200,
        height: 100,
        color: Colors.yellow,
        child: Center(
          child: Text(
            '탭하여 다음 정보 확인',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class _SpeechBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const radius = 20.0;
    const arrowWidth = 50.0;
    const arrowHeight = 10.0;

    path.lineTo(radius, 0);
    path.arcToPoint(Offset(0, radius), radius: Radius.circular(radius));
    path.lineTo(0, size.height - radius);
    path.arcToPoint(Offset(radius, size.height), radius: Radius.circular(radius));
    path.lineTo(size.width - arrowWidth - radius, size.height);
    path.arcToPoint(Offset(size.width - arrowWidth, size.height + arrowHeight), radius: Radius.circular(radius));
    path.lineTo(size.width - arrowWidth, size.height - radius);
    path.arcToPoint(Offset(size.width, size.height - radius), radius: Radius.circular(radius));
    path.lineTo(size.width, radius);
    path.arcToPoint(Offset(size.width - radius, 0), radius: Radius.circular(radius));
    path.lineTo(radius, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}*/
