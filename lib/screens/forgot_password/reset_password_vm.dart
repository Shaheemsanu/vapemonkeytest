import 'dart:async';
import 'package:vape_monkey2/app/contracts/base_view_model.dart';
import 'package:vape_monkey2/app/models/api_models/api_rest_password.dart';
import 'package:vape_monkey2/app/services/auth/rest_password_service.dart';
import '../../Utility/Common/common_navigate.dart';
import '../../Utility/Common/show_toast.dart';
import '../../app/models/api_models/api_forgot_password.dart';
import '../../app/models/params_model/pm_user_forgot_password_model.dart';
import '../../app/models/params_model/pm_user_rest_password.dart';
import '../../app/services/auth/forgot_password_service.dart';

class ResetPasswordVm extends BaseViewModel {
  @override
  void dispose() {}
  bool loading = false;
  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get loaderStream => _loaderController.stream;

  resetPassword(String otp, String password, String userId) async {
    loading = true;
    _loaderSink.add(loading);
    PmUserResetPasswordModel param = PmUserResetPasswordModel(
      otp: otp,
      password: password,
      userId: userId,
    );

    ApiUserResetPasswordModel res =
        await UserResetPasswordService().sendRestPassword(param);
    if (res.status!) {
      CommonNavigate(parentContext: parentContext!).navigateLoginScreen();
    } else {
      if (res.message! == "") {
        ShowToast(
                title: "",
                message: "Password reset failed",
                parentContext: parentContext!)
            .show();
      } else {
        ShowToast(
                title: "", message: res.message!, parentContext: parentContext!)
            .show();
      }
    }
    loading = false;
    _loaderSink.add(loading);
  }

  bool isloading = false;
  final _resendCodeLoaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _resendCodeLoaderSink =>
      _resendCodeLoaderController.sink;
  Stream<bool> get resendCodeLoaderStream => _resendCodeLoaderController.stream;

  resendCode(String email) async {
    if (!isloading) {
      isloading = true;
      _resendCodeLoaderSink.add(isloading);
      PmUserForgotPasswordModel param = PmUserForgotPasswordModel(email: email);
      ApiUserForgotPasswordModel res =
          await ForgotPasswordService().sendForgotPasswordMail(param);
      if (res.status!) {
        ShowToast(
                title: "",
                message: res.token.toString(),
                parentContext: parentContext!)
            .show();
      } else {
        if (res.message! == "") {
          ShowToast(
                  title: "",
                  message: "Resend OTP failed ",
                  parentContext: parentContext!)
              .show();
        } else {
          ShowToast(
                  title: "",
                  message: res.message!,
                  parentContext: parentContext!)
              .show();
        }
      }
      isloading = false;
      _resendCodeLoaderSink.add(isloading);
    }
  }
}
