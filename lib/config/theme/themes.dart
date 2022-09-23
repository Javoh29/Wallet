import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

abstract class Themes {
  const Themes._();
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.primaryLight.scaffoldBg,
      colorScheme: ColorScheme.light(
        secondary: AppColors.primaryLight.shade1,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.baseLight.shade100,
        centerTitle: true,
        titleTextStyle: AppTextStyles.b1Medium.copyWith(color: AppColors.baseLight.shade100),
        iconTheme: IconThemeData(
          color: AppColors.baseLight.shade100,
        ),
      ),
      dividerColor: Colors.transparent,
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryLight.shade1,
            ),
          ),
        ),
        labelPadding: const EdgeInsets.all(12.0),
        labelColor: AppColors.primaryLight.shade1,
        labelStyle: AppTextStyles.b3Medium,
        unselectedLabelColor: AppColors.baseLight.shade50,
        unselectedLabelStyle: AppTextStyles.b3Medium,
      ),
    );
  }
}
