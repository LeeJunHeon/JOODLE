import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            Navigator.pushNamedAndRemoveUntil(context, '/introscreen', (route) => false);
          },
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/landingpage_image/orderbyphone_2.jpg',
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(flex: 1,),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'JOODLE에 오신 것을\n환영합니다',
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        const Text('JOODLE에서 편리하고 빠른 주문을 제공해드립니다'),
                        const Text('간단한 안내와 함께 시작해볼까요?'),
                        Spacer(flex: 3,),
                        Center(
                          child: Text(
                            '시작하시려면 아무 곳이나 탭하세요',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacer(flex: 2,),
                      ],
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
