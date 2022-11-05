import 'package:cookee_api/constants/core_constants.dart';
import 'package:cookee_api/constants/messages.dart';
import 'package:cookee_api/repo/api_app_general_repo.dart';
import 'package:cookee_api/repo/api_appprofile_repo.dart';
import 'package:vape_monkey2/app/models/api_models/api_get_homedata_model.dart';
import 'package:vape_monkey2/app/models/api_models/api_user_register_model.dart';
import 'package:vape_monkey2/screens/register_screen/register_screen_vm.dart';

import '../../../core/models/api_models/api_status_message.dart';
import '../../constants/web_config_contants.dart';
import '../../contracts/base_repo.dart';
import '../../models/api_models/api_make_auth_model.dart';

class AppApiRepo extends BaseRepo {
  ApiAppGeneralRepo apiGeneralRepo = ApiAppGeneralRepo();
  ApiAppProfileRepo apiProfileRepo = ApiAppProfileRepo();
  final Map<String, dynamic> _resErrorBody = {
    "status": false,
    "message": MS_SERVER_ERROR
  };

  Future<ApiStatusMessageModel> checkServer() async {
    try {
      return ApiStatusMessageModel.fromJson(
          await apiGeneralRepo.getProfileExecute(wcCheckServerUrl));
    } catch (_) {}
    return ApiStatusMessageModel.fromJson(_resErrorBody);
  }

  Future<ApiMakeAuthModel> makeAuth(Map<String, dynamic> body) async {
    try {
      print(
          '................................................... AppApiRepo .....  makeAuth   body === $body   wcLoginUrl === $wcLoginUrl ');
      return ApiMakeAuthModel.fromJson(
          await apiGeneralRepo.postProfileExecute(wcLoginUrl, body));
    } catch (_) {}
    return ApiMakeAuthModel.fromJson(_resErrorBody);
  }
   Future<ApiUserRegisterModel> registerUser(Map<String, dynamic> body) async {
    try {
      print(
          '................................................... AppApiRepo .....  RegisterUser   body === $body   wcRegisterUrl === $wcRegisterUrl ');
      return ApiUserRegisterModel.fromJson(
          await apiGeneralRepo.postProfileExecute(wcRegisterUrl, body));
    } catch (_) {}
    return ApiUserRegisterModel.fromJson(_resErrorBody);
  }

  Map<String, String> getProfileHeader() {
    return {
      WC_ACCESS_TOKKEN_KEY: mainModel!.userTokken,
      WC_USER_ID_KEY: mainModel!.userId,
    };
  }


   Future<ApiGetHomeDataModel> getHomedata() async {
    try {
      return ApiGetHomeDataModel.fromJson(
          await apiProfileRepo.getProfileExecute(wcGetHomeUrl,getProfileHeader()));
    } catch (_) {}
    return ApiGetHomeDataModel.fromJson(_resErrorBody);
  }
}
