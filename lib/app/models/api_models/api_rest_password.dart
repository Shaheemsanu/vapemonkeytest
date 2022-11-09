import 'package:cookee_common/Services/convert_service.dart';
import '../models/customer_model.dart';

class ApiUserResetPasswordModel {
  bool? status;
  String? message;
  CustomerModel? customer;

  ApiUserResetPasswordModel({this.status, this.message, this.customer});

  factory ApiUserResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ApiUserResetPasswordModel(
          status: ConvertService.convertBool(json["status"]),
          message: ConvertService.convertString(json["message"]),
          customer: CustomerModel.parseItem(json["customer"]));

  Map<String, dynamic> toJson() =>
      {"status": status, "message": message, "customer": customer!.toJson()};

  static List<ApiUserResetPasswordModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      List<ApiUserResetPasswordModel> pros = list
          .map((data) => ApiUserResetPasswordModel.fromJson(data))
          .toList();
      return pros;
    } catch (_) {}
    return [];
  }

  static ApiUserResetPasswordModel? parseItem(Map<String, dynamic> json) {
    return ApiUserResetPasswordModel.fromJson(json);
    
  }

  ApiUserResetPasswordModel copyItem() => ApiUserResetPasswordModel(
        status: status,
        message: message,
      );

  List<ApiUserResetPasswordModel> copyItems(
      List<ApiUserResetPasswordModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiUserResetPasswordModel initData() =>
      ApiUserResetPasswordModel(
        status: false,
        message: "",
      );
}
