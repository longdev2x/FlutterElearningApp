import 'package:ulearning_app/common/models/base_entities.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class BuyCourseRepo {
  static Future<BaseResponseEntity?> buyCourseRepo({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post('api/checkout', queryParameters: params?.toJson());
    return BaseResponseEntity.fromJson(response);
  }
}