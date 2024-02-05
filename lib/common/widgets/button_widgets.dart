import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class AppButton extends StatelessWidget{
  const AppButton({super.key, required this.buttonName, this.isLogin = true, required this.onTap});
  final String buttonName;
  final bool isLogin;
  final void Function() onTap;
  @override
  Widget build(context) {
    return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: 325,
      height: 50,
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : Colors.white,
        boxBorder: Border.all(color: AppColors.primaryFourElementText),
      ),
      child: Text16Normal(
        text: buttonName,
        color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
      ),
    ),
  );
  }
}
