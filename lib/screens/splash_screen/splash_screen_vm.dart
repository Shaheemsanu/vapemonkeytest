import 'package:vape_monkey2/app/contracts/base_view_model.dart';

class SplashScreenVM extends BaseViewModel{
  @override
  void dispose() {
  }
 checkLogin() async {
   /*  ApiActionStatusMessageModel res = await CheckAuthService().check();
    //print(res.actionStatus);
    if (res.status!) {
      if (res.actionStatus!) {
        CommonNavigate(parentContext: parentContext!).navigateHomeScreen();
      } else {
        CommonNavigate(parentContext: parentContext!).navigateLoginScreen();
      }
    } else {
      //handleFailledRequest(res.message!);
      CommonNavigate(parentContext: parentContext!).navigateLoginScreen();
    } */
  }
}