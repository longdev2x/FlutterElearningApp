import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/global.dart';

final fetchUserProfileProvider = FutureProvider<UserProfile>((ref) async {
  return Global.storageService.getUserProfile();
});