import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double bR = 2,
    double sR = 1,
    BoxBorder? boxBorder}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: boxBorder,
    boxShadow: [
      BoxShadow(
        color: Colors.red.withOpacity(0.1),
        blurRadius: bR,
        spreadRadius: sR,
        offset: const Offset(0, 5),
      ),
    ],
  );
}

BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double bR = 2,
    double sR = 1,
    BoxBorder? border}) {
  return BoxDecoration(
    color: color,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.red.withOpacity(0.1),
        blurRadius: bR,
        spreadRadius: sR,
        offset: const Offset(0, 5),
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  Color borderColor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor),
  );
}

class AppBoxDecorationImage extends StatelessWidget {
  const AppBoxDecorationImage(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.boxFit = BoxFit.fitHeight,
      this.imagePath = ImageRes.profilePhoto});
  final double width;
  final double height;
  final String imagePath;
  final BoxFit boxFit;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: DecorationImage(
          fit: boxFit,
          image: NetworkImage(imagePath),
        ),
      ),
    );
  }
}

