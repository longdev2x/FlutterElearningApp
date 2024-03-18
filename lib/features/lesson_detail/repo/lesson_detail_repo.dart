import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class LessonDetailRepo {
  static Future<LessonDetailResponseEntity?> lessonDetail(LessonRequestEntity params) async {
    final response = await HttpUtil().post('api/lessonDetail', queryParameters: const LessonRequestEntity(id: 3).toJson());
    return LessonDetailResponseEntity.fromJson(response);
  }
}