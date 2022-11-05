import '../../../core/models/api_models/api_status_message.dart';
import '../../contracts/base_service.dart';

class LogoutService extends BaseService {
  Future<ApiStatusMessageModel> logoutData() async {
    ApiStatusMessageModel ret =
        ApiStatusMessageModel(message: "", status: true);
    await _mnLogoutUserMeta();
    return ret;
  }

  /* Main Logout data */
  Future<void> _mnLogoutUserMeta() async {
    await prefRepo.setUserTokken("");
  }
}
