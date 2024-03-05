
class CourseDetailResponseEntity {
  final int code;
  final String msg;
  final CourseItem? data;

  CourseDetailResponseEntity(
      {required this.code, required this.msg, this.data});

  factory CourseDetailResponseEntity.formJson(Map<String, dynamic> json) {
    return CourseDetailResponseEntity(
        code: json['code'],
        msg: json['msg'],
        data: CourseItem.fromJson(json['data']));
  }
}

class CourseListResponseEntity {
  int? code;
  String? msg;
  List<CourseItem>? data;

  CourseListResponseEntity({this.code, this.msg, this.data});

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
  String? name;
  String? thumbnail;
  String? video;
  String? description;
  int? id;
  int? price;
  int? lessonNum;
  int? videoLength;
  int? follow;
  double? score;
  DateTime? createdAt;
  DateTime? updatedAt;

  CourseItem(
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
      this.videoLength});

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
