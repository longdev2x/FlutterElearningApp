class LessonRequestEntity {
  final int id;
  const LessonRequestEntity({required this.id});
  Map<String, int>? toJson() => {
        "id": id,
      };
}

class LessonListResponseEntity {
  int? code;
  String? msg;
  List<LessonItem>? data;
  LessonListResponseEntity({this.code, this.msg, this.data});

  factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) {
    return LessonListResponseEntity(
      code: json['code'],
      msg: json['msg'],
      data: json['data'] == null
          ? []
          : List.from(json['data'].map((e) {
              return LessonItem.fromJson(e);
            })),
    );
  }
}

class LessonItem {
  int? id;
  int? courseId;
  String? name;
  String? thumbnail;
  String? description;
  List<LessonVideoItem>? video;

  LessonItem({
    this.id,
    this.courseId,
    this.name,
    this.thumbnail,
    this.description,
    this.video,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) => LessonItem(
        id: json['id'],
        courseId: json['course_id'],
        name: json['name'],
        thumbnail: json['thumbnail'],
        description: json['description'],
        video: json['video'] == null
            ? []
            : List<LessonVideoItem>.from(
                json['video'].map((e) => LessonVideoItem.fromJson(e))),
      );
}

class LessonVideoItem {
  String? name;
  String? thumbnail;
  String? url;

  LessonVideoItem({this.name, this.thumbnail, this.url});

  factory LessonVideoItem.fromJson(Map<String, dynamic> json) =>
      LessonVideoItem(
        name: json['name'],
        thumbnail: json['thumbnail'],
        url: json['url'],
      );
}
