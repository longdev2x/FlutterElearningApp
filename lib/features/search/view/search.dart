import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/course_tile.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/search/provider/search_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchCourse = ref.watch(searchAsyncNotifierProvider);
    return Scaffold(
      appBar: buildGlobalAppBar(title: 'Search Courses'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const AppSearchBar(),
              SizedBox(height: 10.h),
              fetchCourse.when(
              data: (data) {
                if(data.isEmpty) {
                  return const Center(child: Text('Havn\'t course'));
                }
                return SizedBox(
                  //handler listview, not using expanded
                  height: MediaQuery.of(context).size.height,
                  child: CourseTile(data: data),
                );
              }, 
              error: (error, stackTrace) => const Center(child: Text('Some thing wrong')), 
              loading: () => const Center(child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator()))),
            ],
          ),
        ),
      ),
    );
  }
}

