import 'package:flutter/material.dart';
import 'package:vape_monkey2/Utility/Values/font_utils.dart';
import 'package:vape_monkey2/screens/profile_screen/profile_screem_vm.dart';
import '../../Utility/Common/text_field_validation.dart';
import '../../Utility/Components/custom_text_field.dart';
import '../../Utility/Components/footer_button.dart';
import '../../Utility/Values/size_utils.dart';

class ChangePasswordBottomSheet {
  static bottomSheet({required BuildContext context}) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmpasswordController =
        TextEditingController();
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeUtils.getRadius(25)),
              topRight: Radius.circular(SizeUtils.getRadius(25)))),
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Change Password',
                    style: FontUtils.getfont24Style(),
                  ),
                  SizedBox(
                    height: SizeUtils.getHeight(25),
                  ),
                  CustomTextField(
                    validator: (value) {
                      return TextFieldValidation.passWordValidate(value);
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    passwordField: true,
                    label: "Enter New Password",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeUtils.getHeight(10),
                      bottom: SizeUtils.getHeight(20),
                    ),
                    child: CustomTextField(
                      validator: (value) {
                        return TextFieldValidation.confirmPasswordValidate(
                            value,
                            passwordController.text,
                            confirmpasswordController.text);
                      },
                      label: "Confirm New Password",
                      controller: confirmpasswordController,
                      passwordField: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  FooterButton(
                      label: "Confirm",
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          ProfileScreenVM().updateProfile(
                              pContext: context,
                              password: confirmpasswordController.text);
                          Navigator.pop(context);
                        }
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
