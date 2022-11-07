import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vape_monkey2/screens/spin_wheel/spin_wheel_vm.dart';
import 'dart:async';
import '../../Utility/Values/app_colors.dart';
import '../../Utility/Values/font_utils.dart';
import '../../Utility/Values/size_utils.dart';
import '../../Utility/Values/utils.dart';
import '../../utility/components/custom_back_btn.dart';

class SpinWheelScreen extends StatefulWidget {
  const SpinWheelScreen({Key? key}) : super(key: key);

  @override
  _SpinWheelScreenState createState() => _SpinWheelScreenState();
}

class _SpinWheelScreenState extends State<SpinWheelScreen> {
  StreamController<int> spinnerStrController =
      StreamController<int>.broadcast();
  SpinWheelScreenVm viewModel = SpinWheelScreenVm();
  int selectedIndex = -1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    spinnerStrController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     viewModel.setContext(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeUtils.getWidth(16),
                          top: SizeUtils.getHeight(16)),
                      child: CustomBackButton(),
                    ),
                    SizedBox(
                      height: SizeUtils.getHeight(100),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: SizeUtils.getHeight(64),
                        width: SizeUtils.getWidth(185),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              'Spin the wheel ',
                              style: FontUtils.getHomeGlod64Style(
                                  color: AppColors.black),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "and win coupons ",
                                style: FontUtils.getfont12Style(
                                    color: AppColors.lightGrey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      heightFactor: 1.5,
                      child: SizedBox(
                        // color: Colors.amber,
                        height: SizeUtils.getScreenWidth() + 120,
                        width: SizeUtils.getScreenWidth() + 100,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.antiAlias,
                          child: SizedBox(
                            height: SizeUtils.getScreenWidth() + 60,
                            width: SizeUtils.getScreenWidth() + 60,
                            child:
                                Stack(alignment: Alignment.center, children: [
                              FortuneWheel(
                                  animateFirst: false,
                                  indicators: <FortuneIndicator>[
                                    FortuneIndicator(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    SizeUtils.getRadius(50))),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(
                                                    SizeUtils.getWidth(1),
                                                    SizeUtils.getHeight(1)),
                                                blurRadius:
                                                    SizeUtils.getRadius(20),
                                                color: AppColors.black
                                                    .withOpacity(0.6),
                                              )
                                            ]),
                                        alignment: Alignment.topCenter,
                                        height: SizeUtils.getHeight(35),
                                        width: SizeUtils.getWidth(40),
                                        child: SvgPicture.asset(
                                          Utils.getAssetSvg("indicator"),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    )
                                  ],
                                  styleStrategy: UniformStyleStrategy(
                                      borderColor: AppColors.secondaryColor,
                                      borderWidth: SizeUtils.getWidth(10)),
                                  selected: spinnerStrController.stream,
                                  onAnimationEnd: () {
                                    viewModel.getCoupon(selectedIndex);
                                    setState(() {});
                                  },
                                  items: List.generate(
                                    10,
                                    (index) => FortuneItem(
                                        style: FortuneItemStyle(
                                            borderColor:
                                                AppColors.secondaryColor,
                                            color: index == selectedIndex
                                                ? AppColors.playButton1
                                                    .withOpacity(0.8)
                                                : index % 2 == 0
                                                    ? AppColors
                                                        .fortuneButtonColor
                                                    : AppColors.primaryColor),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Spacer(),
                                              index == selectedIndex
                                                  ? SizedBox(
                                                      height:
                                                          SizeUtils.getHeight(
                                                              15),
                                                      width: SizeUtils.getWidth(
                                                          15),
                                                      child: SvgPicture.asset(
                                                          Utils.getAssetSvg(
                                                              "starL")))
                                                  : SizedBox(
                                                      height:
                                                          SizeUtils.getHeight(
                                                              7),
                                                      width:
                                                          SizeUtils.getWidth(7),
                                                      child: SvgPicture.asset(
                                                          Utils.getAssetSvg(
                                                              "stars"))),
                                              const Spacer(),
                                              Text("${(index + 1)}",
                                                  style:
                                                      FontUtils.getfont64Style(
                                                    color: AppColors
                                                        .secondaryColor,
                                                  )),
                                              const Spacer(),
                                            ])),
                                  )),
                              SizedBox(
                                height: SizeUtils.getHeight(70),
                                width: SizeUtils.getWidth(70),
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                      color: AppColors.secondaryColor,
                                      shape: BoxShape.circle),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: SizeUtils.getHeight(50),
                                    width: SizeUtils.getWidth(50),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFFB557FF),
                                              AppColors.fortuneButtonColor
                                            ]),
                                        border: Border.all(
                                            color: AppColors.secondaryColor,
                                            width: SizeUtils.getWidth(4)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.black,
                                              blurRadius:
                                                  SizeUtils.getRadius(7),
                                              spreadRadius:
                                                  SizeUtils.getRadius(2))
                                        ],
                                        // color: AppColors.fortuneButtonColor,
                                        shape: BoxShape.circle),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: SizeUtils.getHeight(48),
                                      width: SizeUtils.getWidth(48),
                                      decoration: const BoxDecoration(
                                          color: AppColors.fortuneButtonColor,
                                          shape: BoxShape.circle),
                                      child: InkWell(
                                        onTap: () {
                                          selectedIndex =
                                              Fortune.randomInt(0, 10);
                                          spinnerStrController
                                              .add(selectedIndex);
                                        },
                                        child: SvgPicture.asset(
                                          Utils.getAssetSvg("refresh"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}
