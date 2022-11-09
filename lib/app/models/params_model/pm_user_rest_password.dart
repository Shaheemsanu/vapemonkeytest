class PmUserResetPasswordModel {
  String? userId;
  String? otp;
  String? password;

  PmUserResetPasswordModel({this.userId, this.otp, this.password});

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "tokken": otp,
        "password": password,
      };
}
