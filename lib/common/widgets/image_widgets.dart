import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

class AppImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  
  const AppImage(
      {super.key,
      this.imagePath = ImageRes.defaultImg,
      this.width = 16,
      this.height = 16});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width.w,
      height: height.h,
    );
  }
}

class AppImageWithColor extends StatelessWidget {
  const AppImageWithColor(
      {super.key,
      this.imagePath = ImageRes.defaultImg,
      this.width = 16,
      this.height = 16,
      this.color = AppColors.primaryElement});
  final String imagePath;
  final double width;
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width.w,
      height: height.h,
      color: color,
    );
  }
}
