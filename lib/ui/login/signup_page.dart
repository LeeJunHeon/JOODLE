import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joodle_ver_one/repo/login_repo.dart';
import 'package:joodle_ver_one/utils/colors.dart';
import 'package:joodle_ver_one/utils/dimensions.dart';

import '../../controller/login_controller.dart';

class SignUpScreen extends ConsumerStatefulWidget {

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => SignUpPageState();
}

class SignUpPageState extends ConsumerState<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }
  // @override
  // void dispose(){
  //   _nameController.dispose();
  //   super.dispose();
  // }
  final _signUpFormKey = GlobalKey<FormState>();

  late bool _passwordHintVisible = true;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  // final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifiedController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _verifiedFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  late String _phoneFormFieldValue = '';
  late String _passwordFormFieldValue = '';
  late String _nameFormFieldValue = '';
  late String _emailFormFieldValue = '';
  late String _verifiedFormFieldValue = '';
  late bool sameUserException = false;

  late bool _submitted = false;

  void _submit() {
    // set this variable to true when we try to submit
    setState(() => _submitted = true);
    if (_signUpFormKey.currentState!.validate()) {
      _signUpFormKey.currentState!.save();
      _phoneFormFieldValue = _phoneFormFieldValue;
      _passwordFormFieldValue = _passwordFormFieldValue;
      _nameFormFieldValue = _nameFormFieldValue;
      _emailFormFieldValue = _emailFormFieldValue;
      _verifiedFormFieldValue = _verifiedFormFieldValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final saveUserName = ref.watch(userNameProvider);

    return Material(
      child: Scaffold(
          body: Form(
            key: _signUpFormKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              ///드래그 하면 키보드 내려감
              //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: SizedBox(
                width: Dimensions.getScreenWidth(context),
                height: Dimensions.getScreenHeight(context),
                child: SafeArea(
                  child: GestureDetector(
                    onTap: (){
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 30),
                      child: _signUpForm(),
                    ),
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }

  Widget _signUpForm() {
    return Material(
      child: Column(
        children: [
          Text("회원가입",
            style: GoogleFonts.inter(
              fontSize: 25.0,
              color: AppColors.orange,
              fontWeight: FontWeight.w600,
            )
          ),
          const Spacer(),
          Text("아래 회원정보를 입력하고 회원가입 버튼을 눌러주세요",
            style: GoogleFonts.inter(),
          ),
          const Spacer(),
          /// phone textField
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
            child: TextFormField(
              controller: _phoneController,
              style: GoogleFonts.inter(
                fontSize: 16.0,
                color: const Color(0xFF151624),
              ),
              maxLines: 1,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
              inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow: true,)],
              cursorColor: const Color(0xFF151624),
              decoration: InputDecoration(
                hintText: '휴대폰 번호를 입력하세요',
                hintStyle: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: const Color(0xFF151624).withOpacity(0.5),
                ),
                counterText: '',
                fillColor: _phoneController.text.isNotEmpty ? Colors.transparent : Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: _phoneController.text.isEmpty ? Colors.transparent : AppColors.textFormFieldFocusRadiusColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: AppColors.textFormFieldFocusRadiusColor,
                    )),
                prefixIcon: Icon(
                  Icons.phone_android_outlined,
                  color: _phoneController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : AppColors.textFormFieldFocusRadiusColor,
                  size: 20,
                ),
                errorStyle: const TextStyle(
                  fontSize: 12.0,
                  height: 0.2,
                  overflow: TextOverflow.ellipsis,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    )
                ),
                errorBorder: InputBorder.none
              ),
              maxLength: 11,
              autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
              //onChanged: (value) => setState(() => _phoneController.text = value),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return '휴대폰 번호를 입력하세요';
                }
                if(value.length < 11){
                  return '휴대폰 번호를 올바르게 입력해주세요';
                }
                if(sameUserException){
                  //TODO: UsernameExistException에 걸리지 않음
                  sameUserException = false;
                  safePrint('fafafsafweqefwafwq  $sameUserException');
                  return '이미 가입된 번호입니다';
                }
                return null;
              },
              //onChanged: (value) => setState(() => _phoneController.text = value),
              onSaved: _phoneController.text.length == 11 ? (value) => setState(() => _phoneFormFieldValue = value!) : null
            ),
          ),

          const Spacer(),
          /// password textField
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
            child: TextFormField(
              controller: _passwordController,
              style: GoogleFonts.inter(
                fontSize: 18.0,
                color: const Color(0xFF151624),
              ),
              maxLines: 1,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _verifiedFocusNode.requestFocus(),
              inputFormatters: [FilteringTextInputFormatter(RegExp('[a-zA-Z0-9!@#\$%^&*?]'), allow: true,)],
              obscureText: true,
              cursorColor: const Color(0xFF151624),
              decoration: InputDecoration(
                hintText: '비밀번호를 입력하세요',
                hintStyle: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: const Color(0xFF151624).withOpacity(0.5),
                ),
                counterText: '',
                fillColor: _passwordController.text.isNotEmpty ? Colors.transparent : Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: _passwordController.text.isEmpty ? Colors.transparent : AppColors.textFormFieldFocusRadiusColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: AppColors.textFormFieldFocusRadiusColor,
                    )),
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: _passwordController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : AppColors.textFormFieldFocusRadiusColor,
                  size: 20,
                ),
                  errorStyle: const TextStyle(
                    fontSize: 12.0,
                    height: 0.2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      )
                  ),
                  errorBorder: InputBorder.none
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
                if (value != null && RegExp(r'(.)\1{2,}').hasMatch(value)){
                  return '같은 문자를 3자 이상 입력할 수 없습니다';
                }
                final passwordReg = RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                if(!passwordReg.hasMatch(value)){
                  return '비밀번호에 문자, 숫자, 특수문자가 포함되어야 합니다';
                }
                return null;
              },
              onChanged: _passwordController.text.length >= 8 ? (value) => setState(() => _passwordHintVisible = false) : (value) => setState(() => _passwordHintVisible = true),
              onSaved: _passwordController.text.length > 8 ? (value) => setState(() => _passwordFormFieldValue = value!) : null,
            ),
          ),
          Visibility(visible: _passwordHintVisible, child: const Text('※문자, 숫자, 특수문자 포함 최소 8자, 최대 16자', style: TextStyle(fontSize: 12,), textAlign: TextAlign.left,)),
          const Spacer(),
          /// password verifiedField
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
            child: TextFormField(
              controller: _verifiedController,
              style: GoogleFonts.inter(
                fontSize: 18.0,
                color: const Color(0xFF151624),
              ),
              maxLines: 1,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _nameFocusNode.requestFocus(),
              inputFormatters: [FilteringTextInputFormatter(RegExp('[a-zA-Z0-9!@#\$%^&*?]'), allow: true,)],
              obscureText: true,
              cursorColor: const Color(0xFF151624),
              decoration: InputDecoration(
                  hintText: '비밀번호를 다시 입력하세요',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16.0,
                    color: const Color(0xFF151624).withOpacity(0.5),
                  ),
                  counterText: '',
                  fillColor: _verifiedController.text.isNotEmpty ? Colors.transparent : Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        color: _verifiedController.text.isEmpty ? Colors.transparent : AppColors.textFormFieldFocusRadiusColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        color: AppColors.textFormFieldFocusRadiusColor,
                      )),
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: _verifiedController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : AppColors.textFormFieldFocusRadiusColor,
                    size: 20,
                  ),
                  errorStyle: const TextStyle(
                    fontSize: 12.0,
                    height: 0.2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      )
                  ),
                  errorBorder: InputBorder.none
              ),
              maxLength: 16,
              autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
              validator: (value){
                if(value == null || value.isEmpty){
                  return '비밀번호를 다시 입력하세요';
                }
                if(value != _passwordController.text){
                  return '비밀번호가 일치하지 않습니다';
                }
                return null;
              },
              onSaved: _verifiedController.text.length > 8 ? (value) => setState(() => _passwordFormFieldValue = value!) : null,
            ),
          ),
          const Spacer(),
          //CustomTextField(textEditingController: _nameController, iconData: Icons.person_2_outlined, hintText: '이름을 입력하세요', textInputType: TextInputType.name, textInputAction: TextInputAction.next,),
          /// name textField
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
            child: TextFormField(
              controller: _nameController,
              style: GoogleFonts.inter(
                fontSize: 18.0,
                color: const Color(0xFF151624),
              ),
              maxLines: 1,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _emailFocusNode.requestFocus(),
              inputFormatters: [FilteringTextInputFormatter(RegExp('[a-zA-Zㄱ-ㅎ가-힣]'), allow: true,)],
              cursorColor: const Color(0xFF151624),
              decoration: InputDecoration(
                hintText: '이름을 입력하세요',
                hintStyle: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: const Color(0xFF151624).withOpacity(0.5),
                ),
                counterText: '',
                fillColor: _nameController.text.isNotEmpty ? Colors.transparent : const Color.fromRGBO(248, 247, 251, 1),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: _nameController.text.isEmpty ? Colors.transparent : const Color.fromRGBO(44, 185, 176, 1),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(44, 185, 176, 1),
                    )),
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                  color: _nameController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : const Color.fromRGBO(44, 185, 176, 1),
                  size: 20,
                ),
                errorStyle: const TextStyle(
                  fontSize: 12.0,
                  height: 0.2,
                  overflow: TextOverflow.ellipsis,
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    )
                ),
                  errorBorder: InputBorder.none
              ),
              maxLength: 16,
              autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return '이름을 입력하세요';
                  }
                  return null;
                },
                onSaved: (value) => setState(() => _nameFormFieldValue = value!)
            ),
          ),
          const Spacer(),
          // CustomTextInput(hintText: '이메일 주소를 입력하세요', textEditingController: _emailController, textInputType: TextInputType.emailAddress,),
          //CustomTextField(textEditingController: _emailController, iconData: Icons.email_outlined, hintText: '이메일을 입력하세요', textInputType: TextInputType.emailAddress, textInputAction: TextInputAction.done),
          /// email textField
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
            child: TextFormField(
              controller: _emailController,
              style: GoogleFonts.inter(
                fontSize: 18.0,
                color: const Color(0xFF151624),
              ),
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              inputFormatters: [FilteringTextInputFormatter(RegExp('[a-zA-Z0-9@.]'), allow: true,)],
              cursorColor: const Color(0xFF151624),
              decoration: InputDecoration(
                hintText: '이메일을 입력하세요',
                hintStyle: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: const Color(0xFF151624).withOpacity(0.5),
                ),
                counterText: '',
                fillColor: _emailController.text.isNotEmpty ? Colors.transparent : const Color.fromRGBO(248, 247, 251, 1),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: _emailController.text.isEmpty ? Colors.transparent : const Color.fromRGBO(44, 185, 176, 1),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(44, 185, 176, 1),
                    )),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: _emailController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : const Color.fromRGBO(44, 185, 176, 1),
                  size: 20,
                ),
                errorStyle: const TextStyle(
                  fontSize: 12.0,
                  height: 0.2,
                  overflow: TextOverflow.ellipsis,
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    )
                ),
                  errorBorder: InputBorder.none
              ),
              maxLength: 40,
                autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return '이메일 주소를 입력하세요';
                  }
                  final emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if(!emailReg.hasMatch(value)){
                    return '유효한 이메일 주소를 입력하세요';
                  }
                  return null;
                },
                onSaved: (value) => setState(() => _nameFormFieldValue = value!)
            ),
          ),
          const Spacer(),
          // CustomTextInput(hintText: '주소를 입력하세요', textEditingController: _addressController, textInputType: TextInputType.text,),
          // const Spacer(),

          const Spacer(),
          SizedBox(
            height: Dimensions.getScreenHeight(context)/13,
            width: Dimensions.getScreenWidth(context),
            child: Container(
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
              child: ElevatedButton(
                onPressed: () {
                  _submit();
                  /// TODO: navigator => signupConfirm page
                  signUpUser(
                      phoneNumber: '+82${_phoneController.text.trim()}',
                      password: _passwordController.text.trim(),
                      username: _nameController.text.trim(),
                      email: _emailController.text.trim());
                  ref.watch(userNameProvider.notifier).state = '+82${_phoneController.text.trim()}';
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.orange,
                ),
                child: Text('회원가입',
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
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text.rich(
              TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: const [
                  TextSpan(
                    text: '이미 우리의 회원이신가요? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '로그인 페이지로',
                    style: TextStyle(
                      color: Color(0xFFFF7248),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}