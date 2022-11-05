import '../../contracts/base_service.dart';

class CheckAuthService extends BaseService {
  /*  Future<ApiActionStatusMessageModel> check() async {
    ApiActionStatusMessageModel finalRes = ApiActionStatusMessageModel.loadInit();
    try {
      String tokken = await PreferenceRepo().getUserTokken();
      String userId = await PreferenceRepo().getUserId();

      if (tokken != "" && userId != "") {
        ApiGetHomeDataModel apiRes = await GetHomeDataService().get();
        finalRes = apiRes.loadActionStatus();
      } else {
        await Future.delayed(const Duration(seconds: 3));
      }
    } catch (_) {}
    return finalRes;
  } */
}
