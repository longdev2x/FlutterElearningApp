import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/home/provider/course_list_provider.dart';
import 'package:ulearning_app/features/home/view/widgets/home_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: homeAppBar(ref, context),
      body: RefreshIndicator(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const HelloText(),
              const UserName(),
              SizedBox(height: 20.h),
              const AppSearchBar(),
              SizedBox(height: 15.h),
              const HomeBanner(),
              SizedBox(height: 15.h),
              const HomeMenuBar(),
              SizedBox(height: 15.h),
              const SingleChildScrollView(child: CourseItemGrid()),
            ],
          ),
        ),
      ),
      onRefresh: () async {
        return ref.refresh(fetchCourseListProvider.future);
      },
      ),
    );
  }
}
