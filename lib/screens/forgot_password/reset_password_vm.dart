import 'dart:async';
import 'package:vape_monkey2/app/contracts/base_view_model.dart';
import 'package:vape_monkey2/app/models/api_models/api_rest_password.dart';
import 'package:vape_monkey2/app/services/auth/rest_password_service.dart';
import '../../Utility/Common/common_navigate.dart';
import '../../Utility/Common/show_toast.dart';
import '../../app/models/params_model/pm_user_rest_password.dart';

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
    //print(param.toJson());

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
}
