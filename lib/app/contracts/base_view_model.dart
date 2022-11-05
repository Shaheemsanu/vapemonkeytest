import 'package:flutter/cupertino.dart';

import '../../core/config/module_container.dart';
import '../../core/constants/messages.dart';
import '../../core/repositeries/app/main_model.dart';
import '../../utility/Common/common_navigate.dart';
import '../config/app_module_container.dart';
import '../repositeries/app/app_model.dart';

abstract class BaseViewModel {
  BuildContext? parentContext;
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
  AppModel? appModel = AppModuleContainer.moduleInjector?.get<AppModel>();

  void setContext(BuildContext context) {
    parentContext = context;
  }

  void dispose();

  void handleFailledRequest(String message) {
    if (message == MS_NO_INTERNET_CONNECTION) {
      CommonNavigate(parentContext: parentContext!).navigateNoInternet();
    } else if (message == MS_SERVER_ERROR) {
      CommonNavigate(parentContext: parentContext!).navigateServerError();
    } else {
      CommonNavigate(parentContext: parentContext!).navigateSplashScreen();
    }
  }
}
