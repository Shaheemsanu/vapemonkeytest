class PmUserForgotPasswordModel {
  String? email;

  PmUserForgotPasswordModel({this.email});

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
