import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationNotifierProvider extends StateNotifier<int> {
  NavigationNotifierProvider() : super(0);

  void changIndex(int index) {
    state = index;
  }
}

final navigationNotifierProvider =
    StateNotifierProvider<NavigationNotifierProvider, int>(
  (ref) => NavigationNotifierProvider(),
);
