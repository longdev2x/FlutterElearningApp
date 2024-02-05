
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/features/application/provider/navigation_notifier_provider.dart';
import 'package:ulearning_app/features/application/view/widgets/widgets.dart';

class ApplicationScreen extends ConsumerWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationNotifierProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: appScreens(index : currentIndex),
          bottomNavigationBar: Container(
            height: 58,
            width: 375,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              onTap: (value) {
                ref.read(navigationNotifierProvider.notifier).changIndex(value);
              },
              currentIndex: currentIndex,
              elevation: 0,
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ),
      ),
    );
  }
}