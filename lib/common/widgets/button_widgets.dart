import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final bool isLogin;
  final double height;
  final double width;
  final void Function() onTap;
  const AppButton(
      {super.key,
      required this.onTap,
      required this.buttonName,
      this.height = 50,
      this.width = 325,
      this.isLogin = true,
      });
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width.w,
        height: height.h,
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
