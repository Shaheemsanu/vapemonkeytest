import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vape_monkey2/screens/home_screen/home_screen_vm.dart';

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
  HomeScreenVm viewModel = HomeScreenVm();
  int index = 0;

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
                      maxHeight: SizeUtils.getHeight(225),
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
              viewModel.username,
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
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: viewModel.customerBaseUrl + viewModel.customerImage,
                placeholder: (context, url) => placeholder(),
                errorWidget: (context, url, error) => placeholder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget slidingOffer() {
    return Container(
        color: AppColors.secondaryColor,
        height: SizeUtils.getHeight(200),
        width: SizeUtils.getScreenWidth(),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              top: SizeUtils.getHeight(110),
              child: SizedBox(
                width: SizeUtils.getScreenWidth(),
                child: InkWell(
                  child: Image.asset(
                    Utils.getAssetPng('spinner'),
                    fit: BoxFit.fill,
                    width: SizeUtils.getScreenWidth(),
                    height: SizeUtils.getHeight(100),
                  ),
                  onTap: () {
                    CommonNavigate(parentContext: context).navigateSpinwheel();
                  },
                ),
              ),
            ),
            CarouselSlider.builder(
                itemCount: viewModel.offerBanners.length,
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
                            color: AppColors.white,
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
                                topLeft:
                                    Radius.circular(SizeUtils.getRadius(8)),
                                bottomLeft:
                                    Radius.circular(SizeUtils.getRadius(8))),
                          ),
                          child: offerText(index),
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: SizeUtils.getHeight(130),
                          width: SizeUtils.getWidth(100),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.transparent,
                                  spreadRadius: SizeUtils.getRadius(20),
                                  blurRadius: SizeUtils.getRadius(0),
                                  offset: const Offset(
                                      9, 6), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                  bottomRight:
                                      Radius.circular(SizeUtils.getRadius(8)),
                                  topRight:
                                      Radius.circular(SizeUtils.getRadius(8)),
                                  topLeft: Radius.circular(
                                      SizeUtils.getRadius(35)))),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: viewModel.offerBannerBaseUrl +
                                viewModel.offerBanners[index].image!,
                            placeholder: (context, url) => placeholder(),
                            errorWidget: (context, url, error) => placeholder(),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ));
  }

  Widget offerText(int indexNo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: viewModel.getFirstOfferBannerString(
                viewModel.offerBanners[indexNo].name!),
            style: FontUtils.getfont18Style(
                color: AppColors.black, fontWeight: FontWeight.w700),
            children: <TextSpan>[
              TextSpan(
                  text: viewModel.getSecondOfferBannerString(
                      viewModel.offerBanners[indexNo].name!),
                  style:
                      FontUtils.getfont18Style(color: AppColors.primaryColor)),
              TextSpan(
                  text: viewModel.getThirdOfferBannerString(
                      viewModel.offerBanners[indexNo].name!)),
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.getHeight(10),
        ),
        Text(
          viewModel.offerBanners[indexNo].description!,
          style: FontUtils.getfont10Style(
              color: AppColors.grey, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: SizeUtils.getHeight(20),
        ),
        Text(
          viewModel.offerBanners[indexNo].expiryDate!,
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
            itemCount: viewModel.coupens.length,
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
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: viewModel.coupenBaseUrl +
                                    viewModel.coupens[index].image!,
                                placeholder: (context, url) => placeholder(),
                                errorWidget: (context, url, error) =>
                                    placeholder(),
                              ),
                            ),
                            SizedBox(
                              width: SizeUtils.getWidth(30),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viewModel.coupens[index].name!,
                                  style: FontUtils.getfont14Style(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: SizeUtils.getHeight(5),
                                ),
                                SizedBox(
                                  width: SizeUtils.getWidth(190),
                                  child: Text(
                                    viewModel.coupens[index].description!,
                                    maxLines: 5,
                                    style: FontUtils.getfont8Style(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
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
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: viewModel.coupenBaseUrl +
                                    viewModel.coupens[index].brandLogo!,
                                placeholder: (context, url) => placeholder(),
                                errorWidget: (context, url, error) =>
                                    placeholder(),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              viewModel.coupens[index].expiryDate!,
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

  Widget placeholder() {
    return Image.network(
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png");
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
