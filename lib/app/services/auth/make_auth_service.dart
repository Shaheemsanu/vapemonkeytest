import '../../../core/models/api_models/api_action_status_message.dart';
import '../../contracts/base_service.dart';
import '../../models/api_models/api_make_auth_model.dart';
import '../../models/params_model/pm_make_auth_model.dart';

class MakeAuthService extends BaseService {
  Future<ApiActionStatusMessageModel> auth(PmMakeAuthModel param) async {
    print(
        '........................................................MakeAuthService....auth===${param.username}      ${param.password}');
    ApiActionStatusMessageModel finalRes =
        ApiActionStatusMessageModel.loadInit();
    try {
      ApiMakeAuthModel apiRes = await appApiRepo.makeAuth(param.toJson());

      print(
          '........................................................MakeAuthService....apiRes.actionStatus=== ${apiRes.actionStatus}    apiRes.status==${apiRes.status}');
      finalRes = apiRes.loadActionStatus();
      if (apiRes.status!) {
        await prefRepo.setUserId("");
        await prefRepo.setUserTokken(apiRes.accessTokken!);
        mainModel!.userName = apiRes.customerName!;
        // await GetHomeDataService().get();
      }
    } catch (_) {}
    return finalRes;
  }
}


git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Shaheemsanu/vapemonkeytest.git
git push -u origin main