import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joodle_ver_one/common/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:joodle_ver_one/ui/menu/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../repo/detailpage_repo.dart';
import '../repo/image_repo.dart';
import '../repo/nfc_repo.dart';

//TODO: 앱사용이 처음이면 아예 튜토리얼 페이지 splashPage 이전에 보여주고 NFC를 켜도록 구조를 만들자
void splash(){
  runApp(const SplashScreen());
}

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _isFirstInstall = true;

  @override
  void initState(){
    int durationSeconds = 3;
    _fetchImageKeys();
    super.initState();
    //TODO: 세부 수정 필요하다 = tutorial을 완성하고 원래대로 바꾸면 됨, 그리고 _isFirstInstall = true이면 landing_screen으로 false면 home으로 보냄
    isNfcAvalible?null:durationSeconds=10;
    Timer(
      Duration(seconds: durationSeconds),
        () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false)
    );
    //:nfcSettingOn();
  }

  @override
  Widget build(BuildContext context) {
    return isNfcAvalible?MaterialApp.router(
      routerConfig: route,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      builder: (context, _) => Container(color: Colors.white,
        child: Center(child: Image.asset("assets/images/logo/joodle_logo_1.png",),
        ),
      )
    )
        :MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      builder: (context, _) => Container(
        color: Colors.orange,
        child: AlertDialog(
          title: const Text('알림'),
          content: const Text('NFC설정이 켜져 있지 않습니다\n확인 클릭 시 NFC설정으로 넘어갑니다'),
          actions: [
            TextButton(child: Text('확인'),
              onPressed: (){
                _navigateToNfcSettingOn();
              },)
          ],
        ),
      ),
    );
  }

  //get menu image key name
  Future<void> _fetchImageKeys() async {
    const imagePath = "menu-image/";
    List<String> objectKeys = [];
    try {
      final listResult = await Amplify.Storage.list(
        path: imagePath,
        options: const StorageListOptions(
          accessLevel: StorageAccessLevel.guest,
          pluginOptions: S3ListPluginOptions.listAll(),
        ),
      ).result;
      objectKeys = listResult.items.map((item) => item.key).toList().sublist(1);  //첫번째 요소 버림 -> 폴더 이름
      _downloadImageData(objectKeys);
    } on StorageException catch (e) {
      safePrint('Error listing objects: $e');
    }
  }

  //get menu image uint8list value
  void _downloadImageData(List<String> objectKeys) async {
    try {
      List<Uint8List> imageResults = await Future.wait( //objectKeys의 키값으로 이미지의 Uint8List 값을 받아옴
          objectKeys.map((objectKeys) async {
            final result = await Amplify.Storage.downloadData(key: objectKeys).result;
            return Uint8List.fromList(result.bytes);
          })
      );
      ref.read(imageUnit8List.notifier).state = imageResults;
      //for(var imageResult in imageResults){safePrint(imageResult);} //출력
    } on StorageException catch (e) {
      safePrint('Error downloading objects: $e');
    }
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

  Future<void> checkFirstInstall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstInstall = prefs.getBool('_isFirstInstall') ?? true;
    
    if (isFirstInstall){
      Navigator.pushNamedAndRemoveUntil(context, '/landingpage', (route) => false);
      await prefs.setBool('_isFirstInstall', false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }
}
