import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader_notifier/app_loader_notifier_provider.dart.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/sign_up/provider/register_provider.dart';
import 'package:ulearning_app/features/sign_up/repo/sign_up_repo.dart';

class SignUpController {
  const SignUpController({required this.ref});
  final WidgetRef ref;

  void handleSignup() async {
    final state = ref.watch(registerProvider);

    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (username.isEmpty) {
      toastInfo('Username còn trống');
      return;
    }
    if (email.isEmpty) {
      toastInfo('Email còn trống');
      return;
    }
    if (password.isEmpty) {
      toastInfo('Password còn trống');
      return;
    }
    if (username.length < 6) {
      toastInfo('Username phải lớn hơn 6 ký tự');
      return;
    }

    if (password.length < 6) {
      toastInfo('Mật khẩu cần lớn hơn 6 ký tự');
      return;
    }

    if (password != rePassword) {
      toastInfo('Mật khẩu không khớp');
      return;
    }
    var navigator = Navigator.of(ref.context);
    try {
      ref.read(appLoaderNotifierProvider.notifier).updateLoader(true);
      final credential = await SignUpRepo.firebaseSignUp(email, password);
      await credential.user!.sendEmailVerification();
      await credential.user!.updateDisplayName(username);
      ref.read(appLoaderNotifierProvider.notifier).updateLoader(false);
      toastInfo(
          'An email has been to verify your account. Please open $email and confirm that identity ');
      navigator.pop();
    } on FirebaseAuthException catch (exception) {
      if(exception.code=='weak-password') {
        toastInfo('Mật khẩu yếu');
      } else if(exception.code=='email-already-in-use') {
        toastInfo('Email đã được đăng ký');
      } else if(exception.code=='invalid-email') {
        toastInfo('Email không hợp lệ');
      }
      ref.read(appLoaderNotifierProvider.notifier).updateLoader(false);
    }
  }
}
