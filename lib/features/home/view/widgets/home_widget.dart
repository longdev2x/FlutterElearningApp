import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/home/provider/banner_dots_provider.dart';
import 'package:ulearning_app/features/home/provider/course_list_provider.dart';
import 'package:ulearning_app/features/home/provider/user_profile_provider.dart';
import 'package:ulearning_app/global.dart';

AppBar homeAppBar(WidgetRef ref) {
  final fetchUserProfile = ref.watch(fetchUserProfileProvider);
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      padding: const EdgeInsets.only(left: 10),
      icon: AppImage(imagePath: ImageRes.menu, width: 18.w, height: 12.h),
    ),
    actions: [
      fetchUserProfile.when(
          data: (data) {
            return GestureDetector(
              onTap: () {},
              child: AppBoxDecorationImage(
                  imagePath: "${AppConstants.serverApiUrl}${data.avatar}"),
            );
          },
          error: (error, stackTrace) => AppImage(
              imagePath: ImageRes.defaultImg, width: 18.w, height: 12.h),
          loading: () => Container()),
    ],
  );
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text24Normal(
        text: 'Hello,',
        color: AppColors.primaryFourElementText,
        fontweight: FontWeight.bold);
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text24Normal(
      text: Global.storageService.getUserProfile().name ?? '',
      fontweight: FontWeight.bold,
    );
  }
}

class HomeBanner extends ConsumerStatefulWidget {
  const HomeBanner({super.key});

  @override
  ConsumerState<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends ConsumerState<HomeBanner> {
  late PageController pageController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pageController = PageController(initialPage: ref.watch(bannerDotsProvider));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // banner
        SizedBox(
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              ref.read(bannerDotsProvider.notifier).changIndex(index);
            },
            children: const [
              BannerContainer(imagePath: ImageRes.banner1),
              BannerContainer(imagePath: ImageRes.banner2),
              BannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        //dots
        DotsIndicator(
          onTap: (position) {
            pageController.animateToPage(position,
                duration: const Duration(microseconds: 300),
                curve: Curves.bounceIn);
          },
          position: ref.watch(bannerDotsProvider),
          dotsCount: 3,
          decorator: DotsDecorator(
            size: const Size.square(9),
            activeSize: const Size(20, 8),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.w),
            ),
            color: AppColors.primaryFourElementText,
            activeColor: AppColors.primaryElement,
          ),
        ),
      ],
    );
  }
}

class BannerContainer extends StatelessWidget {
  const BannerContainer({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325.h,
      width: 160.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // See all course
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text16Normal(
              text: 'Choice your course',
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text10Normal(text: 'See all'),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        // Course item button long@gmail.com
        Row(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: appBoxShadow(
              color: AppColors.primaryElement,
              radius: 7.w,
            ),
            child: const Text11Normal(text: 'All'),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: const Text11Normal(
              text: 'Popular',
              color: AppColors.primaryThreeElementText,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: const Text11Normal(
              text: 'Newest',
              color: AppColors.primaryThreeElementText,
            ),
          ),
        ]),
      ],
    );
  }
}

class CourseItemGrid extends ConsumerWidget {
  const CourseItemGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseState = ref.watch(fetchCourseListProvider);
    return courseState.when(
      data: (data) {
        if (data != null) {
          return GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.6,
            ),
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {},
                splashColor: Colors.black,
                highlightColor: Colors.black,
                child: AppBoxDecorationImage(
                  voidFunction: () async {
                    Navigator.of(context).pushNamed(AppRoutesNames.detail, arguments: data[index].id);
                  },
                  courseItem: data[index],
                  imagePath:
                      '${AppConstants.imageUploadsPath}${data[index].thumbnail!}',
                  boxFit: BoxFit.fitWidth,
                ),
              );
            },
          );
        } else {
          return const SizedBox(
              child: Center(
            child: Text('No have course'),
          ));
        }
      },
      error: (error, stackTrace) {
        return SizedBox(
            child: Center(
          child: Text(error.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 30)),
        ));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
