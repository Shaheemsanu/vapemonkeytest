import 'package:cookee_api/constants/core_constants.dart';
import 'package:cookee_api/constants/messages.dart';
import 'package:cookee_api/repo/api_app_general_repo.dart';
import 'package:cookee_api/repo/api_appprofile_repo.dart';
import 'package:vape_monkeytest/app/models/api_models/api_forgot_password.dart';
import 'package:vape_monkeytest/app/models/api_models/api_get_homedata_model.dart';
import 'package:vape_monkeytest/app/models/api_models/api_user_register_model.dart';

import '../../../core/models/api_models/api_status_message.dart';
import '../../constants/web_config_contants.dart';
import '../../contracts/base_repo.dart';
import '../../models/api_models/api_make_auth_model.dart';
import '../../models/api_models/api_profile_update_model.dart';
import '../../models/api_models/api_rest_password.dart';

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
      return ApiMakeAuthModel.fromJson(
          await apiGeneralRepo.postProfileExecute(wcLoginUrl, body));
    } catch (_) {}
    return ApiMakeAuthModel.fromJson(_resErrorBody);
  }

  Future<ApiUserRegisterModel> registerUser(Map<String, dynamic> body) async {
    try {
      return ApiUserRegisterModel.fromJson(
          await apiGeneralRepo.postProfileExecute(wcRegisterUrl, body));
    } catch (_) {}
    return ApiUserRegisterModel.fromJson(_resErrorBody);
  }

  Future<ApiGetHomeDataModel> getHomedata() async {
    try {
      return ApiGetHomeDataModel.fromJson(await apiProfileRepo
          .getProfileExecute(wcGetHomeUrl, getProfileHeader()));
    } catch (_) {}
    return ApiGetHomeDataModel.fromJson(_resErrorBody);
  }

  Future<ApiProfileUpdateModel> updateProfile(Map<String, dynamic> body) async {
    try {
      return ApiProfileUpdateModel.fromJson(await apiProfileRepo
          .postProfileExecute(wcProfileUpdateUrl, body, getProfileHeader()));
    } catch (e) {
      print(e);
    }
    return ApiProfileUpdateModel.fromJson(_resErrorBody);
  }

  Future<ApiStatusMessageModel> logoutUser() async {
    try {
      return ApiStatusMessageModel.fromJson(await apiProfileRepo
          .getProfileExecute(wcLogoutUrl, getProfileHeader()));
    } catch (e) {
      print(e);
    }
    return ApiStatusMessageModel.fromJson(_resErrorBody);
  }

  Future<ApiUserForgotPasswordModel> forgotPassword(
      Map<String, dynamic> body) async {
    try {
      return ApiUserForgotPasswordModel.fromJson(await apiGeneralRepo
          .postProfileJsonExecute(wcForgotPasswordurl, body));
    } catch (e) {
      print(e);
    }
    return ApiUserForgotPasswordModel.fromJson(_resErrorBody);
  }

  Future<ApiUserResetPasswordModel> restPassword(
      Map<String, dynamic> body) async {
    try {
      return ApiUserResetPasswordModel.fromJson(await apiGeneralRepo
          .postProfileJsonExecute(wcResetPasswordUrl, body));
    } catch (e) {
      print(e);
    }
    return ApiUserResetPasswordModel.fromJson(_resErrorBody);
  }

  Map<String, String> getProfileHeader() {
    return {
      WC_ACCESS_TOKKEN_KEY: mainModel!.userTokken,
      WC_USER_ID_KEY: mainModel!.userId,
    };
  }
}
