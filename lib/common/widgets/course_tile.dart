import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class CourseTile extends StatelessWidget {
  final List<CourseItem> data;
  const CourseTile({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final course = data[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutesNames.courseDetail,
                    arguments: {'id': course.id});
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 15.h),
                width: double.infinity,
                height: 80.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  )
                ], borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Row(children: [
                      SizedBox(width: 5.w),
                      Container(
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${AppConstants.imageUploadsPath}${course.thumbnail}'),
                                fit: BoxFit.fitHeight),
                          )),
                      SizedBox(width: 5.w),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text14Normal(
                              text: course.name ?? '',
                              color: AppColors.primaryText,
                              fontweight: FontWeight.bold,
                            ),
                            Text11Normal(
                              text: '${course.lessonNum} lessons',
                              color: AppColors.primarySecondaryElementText,
                            )
                          ]),
                    ]),
                    const Spacer(),
                    Text13Normal(
                      text: '\$${course.price.toString()}',
                      color: AppColors.primaryText,
                      fontweight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            );
          });
  }
}