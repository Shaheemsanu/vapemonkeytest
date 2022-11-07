import 'package:flutter/material.dart';

import '../Values/app_colors.dart';
import '../Values/font_utils.dart';
import '../Values/size_utils.dart';

class FooterButton extends StatelessWidget {
  final String label;
  final Color buttonColor;
  final Function() onPressed;
  const FooterButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.buttonColor = AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: SizedBox(
        height: SizeUtils.getHeight(48),
        width: SizeUtils.getWidth(312),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              animationDuration: const Duration(microseconds: 333),
              shadowColor: AppColors.secondaryColor),
          onPressed: onPressed,
          child: Text(
            label,
            style: FontUtils.getfont18Style(),
          ),
        ),
      ),
    );
  }
}
