import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void changIndex(int index) {
    state = index;
  }
}

final navigationNotifierProvider =
    StateNotifierProvider<NavigationNotifier, int>(
  (ref) => NavigationNotifier(),
);
