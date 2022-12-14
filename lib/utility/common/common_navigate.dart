import 'package:flutter/material.dart';

import '../../screens/forgot_password/forgot_password.dart';
import '../../screens/forgot_password/reset_password.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/login_screen/login_screen.dart';
import '../../screens/profile_screen/profile_screen.dart';
import '../../screens/register_screen/register_screen.dart';
import '../../screens/spin_wheel/spin_wheel.dart';
import '../../screens/splash_screen/splash_screen.dart';
import '../../screens/web_view/web_view.dart';

class CommonNavigate {
  CommonNavigate({required this.parentContext});
  final BuildContext parentContext;

  navigateSplashScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const SplashScreen()));
  }

  navigateLoginScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  navigateRegisterScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  navigateHomeScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  navigateForgotPassword() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const ForgotPassword()));
  }

  navigateResetPassword(String userId, String email) {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => ResetPassword(
                  email: email,
                  userId: userId,
                )));
  }

  navigateProfileScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const ProfileScreen()));
  }

  navigateBackPage() {
    Navigator.pop(parentContext);
  }

  navigateWebScreen(String url) {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => WebViewScreen(
                  url: url,
                )));
  }

  navigateSpinwheel() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const SpinWheelScreen()));
  }

  navigateServerError() {
    //  ServerErrorDialog(parentContext: parentContext).show();
    // ShowToast(parentContext: parentContext, title: "", message: "Server Error")
    //     .show();
  }

  navigateNoInternet() {
    // NoInternetDialog(parentContext: parentContext).show();
  }
}
