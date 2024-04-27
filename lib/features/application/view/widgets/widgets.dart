import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/view/home.dart';
import 'package:ulearning_app/features/profile/view/profile_screen.dart';
import 'package:ulearning_app/features/search/view/search.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _botttomIcon(imagepath: ImageRes.home),
      activeIcon: _botttomIcon(
          imagepath: ImageRes.home, color: AppColors.primaryElement),
      label: 'Home'),
  BottomNavigationBarItem(
      icon: _botttomIcon(imagepath: ImageRes.search),
      activeIcon: _botttomIcon(
          imagepath: ImageRes.search,
          color: AppColors.primaryElement),
      label: 'Search'),
  BottomNavigationBarItem(
      icon: _botttomIcon(imagepath: 'assets/icons/play-circle1.png'),
      activeIcon: _botttomIcon(
          imagepath: 'assets/icons/play-circle1.png',
          color: AppColors.primaryElement),
      label: 'Play'),
  BottomNavigationBarItem(
      icon: _botttomIcon(imagepath: ImageRes.message),
      activeIcon: _botttomIcon(
          imagepath: ImageRes.message,
          color: AppColors.primaryElement),
      label: 'Message'),
  BottomNavigationBarItem(
      icon: _botttomIcon(imagepath: 'assets/icons/person2.png'),
      activeIcon: _botttomIcon(
          imagepath: 'assets/icons/person2.png',
          color: AppColors.primaryElement),
      label: 'Profile'),
];

Widget _botttomIcon(
    {double height = 18,
    double width = 18,
    required String imagepath,
    Color color = AppColors.primaryFourElementText}) {
  return SizedBox(
    height: height,
    width: width,
    child: AppImageWithColor(imagePath: imagepath, color: color),
  );
}

Widget appScreens({int index = 0}){
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const Center(child: AppImage(imagePath: ImageRes.play, width: 250)),
    const Center(child: AppImage(imagePath: ImageRes.message, width: 250)),
    const ProfileScreen(),
  ];
  return screens[index];
}

