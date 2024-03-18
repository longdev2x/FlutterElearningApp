import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/features/course_detail/provider/course_provider.dart';
import 'package:ulearning_app/features/course_detail/view/widgets/course_detail_widgets.dart';

class CourseDetail extends ConsumerWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arguments = ModalRoute.of(context)!.settings.arguments as int;

    final courseDetailState =
        ref.watch(courseDetailFutureProviderFamily(arguments));
    final fetchListLesson =
        ref.watch(lessonFutureProviderFamily(arguments));
    return courseDetailState.when(
        data: (courseItem) => courseItem == null
            ? const SizedBox(child: Center(child: Text('No course here !!!!')))
            : Scaffold(
                appBar: buildGlobalAppBar(
                  title: courseItem.name ?? 'Course Name',
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        CourseDetailThumbnail(courseItem: courseItem),
                        SizedBox(height: 15.h),
                        CourseDetailIconText(courseItem: courseItem),
                        SizedBox(height: 15.h),
                        CourseDetailDescription(courseItem: courseItem),
                        SizedBox(height: 15.h),
                        const CourseDetailGoBuyButton(),
                        SizedBox(height: 15.h),
                        CourseDetailIncludes(courseItem: courseItem),
                        SizedBox(height: 15.h),
                        fetchListLesson.when(data: (data) => LessonInfo(lessons: data, ref: ref,), error: (error, stackTrace) => Container(), loading: () => const CircularProgressIndicator(),),
                      ],
                    ),
                  ),
                ),
              ),
        error: (error, stackTrace) =>
            Scaffold(body: Center(child: Text('Erorr---$error, $stackTrace'))),
        loading: () => Scaffold(
            appBar: AppBar(title: const Text('Course Detail')),
            body: const Center(child: CircularProgressIndicator())));
  }
}
