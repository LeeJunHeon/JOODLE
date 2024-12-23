import 'dart:async';
import 'dart:typed_data';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joodle_ver_one/nfc_kit.dart';
import 'package:joodle_ver_one/ui/first_time/intro_screen.dart';
import 'package:joodle_ver_one/ui/first_time/landing_screen.dart';
import 'package:joodle_ver_one/ui/first_time/tutorial_complete.dart';
import 'package:joodle_ver_one/ui/first_time/tutorial_page.dart';
import 'package:joodle_ver_one/ui/login/change_password_page.dart';
import 'package:joodle_ver_one/ui/login/forgot_password_page.dart';
import 'package:joodle_ver_one/ui/login/login_page.dart';
import 'package:joodle_ver_one/ui/login/signup_confirm_page.dart';
import 'package:joodle_ver_one/ui/login/signup_page.dart';
import 'package:joodle_ver_one/ui/menu/cart/cart_page.dart';
import 'package:joodle_ver_one/ui/menu/home/home_page.dart';
import 'package:joodle_ver_one/ui/splash_page.dart';
import 'package:joodle_ver_one/ui/menu/detail/detail_page.dart';
import 'package:nfc_manager/nfc_manager.dart';

import 'amplifyconfiguration.dart';
//import 'controller/login_controller.dart';
import 'models/ModelProvider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
bool isNfcAvalible = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  isNfcAvalible = await NfcManager.instance.isAvailable();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JOODLE',
      navigatorKey: navigatorKey,
      home: _isLoading
        ? const Center(child: CircularProgressIndicator())
        : SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/home' : (BuildContext context) => HomePage(),
        '/login' : (BuildContext context) => const LoginPage(),
        '/signup' : (BuildContext context) => const SignUpScreen(),
        '/signupconfirm' : (BuildContext context) => const SignUpConfirmScreen(),
        '/findpassword' : (BuildContext context) => const ForgotPasswordScreen(),
        '/changepassword': (BuildContext context) => const ChangePasswordPage(),
        '/details': (BuildContext context) => const DetailPage(),
        '/shoppingcart': (BuildContext context) => const CartPage(),
        '/nfckit': (context) => const NfcKit(),
        '/landingpage': (context) => const LandingScreen(),
        '/introscreen': (context) => IntroScreen(),
        '/tutorialComplete': (context) => TutorialComplete(),
        '/tutorialPage': (context) => TutorialPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "SplashScreen",
    );
  }
}

Future<void> _configureAmplify() async {
  try {
    final auth =  AmplifyAuthCognito();
    final dataStore =  AmplifyDataStore(modelProvider: ModelProvider.instance);
    final api = AmplifyAPI();
    final storage = AmplifyStorageS3();

    await Amplify.addPlugins([auth, dataStore, api, storage]);

    await Amplify.configure(amplifyconfig);
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}




