import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/profile/settings/view/widgets/settings_widgets.dart';
import 'package:ulearning_app/global.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildGlobalAppBar(title: 'Settings'),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      const ListTitle(title: 'Account', icon: ImageRes.user),
                      AppItem(onTap: () {toastInfo('Ok');},title: 'Edit Account'),
                      AppItem(onTap: () {},title: 'Change your password'),
                      AppItem(onTap: () {},title: 'Security & privacy'),
                      const ListTitle(title: 'Notification', icon: ImageRes.bell),
                      AppItem(onTap: () {},title: 'Notification'),
                      AppItem(onTap: () {},title: 'App notification'),
                      const ListTitle(title: 'More', icon: ImageRes.fileDetail),
                      AppItem(onTap: () {},title: 'Language'),
                      AppItem(onTap: () {},title: 'Country'),                         
                    ]),
                  ),
                ),
              ),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: const Text('Confirm Logout'),
                    actions: [
                      TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, 
                      child: const Text('Cancel')),
                      TextButton(
                        onPressed: () {
                          Global.storageService.removeKey(AppConstants.storageUserTokenKey, 0);
                          Global.storageService.removeKey(AppConstants.storageUserProfileKey, 0);
                          Navigator.of(context).pushNamedAndRemoveUntil(AppRoutesNames.signIn, (route) => false,);
                        }, 
                        child: const Text('Confirm')),
                    ],
                  );
                });
              },
              child: Container(
                height: 100.h,
                  margin: EdgeInsets.symmetric(vertical: 30.h),
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageRes.logOut), fit: BoxFit.fitHeight),
                  ),
                ),
            ),
            ],
            
          ),
    );
  }
}