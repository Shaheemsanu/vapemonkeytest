import 'package:vape_monkeytest/app/contracts/base_service.dart';

import '../../models/api_models/api_user_register_model.dart';
import '../../models/params_model/pm_user_register_model.dart';

class UserRegisterService extends BaseService {
  ApiUserRegisterModel res = ApiUserRegisterModel.initData();
  register(PmUserRegisterModel param) async {
    try {
      res = await appApiRepo.registerUser(param.toJson());
    } catch (e) {
      print(e);
    }
    return res;
  }
}
