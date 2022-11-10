import 'package:vape_monkeytest/app/contracts/base_service.dart';

import '../../models/api_models/api_forgot_password.dart';
import '../../models/params_model/pm_user_forgot_password_model.dart';

class ForgotPasswordService extends BaseService {
  Future<ApiUserForgotPasswordModel> sendForgotPasswordMail(
      PmUserForgotPasswordModel param) async {
    ApiUserForgotPasswordModel res = ApiUserForgotPasswordModel.initData();
    try {
      res = await appApiRepo.forgotPassword(param.toJson());
    } catch (_) {}
    return res;
  }
}
