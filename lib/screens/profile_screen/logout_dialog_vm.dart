import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:vape_monkey2/app/contracts/base_view_model.dart';
import 'package:vape_monkey2/app/services/auth/logout_service.dart';
import 'package:vape_monkey2/utility/common/common_navigate.dart';
import 'package:vape_monkey2/utility/common/show_toast.dart';

import '../../core/models/api_models/api_status_message.dart';

class LogoutDialogVm extends BaseViewModel {
  @override
  void dispose() {}
  bool isloading = false;
  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get loaderStream => _loaderController.stream;
  logout({required BuildContext pcontext}) async {
    if (!isloading) {
      isloading = true;
      _loaderSink.add(isloading);
      ApiStatusMessageModel result = await LogoutService().logoutData();
      if (result.status!) {
        ShowToast(
                title: '',
                message: ' You have successfully logged out',
                parentContext: pcontext)
            .show();
        CommonNavigate(parentContext: pcontext).navigateLoginScreen();
      } else {
        ShowToast(title: '', message: 'Logout Failed ', parentContext: pcontext)
            .show();
      }
      isloading = false;
      _loaderSink.add(isloading);
    }
  }
}
