import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/features/course_detail/repo/course_repo.dart';

final courseDetailFutureProviderFamily = FutureProvider.family<CourseItem?, int>((ref, params) async {
CourseRequestEntity courseRequestEntity = CourseRequestEntity(courseId: params);
  final response = await CourseRepo.courseDetail(params: courseRequestEntity);

  if(response==null){
    return null;
  }

  if(response.code == 200) {
    return response.data;
  } else {
    if (kDebugMode) {
      print("Request faild ---- ${response.code} --- ${response.msg}");
    }
  return null;
  }
});


final lessonFutureProviderFamily = FutureProvider.family<List<LessonItem>?, int?> ((ref, id) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity(id: id);
  final response = await CourseRepo.lessonList(params: lessonRequestEntity);
  if(response == null) {
    return null;
  }
  if(response.code == 200) {
    return response.data;
  } else {
    return null;
  }

});