import 'package:vape_monkey2/app/contracts/base_view_model.dart';

import '../../Utility/Common/common_navigate.dart';
import '../../app/services/auth/check_auth_service.dart';
import '../../core/models/api_models/api_action_status_message.dart';

class SplashScreenVM extends BaseViewModel {
  @override
  void dispose() {}
  checkLogin() async {
    ApiActionStatusMessageModel res = await CheckAuthService().check();
    if (res.status!) {
      if (res.actionStatus!) {
        CommonNavigate(parentContext: parentContext!).navigateHomeScreen();
      } else {
        CommonNavigate(parentContext: parentContext!).navigateLoginScreen();
      }
    } else {
      CommonNavigate(parentContext: parentContext!).navigateLoginScreen();
    }
  }
}
