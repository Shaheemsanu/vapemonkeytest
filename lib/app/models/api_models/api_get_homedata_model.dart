import 'package:cookee_common/Services/convert_service.dart';

import '../../../core/models/api_models/api_action_status_message.dart';
import '../models/category_model.dart';
import '../models/coupons_model.dart';
import '../models/customer_model.dart';
import '../models/offer_banner_model.dart';
import '../models/product_model.dart';
import '../models/promo_code_model.dart';

class ApiGetHomeDataModel {
  bool? status;
  bool? actionStatus;
  String? message;
  List<OfferBannerModel>? offerBanners;
  List<CouponsModel>? coupens;
  List<PromoCodeModel>? promoCodes;
  bool? todayPromoExist;
  List<CategoryModel>? category;
  List<ProductModel>? product;
  String? offerBannerBaseUrl;
  String? productBaseUrl;
  String? categoryBaseUrl;
  String? customerBaseUrl;
  String? couponBaseUrl;
  CustomerModel? customer;

  ApiGetHomeDataModel({
    this.status,
    this.actionStatus,
    this.message,
    this.offerBanners,
    this.coupens,
    this.promoCodes,
    this.todayPromoExist,
    this.category,
    this.product,
    this.offerBannerBaseUrl,
    this.productBaseUrl,
    this.categoryBaseUrl,
    this.customerBaseUrl,
    this.couponBaseUrl,
    this.customer,
  });

  factory ApiGetHomeDataModel.fromJson(Map<String, dynamic> json) =>
      ApiGetHomeDataModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        offerBanners: OfferBannerModel.parseItems(json["offer_banners"]),
        coupens: CouponsModel.parseItems(json["coupens"]),
        promoCodes: PromoCodeModel.parseItems(json["promo_codes"]),
        todayPromoExist: ConvertService.convertBool(json["today_promo_exist"]),
        category: CategoryModel.parseItems(json["category"]),
        product: ProductModel.parseItems(json["product"]),
        offerBannerBaseUrl:
            ConvertService.convertString(json["offer_banner_base_url"]),
        productBaseUrl: ConvertService.convertString(json["product_base_url"]),
        categoryBaseUrl:
            ConvertService.convertString(json["category_base_url"]),
        customerBaseUrl:
            ConvertService.convertString(json["customer_base_url"]),
        couponBaseUrl: ConvertService.convertString(json["coupon_base_url"]),
        customer: CustomerModel.parseItem(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "offer_banners": offerBanners,
        "coupens": coupens,
        "promo_codes": promoCodes,
        "today_promo_exist": todayPromoExist,
        "category": category,
        "product": product,
        "offer_banner_base_url": offerBannerBaseUrl,
        "product_base_url": productBaseUrl,
        "category_base_url": categoryBaseUrl,
        "customer_base_url": customerBaseUrl,
        "customer": customer,
        "coupon_base_url": couponBaseUrl
      };

  static List<ApiGetHomeDataModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      List<ApiGetHomeDataModel> pros =
          list.map((data) => ApiGetHomeDataModel.fromJson(data)).toList();
      return pros;
    } catch (_) {}
    return [];
  }

  static ApiGetHomeDataModel? parseItem(Map<String, dynamic> json) {
    return ApiGetHomeDataModel.fromJson(json);
    return null;
  }

  ApiGetHomeDataModel copyItem() => ApiGetHomeDataModel(
      status: status,
      actionStatus: actionStatus,
      message: message,
      offerBanners: offerBanners,
      coupens: coupens,
      promoCodes: promoCodes,
      todayPromoExist: todayPromoExist,
      category: category,
      product: product,
      offerBannerBaseUrl: offerBannerBaseUrl,
      productBaseUrl: productBaseUrl,
      categoryBaseUrl: categoryBaseUrl,
      customerBaseUrl: customerBaseUrl,
      customer: customer,
      couponBaseUrl: couponBaseUrl);

  List<ApiGetHomeDataModel> copyItems(List<ApiGetHomeDataModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiGetHomeDataModel initData() => ApiGetHomeDataModel(
        status: false,
        actionStatus: false,
        message: "",
      );

  ApiActionStatusMessageModel loadActionStatus() => ApiActionStatusMessageModel(
      status: status, actionStatus: actionStatus, message: message);
}
