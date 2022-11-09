import '../../../core/models/api_models/api_status_message.dart';
import '../../contracts/base_service.dart';

class LogoutService extends BaseService {
  final String logoutFailled = "Logout Failed";
  Future<ApiStatusMessageModel> logoutData() async {
    ApiStatusMessageModel ret =
        ApiStatusMessageModel(message: "", status: true);
    ret = await appApiRepo.logoutUser();
    if (ret.status!) {
      await _mnLogoutUserMeta();
    } else {
      ret.message = logoutFailled;
    }
    return ret;
  }

  /* Main Logout data */
  Future<void> _mnLogoutUserMeta() async {
    await prefRepo.setUserTokken("");
  }
}
