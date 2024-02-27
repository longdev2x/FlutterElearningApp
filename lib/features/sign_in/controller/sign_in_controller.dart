import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader_notifier/app_loader_notifier_provider.dart.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/main.dart';

class SignInController {
  SignInController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleSignIn(WidgetRef ref) async {

    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || !email.contains('@')) {
      toastInfo('Email không hợp lệ');
      return;
    } else if (password.isEmpty || password.length < 6) {
      toastInfo('Mật khẩu không đúng');
      return;
    }

    try {
      ref.read(appLoaderNotifierProvider.notifier).updateLoader(true);

      final credential = await SignInRepo.firebaseSignIn(email, password);

      if(credential.user==null) {
        toastInfo('Could not found user Infor');
        return;
      }
      if(credential.user!=null){
        final userData = credential.user!;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity(
        name: userData.displayName,
        email: userData.email,
        avatar: userData.photoURL,
        type: 1,
        openId: userData.uid,
      );

      asyncPostAllData(loginRequestEntity);
      } else {
        toastInfo('Login error');
      }
      
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'invalid-email') {
        toastInfo('Email không hợp lệ');
      } else if (exception.code == 'invalid-email') {
        toastInfo('Người dùng bị vô hiệu hoá');
      }
      if (exception.code == 'user-not-found') {
        toastInfo('Không tìm thấy người dùng');
      }
      if (exception.code == 'wrong-password') {
        toastInfo('Sai mật khẩu');
      } else {
        toastInfo('Sai đâu đó');
      } 
      ref.read(appLoaderNotifierProvider.notifier).updateLoader(false);
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {

    final result = await SignInRepo.login(loginRequestEntity: loginRequestEntity);

    //have local storage  long@gmail.com Hoàng Long Flutter Dev
    try{
      if(result.code==200){
        //try to remember user info
      Global.storageService.setString(AppConstants.storageUserProfileKey, jsonEncode(result.data));
      Global.storageService.setString(AppConstants.storageUserTokenKey, result.data!.accessToken!);

      navKey.currentState!.pushNamedAndRemoveUntil('/application', (route) => false);
      }
    } catch(exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
    // navigator.pushNamed('/application');
  }
}
