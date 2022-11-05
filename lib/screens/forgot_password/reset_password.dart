import 'package:flutter/material.dart';
import '../../utility/common/common_navigate.dart';
import '../../utility/common/text_field_validation.dart';
import '../../Utility/Components/custom_text_field.dart';
import '../../utility/components/footer_button.dart';
import '../../utility/components/otp_field.dart';
import '../../utility/values/app_colors.dart';
import '../../utility/values/font_utils.dart';
import '../../utility/values/scroll_behaviour.dart';
import '../../utility/values/size_utils.dart';
import '../../utility/values/utils.dart';

class ResetPassword extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  const ResetPassword({Key? key, this.controller, this.onCompleted})
      : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SizedBox(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          child: ScrollConfiguration(
              behavior: NoGlowScrollBehaviour(),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeUtils.getHeight(281),
                        width: SizeUtils.getScreenWidth(),
                        child: Stack(children: [
                          Image.asset(
                            Utils.getAssetPng("image"),
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: SizeUtils.getWidth(24)),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                height: SizeUtils.getHeight(76),
                                width: SizeUtils.getWidth(208),
                                child: Text(
                                  "Enter code sent to your E-Mail",
                                  style: FontUtils.getfont30Style(),
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: SizeUtils.getWidth(24)),
                        child: Text(
                          "We have sent a 6-digit code to your email ",
                          style: FontUtils.getfont12Style(),
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.getHeight(20),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeUtils.getWidth(24)),
                        child: const OtpField(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeUtils.getWidth(24)),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "Resend Code",
                              style: FontUtils.getfont12Style(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.lightGrey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.getHeight(30),
                      ),
                      newPassword(),
                      SizedBox(
                        height: SizeUtils.getHeight(10),
                      ),
                      confirmPassword(),
                      SizedBox(
                        height: SizeUtils.getHeight(50),
                      ),
                      FooterButton(
                          // FOOTERBUTTON
                          label: "Confirm",
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              CommonNavigate(parentContext: context)
                                  .navigateHomeScreen();
                            }
                          }),
                      SizedBox(
                        height: SizeUtils.getHeight(20),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget newPassword() {
    return CustomTextField(
      validator: (value) {
        return TextFieldValidation.passWordValidate(value);
      },
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      passwordField: true,
      label: "Enter New Password",
    );
  }

  Widget confirmPassword() {
    return CustomTextField(
      validator: (value) {
        return TextFieldValidation.confirmPasswordValidate(
            value, _passwordController.text, _confirmpasswordController.text);
      },
      label: "Confirm New Password",
      controller: _confirmpasswordController,
      passwordField: true,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
