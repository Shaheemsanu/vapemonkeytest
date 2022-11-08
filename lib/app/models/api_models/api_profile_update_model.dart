import '../../../core/constants/messages.dart';
import '../models/customer_model.dart';

class ApiProfileUpdateModel {
  bool? status;
  bool? actionStatus;
  String? message;
  CustomerModel? customer;

  ApiProfileUpdateModel(
      {this.status, this.actionStatus, this.message, this.customer});
  factory ApiProfileUpdateModel.fromJson(Map<String, dynamic> json) =>
      ApiProfileUpdateModel(
        status: json["status"],
        actionStatus: json["action_status"],
        message: getString(json["message"]),
        customer: CustomerModel.parseItem(json["customer"]),
      );

  static String getString(data) {
    if (data != null) {
      return data.toString();
    } else {
      return "";
    }
  }

  factory ApiProfileUpdateModel.loadInit() => ApiProfileUpdateModel(
        status: true,
        actionStatus: false,
        message: "",
      );

  factory ApiProfileUpdateModel.loadError() => ApiProfileUpdateModel(
        status: false,
        actionStatus: false,
        message: MS_SOMETHING_WENT_WRONG,
      );

  factory ApiProfileUpdateModel.loadNoInternet() => ApiProfileUpdateModel(
        status: false,
        actionStatus: false,
        message: MS_NO_INTERNET_CONNECTION,
      );
}
