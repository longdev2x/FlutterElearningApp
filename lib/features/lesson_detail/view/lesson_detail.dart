import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/lesson_detail/provider/lesson_detail_provider.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lessonData = ref.watch(lessonDataVideoProvider);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: lessonData.value == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    lessonData.when(
                        data: (data) => Container(
                              width: 325.w,
                              height: 200.h,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.black, Colors.blue],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)),
                              child: FutureBuilder(
                                future: data.initializeVideoPlayer,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return videoPlayerController == null
                                        ? Container()
                                        : AspectRatio(
                                            aspectRatio: 16 / 10,
                                            child: VideoPlayer(
                                                videoPlayerController!),
                                          );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ),
                        error: (e, t) => const Text("error"),
                        loading: () => const Text("Loading")),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: AppImage(
                              width: 24.w,
                              height: 24.h,
                              imagePath: ImageRes.left,
                            ),
                          ),
                          SizedBox(
                            width: 15.h,
                          ),
                          GestureDetector(
                            child: AppImage(
                              width: 24.w,
                              height: 24.h,
                              imagePath: ImageRes.pause,
                            ),
                          ),
                          SizedBox(
                            width: 15.h,
                          ),
                          GestureDetector(
                            child: AppImage(
                              width: 24.w,
                              height: 24.h,
                              imagePath: ImageRes.right,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    // LessonDetailInfo(ref: ref, lessons: ,),
                  ],
                ),
        ));
  }
}

