import '../../utility/values/app_colors.dart';
import '../../utility/values/size_utils.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({Key? key, this.onTap, this.isWhite = false})
      : super(key: key);
  final Function()? onTap;
  final bool isWhite;

  final Size btnSize = Size(SizeUtils.getHeight(25), SizeUtils.getHeight(25));
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: SizeUtils.getHeight(30),
      width: SizeUtils.getHeight(30),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            alignment: Alignment.center,
            shape: const CircleBorder(),
            padding: EdgeInsetsDirectional.only(start: SizeUtils.getWidth(5)),
            backgroundColor: AppColors.white,
            fixedSize: btnSize,
            tapTargetSize: MaterialTapTargetSize.padded,
            minimumSize: btnSize,
            maximumSize: btnSize),
        onPressed: onTap ??
            () {
              Navigator.pop(context);
            },
        child: Icon(
          Icons.arrow_back_ios,
          color: isWhite ? AppColors.black : AppColors.white,
          size: SizeUtils.getHeight(15),
        ),
      ),
    );
  }
}
