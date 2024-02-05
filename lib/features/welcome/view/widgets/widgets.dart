import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';

class AppOnBoardingPage extends StatelessWidget {
  const AppOnBoardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.pageController,
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  final PageController pageController;

  @override
  Widget build(context) {
    return Column(
      children: [
        Image.asset(imagePath, fit: BoxFit.fitHeight),
        const SizedBox(height: 15),
        Text24Normal(text: title),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text16Normal(text: subTitle),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(microseconds: 300),
                  curve: Curves.linear);
            } else {
              //remember if we are firsttime or not
              Global.storageService.setBool(AppConstants.storageDeviceOpenFirstKey, true);
              Navigator.of(context).pushNamed('/signIn');
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 325,
            margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
            decoration: appBoxShadow(),
            child: Text16Normal(
                text: index < 3 ? 'Next' : 'Get Started', color: Colors.white),
          ),
        ),
      ],
    );
  }
}
