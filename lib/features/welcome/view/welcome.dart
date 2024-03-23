import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/features/welcome/provider/welcome_provider.dart';
import 'package:ulearning_app/features/welcome/view/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerWidget {
  WelcomeScreen({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 80),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                onPageChanged: (index) {
                  ref.read(indexDotProvider.notifier).changeIndex(index);
                },
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  //first page
                   AppOnBoardingPage(
                    index: 1,
                    pageController: _pageController,
                    imagePath: ImageRes.reading,
                    title: 'First See Learning',
                    subTitle:
                        'Forget about of paper all knowledge in one learning',
                  ),
                  //second page
                  AppOnBoardingPage(
                    index: 2,
                    pageController: _pageController,
                    imagePath: ImageRes.man,
                    title: 'Connect With Everyone',
                    subTitle:
                        'Always keep in touch with your tutor and frients. Let\'s get connected',
                  ),
                  //third page
                  AppOnBoardingPage(
                    index: 3,
                    pageController: _pageController,
                    imagePath: ImageRes.boy,
                    title: 'Always Fascinated Learning',
                    subTitle:
                        'Anywhere, anytime. The time is at your discretion. So study wherever',
                  ),
                ],
              ),
              Positioned(
                left: 200,
                bottom: 50,
                child: DotsIndicator(
                  position: index,
                  mainAxisAlignment: MainAxisAlignment.end,
                  dotsCount: 3,
                  decorator: const DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
