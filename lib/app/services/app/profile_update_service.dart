import 'package:vape_monkeytest/app/models/api_models/api_profile_update_model.dart';
import 'package:vape_monkeytest/app/models/params_model/pm_profile_update.dart';
import '../../contracts/base_service.dart';

class ProfileUpdateService extends BaseService {
  Future<ApiProfileUpdateModel> update(PmProfileUpdateModel param) async {
    ApiProfileUpdateModel result = ApiProfileUpdateModel.loadInit();
    try {
      result = await appApiRepo.updateProfile(param.toJson());
      if (result.status! && result.actionStatus!) {
        appModel!.customer = result.customer!;
      }
    } catch (_) {}
    return result;
  }
}
