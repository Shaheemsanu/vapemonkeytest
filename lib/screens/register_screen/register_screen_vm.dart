import 'dart:async';
import 'package:vape_monkeytest/app/contracts/base_view_model.dart';
import 'package:vape_monkeytest/app/models/params_model/pm_user_register_model.dart';
import '../../Utility/Common/common_navigate.dart';
import '../../Utility/Common/show_toast.dart';
import '../../app/models/api_models/api_user_register_model.dart';
import '../../app/services/auth/user_register_service.dart';

class RegisterScreenVm extends BaseViewModel {
  bool loading = false;
  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get loaderStream => _loaderController.stream;
  @override
  void dispose() {
    _loaderController.close();
  }

  makeRegister(
    String name,
    String email,
    String password,
  ) async {
    if (!loading) {
      loading = true;
      _loaderSink.add(loading);
      PmUserRegisterModel param =
          PmUserRegisterModel(email: email, name: name, password: password);
      ApiUserRegisterModel result = await UserRegisterService().register(param);
      if (result.status!) {
        if (result.actionStatus!) {
          ShowToast(
                  title: "",
                  message: "Registered successfully",
                  parentContext: parentContext!)
              .show();
          await Future.delayed(const Duration(seconds: 4));
          CommonNavigate(parentContext: parentContext!).navigateLoginScreen();
        } else {
          String message = result.message!;
          ShowToast(title: "", message: message, parentContext: parentContext!)
              .show();
        }
      } else {
        handleFailledRequest(result.message!);
      }
      loading = false;
      _loaderSink.add(loading);
    }
  }
}
