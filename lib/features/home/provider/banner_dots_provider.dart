import 'package:flutter_riverpod/flutter_riverpod.dart';

class BannerDotsNotifier extends StateNotifier<int>{
  BannerDotsNotifier() : super(0);
  void changIndex(int index) {
    state = index;
  }
}
final bannerDotsProvider = StateNotifierProvider<BannerDotsNotifier, int>((ref) {
  return BannerDotsNotifier();
},);