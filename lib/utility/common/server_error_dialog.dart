import 'package:flutter/material.dart';
import 'package:vape_monkey2/Utility/Common/common_navigate.dart';
import 'package:vape_monkey2/Utility/Common/show_toast.dart';
import 'package:vape_monkey2/Utility/Values/font_utils.dart';
import '../../app/contracts/base_service.dart';
import '../../core/models/api_models/api_status_message.dart';
import '../Components/custom_circular_loader.dart';
import '../Components/footer_button.dart';
import '../values/app_colors.dart';
import '../values/size_utils.dart';

class ServerErrorDialog extends BaseService {
  final BuildContext parentContext;

  ServerErrorDialog({required this.parentContext});

  double screenHeight = SizeUtils.getScreenHeight();
  double screenWidth = SizeUtils.getScreenWidth();
  bool _isLoading = false;

  show() {
    return showDialog(
        context: parentContext,
        useSafeArea: true,
        useRootNavigator: false,
        barrierDismissible: true,
        builder: (context) => WillPopScope(
              onWillPop: () async => false,
              child: StatefulBuilder(
                builder: (BuildContext parentContext, StateSetter setState) {
                  return SimpleDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      title: Text(
                        "Server Error",
                        style: FontUtils.getfont18Style(
                            fontWeight: FontWeight.w600,
                            color: AppColors.black),
                      ),
                      titlePadding: EdgeInsets.only(
                          top: screenHeight * .035,
                          left: screenWidth * .07,
                          right: screenWidth * .07),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: screenWidth * .07,
                          vertical: screenHeight * .03),
                      children: [
                        Column(
                          children: [
                            Text(
                              "Unable to connect to the server. Please try again.",
                              style: FontUtils.getfont14Style(
                                  color: AppColors.grey),
                            ),
                            SizedBox(height: screenHeight * .03),
                            _isLoading
                                ? const CustomCircularLoader()
                                : FooterButton(
                                    label: "Retry",
                                    //color: AppColors.primaryColor,
                                    onPressed: () {
                                      _checkConnection(setState);
                                    },
                                  )
                          ],
                        )
                      ]);
                },
              ),
            ));
  }

  _checkConnection(StateSetter setState) async {
    setState(() {
      _isLoading = true;
    });
    ApiStatusMessageModel res = await appApiRepo.checkServer();
    setState(() {
      _isLoading = false;
    });
    if (res.status!) {
      Navigator.popUntil(parentContext, (route) => route.isFirst);
      CommonNavigate(parentContext: parentContext).navigateSplashScreen();
    } else {
      ShowToast(
              title: "",
              message: "Please contact service provider",
              parentContext: parentContext)
          .show();
    }
  }
}
