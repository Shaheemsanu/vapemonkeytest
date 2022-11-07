import 'package:flutter/material.dart';
import 'package:vape_monkey2/screens/splash_screen/splash_screen_vm.dart';
import '../../utility/common/common_navigate.dart';
import '../../utility/values/app_colors.dart';
import '../../utility/values/size_utils.dart';
import '../../utility/values/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenVM viewModel = SplashScreenVM();
  @override
  void initState() {
    super.initState();
    viewModel.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Container(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Utils.getAssetPng("spbg")),
                  fit: BoxFit.cover),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryColor,
                    Color(0xFF004FC7),
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: SizeUtils.getHeight(170),
                  width: SizeUtils.getWidth(170),
                  child: Image.asset(Utils.getAssetPng("logo"))),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigatetoLoginScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    CommonNavigate(parentContext: context).navigateLoginScreen();
  }
}
