import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/features/lesson_detail/provider/lesson_detail_provider.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerWidget {
  const LessonDetail({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchVideo = ref.watch(videoFutureProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: fetchVideo.value == null
      ? Container()
      : fetchVideo.when(data: (data) {
        return data!.initializeVideoPlayer == null
        ? Container()
        : FutureBuilder(
          future: data.initializeVideoPlayer, 
          builder: (context, snapshots) {
            if(snapshots.connectionState == ConnectionState.done) {
              return videoPlayerController==null
              ? Container()
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 325.w,
                    height: 200.h,
                    child: VideoPlayer(videoPlayerController!),
                  ),
                ],
              );
            }
            if(snapshots.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            else {
              return const Center(child: Text('Somthing Wrong'));
            }
          });
      }, 
      error: (error, stackTrace) => Center(child: Text(error.toString())), 
      loading: () => const Center(child: CircularProgressIndicator())));
  }
}
