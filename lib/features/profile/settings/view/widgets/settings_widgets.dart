import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class ListTitle extends StatelessWidget {
  final String? icon;
  final String? title;
  const ListTitle({super.key, this.icon = ImageRes.user, this.title = ''});
  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(children: [
        Image.asset(
          icon!,
          width: 16.w,
          height: 16.h,
        ),
        SizedBox(width: 3.w),
        Text14Normal(text: title!, fontweight: FontWeight.bold, color: AppColors.primaryText)
      ],),
    );
  }
}

class AppItem extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final double? height;
  const AppItem({super.key, this.onTap,this.title = '', this.height = 35});
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height!.h,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(2, -3)
            )
          ],
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text14Normal(text: title!),
            const AppImage(imagePath: ImageRes.arrowRight,)
        ],),
      ),
    );
  }
}