import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

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

class Menu extends StatelessWidget {
  const Menu({super.key});

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
              const Text14Normal(
                  text: '5', color: AppColors.primaryThreeElementText),
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
              const Text14Normal(
                  text: '5', color: AppColors.primaryThreeElementText),
            ],
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

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
        const FadeText(
          text:
              'Thơ tán gái hay giúp bạn thể hiện tâm tư tình cảm của bạn gửi đến người ấy. Thay vì những dòng tin nhắn bắt chuyện nhàm chán với nàng thì những câu thơ tán gái hay dưới đây sẽ gây ấn tượng mạnh mẽ cho những lần trò chuyện. Trong cuộc sống và tình yêu thỉnh thoảng chúng ta cũng nên phá cách, pha trò thì tình cảm mới không nhàm chán và nhạt nhòa. Dưới đây là những bài thơ tán gái hay nhất mọi thời đại mang đến niềm vui và sự thú vị khiến nàng đổ gục trong tích tắc được tổng hợp lại, mời các bạn đọc đón xem!',
          fontSize: 10,
          color: AppColors.primaryThreeElementText,
          maxLines: 5,
          textOverflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class GoBuyButton extends StatelessWidget {
  const GoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toastInfo("Yêu bé Phương nhứt <3");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Ok baby ơii')));
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: appBoxShadow(),
        child: const Center(
            child: Text16Normal(
                text: 'Go Buy', color: AppColors.primaryElementText)),
      ),
    );
  }
}

class CourseIncludes extends StatelessWidget {
  final CourseItem courseItem;

  const CourseIncludes({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text16Normal(
          text: 'The Course Includes',
          color: AppColors.primaryText,
          fontweight: FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(7.w),
              decoration: appBoxShadow(radius: 10),
              child: const AppImage(imagePath: ImageRes.video1),
            ),
            SizedBox(width: 10.w),
            Text11Normal(
              text: "${courseItem.videoLength} Hours Video",
              fontweight: FontWeight.bold,
              color: AppColors.primarySecondaryElementText,
            )
          ],
        ),
        SizedBox(height: 15.h,),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(7.w),
              decoration: appBoxShadow(radius: 10),
              child: const AppImage(imagePath: ImageRes.video1),
            ),
            SizedBox(width: 10.w),
            Text11Normal(
              text: "${courseItem.lessonNum} Lessons Number",
              fontweight: FontWeight.bold,
              color: AppColors.primarySecondaryElementText,
            )
          ],
        ),
        SizedBox(height: 15.h,),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(7.w),
              decoration: appBoxShadow(radius: 10),
              child: const AppImage(imagePath: ImageRes.video1),
            ),
            SizedBox(width: 10.w),
            Text11Normal(
              text: "${courseItem.score} Dowmload Resources",
              fontweight: FontWeight.bold,
              color: AppColors.primarySecondaryElementText,
            )
          ],
        ),
      ],
    );
  }
}
