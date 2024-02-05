import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexDotNotifier extends StateNotifier<int>{
  IndexDotNotifier() : super(0);

  void changeIndex(int index) {
    state = index;
  }
}

final indexDotProvider = StateNotifierProvider<IndexDotNotifier, int>((ref) {
  return IndexDotNotifier();
});