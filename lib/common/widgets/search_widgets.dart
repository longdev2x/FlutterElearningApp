import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/app_text_fields.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

class AppSearchBar extends StatelessWidget {
  final Function()? onTap;
  const AppSearchBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 17.h),
          width: 280.w,
          height: 40.h,
          decoration: appBoxShadow(
              color: AppColors.primaryBackground,
              boxBorder: Border.all(color: AppColors.primaryElement)),
          child: Row(
            children: [
              const AppImage(imagePath: ImageRes.search),
              SizedBox(
                width: 240.w,
                height: 40.h,
                child: const AppTextFieldOnly(
                    width: 240, height: 40, hintText: 'Search your course...'),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(5.w),
            width: 40.w,
            height: 40.h,
            decoration: appBoxShadow(
              boxBorder: Border.all(color: AppColors.primaryElement),
            ),
            child: const AppImage(imagePath: ImageRes.searchButton),
          ),
        ),
      ],
    );
  }
}

