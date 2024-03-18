
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class CourseRepo{
  static Future<CourseDetailResponseEntity?> courseDetail({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post('api/courseDetail', 
    queryParameters: {'id' : params?.toJson()});
    return CourseDetailResponseEntity.formJson(response);
  }

  static Future<LessonListResponseEntity?> lessonList({LessonRequestEntity? params}) async {

    var response = await HttpUtil().post('api/lessonList', queryParameters: params?.toJson());


    return LessonListResponseEntity.fromJson(response);

  }
}