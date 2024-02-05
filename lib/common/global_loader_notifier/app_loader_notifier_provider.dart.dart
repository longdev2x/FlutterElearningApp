import 'package:flutter_riverpod/flutter_riverpod.dart';


class AppLoaderNotifierProvider extends StateNotifier<bool>{
  AppLoaderNotifierProvider() : super(false);

  void updateLoader(bool loader) {
    state = loader;
  }
}

final appLoaderNotifierProvider = StateNotifierProvider<AppLoaderNotifierProvider, bool>((ref) {
  return AppLoaderNotifierProvider();
});