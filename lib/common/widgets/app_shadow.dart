import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double bR = 2,
    double sR = 1,
    BoxBorder? boxBorder}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius.w),
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
  final double width;
  final double height;
  final String? imagePath;
  final BoxFit boxFit;
  final CourseItem? courseItem;
  final void Function()? voidFunction;

  
  const AppBoxDecorationImage(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.boxFit = BoxFit.fitHeight,
      this.courseItem,
      this.voidFunction,
      this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidFunction,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          image: DecorationImage(
            fit: boxFit,
            image: imagePath != null 
            ? NetworkImage(imagePath!)
            : const AssetImage(ImageRes.profilePhoto) as ImageProvider<Object>,
          ),
        ),
        child: courseItem == null
            ? Container()
            : Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeText(text: courseItem!.name!),
                    FadeText(
                        text: "${courseItem!.lessonNum!} lesson",
                        color: AppColors.primaryFourElementText,
                        fontSize: 8.sp),
                  ],
                ),
              ),
      ),
    );
  }
}
