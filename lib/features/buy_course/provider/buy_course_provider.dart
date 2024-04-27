import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/features/buy_course/repo/buy_course_repo.dart';

final buyCourseProviderFamily = AutoDisposeFutureProviderFamily<String?, int>((ref, id) async {

  CourseRequestEntity courseRequestEntity = CourseRequestEntity(courseId: id);

  var response = await BuyCourseRepo.buyCourseRepo(params: courseRequestEntity);

  if(response==null) {
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