import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final int? maxLines;
  const Text10Normal(
      {super.key,
      required this.text,
      this.maxLines,
      this.color = AppColors.primaryThreeElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontweight;
  final int? maxLines;
  const Text11Normal(
      {super.key,
      required this.text,
      this.fontweight = FontWeight.normal,
      this.maxLines,
      this.color = AppColors.primaryElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: 10.sp,
        fontWeight: fontweight,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontweight;

  const Text14Normal(
      {super.key,
      required this.text,
      this.fontweight = FontWeight.normal,
      this.color = AppColors.primaryThreeElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: fontweight,
      ),
    );
  }
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontweight;

  const Text16Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primarySecondaryElementText,
      this.fontweight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 16.sp,
        fontWeight: fontweight,
      ),
    );
  }
}

class Text24Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontweight;

  const Text24Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primaryText,
      this.fontweight = FontWeight.normal});

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

class FadeText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final int maxLines;
  final TextOverflow textOverflow;
  
  const FadeText(
      {super.key,
      required this.text,
      this.maxLines = 1,
      this.fontSize = 10,
      this.textOverflow = TextOverflow.fade,
      this.color = AppColors.primaryElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      softWrap: null,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
