import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/features/profile/courses_bought/repo/courses_bought_repo.dart';

final coursesBoughtProvider = FutureProvider<List<CourseItem>?>((ref) async {
  final CourseListResponseEntity response = await CoursesBoughtRepo.coursesBought();
      print('code---${response.code}, data --- ${response.data}');
  if(response.code == 200) {
    return response.data;
  } else {
    return null;
  }
});