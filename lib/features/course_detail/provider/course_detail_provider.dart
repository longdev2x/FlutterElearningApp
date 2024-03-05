import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/features/course_detail/repo/course_detail_repo.dart';

final fetchCourseDetailProvider = FutureProvider.family<CourseItem?, int>((ref, params) async {

  final response = await CourseDetailRepo.courseDetail(id: params);

  if(response==null){
    return null;
  }

  if(response.code == 200) {
    return response.data;
  } else {
    if (kDebugMode) {
      print("Request faild ---- ${response.code} --- ${response.msg}");
    }
  }
  return null;
});