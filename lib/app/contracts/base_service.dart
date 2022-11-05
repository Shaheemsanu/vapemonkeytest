import 'package:cookee_api/repo/api_app_general_repo.dart';
import 'package:cookee_api/repo/api_appprofile_repo.dart';
import '../../core/config/module_container.dart';
import '../../core/repositeries/app/main_model.dart';
import '../../core/repositeries/preference/preference_repo.dart';
import '../config/app_module_container.dart';
import '../repositeries/api/app_api_repo.dart';
import '../repositeries/app/app_model.dart';

abstract class BaseService {
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
  AppModel? appModel = AppModuleContainer.moduleInjector?.get<AppModel>();
  ApiAppGeneralRepo apiAppGeneralRepo = ApiAppGeneralRepo();
  ApiAppProfileRepo apiAppProfileRepo = ApiAppProfileRepo();
  AppApiRepo appApiRepo = AppApiRepo();
  PreferenceRepo prefRepo = PreferenceRepo();
}
