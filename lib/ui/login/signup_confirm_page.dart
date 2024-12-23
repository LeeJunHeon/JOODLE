import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joodle_ver_one/ui/login/login_page.dart';
import 'package:joodle_ver_one/utils/dimensions.dart';
import 'package:joodle_ver_one/utils/signUp_TextFields/customTextField.dart';

import '../../controller/login_controller.dart';
import '../../repo/login_repo.dart';
import '../../utils/colors.dart';
import '../../utils/signUp_TextFields/customNumberField.dart';

class SignUpConfirmScreen extends ConsumerStatefulWidget {
  const SignUpConfirmScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpConfirmScreen> createState() => _SignUpConfirmScreenState();
}

class _SignUpConfirmScreenState extends ConsumerState<SignUpConfirmScreen> {
  @override
  void initState() {
    super.initState();
    final saveUserName = ref.read(userNameProvider);
    //configureAmplify();
  }

  bool isSignUpComplete = false;

  final _verifiedController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return _signUpConfirmForm();
  }

  Widget _signUpConfirmForm(){
    return Scaffold(
      body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: Dimensions.screenWidth,
            height: Dimensions.screenHeight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomNumberField(textEditingController: _verifiedController, iconData: Icons.content_paste_search_outlined, hintText: '인증번호를 입력하세요', textInputAction: TextInputAction.next,),
                    SizedBox(height: Dimensions.getScreenHeight(context)/84.4,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.orange,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4C2E84).withOpacity(0.2),
                            offset: const Offset(0, 15.0),
                            blurRadius: 60.0,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: 50,
                        width: Dimensions.screenWidth,
                        child: ElevatedButton(
                          onPressed: () {
                            _confirmUser(ref.watch(userNameProvider), _verifiedController.text.trim());
                            print(Text("phone number is :            !!${ref.watch(userNameProvider)}!!"));
                        },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.orange,
                          ),
                          child: Text(
                            '확인',
                            style: GoogleFonts.inter(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _confirmUser(String phone, String verifiedCode) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: phone,
          confirmationCode: verifiedCode
      );

      setState(() {
        isSignUpComplete = result.isSignUpComplete;
        /// isSignUpComplete is true
        isSignUpComplete ? Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false):
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Center(child: Text("회원가입에 실패하였습니다. 다시 입력 후 시도해주세요")),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              right: 20,
              left: 20
          ),
        ));
      });
      // Check if further confirmations are needed or if
      // the sign up is complete.
      await handleSignUpResult(result);
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }
}
