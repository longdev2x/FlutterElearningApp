import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/lesson_detail/provider/lesson_detail_provider.dart';
import 'package:ulearning_app/features/lesson_detail/view/lesson_detail_widget.dart';
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
        appBar: buildGlobalAppBar(title: 'Lesson Video'),
        body: Center(
          child: lessonData.value == null ||
                  lessonData.value!.lessonItems.isEmpty ||
                  videoPlayerController == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    lessonData.when(
                        data: (data) {
                          // Duration? position;
                          // videoPlayerController!.position.then((value) {
                          //   position = value;
                          // });
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 325.w,
                                    height: 200.h,
                                    decoration: networkImageDecoration(
                                        url:
                                            '${AppConstants.imageUploadsPath}${data.lessonItems[data.index].thumbnail}'),
                                    child: FutureBuilder(
                                      future: data.initializeVideoPlayer,
                                      //  Future.delayed(const Duration(seconds: 10)),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return AspectRatio(
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
                                  // Positioned(
                                  //   top: MediaQuery.of(context).size.height * 0.12,
                                  //   left: MediaQuery.of(context).size.width * 0.16,
                                  //   child: AnimatedOpacity(
                                  //   opacity: position != null ? 1.0 : 1.0, 
                                  //   duration: const Duration(milliseconds: 1500),
                                  //   child: Text(position != null ? position!.inSeconds.toString() : "position null",style: const TextStyle(color: Colors.white),))),
                                ],
                              ),

                              //Video controls
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 25.w, right: 25.w, top: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //arrow turn back video
                                    GestureDetector(
                                      onTap: () {
                                        if(data.index == 0) {
                                          toastInfo('No Earlier Videos');
                                          return;
                                        }
                                        ref.read(lessonDataVideoProvider.notifier).playNextVideo(data.lessonItems[data.index-1].url, data.index -1);
                                      },
                                      child: AppImage(
                                        width: 24.w,
                                        height: 24.h,
                                        imagePath: ImageRes.left,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.h,
                                    ),
                                    //button play pause video
                                    GestureDetector(
                                      onTap: () {
                                        if (data.isPlay) {
                                          videoPlayerController!.pause();
                                          ref
                                              .read(lessonDataVideoProvider
                                                  .notifier)
                                              .playPause(false);
                                        } else {
                                          videoPlayerController!.play();
                                          ref
                                              .read(lessonDataVideoProvider
                                                  .notifier)
                                              .playPause(true);
                                        }
                                      },
                                      child: AppImage(
                                        width: 24.w,
                                        height: 24.h,
                                        imagePath: data.isPlay
                                            ? ImageRes.pause
                                            : ImageRes.play,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.h,
                                    ),
                                    //Arrow turn right video
                                    GestureDetector(
                                      onTap: () {
                                        if(data.index == data.lessonItems.length) {
                                          toastInfo('No More Videos');
                                          return;
                                        }
                                        ref.read(lessonDataVideoProvider.notifier).playNextVideo(data.lessonItems[data.index+1].url, data.index + 1);
                                      },
                                      child: AppImage(
                                        width: 24.w,
                                        height: 24.h,
                                        imagePath: ImageRes.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              //video list
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: LessonDetailInfo(
                                    lessonVideos: data.lessonItems, ref: ref),
                              ),
                            ],
                          );
                        },
                        error: (e, t) => const Text("error"),
                        loading: () => const Text("Loading")),
                  ],
                ),
        ));
  }
}
