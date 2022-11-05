import 'package:cookee_common/Services/convert_service.dart';
import '../../../core/models/api_models/api_action_status_message.dart';

class ApiMakeAuthModel {
  bool? status;
  bool? actionStatus;
  String? message;
  String? accessTokken;
  String? customerId;
  String? customerName;

  ApiMakeAuthModel({
    this.status,
    this.actionStatus,
    this.message,
    this.accessTokken,
    this.customerId,
    this.customerName,
  });

  factory ApiMakeAuthModel.fromJson(Map<String, dynamic> json) =>
      ApiMakeAuthModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        accessTokken: ConvertService.convertString(json["access_tokken"]),
        customerId: ConvertService.convertString(json["customer_id"]),
        customerName: ConvertService.convertString(json["customer_name"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "access_tokken": accessTokken,
        "customer_id": customerId,
        "customer_name": customerName,
      };

  static ApiMakeAuthModel initData() => ApiMakeAuthModel(
        status: false,
        actionStatus: false,
        message: "",
        accessTokken: "",
        customerId: "",
        customerName: "",
      );

  ApiActionStatusMessageModel loadActionStatus() => ApiActionStatusMessageModel(
      status: status, actionStatus: actionStatus, message: message);
}
