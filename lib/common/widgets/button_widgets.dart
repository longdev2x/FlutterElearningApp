import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
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


class AppButtonIconText extends StatelessWidget {
  final Function()? onTap;
  final String? icon;
  final String? title;
  final double? height;
  final double? width;
  final double? radius;
  final Color? bgColor;
  final bool? isColumn;
  final Color? textColor;
  final bool isText13;
  const AppButtonIconText({super.key, this.onTap, this.icon, this.title, this.height = 56, this.width = 100, this.bgColor = AppColors.primaryElement, this.radius =  12, this.isColumn = true, this.textColor, this.isText13 = false});

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height!.h,
        width: width!.w,
        padding: EdgeInsets.symmetric(vertical: 0.12*height!.h, horizontal: 0.1*height!.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius!.w),
          border: Border.all(color: AppColors.primaryElement),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ]
        ),
        child: 
        isColumn! ? 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Image.asset(icon ?? ImageRes.defaultImg, height: 0.35*height!.h),
          Text11Normal(text: title ?? "No Name", fontweight: FontWeight.w600, color: textColor ?? AppColors.primaryElementText),
        ],)
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Image.asset(icon ?? ImageRes.defaultImg, height: 0.35*height!.h),
          isText13 
          ? Text14Normal(text: title ?? "No Name", fontweight: FontWeight.w500, color: textColor ?? AppColors.primaryElement)
          : Text11Normal(text: title ?? "No Name", fontweight: FontWeight.w600, color: textColor ?? AppColors.primaryElement),
        ],)
      ),
    );
  }
}

class AppButtonIcon extends StatelessWidget {
  final String? icon;
  final double? height;
  final double? width;
  final double? radius;
  final Color? bgColor;
  const AppButtonIcon({super.key, this.icon, this.height = 40, this.width = 40, this.radius = 8, this.bgColor = AppColors.primaryElement});

  @override
  Widget build(context) {
    return Container(
      height: height!.h,
      width: width!.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius!.w),
      ),
      padding: EdgeInsets.all(height!*0.18.h),
      child: Image.asset(icon ?? ImageRes.defaultImg)
    );
  }
}

