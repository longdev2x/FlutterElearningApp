import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/lesson_detail/provider/lesson_detail_provider.dart';

class LessonDetailInfo extends StatelessWidget {
  final List<LessonVideoItem>? lessonVideos;
  final WidgetRef ref;
  const LessonDetailInfo({super.key, required this.lessonVideos, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text14Normal(
            text: "Another Video",
            color: AppColors.primaryText,
            fontweight: FontWeight.bold),
        SizedBox(height: 20.h),
        lessonVideos == null
            ? Container()
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: lessonVideos!.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      ref.read(lessonDataVideoProvider.notifier).playNextVideo(lessonVideos![index].url, index);
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 325.w,
                      height: 80.h,
                      padding: EdgeInsets.all(10.w),
                      decoration:
                          appBoxShadow(color: AppColors.primaryBackground),
                      child: lessonVideos == null
                          ? const SizedBox(
                              child: Center(child: Text('No Values')))
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppBoxDecorationImage(
                                  imagePath:
                                      '${AppConstants.imageUploadsPath}${lessonVideos![index].thumbnail}',
                                  boxFit: BoxFit.fitWidth,
                                  height: 50,
                                  width: 50,
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text11Normal(
                                          text: lessonVideos![index].name ??
                                              "No name",
                                          maxLines: 1,
                                          color: AppColors.primaryText),
                                      Text10Normal(
                                        text: lessonVideos![index].name ??
                                            "No name",
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                const Spacer(),
                                const AppImage(
                                    imagePath: ImageRes.arrowRight,
                                    width: 24,
                                    height: 24),
                              ],
                            ),
                    ),
                  );
                }),
      ],
    );
  }
}
