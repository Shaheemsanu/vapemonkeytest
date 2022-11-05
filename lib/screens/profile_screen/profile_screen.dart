
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utility/common/common_navigate.dart';
import '../../utility/common/text_field_validation.dart';
import '../../Utility/Components/custom_text_field.dart';
import '../../utility/components/footer_button.dart';
import '../../utility/values/app_colors.dart';
import '../../utility/values/font_utils.dart';
import '../../utility/values/scroll_behaviour.dart';
import '../../utility/values/size_utils.dart';
import '../../utility/values/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehaviour(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  appBar(),
                  SizedBox(
                    height: SizeUtils.getHeight(30),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.getWidth(24)),
                    height: SizeUtils.getHeight(100),
                    width: SizeUtils.getScreenWidth(),
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: SizeUtils.getHeight(90),
                          width: SizeUtils.getWidth(80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeUtils.getRadius(10))),
                          child: Image.asset(
                            Utils.getAssetPng("profile"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: SizeUtils.getWidth(20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: SizeUtils.getHeight(16),
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    width: SizeUtils.getWidth(5),
                                  ),
                                  Text(
                                    "Change Profile Picture",
                                    style: FontUtils.getfont14Style(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lock,
                                    size: SizeUtils.getHeight(16),
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    width: SizeUtils.getWidth(5),
                                  ),
                                  Text(
                                    "Change Password",
                                    style: FontUtils.getfont14Style(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer()
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeUtils.getHeight(50),
                  ),
                  userName(),
                  SizedBox(
                    height: SizeUtils.getHeight(10),
                  ),
                  eMail(),
                  SizedBox(
                    height: SizeUtils.getHeight(60),
                  ),
                  FooterButton(label: "Save", onPressed: () {}),
                  SizedBox(
                    height: SizeUtils.getHeight(50),
                  ),
                  logOutButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userName() {
    return CustomTextField(
      passwordField: false,
      validator: (value) {
        return TextFieldValidation.nameValidate(value);
      },
      label: "Name",
      keyboardType: TextInputType.name,
      controller: name,
    );
  }

  Widget eMail() {
    return CustomTextField(
      passwordField: false,
      validator: (value) {
        return TextFieldValidation.emailValidate(value);
      },
      label: "Email ID",
      controller: email,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(24),
          horizontal: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              CommonNavigate(parentContext: context).navigateBackPage();
            },
            child: Container(
              alignment: Alignment.center,
              height: SizeUtils.getHeight(30),
              width: SizeUtils.getWidth(30),
              decoration: const BoxDecoration(
                color: AppColors.lightBlue,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Utils.getAssetSvg("ic_backArrow")),
            ),
          ),
          SizedBox(
            width: SizeUtils.getWidth(20),
          ),
          const Spacer(),
          Text("Profile",
              style: FontUtils.getfont18Style(color: AppColors.black)),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget logOutButton() {
    return SizedBox(
      height: SizeUtils.getHeight(100),
      width: SizeUtils.getWidth(100),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: AppColors.secondaryColor, elevation: 0),
        onPressed: () {},
        child: Text(
          "Log Out",
          style: FontUtils.getfont18Style(
              color: AppColors.logOut, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
