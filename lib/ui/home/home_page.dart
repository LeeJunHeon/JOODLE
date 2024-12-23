import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Text('로그인 했읍니다'),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle:  const TextStyle(fontSize: 20)
                ),
                onPressed: () {
                  Amplify.Auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
                child: const Text('로그아웃')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
