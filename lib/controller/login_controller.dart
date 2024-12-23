import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/cupertino.dart';

import '../amplifyconfiguration.dart';
import 'package:joodle_ver_one/main.dart';

import '../models/ModelProvider.dart';
import '../ui/login/signup_page.dart';

bool isSignUpComplete = false;
bool isSignedIn = false;
/*
void configureAmplify() async {
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
*/
/// 로그인 검증 => 로그인 하지 않았으면 isSignedIn 값은 false
Future<bool> isUserSignedIn() async {
  final result = await Amplify.Auth.fetchAuthSession();
  return result.isSignedIn;
}

/// 현재 Login한 유저의 userId와 userName을 값으로 반환
Future<AuthUser> getCurrentUser() async {
  final user = await Amplify.Auth.getCurrentUser();
  return user;
}


/// Signs a user up with a username, password, and email. The required
/// attributes may be different depending on your app's configuration.
Future<void> signUpUser({required String phoneNumber, required String password, required String username, required String email}) async {
  try {
    final userAttributes = {
      AuthUserAttributeKey.email: email,
      AuthUserAttributeKey.name: username,
      // additional attributes as needed
    };
    final result = await Amplify.Auth.signUp(
      username: phoneNumber,
      password: password,
      options: SignUpOptions(
        userAttributes: userAttributes,
      ),
    );
    // Check if further confirmations are needed or if
    // the sign up is complete.
    await handleSignUpResult(result);
  } on InvalidParameterException catch(e) {
    safePrint(e);
  } on UsernameExistsException catch(e) {
    safePrint(e);
    //TODO: setState(){_sameUserException = true}로 바꿔야됨
    sameUserVerifier(SignUpPageState().context);
    print('fafafsafweqefwafwq  $isSignUpComplete');
  } on InvalidPasswordException catch(e) {
    safePrint(e);
  }
  on AuthException catch (e) {
    safePrint('Error signing up user: ${e.message}');
  }
}

Future<void> handleSignUpResult(SignUpResult result) async {
  switch (result.nextStep.signUpStep) {
    case AuthSignUpStep.confirmSignUp:
      navigatorKey.currentState?.pushNamed('/signupconfirm');
      final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
      _handleCodeDelivery(codeDeliveryDetails);
      break;
    case AuthSignUpStep.done:
      navigatorKey.currentState?.pushNamed('/home');
      safePrint('Sign up is complete');
      break;
  }
}

Future<void> handleSignInResult(SignInResult result, String username) async {
  switch (result.nextStep.signInStep) {
    case AuthSignInStep.confirmSignInWithSmsMfaCode:
      final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
      _handleCodeDelivery(codeDeliveryDetails);
      break;
    case AuthSignInStep.confirmSignInWithNewPassword:
      safePrint('Enter a new password to continue signing in');
      break;
    case AuthSignInStep.confirmSignInWithCustomChallenge:
      final parameters = result.nextStep.additionalInfo;
      final prompt = parameters['prompt']!;
      safePrint(prompt);
      break;
    case AuthSignInStep.resetPassword:
      final resetResult = await Amplify.Auth.resetPassword(
        username: username,
      );
      safePrint('AuthSignInStep.resetPassword에 걸렸다');
      await _handleResetPasswordResult(resetResult);
      break;
    case AuthSignInStep.confirmSignUp:
    // Resend the sign up code to the registered device.
      final resendResult = await Amplify.Auth.resendSignUpCode(
        username: username,
      );
      safePrint('AuthSignInStep.confirmSignUp에 걸렸다');
      _handleCodeDelivery(resendResult.codeDeliveryDetails);
      break;
    case AuthSignInStep.done:
      safePrint('Sign in is complete');
      break;
  }
}

Future<void> _handleResetPasswordResult(ResetPasswordResult result) async {
  switch (result.nextStep.updateStep) {
    case AuthResetPasswordStep.confirmResetPasswordWithCode:
      final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
      _handleCodeDelivery(codeDeliveryDetails);
      break;
    case AuthResetPasswordStep.done:
      safePrint('Successfully reset password');
      break;
  }
}

void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
  safePrint(
    'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
        'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
  );
}

void sameUserVerifier(BuildContext context){
  final signUpState = context.findAncestorStateOfType<SignUpPageState>();
  if(signUpState != null){
    signUpState.setState(() {
      signUpState.sameUserException = true;
    });
  }
}

