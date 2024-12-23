import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/customTextinput.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  @override
  void initState() {
    super.initState();
  }

  final _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  late bool enablePhoneText = true;
  final _verifiedController = TextEditingController();

  final _newPasswordController = TextEditingController();
  final FocusNode _newPasswordFocusNode = FocusNode();

  final _confirmPasswordController = TextEditingController();
  final FocusNode _confirmPasswordNode = FocusNode();

  late bool _showTextField = false;
  late bool _showConfirmButton = false;

  bool isPasswordReset = false;

  final _forgotPasswordScreenFormKey = GlobalKey<FormState>();
  late String _phoneFormFieldValue = '';
  late bool _submitted = false;
  late bool _userNotFoundException = false;
  final passwordReg = RegExp('[a-zA-Z0-9!@#\$%^&*?]');

  void _submit() {
    // set this variable to true when we try to submit
    setState(() => _submitted = true);
    if (_forgotPasswordScreenFormKey.currentState!.validate()) {
      _forgotPasswordScreenFormKey.currentState!.save();
    }
  }
  void _checkInputLength(){
    _phoneController.text.length == 11 ? _showConfirmButton = true : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _forgotPasswordScreenFormKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 휴대폰 번호 입력 폼
                  TextFormField(
                    controller: _phoneController,
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
                      color: const Color(0xFF151624),
                    ),
                    focusNode: _phoneFocusNode,
                    enabled: enablePhoneText,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow: true,)],
                    cursorColor: AppColors.mainColor,
                    decoration: InputDecoration(
                      hintText: '휴대폰 번호를 입력하세요',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16.0,
                        color: const Color(0xFF151624).withOpacity(0.5),
                      ),
                      counterText: '',
                      prefixIcon: Icon(
                        Icons.phone_android_outlined,
                        color: _phoneController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : AppColors.textFormFieldFocusRadiusColor,
                        size: 20,
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                      ),
                      filled: true,
                      fillColor: _showTextField? AppColors.placeholder: Colors.transparent,
                    ),
                    maxLength: 11,
                    autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return '휴대폰 번호를 입력하세요';
                      }
                      if(value.length < 11){
                        return '휴대폰 번호를 올바르게 입력하세요';
                      }
                      if(_userNotFoundException){
                        _userNotFoundException = false;
                        return '존재하지 않는 번호입니다';
                      }
                      return null;
                    },
                    onSaved: _phoneController.text.length == 11 ? (value) => setState(() => _phoneFormFieldValue = value!) : null,
                    onChanged: (value) => _checkInputLength(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      /// 인증번호 받기 버튼
                      Visibility(
                        visible: _showConfirmButton,
                        child: SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              _submit();
                              _resetPassword('+82${_phoneController.text.trim()}');
                          },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.orange,
                            ),
                                child: Text('인증번호 받기', style: GoogleFonts.inter(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600, height: 1.5,),textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  /// 인증번호 입력 폼
                  Visibility(
                    visible: _showTextField,
                      child: TextFormField(
                        controller: _verifiedController,
                        style: GoogleFonts.inter(
                          fontSize: 16.0,
                          color: const Color(0xFF151624),
                        ),
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => _newPasswordFocusNode.requestFocus(),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow: true,)],
                        cursorColor: AppColors.mainColor,
                        decoration: InputDecoration(
                            hintText: '인증번호를 입력하세요',
                            hintStyle: GoogleFonts.inter(
                              fontSize: 16.0,
                              color: const Color(0xFF151624).withOpacity(0.5),
                            ),
                            counterText: '',
                            prefixIcon: Icon(
                              Icons.content_paste_search_outlined,
                              color: _phoneController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : AppColors.textFormFieldFocusRadiusColor,
                              size: 20,
                            ),
                            errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)
                            ),
                        ),
                        maxLength: 6,
                        autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return '인증번호를 입력하세요';
                          }
                          if(value.length < 6){
                            return '인증번호를 6자리 입력하세요';
                          }
                          return null;
                        },
                        onSaved: _phoneController.text.length == 11 ? (value) => setState(() => _phoneFormFieldValue = value!) : null,
                        onChanged: (value) => _checkInputLength(),
                      ),
                  ),
                  const SizedBox(height: 10,),
                  /// 비밀번호 입력 폼
                  Visibility(
                    visible: _showTextField,
                    child: TextFormField(
                      controller: _newPasswordController,
                      style: GoogleFonts.inter(
                        fontSize: 16.0,
                        color: const Color(0xFF151624),
                      ),
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => _confirmPasswordNode.requestFocus(),
                      keyboardType: TextInputType.visiblePassword,
                      inputFormatters: [FilteringTextInputFormatter(passwordReg, allow: true,)],
                      obscureText: true,
                      cursorColor: AppColors.mainColor,
                      decoration: InputDecoration(
                        hintText: '새로운 비밀번호를 입력하세요',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 16.0,
                          color: const Color(0xFF151624).withOpacity(0.5),
                        ),
                        counterText: '',
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: _newPasswordController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : AppColors.textFormFieldFocusRadiusColor,
                          size: 20,
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                        ),
                      ),
                      maxLength: 16,
                      autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return '비밀번호를 입력하세요';
                        }
                        if(value.length < 8){
                          return '비밀번호는 최소 8자여야 합니다';
                        }
                        if (RegExp(r'(.)\1{2,}').hasMatch(value)){
                          return '같은 문자를 3자 이상 입력할 수 없습니다';
                        }
                        final passwordReg = RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if(!passwordReg.hasMatch(value)){
                          return '비밀번호에 문자, 숫자, 특수문자가 포함되어야 합니다';
                        }
                        return null;
                      },
                      onSaved: _newPasswordController.text.length == 11 ? (value) => setState(() => _phoneFormFieldValue = value!) : null,
                    ),
                  ),
                  Visibility(visible: _showTextField, child: Text('※문자, 숫자, 특수문자 포함 최소 8자, 최대 16자', style: TextStyle(fontSize: 12,), textAlign: TextAlign.left,)),
                  const SizedBox(height: 10,),
                  /// 비밀번호 확인 폼
                  Visibility(
                    visible: _showTextField,
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      style: GoogleFonts.inter(
                        fontSize: 16.0,
                        color: const Color(0xFF151624),
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      inputFormatters: [FilteringTextInputFormatter(passwordReg, allow: true,)],
                      obscureText: true,
                      cursorColor: AppColors.mainColor,
                      decoration: InputDecoration(
                        hintText: '비밀번호를 다시 입력해주세요',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 16.0,
                          color: const Color(0xFF151624).withOpacity(0.5),
                        ),
                        counterText: '',
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: _confirmPasswordController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : AppColors.textFormFieldFocusRadiusColor,
                          size: 20,
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                        ),
                      ),
                      maxLength: 16,
                      autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return '비밀번호를 다시 입력하세요';
                        }
                        if(value != _newPasswordController.text){
                          return '비밀번호가 일치하지 않습니다';
                        }
                        return null;
                      },
                      onSaved: _confirmPasswordController.text.length == 11 ? (value) => setState(() => _phoneFormFieldValue = value!) : null,
                    ),
                  ),
                  const SizedBox(height: 40,),
                  // ConfirmButton(function: _resetPassword('+82${_phoneController.text.trim()}'), string: '확인', width: double.infinity,)
                  /// 확인 버튼
                  Visibility(
                    visible: _showTextField,
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          _submit();
                          _confirmResetPassword(
                            phone: '+82${_phoneController.text.trim()}',
                            newPassword: _newPasswordController.text.trim(),
                            confirmationCode: _verifiedController.text.trim(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.orange,
                        ),
                        child: Text(
                          '확인',
                          style: GoogleFonts.inter(
                            fontSize: 18.0,
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
  Future<void> _resetPassword(String phone) async {
    try {
      final result = await Amplify.Auth.resetPassword(
        username: phone,
      );
      setState(() {
        isPasswordReset = result.isPasswordReset;
        _showConfirmButton = false;
        _showTextField = true;
        enablePhoneText = false;
        _phoneFocusNode.unfocus();
      });
    } on UserNotFoundException catch (e) {
      setState(() {
        _userNotFoundException = true;
      });
    } on AmplifyException catch (e) {
      safePrint(e);
    }
  }

  Future<void> _confirmResetPassword({
    required String phone,
    required String newPassword,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmResetPassword(
        username: phone,
        newPassword: newPassword,
        confirmationCode: confirmationCode,
      );
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      safePrint('Password reset complete: ${result.isPasswordReset}');
    } on AuthException catch (e) {
      safePrint('Error resetting password: ${e.message}');
    }
  }
}
