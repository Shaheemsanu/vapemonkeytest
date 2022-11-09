import 'dart:async';
import 'package:vape_monkey2/app/contracts/base_view_model.dart';
import 'package:vape_monkey2/app/services/auth/forgot_password_service.dart';
import 'package:vape_monkey2/utility/common/common_navigate.dart';
import '../../Utility/Common/show_toast.dart';
import '../../app/models/api_models/api_forgot_password.dart';
import '../../app/models/params_model/pm_user_forgot_password_model.dart';

class ForgotPasswordVm extends BaseViewModel {
  @override
  void dispose() {}
  bool loading = false;
  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get loaderStream => _loaderController.stream;

  forgotPassword(String email) async {
    if (!loading) {
      loading = true;
      _loaderSink.add(loading);
      PmUserForgotPasswordModel param = PmUserForgotPasswordModel(email: email);
      //print(param.toJson());
      ApiUserForgotPasswordModel res =
          await ForgotPasswordService().sendForgotPasswordMail(param);
      if (res.status!) {
        String userId = res.customerId.toString();
        // CommonNavigate(parentContext: parentContext!).navigateResetPassword();
        CommonNavigate(parentContext: parentContext!)
            .navigateResetPassword(userId);

        ShowToast(
                title: "",
                message: res.token.toString(),
                parentContext: parentContext!)
            .show();
      } else {
        if (res.message! == "") {
          ShowToast(
                  title: "",
                  message: "Please Enter valid Email",
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
      loading = false;
      _loaderSink.add(loading);
    }
  }
}
