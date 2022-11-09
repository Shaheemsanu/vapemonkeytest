import 'package:cookee_common/Services/convert_service.dart';

class ApiUserForgotPasswordModel {
  bool? status;
  String? message;
  String? customerName;
  int? customerId;
    int? token;

  ApiUserForgotPasswordModel({
    this.status,
    this.message,
    this.customerName,
    this.customerId,
    this.token
  });

  factory ApiUserForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ApiUserForgotPasswordModel(
        status: ConvertService.convertBool(json["status"]),
        message: ConvertService.convertString(json["message"]),
        customerName: ConvertService.convertString(json["customer_name"]),
        customerId: ConvertService.convertInt(json["customer_id"]),
          token: ConvertService.convertInt(json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "customer_name": customerName,
        "customer_id": customerId,
        "token" : token,
      };

  static List<ApiUserForgotPasswordModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      List<ApiUserForgotPasswordModel> pros = list
          .map((data) => ApiUserForgotPasswordModel.fromJson(data))
          .toList();
      return pros;
    } catch (_) {}
    return [];
  }

  static ApiUserForgotPasswordModel? parseItem(Map<String, dynamic> json) {
    return ApiUserForgotPasswordModel.fromJson(json);
  }

  ApiUserForgotPasswordModel copyItem() => ApiUserForgotPasswordModel(
        status: status,
        message: message,
        customerName: customerName,
        customerId: customerId,
        token :token,
      );

  List<ApiUserForgotPasswordModel> copyItems(
      List<ApiUserForgotPasswordModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiUserForgotPasswordModel initData() => ApiUserForgotPasswordModel(
        status: false,
        message: "",
        customerName: "",
        customerId: 0,
        token: 0
      );
}
