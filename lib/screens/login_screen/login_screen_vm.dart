import 'dart:async';

import '../../app/contracts/base_view_model.dart';
import '../../app/models/params_model/pm_make_auth_model.dart';
import '../../app/services/auth/make_auth_service.dart';
import '../../core/models/api_models/api_action_status_message.dart';
import '../../utility/Common/common_navigate.dart';
import '../../utility/common/show_toast.dart';

class LoginScreenVM extends BaseViewModel {
  //Login Loading
  bool loading = false;
  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get loaderStream => _loaderController.stream;
  String firebaseTokken = "";

  @override
  void dispose() {
    _loaderController.close();
  }

  makeLogin(String email, String password) async {
    print(
        '........................................................LoginScreenVM....makeLogin===$email      $password');
    String message = "Authentication failed ❗";
    if (!loading) {
      loading = true;
      _loaderSink.add(loading);
      PmMakeAuthModel param = PmMakeAuthModel(
          username: email, password: password, firebaseTokken: firebaseTokken);
      ApiActionStatusMessageModel result = await MakeAuthService().auth(param);
      if (result.status!) {
        if (result.actionStatus!) {
          CommonNavigate(parentContext: parentContext!).navigateHomeScreen();
        } else {
          ///Show error toast - res.message!
          message = result.message!;
          ShowToast(title: "", message: message, parentContext: parentContext!)
              .show();
        }
      } else {
        handleFailledRequest(result.message!);
      }
      loading = false;
      _loaderSink.add(loading);
      print(
          '..................wwwwwwwwwwwreee.io..........................................');
    }
  }
}
