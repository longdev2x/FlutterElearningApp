import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/utils/constants.dart';

class StorageService{
  late final SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  } 
  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }
  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }
  String getString(String key) {
    return _pref.getString(key) ?? '';
  }
  String getUserToken() {
    return _pref.getString(AppConstants.storageUserTokenKey) ?? '';
  }
  bool getDeviceFirstOpen() {
    return  _pref.getBool(AppConstants.storageDeviceOpenFirstKey) ?? false;
  }
  bool isLoggedIn() {
    return _pref.getString(AppConstants.storageUserTokenKey) != null ? true : false;
  }
  UserProfile getUserProfile() {
    var profile = _pref.getString(AppConstants.storageUserProfileKey) ?? '';
    var profileJson = jsonDecode(profile);
    var userProfile = UserProfile.fromJson(profileJson);
    return userProfile;
  }



  Future<bool> removeKey(String key, int seconds) async {
    try {
          Timer(Duration(seconds: seconds), () async { 
      await _pref.remove(key);
    });
    return true;
    } catch(e) {
      return false;
    }
  }
 }