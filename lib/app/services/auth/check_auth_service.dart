import '../../../core/models/api_models/api_action_status_message.dart';
import '../../contracts/base_service.dart';
import '../../models/api_models/api_get_homedata_model.dart';
import '../app/get_home_data_service.dart';

class CheckAuthService extends BaseService {
  Future<ApiActionStatusMessageModel> check() async {
    ApiActionStatusMessageModel finalRes =
        ApiActionStatusMessageModel.loadInit();
    try {
      String tokken = await prefRepo.getUserTokken();
      String userId = await prefRepo.getUserId();

      if (tokken != "" && userId != "") {
        ApiGetHomeDataModel apiRes = await GetHomeDataService().get();
        finalRes = apiRes.loadActionStatus();
      } else {
        await Future.delayed(const Duration(seconds: 3));
      }
    } catch (_) {}
    return finalRes;
  }
}
