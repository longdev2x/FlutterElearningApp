import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/global.dart';

class ProfileStateNotifier extends StateNotifier<UserProfile> {
  ProfileStateNotifier() : super(Global.storageService.getUserProfile());

}

final profileStateNotifierProvider = StateNotifierProvider.autoDispose<ProfileStateNotifier, UserProfile>((ref) {
  return ProfileStateNotifier();
});