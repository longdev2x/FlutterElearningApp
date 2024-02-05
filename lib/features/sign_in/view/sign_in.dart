import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader_notifier/app_loader_notifier_provider.dart.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_text_fields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign_in/controller/sign_in_controller.dart';
import 'package:ulearning_app/features/sign_in/view/widgets/sign_in_widgets.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late SignInController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = SignInController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.emailController;
    _controller.passwordController;
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Login'),
      body: ref.watch(appLoaderNotifierProvider)
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
                color: AppColors.primaryElement,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const ThirdPartyLogin(),
                  const SizedBox(height: 25),
                  const Center(
                      child: Text14Normal(
                          text: 'Or use your email account to login',
                          color: AppColors.primaryElement)),
                  const SizedBox(height: 50),
                  AppTextField(
                      controller: _controller.emailController,
                      text: 'Email',
                      iconPath: ImageRes.user,
                      hintText: 'Enter your email address'),
                  const SizedBox(height: 25),
                  AppTextField(
                      controller: _controller.passwordController,
                      text: 'Password',
                      iconPath: ImageRes.lock,
                      hintText: 'Enter your Password',
                      obscureText: true),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: TextUnderline(text: 'Forgot Password'),
                  ),
                  const SizedBox(height: 110),
                  //button login
                  Center(
                    child: AppButton(
                      buttonName: 'Login',
                      onTap: () {
                        _controller.handleSignIn(ref);
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  //button signup
                  Center(
                    child: AppButton(
                      buttonName: 'Register',
                      isLogin: false,
                      onTap: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
