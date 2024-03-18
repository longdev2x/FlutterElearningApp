import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRequestEntity {
  final int? type;
  final String? name;
  final String? description;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? openId;
  final int? online;

  const LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.openId,
    this.online,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "description": description,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "open_id": openId,
        "online": online,
      };
}

//api post response msg
class UserLoginResponseEntity {
  final int? code;
  final String? msg;
  final UserProfile? data;

  const UserLoginResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserProfile.fromJson(json["data"]),
      );
}

// login result
class UserProfile {
  final String? accessToken;
  final String? token;
  final String? name;
  final String? description;
  final String? avatar;
  final int? online;
  final int? type;
// Generic Constructor
  const UserProfile({
    this.accessToken,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });
//Name Constructor, factory thì ta có thể retur Contructor
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    // if(json['access_token'] == null) {
    //   //return Constructor trống thông tin để bảo mật thông tin
    //   return UserProfile();
    // }
    return UserProfile(
      accessToken: json["access_token"],
      token: json["token"],
      name: json["name"],
      description: json["description"],
      avatar: json["avatar"],
      online: json["online"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token": token,
        "name": name,
        "description": description,
        "avatar": avatar,
        "online": online,
        "type": type,
      };
}

class UserData {
  final String? token;
  final String? name;
  final String? avatar;
  final String? description;
  final int? online;

  const UserData({
    this.token,
    this.name,
    this.avatar,
    this.description,
    this.online,
  });

  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      token: data?['token'],
      name: data?['name'],
      avatar: data?['avatar'],
      description: data?['description'],
      online: data?['online'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (name != null) "name": name,
      if (avatar != null) "avatar": avatar,
      if (description != null) "description": description,
      if (online != null) "online": online,
    };
  }
}


