class CourseRequestEntity{
  final int? courseId;
  const CourseRequestEntity({this.courseId});
  Map<String, dynamic>? toJson() => {
    'course_id' : courseId,
  };
}

class CourseDetailResponseEntity {
  final int code;
  final String msg;
  final CourseItem? data;

  const CourseDetailResponseEntity(
      {required this.code, required this.msg, this.data});

  factory CourseDetailResponseEntity.formJson(Map<String, dynamic> json) {
    return CourseDetailResponseEntity(
        code: json['code'],
        msg: json['msg'],
        data: CourseItem.fromJson(json['data']));
  }
}

class CourseListResponseEntity {
  final int? code;
  final String? msg;
  final List<CourseItem>? data;

  const CourseListResponseEntity({this.code, this.msg, this.data});

  factory CourseListResponseEntity.fromJson(Map<String, dynamic> json) {
    return CourseListResponseEntity(
      code: json['code'],
      msg: json['msg'],
      data: json['data'] == null
          ? []
          : List<CourseItem>.from(json['data'].map((e) {
              return CourseItem.fromJson(e);
            })),
    );
  }
}

class CourseItem {
  final String? name;
  final String? thumbnail;
  final String? video;
  final String? description;
  final int? id;
  final int? price;
  final int? lessonNum;
  final int? videoLength;
  final int? follow;
  final double? score;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CourseItem(
      {this.name,
      this.thumbnail,
      this.video,
      this.description,
      this.id,
      this.price,
      this.lessonNum,
      this.follow,
      this.score,
      this.createdAt,
      this.updatedAt,
      this.videoLength,});

  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      name: json['name'],
      thumbnail: json['thumbnail'],
      video: json['video'],
      description: json['description'],
      id: json['id'],
      price: json['price'],
      lessonNum: json['lesson_num'],
      follow: json['follow'],
      score: json['score'],
      createdAt: json['created_at'],
      videoLength: json['video_length'],
      updatedAt: json['updated_at'],
    );
  }
}
