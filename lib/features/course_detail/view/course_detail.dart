import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/features/course_detail/provider/course_detail_provider.dart';

class CourseDetail extends ConsumerWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final argguments = ModalRoute.of(context)!.settings.arguments as int;

    final courseDetailState =
        ref.watch(fetchCourseDetailProvider(argguments));
    return courseDetailState.when(
      data: (data) {
        if (data != null) {
          return Scaffold(
            appBar: AppBar(title: Text(data.name ?? 'Course Detail')),
            body: Column(
              children: [
                Text(data.name ?? 'Course Detail'),
              ],
            ),
          );
        } else {
          return const SizedBox(
              child: Center(child: Text('No course here !!!!')));
        }
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(child: Text('Erorr---$error, $stackTrace')),
        );
      },
      loading: () {
        return Scaffold(
          appBar: AppBar(title: const Text('Course Detail')),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
