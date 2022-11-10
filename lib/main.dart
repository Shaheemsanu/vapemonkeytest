import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:vape_monkeytest/screens/splash_screen/splash_screen.dart';
import 'package:vape_monkeytest/utility/values/app_theme.dart';

import 'app/config/app_module_container.dart';
import 'core/config/module_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(AppTheme.statusBarStyle);
  await ModuleContainer.initialise(Injector());
  await AppModuleContainer.initialise(Injector());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 760),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Vape Monkey',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          );
        });
  }
}
