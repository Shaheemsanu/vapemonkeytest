import '../../utility/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static SystemUiOverlayStyle statusBarStyle = const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light);

  static AppBar dummyAppbar = AppBar(
    toolbarHeight: 0,
    elevation: 0,
    backgroundColor: AppColors.white,
    systemOverlayStyle: statusBarStyle,
  );
}
