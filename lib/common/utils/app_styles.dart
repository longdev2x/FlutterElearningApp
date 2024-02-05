
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

class AppTheme{
  static ThemeData appThemeData = ThemeData().copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: AppColors.primaryText),
    ),
  );
}