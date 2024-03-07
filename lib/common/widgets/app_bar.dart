import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    title: Text16Normal(text: title, color: AppColors.primaryText),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1), // Giúp tăng chiều cao của appBar
      child: Container(
        height: 1,
        color: Colors.grey.withOpacity(0.3),
      ),
    ),
  );
}

AppBar buildGlobalAppBar({required String title}) {
  return AppBar(
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}
