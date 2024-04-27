
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class SignInRepo {
  static Future<UserCredential> firebaseSignIn(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password); 
        return credential; 
  } 


  static Future<UserLoginResponseEntity> login({required LoginRequestEntity loginRequestEntity}) async {
    final responseData = await HttpUtil().post('api/login', queryParameters: loginRequestEntity.toJson());
    return UserLoginResponseEntity.fromJson(responseData);
  }
}
