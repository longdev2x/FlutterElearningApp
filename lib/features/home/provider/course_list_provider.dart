import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/api/course_api.dart';
import 'package:ulearning_app/common/models/course_entities.dart';

final fetchCourseListProvider = FutureProvider<List<CourseItem>?>((ref) async {
  var result = await CourseAPI.courseList();
  if(result.code==200){
    return result.data;
  }
  return null;
} ); 