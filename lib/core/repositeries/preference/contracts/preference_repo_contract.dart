import 'package:cookee_prefs/Repositeries/preference_core_repo.dart';
import '../../../config/module_container.dart';
import '../../app/main_model.dart';

abstract class PreferenceRepoContract {
  PreferenceCoreRepo prefCoreRepo = PreferenceCoreRepo();
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
}
