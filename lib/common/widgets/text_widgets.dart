import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

class Text10Normal extends StatelessWidget {
  const Text10Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primaryThreeElementText});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
class Text11Normal extends StatelessWidget {
  const Text11Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primaryElementText });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
class Text14Normal extends StatelessWidget {
  const Text14Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primaryThreeElementText});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class Text16Normal extends StatelessWidget {
  const Text16Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primarySecondaryElementText,
      this.fontWeight = FontWeight.normal});
  final String text;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 16.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text24Normal extends StatelessWidget {
  const Text24Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primaryText,
      this.fontweight = FontWeight.normal});
  final String text;
  final Color color;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: fontweight,
      ),
    );
  }
}


class TextUnderline extends StatelessWidget {
  const TextUnderline({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        ),
      ),
    );
  }
}

