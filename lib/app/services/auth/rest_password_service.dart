import 'package:vape_monkeytest/app/models/params_model/pm_user_rest_password.dart';

import '../../contracts/base_service.dart';
import '../../models/api_models/api_rest_password.dart';

class UserResetPasswordService extends BaseService {
  Future<ApiUserResetPasswordModel> sendRestPassword(
      PmUserResetPasswordModel param) async {
    ApiUserResetPasswordModel res = ApiUserResetPasswordModel.initData();
    try {
      res = await appApiRepo.restPassword(param.toJson());
    } catch (_) {}
    return res;
  }
}
