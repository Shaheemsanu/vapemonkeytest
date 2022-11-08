import 'package:vape_monkey2/app/models/api_models/api_profile_update_model.dart';
import 'package:vape_monkey2/app/models/params_model/pm_profile_update.dart';
import '../../contracts/base_service.dart';

class ProfileUpdateService extends BaseService {
  Future<ApiProfileUpdateModel> update(PmProfileUpdateModel param) async {
    ApiProfileUpdateModel result = ApiProfileUpdateModel.loadInit();
    try {
      print('--------------------------------------------');
      result = await appApiRepo.updateProfile(param.toJson());
      print(
          '.............  ProfileUpdateService - update ..... msg == ${result.message}....... id . ${result.customer!.id!}.... name . ${result.customer!.name!}.............');
      if (result.status! && result.actionStatus!) {
        print(
            '.............  ProfileUpdateService - updat - result.status! && result.actionStatus! ....................${result.customer!.name!}');
        appModel!.customer = result.customer!;
      }
    } catch (_) {}
    return result;
  }
}
