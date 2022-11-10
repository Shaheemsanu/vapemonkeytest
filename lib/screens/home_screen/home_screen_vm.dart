import 'package:vape_monkeytest/app/contracts/base_view_model.dart';
import 'package:vape_monkeytest/app/services/app/get_home_data_service.dart';
import '../../app/models/models/coupons_model.dart';
import '../../app/models/models/offer_banner_model.dart';

class HomeScreenVm extends BaseViewModel {
  List<OfferBannerModel> offerBanners = <OfferBannerModel>[];
  List<CouponsModel> coupens = <CouponsModel>[];
  String offerBannerBaseUrl = "";
  String username = "";
  String customerImage = "";
  String customerBaseUrl = "";
  String coupenBaseUrl = "";
  HomeScreenVm() {
    offerBanners = appModel!.offerBanners;
    offerBannerBaseUrl = appModel!.offerBannerBaseUrl;
    coupens = appModel!.coupens;
    username = appModel!.customer!.name!;
    customerImage = appModel!.customer!.image!;
    customerBaseUrl = appModel!.customerBaseUrl;
    coupenBaseUrl = appModel!.couponBaseUrl;
  }
  @override
  void dispose() {}

  Future<void> swipeRefresh() async {
    await GetHomeDataService().get();
    HomeScreenVm();
  }

  String getFirstOfferBannerString(String firstString) {
    List words = firstString.split(' ');
    return words[0];
  }

  String getSecondOfferBannerString(String secondString) {
    List words = secondString.split(' ');
    return ' ${words[1]} ${words[2]} ';
  }

  String getThirdOfferBannerString(String thirdString) {
    List words = thirdString.split(' ');
    String name3 = '';
    for (int i = 3; i < words.length; i++) {
      name3 = '$name3 ${words[i]}';
    }
    return name3;
  }
}
