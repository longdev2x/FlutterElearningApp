import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/profile/provider/profile_provider.dart/profile_provider.dart';
import 'package:ulearning_app/features/profile/view/widgets/profile_widgets.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(context, WidgetRef ref) {
    UserProfile userProfile = ref.watch(profileStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text14Normal(
            text: 'Profile',
            fontweight: FontWeight.normal,
            color: AppColors.primaryText),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Avatar(
                  imagePath:
                      '${AppConstants.serverApiUrl}${userProfile.avatar}',
                  name: userProfile.name),
              SizedBox(
                height: 35.h,
              ),
              const Menu(),
              SizedBox(
                height: 30.h,
              ),
              const ProfileListItem()
            ],
          ),
        ),
      ),
    );
  }
}
