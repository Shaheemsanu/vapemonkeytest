import 'package:flutter/material.dart';
import '../../utility/values/app_colors.dart';
import '../../utility/values/size_utils.dart';

class FontUtils {
  static TextStyle getfont8Style(
      {Color color = AppColors.lightGrey,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        fontSize: SizeUtils.getFont(8),
        fontWeight: fontWeight,
        color: color,
        fontFamily: "Circular Std");
  }

  static TextStyle getfont10Style(
      {Color color = AppColors.lightGrey,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        fontSize: SizeUtils.getFont(10),
        fontWeight: fontWeight,
        color: color,
        fontFamily: "Circular Std");
  }

  static TextStyle getfont12Style(
      {Color color = AppColors.grey,
      FontWeight fontWeight = FontWeight.w400,
      TextDecoration? decoration}) {
    return TextStyle(
        fontSize: SizeUtils.getFont(12),
        fontWeight: fontWeight,
        color: color,
        fontFamily: "Circular Std",
        decoration: decoration);
  }

  static TextStyle getfont14Style(
      {Color color = AppColors.grey,
      FontWeight fontWeight = FontWeight.w400,
      TextDecoration? decoration}) {
    return TextStyle(
        fontSize: SizeUtils.getFont(14),
        fontWeight: fontWeight,
        color: color,
        fontFamily: "Circular Std",
        decoration: decoration);
  }

  static TextStyle getfont18Style(
      {Color color = AppColors.secondaryColor,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
        fontSize: SizeUtils.getFont(18),
        fontWeight: fontWeight,
        color: color,
        fontFamily: "Circular Std");
  }

  static TextStyle getfont26Style(
      {Color color = AppColors.black,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        fontSize: SizeUtils.getFont(26),
        fontWeight: fontWeight,
        color: color,
        fontFamily: "Circular Std");
  }

  static TextStyle getfont30Style(
      {Color color = AppColors.black,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        fontSize: SizeUtils.getFont(30),
        fontWeight: fontWeight,
        color: color,
        fontFamily: "Circular Std");
  }
}
