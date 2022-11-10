import 'package:flutter/material.dart';
import 'package:vape_monkeytest/screens/register_screen/register_screen_vm.dart';

import '../../utility/common/common_navigate.dart';
import '../../utility/common/text_field_validation.dart';
import '../../Utility/Components/custom_text_field.dart';
import '../../utility/components/footer_button.dart';
import '../../utility/values/app_colors.dart';
import '../../utility/values/font_utils.dart';
import '../../utility/values/scroll_behaviour.dart';
import '../../utility/values/size_utils.dart';
import '../../utility/values/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenVm viewModel = RegisterScreenVm();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    email.dispose();
    name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
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
                          height: SizeUtils.getHeight(250),
                          width: SizeUtils.getScreenWidth(),
                          child: Stack(children: [
                            Image.asset(
                              Utils.getAssetPng("image"),
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: SizeUtils.getWidth(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: SizeUtils.getHeight(80),
                                  ),
                                  SizedBox(
                                    width: SizeUtils.getWidth(208),
                                    child: Text(
                                      "Enter your information",
                                      style: FontUtils.getfont30Style(),
                                    ),
                                  ),
                                  SizedBox(height: SizeUtils.getHeight(10)),
                                  Text(
                                    "sed do eiusmod tempor incididunt",
                                    style: FontUtils.getfont12Style(),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        userName(),
                        SizedBox(
                          height: SizeUtils.getHeight(10),
                        ),
                        eMail(),
                        SizedBox(
                          height: SizeUtils.getHeight(10),
                        ),
                        passWord(),
                        SizedBox(
                          height: SizeUtils.getHeight(10),
                        ),
                        confirmpassWord(),
                        SizedBox(
                          height: SizeUtils.getHeight(28),
                        ),
                        StreamBuilder<bool>(
                            initialData: false,
                            stream: viewModel.loaderStream,
                            builder: (context, snapshot) {
                              if (snapshot.data!) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return FooterButton(
                                    label: "Register",
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        viewModel.makeRegister(
                                            name.text,
                                            email.text,
                                            _confirmPasswordController.text);
                                      }
                                    });
                              }
                            }),
                        logInButton(),
                      ]),
                ),
              )),
        ),
      ),
    );
  }

  Widget userName() {
    return CustomTextField(
      validator: (value) {
        return TextFieldValidation.nameValidate(value);
      },
      label: "Name",
      keyboardType: TextInputType.name,
      controller: name,
      passwordField: false,
    );
  }

  Widget eMail() {
    return CustomTextField(
      passwordField: false,
      validator: (value) {
        return TextFieldValidation.emailValidate(value);
      },
      label: "Email ID",
      controller: email,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passWord() {
    return CustomTextField(
      validator: (value) {
        return TextFieldValidation.passWordValidate(value);
      },
      label: "Password",
      controller: _passwordController,
      passwordField: true,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget confirmpassWord() {
    return CustomTextField(
      validator: (value) {
        return TextFieldValidation.confirmPasswordValidate(
            value, _passwordController.text, _confirmPasswordController.text);
      },
      label: "Confirm Password",
      controller: _confirmPasswordController,
      passwordField: true,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget logInButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Already have an account?",
        style: FontUtils.getfont14Style(),
      ),
      TextButton(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.secondaryColor, elevation: 0),
          onPressed: () {
            CommonNavigate(parentContext: context).navigateLoginScreen();
          },
          child: Text(
            "Login",
            style: FontUtils.getfont14Style(
                color: AppColors.black, fontWeight: FontWeight.w600),
          )),
    ]);
  }
}
