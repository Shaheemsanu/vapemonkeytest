import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../Values/app_colors.dart';
import '../Values/font_utils.dart';
import '../Values/size_utils.dart';

class OtpField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  const OtpField({Key? key, this.controller, this.onCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      blinkDuration: const Duration(milliseconds: 1),
      length: 6,
      onChanged: (value) {},
      onCompleted: onCompleted,
      textStyle: FontUtils.getfont26Style(),
      animationType: AnimationType.none,
      pinTheme: PinTheme(
          disabledColor: AppColors.logOut,
          borderWidth: SizeUtils.getHeight(1),
          shape: PinCodeFieldShape.box,
          activeColor: AppColors.lightBlue,
          activeFillColor: AppColors.lightBlue,
          inactiveFillColor: AppColors.lightBlue,
          selectedFillColor: AppColors.lightBlue,
          fieldHeight: SizeUtils.getHeight(50),
          fieldWidth: SizeUtils.getHeight(50),
          selectedColor: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(8)),
          inactiveColor: AppColors.dialPad),
      backgroundColor: AppColors.transparent,
      enableActiveFill: true,
      cursorHeight: SizeUtils.getHeight(25),
      keyboardType: TextInputType.number,
      enablePinAutofill: true,
    );
  }
}
