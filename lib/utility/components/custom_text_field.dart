import 'package:flutter/material.dart';

import '../Values/app_colors.dart';
import '../Values/font_utils.dart';
import '../Values/size_utils.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final bool passwordField;
  final String? errorMessage;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Function? validator;
  final Function? onTap;
  final bool isReadOnly;

  const CustomTextField(
      {Key? key,
      required this.label,
      this.controller,
      this.passwordField = false,
      this.errorMessage,
      this.suffixIcon,
      this.keyboardType,
      this.onTap,
      this.isReadOnly = false,
      this.validator})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: FontUtils.getfont12Style(
                color: AppColors.grey, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: SizeUtils.getHeight(10),
          ),
          TextFormField(
            readOnly: widget.isReadOnly,
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: widget.passwordField ? obscureText : false,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            style: FontUtils.getfont18Style(
                color: AppColors.black, fontWeight: FontWeight.w500),
            cursorColor: AppColors.black,
            decoration: InputDecoration(
              suffixIcon:
                  widget.passwordField ? passwordIcon() : widget.suffixIcon,
              contentPadding: EdgeInsets.symmetric(
                  vertical: SizeUtils.getHeight(7),
                  horizontal: SizeUtils.getWidth(15)),
              filled: true,
              fillColor: AppColors.textField.withOpacity(0.6),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.logOut),
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.logOut),
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
            ),
            validator: (value) {
              if (widget.validator != null && !widget.validator!(value)) {
                if (widget.errorMessage == null) {
                  return "Please Enter a Valid ${widget.label.toLowerCase()}";
                } else {
                  return widget.errorMessage;
                }
              }
              return null;
            },
          )
        ],
      ),
    );
  }

  Widget passwordIcon() {
    return IconButton(
        splashColor: AppColors.secondaryColor,
        highlightColor: AppColors.secondaryColor,
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: obscureText ? AppColors.lightGrey : AppColors.lightGrey,
        ));
  }
}
