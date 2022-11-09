import 'package:flutter/material.dart';
import 'package:vape_monkey2/screens/profile_screen/logout_dialog_vm.dart';

import '../../Utility/Components/footer_button.dart';
import '../../Utility/Values/app_colors.dart';
import '../../Utility/Values/font_utils.dart';
import '../../Utility/Values/size_utils.dart';
import '../../utility/Components/custom_circular_loader.dart';

class LogoutDialog {
  final BuildContext parentContext;
  LogoutDialog({required this.parentContext});
  double screenHeight = SizeUtils.getScreenHeight();
  double screenWidth = SizeUtils.getScreenWidth();
  LogoutDialogVm viewModel = LogoutDialogVm();
  Future<void> show() {
    return showDialog(
        context: parentContext,
        builder: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
              child: SimpleDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: screenWidth * .06),
                /* title: Text(
                  "Logout",
                  style: FontUtils.getfont18Style(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ), */
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * .035),
                        child: Text(
                          "Are you sure to logout?",
                          style: FontUtils.getfont18Style(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      StreamBuilder(
                          initialData: false,
                          stream: viewModel.loaderStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            if (snapshot.data!) {
                              return const Center(
                                  child: CustomCircularLoader());
                            } else {
                              return FooterButton(
                                label: "Logout",
                                onPressed: () {
                                  //Navigator.pop(context);
                                  viewModel.logout(pcontext: context);
                                },
                              );
                            }
                          }),
                      /*FooterButton(
                        label: "Logout",
                        onPressed: () {
                          //Navigator.pop(context);
                          viewModel.
                        },
                      ),*/
                    ],
                  ),
                  SizedBox(height: screenHeight * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeUtils.getWidth(24),
                    ),
                    child: InkWell(
                      splashColor: AppColors.primaryColor.withOpacity(.3),
                      highlightColor: AppColors.primaryColor.withOpacity(.2),
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(8)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: screenWidth,
                          height: screenHeight * .063,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Cancel",
                            style: FontUtils.getfont18Style(
                                color: AppColors.logOut,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                  SizedBox(height: screenHeight * .013),
                ],
              ),
            ));
  }
}
