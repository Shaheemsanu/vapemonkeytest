import 'package:vape_monkeytest/app/models/models/customer_model.dart';

import '../../models/models/category_model.dart';
import '../../models/models/coupons_model.dart';
import '../../models/models/offer_banner_model.dart';
import '../../models/models/product_model.dart';
import '../../models/models/promo_code_model.dart';

class AppModel {
  ///Singleton Settings
  static final AppModel _singleton = AppModel._internal();
  factory AppModel() {
    return _singleton;
  }
  AppModel._internal();
  List<OfferBannerModel> offerBanners = <OfferBannerModel>[];
  List<CouponsModel> coupens = <CouponsModel>[];
  List<PromoCodeModel> promoCodes = <PromoCodeModel>[];
  bool todayPromoExist = false;
  List<CategoryModel> category = <CategoryModel>[];
  List<ProductModel> product = <ProductModel>[];
  String offerBannerBaseUrl = "";
  String productBaseUrl = "";
  String categoryBaseUrl = "";
  String customerBaseUrl = "";
  CustomerModel? customer;
  String couponBaseUrl = "";
}
