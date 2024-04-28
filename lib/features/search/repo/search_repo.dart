import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class SearchRepo {
  static Future<CourseListResponseEntity> courseDefaultSearch() async {
    var response = await HttpUtil().post(
      'api/courseDefaultSearch',
      queryParameters: {'keyword' : 'ok'} 
    );
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> courseSearch({CourseSearchRequest? params}) async {
    var response = await HttpUtil().post(
      'api/courseSearch',
      queryParameters: params?.toJson(), 
    );
    return CourseListResponseEntity.fromJson(response);
  }
}