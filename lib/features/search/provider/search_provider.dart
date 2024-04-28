import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/features/search/repo/search_repo.dart';


class SearchAsyncNotifier extends AsyncNotifier<List<CourseItem>> {
  SearchAsyncNotifier();
  @override
  FutureOr<List<CourseItem>> build() async {
    final response = await SearchRepo.courseDefaultSearch();
    if(response.code == 200) {
      return response.data ?? [];
    }
    return [];
  }

  searchCourse({String? search}) async {
    final response = await SearchRepo.courseSearch(params: CourseSearchRequest(search: search));
    if(response.code == 200) {
      if(response.data == null) {
        state = const AsyncData([]);
      }
      state = AsyncData(response.data!);
    } else {
        state = const AsyncData([]);
    }
  }

} 

final searchAsyncNotifierProvider = AsyncNotifierProvider<SearchAsyncNotifier, List<CourseItem>> (() {
  return SearchAsyncNotifier();
});