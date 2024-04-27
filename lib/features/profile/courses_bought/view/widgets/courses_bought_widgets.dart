import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/widgets/course_tile.dart';


class CoursesBoughtWidget extends StatelessWidget {
  final List<CourseItem> data;
  const CoursesBoughtWidget({super.key, required this.data});
  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: CourseTile(data: data),
    );
  }
}
