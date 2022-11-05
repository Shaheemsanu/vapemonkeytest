import 'package:vape_monkey2/utility/components/footer_button.dart';
import '../../utility/Common/common_navigate.dart';
import '../../utility/Common/text_field_validation.dart';
import '../../utility/Values/app_colors.dart';
import '../../utility/Values/font_utils.dart';
import '../../utility/Values/size_utils.dart';
import '../../utility/Values/utils.dart';
import 'package:flutter/material.dart';
import '../../Utility/Components/custom_text_field.dart';
import '../../utility/values/scroll_behaviour.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController email = TextEditingController();
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
                                "Reset  Password?",
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
                        "We will sent a 6-digit code to your email ",
                        style: FontUtils.getfont12Style(),
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.getHeight(80),
                    ),
                    Form(key: _formkey, child: eMail()), // email customfield
                    SizedBox(
                      height: SizeUtils.getHeight(190),
                    ),
                    FooterButton(
                        // FOOTERBUTTON
                        label: "Next",
                        onPressed:  () {
                          if (_formkey.currentState!.validate()) {
                            CommonNavigate(parentContext: context)
                                .navigateResetPassword();
                          }

                          // CommonNavigate(parentContext: context)
                          //     .navigateResetPassword();
                        }),
                    // SizedBox(
                    //   height: SizeUtils.getHeight(20),
                    // ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget eMail() {
    return CustomTextField(
      validator: (value) {
        return TextFieldValidation.emailValidate(value);
      },
      label: "Email ID",
      controller: email,
      keyboardType: TextInputType.emailAddress, passwordField: true,
    );
  }
}
