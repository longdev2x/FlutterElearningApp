import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/course_detail/provider/course_provider.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailThumbnail({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBoxDecorationImage(
          imagePath: "${AppConstants.imageUploadsPath}${courseItem.thumbnail}",
          height: 200,
          width: 325,
          boxFit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}

class CourseDetailIconText extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailIconText({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              decoration: appBoxShadow(radius: 7),
              child: const Text11Normal(text: 'Author Page'),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Row(
            children: [
              const SizedBox(
                child: AppImage(imagePath: ImageRes.people),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text14Normal(
                  text:
                      courseItem.follow != null ? "${courseItem.follow}" : "0",
                  color: AppColors.primaryThreeElementText),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Row(
            children: [
              const SizedBox(
                child: AppImage(imagePath: ImageRes.star),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text14Normal(
                  text: "${courseItem.score ?? 0}",
                  color: AppColors.primaryThreeElementText),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseDetailDescription extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailDescription({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text16Normal(
          text: 'Course Description',
          fontweight: FontWeight.bold,
          color: AppColors.primaryText,
        ),
        SizedBox(height: 10.h),
        FadeText(
          text: courseItem.description ?? "No description",
          fontSize: 10,
          color: AppColors.primaryThreeElementText,
          maxLines: 5,
          textOverflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(onTap: () {}, buttonName: "Go buy");
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailIncludes({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text14Normal(
          text: 'The Course Includes',
          color: AppColors.primaryText,
          fontweight: FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        CourseInfo(
            imagePath: ImageRes.videoDetail,
            lengthAndDesciption: '${courseItem.videoLength ?? 0} Hours Video'),
        SizedBox(
          height: 15.h,
        ),
        CourseInfo(
            imagePath: ImageRes.fileDetail,
            lengthAndDesciption: '${courseItem.lessonNum ?? 0} Lessons Number'),
        SizedBox(
          height: 15.h,
        ),
        CourseInfo(
            imagePath: ImageRes.dowloadDetail,
            lengthAndDesciption:
                '${courseItem.follow ?? 0} Douwnload Resources')
      ],
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  final String lengthAndDesciption;
  const CourseInfo({
    super.key,
    required this.imagePath,
    required this.lengthAndDesciption,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(7.w),
          decoration: appBoxShadow(radius: 10),
          child: AppImage(imagePath: imagePath),
        ),
        SizedBox(width: 10.w),
        Text11Normal(
          text: lengthAndDesciption,
          fontweight: FontWeight.bold,
          color: AppColors.primarySecondaryElementText,
        ),
      ],
    );
  }
}

class LessonInfo extends ConsumerWidget {
  const LessonInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchListLesson =
        ref.watch(lessonFutureProviderFamily(const LessonRequestEntity(id: 4)));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text14Normal(
            text: "Lesson List",
            color: AppColors.primaryText,
            fontweight: FontWeight.bold),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 325.w,
            height: 80.h,
            padding: EdgeInsets.all(10.w),
            decoration: appBoxShadow(color: AppColors.primaryBackground),
            child: fetchListLesson.when(
              data: (data) {
                if (data == null) {
                  return const SizedBox(
                      child: Center(child: Text('No Values')));
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppImage(
                      imagePath: ImageRes.boy,
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text11Normal(
                            text: data[0].name ?? "What are UI design?",
                            color: AppColors.primaryText),
                        Text10Normal(
                            text: data[0].description ?? "What are UI design?"),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    const Spacer(),
                    const AppImage(
                        imagePath: ImageRes.arrowRight, width: 24, height: 24),
                  ],
                );
              },
              error: (error, stackTrace) =>
                  SizedBox(child: Text(error.toString())),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ],
    );
  }
}
