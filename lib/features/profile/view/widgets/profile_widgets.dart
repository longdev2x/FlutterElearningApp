import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/profile/provider/profile_provider.dart/profile_provider.dart';

class Avatar extends StatelessWidget {
  final String? imagePath;
  final String? name;
  const Avatar({super.key, this.imagePath, this.name});

  @override
  Widget build(context) {
    return Consumer(builder: (context, ref, child) {
      var profile = ref.watch(profileStateNotifierProvider);
      return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
        alignment: Alignment.bottomRight,
        height: 80.h,
        width: 80.w,
        decoration:  profile.avatar != null 
        ? BoxDecoration(
          image: DecorationImage(image: NetworkImage('${AppConstants.serverApiUrl}${profile.avatar}'), fit: BoxFit.cover) ,
          borderRadius: const BorderRadius.all(Radius.circular(15))
        )
        : const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageRes.headpic), fit: BoxFit.cover) ,
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: const AppImage(imagePath: ImageRes.editImage, height: 25, width: 25,)
      ),
      SizedBox(height: 15.h),
      Text16Normal(text: name ?? "No Name", fontweight: FontWeight.bold, color: AppColors.primaryText),
    ],);
    },);
  }
}


class Menu extends StatelessWidget {
  const Menu({super.key});
  @override
  Widget build(context) {
    return Consumer(
      builder: (context, ref, child) {
        return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        AppButtonIconText(onTap: () {}, icon: ImageRes.profileVideo,title: 'My Courses',),
        AppButtonIconText(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutesNames.coursesBought);
          }, 
          icon: ImageRes.profileBook,title: 'Course Bought'),
        AppButtonIconText(onTap: () {}, icon: ImageRes.profileStar,title: '4.9'),
      ],);
      },
    );
  }
}

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({super.key});
  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listTile(onTap: () {Navigator.of(context).pushNamed(AppRoutesNames.settings);},icon: ImageRes.settings, title: 'Settings'),
        SizedBox(height: 15.h),
        _listTile(icon: ImageRes.creditCard, title: 'Payment Details'),
        SizedBox(height: 15.h),
        _listTile(icon: ImageRes.award, title: 'Achivement'),
        SizedBox(height: 15.h),
        _listTile(icon: ImageRes.love, title: 'Love'),
        SizedBox(height: 15.h),
        _listTile(icon: ImageRes.reminder, title: 'Learning Reminders'),
        SizedBox(height: 15.h),

    ],);
  }
}

Widget _listTile({String title = '', String icon = '', Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(children: [
      AppButtonIcon(icon: icon,),
      SizedBox(width: 15.w),
      Text14Normal(text: title, color: AppColors.primaryText, fontweight: FontWeight.bold,)
    ],),
  );
}