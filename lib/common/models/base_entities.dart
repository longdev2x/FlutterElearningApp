class BaseResponseEntity {
  int? code;
  String? msg;
  String? data;

  BaseResponseEntity({this.code, this.msg, this.data});

  factory BaseResponseEntity.fromJson(Map<String, dynamic> json) => BaseResponseEntity(
    code: json['code'],
    msg: json['msg'],
    data: json['data']
  );
}