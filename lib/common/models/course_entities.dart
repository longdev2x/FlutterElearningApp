class CourseListResponseEntity {
  int? code;
  String? msg;
  List<CourseItem>? data;

  CourseListResponseEntity({this.code, this.msg, this.data});

  CourseListResponseEntity fromJson(Map<String, dynamic> json) { 
    return CourseListResponseEntity(
      code: json['code'],
      msg: json['msg'],
      data: json['data'] == null ? [] : List<CourseItem>.from(
        json['data'].map((e) {
          return CourseItem().fromJson(e);
        })
      ),
    );
  }
}

class CourseItem {
  String? name;
  String? thumbnail;
  String? video;
  String? description;
  int? typeId;
  double? price;
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
      this.typeId,
      this.price,
      this.lessonNum,
      this.follow,
      this.score,
      this.createdAt,
      this.updatedAt,
      this.videoLength});

  CourseItem fromJson(Map<String, dynamic> json) {
    return CourseItem(
        name: json['name'],
        thumbnail: json['thumbnail'],
        video: json['video'],
        description: json['description'],
        typeId: json['id'],
        price: json['price'],
        lessonNum: json['lesson_num'],
        follow: json['follow'],
        score: json['score'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
