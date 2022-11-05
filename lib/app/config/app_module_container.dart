import 'package:flutter_simple_dependency_injection/injector.dart';

import '../repositeries/app/app_model.dart';

class AppModuleContainer {
  static Injector? moduleInjector;
  static Future<Injector?> initialise(Injector injector) async {
    moduleInjector = injector;
    moduleInjector?.map<AppModel>((injector) => AppModel(), isSingleton: true);
    return moduleInjector;
  }
}
