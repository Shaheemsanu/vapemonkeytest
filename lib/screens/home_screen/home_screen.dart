import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/common/common_navigate.dart';
import '../../utility/values/app_colors.dart';
import '../../utility/values/custom_sliver_delegate.dart';
import '../../utility/values/font_utils.dart';
import '../../utility/values/scroll_behaviour.dart';
import '../../utility/values/size_utils.dart';
import '../../utility/values/utils.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<String> images = [
    "listitem1",
    "novo",
    "novo4",
    "listitem1",
    "novo",
    "novo4"
  ];
  List<String> brand = ["juul", "smok", "eleaf", "juul", "smok", "eleaf"];
  List<String> items = [
    "Tripod PCC Kit by Uwell",
    "Smok Novo 4 25W Pod Kit",
    "Smok Novo 4 25W Pod Kit",
    "Tripod PCC Kit by Uwell",
    "Smok Novo 4 25W Pod Kit",
    "Smok Novo 4 25W Pod Kit"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.secondaryColor,
          body: ScrollConfiguration(
            behavior: NoGlowScrollBehaviour(),
            child: CustomScrollView(
              primary: true,
              shrinkWrap: true,
              slivers: [
                SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: SliverAppBarDelegate(
                        minHeight: 70, maxHeight: 70, child: appBar())),
                SliverPersistentHeader(
                  floating: true,
                  delegate: SliverAppBarDelegate(
                      maxHeight: SizeUtils.getHeight(160),
                      minHeight: 0,
                      child: slidingOffer()),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  couponList(),
                  SizedBox(
                    height: SizeUtils.getHeight(20),
                  )
                ]))
              ],
            ),
          )),
    );
  }

  Widget appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(16)),
      alignment: Alignment.center,
      color: AppColors.secondaryColor,
      height: SizeUtils.getHeight(70),
      width: SizeUtils.getScreenWidth(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Welcome Back!",
            textAlign: TextAlign.center,
            style: FontUtils.getfont14Style(),
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: AppColors.secondaryColor, elevation: 0),
            onPressed: () {
              CommonNavigate(parentContext: context).navigateProfileScreen();
            },
            child: Text(
              "Jane Cooper",
              style: FontUtils.getfont18Style(
                  color: AppColors.black, fontWeight: FontWeight.w600),
            ),
          ),
          InkWell(
            onTap: () {
              CommonNavigate(parentContext: context).navigateProfileScreen();
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: SizeUtils.getHeight(25),
              width: SizeUtils.getWidth(25),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(Utils.getAssetPng("profile")),
            ),
          ),
        ],
      ),
    );
  }

  Widget slidingOffer() {
    return Container(
        color: AppColors.secondaryColor,
        height: SizeUtils.getHeight(150),
        width: SizeUtils.getScreenWidth(),
        child: CarouselSlider.builder(
            itemCount: 4,
            // carousel options
            options: CarouselOptions(
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlayCurve: Curves.easeOut,
                initialPage: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                height: SizeUtils.getHeight(180),
                viewportFraction: SizeUtils.getWidth(0.75)),
            itemBuilder: (context, index, realIndex) {
              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeUtils.getWidth(10),
                          top: SizeUtils.getHeight(20)),
                      height: SizeUtils.getHeight(130),
                      width: SizeUtils.getWidth(155),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: SizeUtils.getWidth(1),
                              color: AppColors.borderColor),
                          top: BorderSide(
                              width: SizeUtils.getWidth(1),
                              color: AppColors.borderColor),
                          left: BorderSide(
                              width: SizeUtils.getWidth(1),
                              color: AppColors.borderColor),
                          right: BorderSide(
                              width: SizeUtils.getWidth(1),
                              color: AppColors.borderColor),
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SizeUtils.getRadius(8)),
                            bottomLeft:
                                Radius.circular(SizeUtils.getRadius(8))),
                      ),
                      child: offerText(),
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: SizeUtils.getHeight(130),
                      width: SizeUtils.getWidth(100),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.secondaryColor,
                              spreadRadius: SizeUtils.getRadius(20),
                              blurRadius: SizeUtils.getRadius(0),
                              offset: const Offset(
                                  9, 6), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomRight:
                                  Radius.circular(SizeUtils.getRadius(8)),
                              topRight: Radius.circular(SizeUtils.getRadius(8)),
                              topLeft:
                                  Radius.circular(SizeUtils.getRadius(35)))),
                      child: Image.asset(
                        Utils.getAssetPng("offerimage"),
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  Widget offerText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: 'Great ',
            style: FontUtils.getfont18Style(
                color: AppColors.black, fontWeight: FontWeight.w700),
            children: <TextSpan>[
              TextSpan(
                  text: '20% OFF ',
                  style:
                      FontUtils.getfont18Style(color: AppColors.primaryColor)),
              const TextSpan(text: "your first order"),
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.getHeight(10),
        ),
        Text(
          "Smok Acro 25W Pod Kit",
          style: FontUtils.getfont10Style(
              color: AppColors.grey, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: SizeUtils.getHeight(20),
        ),
        Text(
          "*till 24 Nov 2021",
          style: FontUtils.getfont8Style(),
        )
      ],
    );
  }

  Widget couponList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(16)),
      child: SizedBox(
        width: SizeUtils.getScreenWidth(),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 6,
            primary: false,
            itemBuilder: (context, int index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        bottom: SizeUtils.getHeight(8),
                        left: SizeUtils.getWidth(16),
                        top: SizeUtils.getHeight(16),
                        right: SizeUtils.getWidth(14)),
                    height: SizeUtils.getHeight(144),
                    width: SizeUtils.getScreenWidth(),
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.all(
                            Radius.circular(SizeUtils.getRadius(8)))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: SizeUtils.getHeight(64),
                              width: SizeUtils.getWidth(64),
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(
                                      SizeUtils.getRadius(16))),
                              child:
                                  Image.asset(Utils.getAssetPng(images[index])),
                            ),
                            SizedBox(
                              width: SizeUtils.getWidth(30),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index],
                                  style: FontUtils.getfont14Style(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: SizeUtils.getHeight(5),
                                ),
                                Text(
                                  "Get up to AED 100 Cashback",
                                  style: FontUtils.getfont10Style(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeUtils.getHeight(5),
                        ),
                        Text(
                          "--------------------------------------------------------------",
                          maxLines: 1,
                          style: FontUtils.getfont14Style(
                              color: AppColors.divider,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: SizeUtils.getHeight(16),
                                width: SizeUtils.getWidth(52),
                                child: Image.asset(
                                    Utils.getAssetPng(brand[index]))),
                            const Spacer(),
                            Text(
                              "Expires on 14th Nov",
                              style: FontUtils.getfont10Style(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(width: SizeUtils.getWidth(5)),
                            Container(
                              height: SizeUtils.getHeight(34),
                              width: SizeUtils.getWidth(81),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF0078A1),
                                        AppColors.primaryColor
                                      ]),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(SizeUtils.getRadius(8))),
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                  )),
                              child: SizedBox(
                                height: SizeUtils.getHeight(30),
                                width: SizeUtils.getWidth(78),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              SizeUtils.getRadius(8))),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            AppColors.primaryColor,
                                            Color(0xFF0078A1),
                                          ])),
                                  child: TextButton(
                                      style: TextButton.styleFrom(),
                                      onPressed: () {
                                        CommonNavigate(parentContext: context)
                                            .navigateWebScreen();
                                      },
                                      child: Text(
                                        "Grab Now",
                                        style: FontUtils.getfont12Style(
                                            color: AppColors.secondaryColor,
                                            fontWeight: FontWeight.w700),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeUtils.getHeight(20),
                  )
                ],
              );
            }),
      ),
    );
  }

  // _launchURL() async {
  //   const url = "https://vape-dubai.com/product/blue-mint-by-dyb-plus/";
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw "Could not Launch $url";
  //   }
  // }
}
