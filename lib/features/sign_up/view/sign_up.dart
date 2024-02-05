import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader_notifier/app_loader_notifier_provider.dart.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_text_fields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign_up/controller/sign_up_controller.dart';
import 'package:ulearning_app/features/sign_up/provider/register_provider.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(appLoaderNotifierProvider);
    return Scaffold(
      appBar: buildAppBar(title: 'Register'),
      body: loader
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 3, 4, 4),
                color: AppColors.primaryElement,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const Center(
                      child: Text14Normal(
                          text: 'Enter your detail below & free sign up')),
                  const SizedBox(height: 50),
                  AppTextField(
                      onChanged: (value) => ref
                          .read(registerProvider.notifier)
                          .onUsernameChange(value),
                      text: 'Username',
                      iconPath: ImageRes.user,
                      hintText: 'Enter your username'),
                  const SizedBox(height: 25),
                  AppTextField(
                      onChanged: (value) => ref
                          .read(registerProvider.notifier)
                          .onEmailChange(value),
                      text: 'Email',
                      iconPath: ImageRes.user,
                      hintText: 'Enter your email address'),
                  const SizedBox(height: 25),
                  AppTextField(
                      onChanged: (value) => ref
                          .read(registerProvider.notifier)
                          .onPasswordChange(value),
                      text: 'Password',
                      iconPath: ImageRes.lock,
                      hintText: 'Enter your Password',
                      obscureText: true),
                  const SizedBox(height: 25),
                  AppTextField(
                      onChanged: (value) => ref
                          .read(registerProvider.notifier)
                          .onRePasswordChange(value),
                      text: 'Confirm Password',
                      iconPath: ImageRes.lock,
                      hintText: 'Enter your Confirm Password',
                      obscureText: true),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text14Normal(
                        text:
                            'By create an account you have to agree with our them & condication'),
                  ),
                  const SizedBox(height: 110),
                  //button login
                  Center(
                    child: AppButton(
                      buttonName: 'SignUp',
                      onTap: () {
                        SignUpController(ref: ref).handleSignup();
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
