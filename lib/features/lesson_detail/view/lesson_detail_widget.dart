import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/lesson_detail/provider/lesson_detail_provider.dart';

class LessonDetailInfo extends StatelessWidget {
  final List<LessonItem>? lessons;
  final WidgetRef ref;
  const LessonDetailInfo({super.key, required this.lessons, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text14Normal(
            text: "Lesson List",
            color: AppColors.primaryText,
            fontweight: FontWeight.bold),
        SizedBox(height: 20.h),
        lessons == null
            ? Container()
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: lessons!.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      ref.watch(lessonDetailProvider(id: lessons![index].id!));
                      Navigator.of(context)
                          .pushNamed(AppRoutesNames.lessonDetail);
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 325.w,
                      height: 80.h,
                      padding: EdgeInsets.all(10.w),
                      decoration:
                          appBoxShadow(color: AppColors.primaryBackground),
                      child: lessons == null
                          ? const SizedBox(
                              child: Center(child: Text('No Values')))
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppBoxDecorationImage(
                                  imagePath:
                                      '${AppConstants.imageUploadsPath}${lessons![index].thumbnail}',
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
                                          text: lessons![index].name ??
                                              "What are UI design?",
                                          maxLines: 1,
                                          color: AppColors.primaryText),
                                      Text10Normal(
                                        text: lessons![index].name ??
                                            "What are UI design?",
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                const Spacer(),
                                const AppImage(
                                    imagePath: ImageRes.right,
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
