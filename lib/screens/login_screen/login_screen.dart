import 'package:flutter/material.dart';

import '../../Utility/Components/custom_text_field.dart';
import '../../utility/common/common_navigate.dart';
import '../../utility/common/text_field_validation.dart';
import '../../utility/components/footer_button.dart';
import '../../utility/values/app_colors.dart';
import '../../utility/values/font_utils.dart';
import '../../utility/values/scroll_behaviour.dart';
import '../../utility/values/size_utils.dart';
import '../../utility/values/utils.dart';
import 'login_screen_vm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenVM viewModel = LoginScreenVM();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    viewModel.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                                "Enter your Email to Login",
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
                        "sed do eiusmod tempor incididunt",
                        style: FontUtils.getfont12Style(),
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.getHeight(45),
                    ),
                    eMail(), // EMAIL
                    SizedBox(
                      height: SizeUtils.getHeight(20),
                    ),
                    passWord(), // PASSWORD
                    forgotPassWord(),
                    SizedBox(
                      height: SizeUtils.getHeight(20),
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
                                // FOOTERBUTTON
                                label: "Login",
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    viewModel.makeLogin(_emailController.text,
                                        _passwordController.text);
                                  }

                                  // validateAndSave();
                                  // var email = _emailController.text;
                                  // var password = _passwordController.text;
                                  // print(email);
                                  // print(password);

                                  // if (email == "test@gmail.com" && password == "123") {
                                  //   CommonNavigate(parentContext: context)
                                  //       .navigateHomeScreen();
                                  // } else {
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) => const AlertDialog(
                                  //     title: Text("Incorrect Email or Password !!!"),
                                  //     content: Text("Enter a valid Email & Password"),
                                  //     backgroundColor: AppColors.primaryColor,
                                  //     elevation: 24.0,
                                  //   ),
                                  // );
                                  // }
                                });
                          }
                        }),
                    SizedBox(
                      height: SizeUtils.getHeight(20),
                    ),
                    signUpButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget eMail() {
    return CustomTextField(
      passwordField: false,
      validator: (value) {
        return TextFieldValidation.emailValidate(value);
      },
      controller: _emailController,
      label: "Email ID",
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passWord() {
    return CustomTextField(
      validator: (value) {
        return TextFieldValidation.passWordValidate(value);
      },
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      passwordField: true,
      label: "Password",
    );
  }

  Widget forgotPassWord() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: SizeUtils.getWidth(24)),
          child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.secondaryColor, elevation: 0),
              onPressed: () {
                CommonNavigate(parentContext: context).navigateForgotPassword();
              },
              child: Text(
                "Forgot Password?",
                style: FontUtils.getfont12Style(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w500),
              )),
        )
      ],
    );
  }

  Widget signUpButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Don't have an account?",
        style: FontUtils.getfont14Style(),
      ),
      TextButton(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.secondaryColor, elevation: 0),
          onPressed: () {
            CommonNavigate(parentContext: context).navigateRegisterScreen();
          },
          child: Text(
            "Sign Up",
            style: FontUtils.getfont14Style(
                color: AppColors.black, fontWeight: FontWeight.w600),
          )),
    ]);
  }
}
