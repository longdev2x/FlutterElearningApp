import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/course_detail/provider/course_detail_provider.dart';
import 'package:ulearning_app/features/course_detail/view/widgets/course_detail_widgets.dart';

class CourseDetail extends ConsumerWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final argguments = ModalRoute.of(context)!.settings.arguments as int;

    final courseDetailState = ref.watch(fetchCourseDetailProvider(argguments));
    return courseDetailState.when(
        data: (courseItem) => courseItem == null
            ? const SizedBox(child: Center(child: Text('No course here !!!!')))
            : Scaffold(
                appBar: buildGlobalAppBar(
                  title: courseItem.name ?? 'Course Name',
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      CourseDetailThumbnail(courseItem: courseItem),
                      SizedBox(height: 20.h),
                      const Menu(),
                      SizedBox(height: 20.h),
                      const Description(),
                      SizedBox(height: 20.h),
                      const GoBuyButton(),
                      SizedBox(height: 20.h),
                      CourseIncludes(courseItem: courseItem),
                      SizedBox(height: 20.h),
                      const Row(
                        children: [
                          Text16Normal(text: "Please tell me the questions ...", color: AppColors.primaryText),
                        ],
                      ),
                    ],
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
