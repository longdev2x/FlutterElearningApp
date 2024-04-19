class LessonRequestEntity {
  final int? id;
  const LessonRequestEntity({this.id});
  Map<String, dynamic>? toJson() => {
        "id": id,
      };
}

class LessonListResponseEntity {
  final int? code;
  final String? msg;
  final List<LessonItem>? data;
  const LessonListResponseEntity({this.code, this.msg, this.data});

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

class LessonDetailResponseEntity {
  final int? code;
  final String? msg;
  final List<LessonVideoItem>? data;
  const LessonDetailResponseEntity({this.code, this.msg, this.data});

  factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) {
    return LessonDetailResponseEntity(
      code: json['code'],
      msg: json['msg'],
      data: json['data'] != null
          ? List<LessonVideoItem>.from(json['data']['video'].map((e) {
              return LessonVideoItem.fromJson(e);
            }))
          : null,
    );
  }
}

class LessonItem {
  final int? id;
  final int? courseId;
  final String? name;
  final String? thumbnail;
  final String? description;
  final List<LessonVideoItem>? video;

  const LessonItem({
    this.id,
    this.courseId,
    this.name,
    this.thumbnail,
    this.description,
    this.video,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) {
    return LessonItem(
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
}

class LessonVideoItem {
  final String? name;
  final String? thumbnail;
  final String? url;

  const LessonVideoItem({this.name, this.thumbnail, this.url});

  factory LessonVideoItem.fromJson(Map<String, dynamic> json) =>
      LessonVideoItem(
        name: json['name'],
        thumbnail: json['thumbnail'],
        url: json['url'],
      );
}

class LessonVideo {
  final List<LessonVideoItem> lessonItems;
  final Future<void>? initializeVideoPlayer;
  final bool isPlay;
  final int index;

  const LessonVideo(
      {this.lessonItems = const <LessonVideoItem>[],
      this.initializeVideoPlayer,
      this.isPlay = false,
      this.index = 0});

  LessonVideo copyWith(
      {List<LessonVideoItem>? lessonItems,
      Future<void>? initializeVideoPlayer,
      bool? isPlay,
      int? index}) {
    return LessonVideo(
      lessonItems: lessonItems ?? this.lessonItems,
      initializeVideoPlayer:
          initializeVideoPlayer ?? this.initializeVideoPlayer,
      isPlay: isPlay ?? this.isPlay,
      index: index ?? this.index,
    );
  }
}
