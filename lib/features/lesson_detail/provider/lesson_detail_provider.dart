import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/features/lesson_detail/repo/lesson_detail_repo.dart';
import 'package:video_player/video_player.dart';

late VideoPlayerController videoPlayerController;

final lessonDetailFutureProviderFamily =
    FutureProvider.family<void, int?>((ref, id) async {
  final lessonDetailResponse =
      await LessonDetailRepo.lessonDetail(LessonRequestEntity(id: id));

  if (lessonDetailResponse == null) {
    return;
  }
  if (lessonDetailResponse.code == 200) {
    if (lessonDetailResponse.data == null) {
      return;
    }

    videoPlayerController = VideoPlayerController.networkUrl(Uri(
        path:
            '${AppConstants.imageUploadsPath}${lessonDetailResponse.data![0].url}'));
    var initializeVideoPlayer = videoPlayerController.initialize();
    LessonVideo lessonVideo = LessonVideo(
      initializeVideoPlayer: initializeVideoPlayer,
      lessonItems: lessonDetailResponse.data!,
    );
    ref.read(stateVideoProvider.notifier).state = lessonVideo;
  }
  return;
});

final stateVideoProvider =
    StateProvider<LessonVideo>((ref) => const LessonVideo());

final videoFutureProvider = FutureProvider<LessonVideo>((ref) async {
  LessonVideo lessonVideo = ref.watch(stateVideoProvider);
  return lessonVideo;
});
