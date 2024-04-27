import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/features/profile/courses_bought/provider/courses_bought_provider.dart';
import 'package:ulearning_app/features/profile/courses_bought/view/widgets/courses_bought_widgets.dart';

class CoursesBought extends ConsumerWidget {
  const CoursesBought({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchCoursesList = ref.watch(coursesBoughtProvider);
    return Scaffold(
      appBar: buildGlobalAppBar(title: 'Your Courses'),
      body: fetchCoursesList.when(
        data: (data) {
          if(data==null) {
            return const Center(child: Text('Have not courses bought'));
          }
          return CoursesBoughtWidget(data: data);
        }, 
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        }, 
        loading: () {
          return Center(
            child: SizedBox(
              height: 20.h,
              width: 20.w,
              child: const CircularProgressIndicator()),
          );
        }),
    );
  }
}