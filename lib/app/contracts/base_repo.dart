import '../../core/config/module_container.dart';
import '../../core/repositeries/app/main_model.dart';
import '../config/app_module_container.dart';
import '../repositeries/app/app_model.dart';

abstract class BaseRepo {
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
  AppModel? appModel = AppModuleContainer.moduleInjector?.get<AppModel>();
}
