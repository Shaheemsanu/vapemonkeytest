import 'package:cookee_common/Services/convert_service.dart';

class ApiUserRegisterModel {
  bool? status;
  bool? actionStatus;
  String? message;
  int? userId;

  ApiUserRegisterModel({
    this.status,
    this.actionStatus,
    this.message,
    this.userId,
  });

  factory ApiUserRegisterModel.fromJson(Map<String, dynamic> json) =>
      ApiUserRegisterModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        userId: ConvertService.convertInt(json["user_id"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "user_id": userId,
      };

  static ApiUserRegisterModel initData() => ApiUserRegisterModel(
        status: false,
        actionStatus: false,
        message: "",
        userId: 0,
      );
}
